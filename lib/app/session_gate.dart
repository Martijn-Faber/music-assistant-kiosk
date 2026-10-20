import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/platform/volume_button_bridge.dart';
import '../core/storage/session_storage.dart';
import '../l10n/generated/app_localizations.dart';
import 'app_page_pager.dart';
import '../features/onboarding/presentation/onboarding_screen.dart';
import '../features/onboarding/presentation/onboarding_components.dart';
import '../features/player/data/music_assistant_repository.dart';
import 'package:music_assistant_api/music_assistant_api.dart';
import '../features/player/presentation/player_screen.dart';
import '../features/player/presentation/player_glass_widgets.dart';
import '../features/player/presentation/player_now_playing_page.dart';
import '../features/player/presentation/player_setup_page.dart';
import '../features/player/presentation/player_volume_dialog.dart';
import '../features/player/presentation/player_volume_feedback_popup.dart';
import '../features/player/presentation/album_backdrop.dart';
import '../features/player/viewmodels/player_volume_view_model.dart';
import '../features/idle/presentation/idle_player_page.dart';
import '../features/screensaver/presentation/clock_screensaver_page.dart';
import '../features/settings/presentation/player_settings_page.dart';

class SessionGate extends StatefulWidget {
  const SessionGate({super.key, required this.onLocaleChanged});

  final ValueChanged<Locale> onLocaleChanged;

  @override
  State<SessionGate> createState() => _SessionGateState();
}

class _SessionGateState extends State<SessionGate> {
  static const _sessionRestoreTimeout = Duration(seconds: 45);
  final _pagerKey = GlobalKey<AppPagePagerState>();
  MusicAssistantPlayerMedia? _backdropMediaOverride;
  String? _backdropOverridePlayerId;
  final _sessionStorage = SessionStorage();
  final _volumeButtons = VolumeButtonBridge();
  late final _volumeController = PlayerVolumeViewModel(
    isMounted: () => mounted,
    selectedPlayerId: () => _selectedPlayerId,
    repository: () => _repository,
    players: () => _players,
    onPlayerUpdated: _replacePlayer,
    onActionError: () {
      if (mounted) {
        setState(
          () => _playerActionError =
              AppLocalizations.of(context).playerActionFailed,
        );
      }
    },
  );

  MusicAssistantRepository? _repository;
  List<MusicAssistantPlayer> _players = [];
  MusicAssistantServerInfoMessage? _serverInfo;
  String? _selectedPlayerId;
  void Function()? _unsubscribeFromPlayers;
  bool _isLoading = true;
  bool _showStartupLoading = true;
  bool _onboardingComplete = false;
  bool _isConnecting = false;
  bool _needsPlayerSetup = false;
  bool _isRefreshingSetupPlayers = false;
  String? _playerSetupError;
  String? _connectionError;
  String? _playerError;
  String? _playerActionError;
  String? _qualityLabel;
  int _qualityRequest = 0;
  bool? _clock24HourFormat;
  int _clockFormatRevision = 0;

  @override
  void initState() {
    super.initState();
    _volumeButtons.setHandler(_handleHardwareButton);
    unawaited(_restoreClockFormat());
    _restoreSession();
  }

  @override
  void dispose() {
    _volumeController.dispose();
    unawaited(_volumeButtons.setEnabled(false));
    _volumeButtons.dispose();
    _unsubscribeFromPlayers?.call();
    final repository = _repository;
    if (repository != null) unawaited(repository.disconnect());
    super.dispose();
  }

  Future<void> _restoreSession() async {
    final restoreTimer = Stopwatch()..start();
    Future<T> waitForRestore<T>(Future<T> operation) {
      final remaining = _sessionRestoreTimeout - restoreTimer.elapsed;
      if (remaining <= Duration.zero) {
        return Future<T>.error(
          TimeoutException('Session restore timed out.'),
        );
      }
      return operation.timeout(remaining);
    }

    MusicAssistantRepository? repository;
    try {
      final savedSession = await waitForRestore(_sessionStorage.readSession());
      _onboardingComplete = await waitForRestore(
        _sessionStorage.readOnboardingComplete(),
      );
      if (mounted) {
        setState(() => _showStartupLoading = _onboardingComplete);
      }
      // Existing installs with saved credentials have already completed setup.
      if (savedSession != null && !_onboardingComplete) {
        _onboardingComplete = true;
        await waitForRestore(_sessionStorage.saveOnboardingComplete(true));
        if (mounted) setState(() => _showStartupLoading = true);
      }
      if (savedSession == null) return;

      final restoredRepository = await waitForRestore(
        MusicAssistantRepository.resume(
          serverUrl: savedSession.serverUrl,
          token: savedSession.token,
        ),
      );
      repository = restoredRepository;
      final players = await waitForRestore(restoredRepository.fetchPlayers());
      final serverInfo = await waitForRestore(
        restoredRepository.fetchServerInfo(),
      );
      if (!mounted) {
        await restoredRepository.disconnect();
        return;
      }

      final selectedPlayerId =
          players.any(
            (player) => player.playerId == savedSession.selectedPlayerId,
          )
          ? savedSession.selectedPlayerId
          : null;
      final selectedPlayer = selectedPlayerId == null
          ? null
          : await waitForRestore(
              restoredRepository.fetchPlayer(selectedPlayerId),
            );
      if (!mounted) {
        await restoredRepository.disconnect();
        return;
      }
      if (selectedPlayer != null) {
        final index = players.indexWhere(
          (player) => player.playerId == selectedPlayerId,
        );
        players[index] = selectedPlayer;
      }
      setState(() {
        _repository = repository;
        _players = players;
        _serverInfo = serverInfo;
        _selectedPlayerId = selectedPlayerId;
        _needsPlayerSetup = selectedPlayerId == null;
        _showStartupLoading = false;
      });
      _listenToPlayerChanges(restoredRepository);
      await _setVolumeControlEnabled(_playerSupportsVolumeSet(selectedPlayer));
      if (selectedPlayerId != null)
        unawaited(_refreshQuality(selectedPlayerId));
    } catch (_) {
      final failedRepository = repository;
      if (failedRepository != null) {
        try {
          await failedRepository
              .disconnect()
              .timeout(const Duration(seconds: 2));
        } catch (_) {
          // The loading screen still needs to give way to onboarding on timeout.
        }
      }
      if (mounted) {
        setState(
          () => _connectionError =
              AppLocalizations.of(context).settingsSignInAgainToReconnect,
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _showStartupLoading = false;
        });
      }
    }
  }

  Future<void> _restoreClockFormat() async {
    try {
      final revision = _clockFormatRevision;
      final format = await _sessionStorage.readClock24HourFormat();
      if (mounted && revision == _clockFormatRevision) {
        setState(() => _clock24HourFormat = format);
      }
    } catch (_) {
      // The clock falls back to the device's time format if storage is unavailable.
    }
  }

  void _setClockFormat(bool? format) {
    _clockFormatRevision++;
    setState(() => _clock24HourFormat = format);
    unawaited(_sessionStorage.saveClock24HourFormat(format));
  }

  Future<void> _connect(String serverUrl, String token) async {
    setState(() {
      _isConnecting = true;
      _connectionError = null;
    });

    MusicAssistantRepository? repository;
    try {
      final normalizedServerUrl = serverUrl.trim().replaceFirst(
        RegExp(r'/$'),
        '',
      );
      repository = await MusicAssistantRepository.connectWithLoginToken(
        serverUrl: normalizedServerUrl,
        loginToken: token,
      );
      final players = await repository.fetchPlayers();
      final serverInfo = await repository.fetchServerInfo();
      await _sessionStorage.saveSelectedPlayerId(null);
      await _sessionStorage.saveCredentials(
        serverUrl: normalizedServerUrl,
        token: repository.token,
      );
      if (!mounted) {
        await repository.disconnect();
        return;
      }

      setState(() {
        _repository = repository;
        _players = players;
        _serverInfo = serverInfo;
        _selectedPlayerId = null;
        _needsPlayerSetup = true;
        _playerSetupError = null;
      });
      _listenToPlayerChanges(repository);
      await _setVolumeControlEnabled(false);
    } on MissingPluginException {
      await repository?.disconnect();
      if (mounted) {
        setState(
          () => _connectionError =
              AppLocalizations.of(
                context,
              ).settingsSecureStorageUnavailable,
        );
      }
      rethrow;
    } catch (error) {
      await repository?.disconnect();
      if (mounted) {
        setState(
          () => _connectionError =
              AppLocalizations.of(context).commonConnectionFailed,
        );
      }
      rethrow;
    } finally {
      if (mounted) {
        setState(() => _isConnecting = false);
      }
    }
  }

  Future<void> _disconnect() async {
    await _setVolumeControlEnabled(false);
    _unsubscribeFromPlayers?.call();
    _unsubscribeFromPlayers = null;
    final repository = _repository;
    try {
      await repository?.logout();
    } catch (_) {
      // Local sign-out still needs to complete if the server is unreachable.
    } finally {
      await repository?.disconnect();
      await _sessionStorage.clearCredentials();
      await _sessionStorage.saveOnboardingComplete(false);
      _onboardingComplete = false;
    }
    if (!mounted) return;

    _qualityRequest++;
    setState(() {
      _repository = null;
      _players = [];
      _serverInfo = null;
      _selectedPlayerId = null;
      _qualityLabel = null;
      _backdropMediaOverride = null;
      _backdropOverridePlayerId = null;
      _connectionError = null;
      _playerError = null;
      _playerActionError = null;
    });
  }

  Future<void> _selectPlayer(String playerId) async {
    try {
      final repository = _repository;
      if (repository == null) {
        throw StateError(
          AppLocalizations.of(
            context,
          ).settingsConnectBeforeSelectingPlayer,
        );
      }
      final player = await repository.fetchPlayer(playerId);
      await _sessionStorage.saveSelectedPlayerId(playerId);
      await _sessionStorage.saveOnboardingComplete(true);
      _onboardingComplete = true;
      if (!mounted) return;
      setState(() {
        final index = _players.indexWhere((item) => item.playerId == playerId);
        if (index == -1) {
          _players.add(player);
        } else {
          _players[index] = player;
        }
        _selectedPlayerId = playerId;
        _backdropMediaOverride = null;
        _backdropOverridePlayerId = null;
        _needsPlayerSetup = false;
        _playerSetupError = null;
        _qualityLabel = null;
        _playerError = null;
      });
      await _setVolumeControlEnabled(_playerSupportsVolumeSet(player));
      unawaited(_refreshQuality(playerId));
    } catch (error) {
      if (mounted) {
        setState(() {
          _playerError =
              AppLocalizations.of(context).commonPlayerSelectionFailed;
          _playerSetupError =
              AppLocalizations.of(context).commonPlayerSelectionFailed;
        });
      }
    }
  }

  Future<void> _refreshSetupPlayers() async {
    final repository = _repository;
    if (repository == null || _isRefreshingSetupPlayers) return;
    setState(() {
      _isRefreshingSetupPlayers = true;
      _playerSetupError = null;
    });
    try {
      final players = await repository.fetchPlayers();
      if (mounted && identical(repository, _repository)) {
        setState(() => _players = players);
      }
    } catch (_) {
      if (mounted) {
        setState(
          () => _playerSetupError =
              AppLocalizations.of(context).settingsCouldNotLoadPlayers,
        );
      }
    } finally {
      if (mounted) setState(() => _isRefreshingSetupPlayers = false);
    }
  }

  void _listenToPlayerChanges(MusicAssistantRepository repository) {
    _unsubscribeFromPlayers?.call();
    _unsubscribeFromPlayers = repository.listenToPlayerEvents(
      onChanged: (player) {
        if (!mounted) return;
        final previousPlayer = _players
            .where((item) => item.playerId == player.playerId)
            .firstOrNull;
        final holdHardwareVolume =
            _volumeController.isHardwareVolumePending(player.playerId);
        final playerWithVolume = player.copyWith(
          volumeLevel: player.volumeLevel ?? previousPlayer?.volumeLevel,
          groupVolume: player.groupVolume ?? previousPlayer?.groupVolume,
        );
        final updatedPlayer = playerWithVolume;
        final trackChanged =
            previousPlayer == null ||
            previousPlayer.currentMedia?.title !=
                updatedPlayer.currentMedia?.title ||
            previousPlayer.currentMedia?.uri !=
                updatedPlayer.currentMedia?.uri ||
            previousPlayer.currentMedia?.artist !=
                updatedPlayer.currentMedia?.artist ||
            previousPlayer.currentMedia?.album !=
                updatedPlayer.currentMedia?.album;
        final volumeChanged =
            previousPlayer != null &&
            previousPlayer.effectiveVolumeLevel !=
                updatedPlayer.effectiveVolumeLevel;

        setState(() {
          final index = _players.indexWhere(
            (item) => item.playerId == player.playerId,
          );
          if (index == -1) {
            _players.add(updatedPlayer);
          } else {
            _players[index] = updatedPlayer;
          }
          if (_selectedPlayerId == player.playerId && trackChanged) {
            _qualityLabel = null;
            final backdropOverride = _backdropMediaOverride;
            final serverMedia = updatedPlayer.currentMedia;
            if (backdropOverride != null &&
                (serverMedia == null ||
                    serverMedia.queueItemId == backdropOverride.queueItemId ||
                    serverMedia.uri == backdropOverride.uri)) {
              _backdropMediaOverride = null;
              _backdropOverridePlayerId = null;
            }
          }
        });

        if (_selectedPlayerId == player.playerId && trackChanged) {
          unawaited(_refreshQuality(player.playerId));
        }
        if (_selectedPlayerId == player.playerId && volumeChanged) {
          _volumeController.onPlayerVolumeChanged(
            repository,
            player.playerId,
            hardwarePending: holdHardwareVolume,
          );
        }
      },
      onRemoved: (playerId) {
        if (!mounted) return;
        final wasSelected = _selectedPlayerId == playerId;
        if (wasSelected) _qualityRequest++;
        setState(() {
          _players.removeWhere((player) => player.playerId == playerId);
          if (wasSelected) {
            _selectedPlayerId = null;
            _qualityLabel = null;
            _backdropMediaOverride = null;
            _backdropOverridePlayerId = null;
          }
        });
        if (wasSelected) {
          unawaited(_sessionStorage.saveSelectedPlayerId(null));
          unawaited(_setVolumeControlEnabled(false));
        }
      },
    );
  }

  Future<void> _refreshQuality(String playerId) async {
    final repository = _repository;
    if (repository == null) return;
    final request = ++_qualityRequest;

    String? qualityLabel;
    try {
      qualityLabel = await repository.fetchQualityLabel(playerId);
    } catch (_) {
      qualityLabel = null;
    }

    if (!mounted ||
        request != _qualityRequest ||
        _selectedPlayerId != playerId) {
      return;
    }
    setState(
      () => _qualityLabel =
          qualityLabel ?? AppLocalizations.of(context).playerQualityUnknown,
    );
  }

  Future<void> _handleHardwareButton(String action) async {
    final repository = _repository;
    final playerId = _selectedPlayerId;
    if (repository == null || playerId == null) return;
    if ((action == 'volumeUp' || action == 'volumeDown') &&
        !_playerSupportsVolumeSet(
          _players.where((player) => player.playerId == playerId).firstOrNull,
        )) {
      return;
    }

    print("Incoming hardware button command");

    try {
      switch (action) {
        case 'volumeUp':
          _volumeController.handleHardwareButton(
            repository,
            playerId,
            increase: true,
          );
        case 'volumeDown':
          _volumeController.handleHardwareButton(
            repository,
            playerId,
            increase: false,
          );
        case 'togglePlayback':
          await repository.togglePlayback(playerId);
        default:
          return;
      }
      if (mounted) setState(() => _playerActionError = null);
    } catch (_) {
      if (mounted) {
        setState(
          () => _playerActionError =
              AppLocalizations.of(context).playerActionFailed,
        );
      }
    }
  }

  bool _playerSupportsVolumeSet(MusicAssistantPlayer? player) =>
      player?.supportedFeatures?.contains(
        MusicAssistantPlayerFeature.volumeSet,
      ) ==
      true;

  void _markPlayerIdle(String playerId) {
    final index = _players.indexWhere((player) => player.playerId == playerId);
    if (index == -1) return;
    setState(() {
      final player = _players[index];
      _players[index] = player.copyWith(
        playbackState: MusicAssistantPlaybackState.idle,
        currentMedia: null,
        elapsedTime: null,
        elapsedTimeLastUpdated: null,
      );
      if (_selectedPlayerId == playerId) {
        _qualityLabel = null;
        _backdropMediaOverride = null;
        _backdropOverridePlayerId = null;
      }
    });
  }

  void _replacePlayer(MusicAssistantPlayer updatedPlayer) {
    if (!mounted) return;
    setState(() {
      final index = _players.indexWhere(
        (player) => player.playerId == updatedPlayer.playerId,
      );
      if (index == -1) {
        _players.add(updatedPlayer);
      } else {
        _players[index] = updatedPlayer;
      }
    });
  }

  Future<void> _setVolumeControlEnabled(bool enabled) async {
    try {
      await _volumeButtons.setEnabled(enabled);
      print("VOLUME BUTTONS ENABLED: $enabled");
    } on MissingPluginException {
      // Native volume routing is available on Android builds only.
    } on PlatformException {
      // Keep the Music Assistant connection usable without the native session.
    }
  }

  void _onDisplayedMediaChanged(
    String playerId,
    MusicAssistantPlayerMedia? media,
  ) {
    if (_selectedPlayerId != playerId) return;
    setState(() {
      _backdropMediaOverride = media;
      _backdropOverridePlayerId = media == null ? null : playerId;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_showStartupLoading) {
      return const Scaffold(
        backgroundColor: Color(0xFF090D12),
        body: Stack(
          fit: StackFit.expand,
          children: [
            ConnectionBackdrop(),
            Center(
              child: SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(
                  strokeWidth: 2.2,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      );
    }
    final repository = _repository;
    if (repository == null || _needsPlayerSetup) {
      return OnboardingScreen(
        isLoading: _isConnecting,
        error: _connectionError,
        onConnect: _connect,
        onLocaleChanged: widget.onLocaleChanged,
        showPlayerSetup: _needsPlayerSetup,
        playerSetupPage: repository == null
            ? null
            : PlayerSetupPage(
                players: _players,
                isRefreshing: _isRefreshingSetupPlayers,
                error: _playerSetupError,
                onRefresh: _refreshSetupPlayers,
                onComplete: _selectPlayer,
              ),
      );
    }

    final player = _players
        .where((item) => item.playerId == _selectedPlayerId)
        .firstOrNull;
    final currentMedia = player?.currentMedia;
    final hasCurrentTrack = currentMedia?.title?.trim().isNotEmpty ?? false;
    final isPlaying =
        player?.playbackState == MusicAssistantPlaybackState.playing;
    final isIdle = !hasCurrentTrack && !isPlaying;
    final backdropMedia = _backdropOverridePlayerId == _selectedPlayerId
        ? _backdropMediaOverride ?? currentMedia
        : currentMedia;
    final nowPlayingLabel = hasCurrentTrack
        ? [
            currentMedia!.title!.trim(),
            if (currentMedia.artist?.trim().isNotEmpty == true)
              currentMedia.artist!.trim(),
          ].join(' · ')
        : isPlaying
        ? AppLocalizations.of(context).playerMusicIsPlaying
        : null;

    final settingsPage = PlayerSettingsPage(
      user: repository.user,
      serverInfo: _serverInfo,
      players: _players,
      selectedPlayerId: _selectedPlayerId,
      serverAddress:
          Uri.tryParse(repository.serverUrl)?.authority ?? repository.serverUrl,
      clock24HourFormat: _clock24HourFormat,
      onClock24HourFormatChanged: _setClockFormat,
      onLocaleChanged: widget.onLocaleChanged,
      onSelectPlayer: _selectPlayer,
      onSignOut: _disconnect,
    );

    final idlePage = player == null
        ? const NothingPlayingPage()
        : IdlePlayerPage(
            key: ValueKey('${repository.serverUrl}:$_selectedPlayerId'),
            repository: repository,
            player: player,
            onPlaybackStarted: () =>
                _pagerKey.currentState?.openPlayerPage(),
          );
    final playerPage = player == null || isIdle
        ? const NothingPlayingPage()
        : PlayerScreen(
            key: ValueKey('${repository.serverUrl}:$_selectedPlayerId'),
            repository: repository,
            player: player,
            qualityLabel: _qualityLabel,
            playerActionError: _playerActionError,
            error: _playerError,
            onQueueCleared: _markPlayerIdle,
            onDisplayedMediaChanged: (media) =>
                _onDisplayedMediaChanged(player.playerId, media),
          );

    return Scaffold(
      backgroundColor: const Color(0xFF101819),
      body: AlbumBackdrop(
        imageUrl: isIdle ? null : backdropMedia?.imageUrl,
        palette: backdropMedia?.palette,
        serverUrl: repository.serverUrl,
        token: repository.token,
        child: Stack(
          fit: StackFit.expand,
          children: [
            SafeArea(
              child: Center(
                child: Material(
                  type: MaterialType.transparency,
                  child: AppPagePager(
                    key: _pagerKey,
                    isIdle: isIdle,
                    activePageControl: player == null
                        ? null
                        : PlayerNamePill(
                            playerName: player.name,
                            groupMemberCount:
                                (player.groupMembers?.length ?? 0) > 1
                                    ? player.groupMembers!.length
                                    : null,
                            onTap: () => showDialog<void>(
                              context: context,
                              builder: (_) => PlayerVolumeDialog(
                                repository: repository,
                                player: player,
                              ),
                            ),
                          ),
                    pages: [
                      ClockScreensaverPage(
                        nowPlayingLabel: nowPlayingLabel,
                        onNowPlayingTap: () =>
                            _pagerKey.currentState?.openPlayerPage(),
                        alwaysUse24HourFormat: _clock24HourFormat,
                      ),
                      idlePage,
                      playerPage,
                      settingsPage,
                    ],
                  ),
                ),
              ),
            ),
            if (player != null)
              PlayerVolumeFeedbackPopup(
                player: player,
                controller: _volumeController,
              ),
          ],
        ),
      ),
    );
  }
}
