import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/platform/volume_button_bridge.dart';
import '../core/storage/session_storage.dart';
import '../l10n/generated/app_localizations.dart';
import '../features/onboarding/presentation/onboarding_screen.dart';
import '../features/player/data/music_assistant_repository.dart';
import 'package:music_assistant_api/music_assistant_api.dart';
import '../features/player/presentation/player_screen.dart';
import '../features/player/presentation/player_setup_page.dart';
import '../features/player/viewmodels/player_volume_view_model.dart';

class SessionGate extends StatefulWidget {
  const SessionGate({super.key, required this.onLocaleChanged});

  final ValueChanged<Locale> onLocaleChanged;

  @override
  State<SessionGate> createState() => _SessionGateState();
}

class _SessionGateState extends State<SessionGate> {
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
    MusicAssistantRepository? repository;
    try {
      final savedSession = await _sessionStorage.readSession();
      if (savedSession == null) return;

      repository = await MusicAssistantRepository.resume(
        serverUrl: savedSession.serverUrl,
        token: savedSession.token,
      );
      final players = await repository.fetchPlayers();
      final serverInfo = await repository.fetchServerInfo();
      if (!mounted) {
        await repository.disconnect();
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
          : await repository.fetchPlayer(selectedPlayerId);
      if (!mounted) {
        await repository.disconnect();
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
      });
      _listenToPlayerChanges(repository);
      await _setVolumeControlEnabled(_playerSupportsVolumeSet(selectedPlayer));
      if (selectedPlayerId != null)
        unawaited(_refreshQuality(selectedPlayerId));
    } catch (_) {
      await repository?.disconnect();
      if (mounted) {
        setState(
          () => _connectionError =
              AppLocalizations.of(context).settingsSignInAgainToReconnect,
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
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
    }
    if (!mounted) return;

    _qualityRequest++;
    setState(() {
      _repository = null;
      _players = [];
      _serverInfo = null;
      _selectedPlayerId = null;
      _qualityLabel = null;
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
      if (!mounted) return;
      setState(() {
        final index = _players.indexWhere((item) => item.playerId == playerId);
        if (index == -1) {
          _players.add(player);
        } else {
          _players[index] = player;
        }
        _selectedPlayerId = playerId;
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
      if (_selectedPlayerId == playerId) _qualityLabel = null;
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

  @override
  Widget build(BuildContext context) {
    final repository = _repository;
    if (repository == null || _needsPlayerSetup) {
      return OnboardingScreen(
        isLoading: _isConnecting,
        error: _connectionError,
        onConnect: _connect,
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

    return PlayerScreen(
      repository: repository,
      serverInfo: _serverInfo,
      players: _players,
      selectedPlayerId: _selectedPlayerId,
      qualityLabel: _qualityLabel,
      playerActionError: _playerActionError,
      error: _playerError,
      volumeController: _volumeController,
      clock24HourFormat: _clock24HourFormat,
      onClock24HourFormatChanged: _setClockFormat,
      onLocaleChanged: widget.onLocaleChanged,
      onSelectPlayer: _selectPlayer,
      onQueueCleared: _markPlayerIdle,
      onDisconnect: _disconnect,
    );
  }
}
