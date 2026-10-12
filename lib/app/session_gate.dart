import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/platform/volume_button_bridge.dart';
import '../core/storage/session_storage.dart';
import '../features/connection/presentation/connection_screen.dart';
import '../features/player/data/music_assistant_repository.dart';
import '../features/player/domain/player_summary.dart';
import '../features/player/presentation/player_screen.dart';

class SessionGate extends StatefulWidget {
  const SessionGate({super.key});

  @override
  State<SessionGate> createState() => _SessionGateState();
}

class _SessionGateState extends State<SessionGate> {
  final _sessionStorage = SessionStorage();
  final _volumeButtons = VolumeButtonBridge();

  MusicAssistantRepository? _repository;
  List<PlayerSummary> _players = [];
  String? _selectedPlayerId;
  void Function()? _unsubscribeFromPlayers;
  bool _isLoading = true;
  bool _isConnecting = false;
  String? _connectionError;
  String? _playerError;
  String? _playerActionError;
  String? _qualityLabel;
  int _qualityRequest = 0;
  int _volumeRefreshRequest = 0;
  Timer? _volumeFeedbackTimer;
  bool _showVolumeFeedback = false;
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
    _volumeFeedbackTimer?.cancel();
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
      if (!mounted) {
        await repository.disconnect();
        return;
      }

      final selectedPlayerId =
          players.any((player) => player.id == savedSession.selectedPlayerId)
          ? savedSession.selectedPlayerId
          : null;
      setState(() {
        _repository = repository;
        _players = players;
        _selectedPlayerId = selectedPlayerId;
      });
      _listenToPlayerChanges(repository);
      await _setVolumeControlEnabled(selectedPlayerId != null);
      if (selectedPlayerId != null)
        unawaited(_refreshQuality(selectedPlayerId));
    } catch (_) {
      await repository?.disconnect();
      if (mounted) {
        setState(() => _connectionError = 'Sign in again to reconnect.');
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

  Future<void> _connect(
    String serverUrl,
    String username,
    String password,
  ) async {
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
      repository = await MusicAssistantRepository.login(
        serverUrl: normalizedServerUrl,
        username: username,
        password: password,
      );
      final players = await repository.fetchPlayers();
      final savedPlayerId = await _sessionStorage.readSelectedPlayerId();
      await _sessionStorage.saveCredentials(
        serverUrl: normalizedServerUrl,
        token: repository.token,
      );
      if (!mounted) {
        await repository.disconnect();
        return;
      }

      final selectedPlayerId =
          players.any((player) => player.id == savedPlayerId)
          ? savedPlayerId
          : null;
      setState(() {
        _repository = repository;
        _players = players;
        _selectedPlayerId = selectedPlayerId;
      });
      _listenToPlayerChanges(repository);
      await _setVolumeControlEnabled(selectedPlayerId != null);
      if (selectedPlayerId != null)
        unawaited(_refreshQuality(selectedPlayerId));
    } on MissingPluginException {
      await repository?.disconnect();
      if (mounted) {
        setState(
          () => _connectionError =
              'Secure storage is not loaded. Fully stop and relaunch the app from Flutter.',
        );
      }
    } catch (error) {
      await repository?.disconnect();
      if (mounted) setState(() => _connectionError = error.toString());
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
    await _repository?.disconnect();
    await _sessionStorage.clearCredentials();
    if (!mounted) return;

    _qualityRequest++;
    setState(() {
      _repository = null;
      _players = [];
      _selectedPlayerId = null;
      _qualityLabel = null;
      _connectionError = null;
      _playerError = null;
      _playerActionError = null;
    });
  }

  Future<void> _selectPlayer(String playerId) async {
    try {
      await _sessionStorage.saveSelectedPlayerId(playerId);
      if (!mounted) return;
      setState(() {
        _selectedPlayerId = playerId;
        _qualityLabel = null;
        _playerError = null;
      });
      await _setVolumeControlEnabled(true);
      unawaited(_refreshQuality(playerId));
    } catch (error) {
      if (mounted) setState(() => _playerError = error.toString());
    }
  }

  void _listenToPlayerChanges(MusicAssistantRepository repository) {
    _unsubscribeFromPlayers?.call();
    _unsubscribeFromPlayers = repository.listenToPlayerEvents(
      onChanged: (player) {
        if (!mounted) return;
        final previousPlayer = _players
            .where((item) => item.id == player.id)
            .firstOrNull;
        final updatedPlayer =
            player.volumeLevel == null && previousPlayer?.volumeLevel != null
            ? player.withVolumeLevel(previousPlayer!.volumeLevel)
            : player;
        final trackChanged =
            previousPlayer == null ||
            previousPlayer.title != updatedPlayer.title ||
            previousPlayer.mediaUri != updatedPlayer.mediaUri ||
            previousPlayer.artist != updatedPlayer.artist ||
            previousPlayer.album != updatedPlayer.album;
        final volumeChanged =
            previousPlayer != null &&
            previousPlayer.volumeLevel != updatedPlayer.volumeLevel;

        setState(() {
          final index = _players.indexWhere((item) => item.id == player.id);
          if (index == -1) {
            _players.add(updatedPlayer);
          } else {
            _players[index] = updatedPlayer;
          }
          if (_selectedPlayerId == player.id && trackChanged) {
            _qualityLabel = null;
          }
        });

        if (_selectedPlayerId == player.id && trackChanged) {
          unawaited(_refreshQuality(player.id));
        }
        if (_selectedPlayerId == player.id && volumeChanged) {
          // An event is newer than any in-flight volume fetch. Do not let an
          // older fetch response move the bar back to a stale value.
          _volumeRefreshRequest++;
          _showVolumeChangeFeedback();
        }
      },
      onRemoved: (playerId) {
        if (!mounted) return;
        final wasSelected = _selectedPlayerId == playerId;
        if (wasSelected) _qualityRequest++;
        setState(() {
          _players.removeWhere((player) => player.id == playerId);
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
      onProgress: (playerId, report) {
        if (!mounted) return;
        final index = _players.indexWhere((player) => player.id == playerId);
        if (index == -1) return;
        setState(() {
          _players[index] = _players[index].withPlaybackProgress(report);
        });
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
    setState(() => _qualityLabel = qualityLabel ?? 'QUALITY UNKNOWN');
  }

  Future<void> _handleHardwareButton(String action) async {
    final repository = _repository;
    final playerId = _selectedPlayerId;
    if (repository == null || playerId == null) return;

    print("Incoming hardware button command");

    try {
      switch (action) {
        case 'volumeUp':
          _showVolumeChangeFeedback();
          await _adjustVolume(repository, playerId, increase: true);
          await _refreshPlayerAfterVolumeChange(repository, playerId);
        case 'volumeDown':
          _showVolumeChangeFeedback();
          await _adjustVolume(repository, playerId, increase: false);
          await _refreshPlayerAfterVolumeChange(repository, playerId);
        case 'togglePlayback':
          await repository.togglePlayback(playerId);
        default:
          return;
      }
      if (mounted) setState(() => _playerActionError = null);
    } catch (_) {
      if (mounted) setState(() => _playerActionError = 'Player action failed.');
    }
  }

  void _showVolumeChangeFeedback() {
    _volumeFeedbackTimer?.cancel();
    setState(() => _showVolumeFeedback = true);
    _volumeFeedbackTimer = Timer(const Duration(milliseconds: 1800), () {
      if (mounted) setState(() => _showVolumeFeedback = false);
    });
  }

  Future<void> _adjustVolume(
    MusicAssistantRepository repository,
    String playerId, {
    required bool increase,
  }) async {
    // Music Assistant owns the volume step (which may vary by player/group).
    // Keep the displayed value server-authoritative instead of guessing a
    // local percentage that will be corrected by the next event/fetch.
    await repository.adjustVolume(playerId, increase: increase);
  }

  Future<void> _refreshPlayerAfterVolumeChange(
    MusicAssistantRepository repository,
    String playerId,
  ) async {
    final request = ++_volumeRefreshRequest;
    try {
      await Future<void>.delayed(const Duration(milliseconds: 250));
      if (!mounted ||
          request != _volumeRefreshRequest ||
          !identical(_repository, repository) ||
          _selectedPlayerId != playerId) {
        return;
      }

      final players = await repository.fetchPlayers();
      if (!mounted ||
          request != _volumeRefreshRequest ||
          !identical(_repository, repository) ||
          _selectedPlayerId != playerId) {
        return;
      }

      final refreshedPlayer = players
          .where((player) => player.id == playerId)
          .firstOrNull;
      if (refreshedPlayer == null) return;
      final currentPlayer = _players
          .where((player) => player.id == playerId)
          .firstOrNull;
      final playerToStore =
          refreshedPlayer.volumeLevel == null &&
              currentPlayer?.volumeLevel != null
          ? refreshedPlayer.withVolumeLevel(currentPlayer!.volumeLevel)
          : refreshedPlayer;

      setState(() {
        final index = _players.indexWhere((player) => player.id == playerId);
        if (index == -1) {
          _players.add(playerToStore);
        } else {
          _players[index] = playerToStore;
        }
      });
      _showVolumeChangeFeedback();
    } catch (_) {
      // Keep the last volume received through the player event subscription.
    }
  }

  void _markPlayerIdle(String playerId) {
    final index = _players.indexWhere((player) => player.id == playerId);
    if (index == -1) return;
    setState(() {
      final player = _players[index];
      _players[index] = PlayerSummary(
        id: player.id,
        name: player.name,
        playbackState: 'idle',
        available: player.available,
        volumeLevel: player.volumeLevel,
        groupMembers: player.groupMembers,
      );
      if (_selectedPlayerId == playerId) _qualityLabel = null;
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
    if (repository == null) {
      return ConnectionScreen(
        isLoading: _isConnecting,
        error: _connectionError,
        onConnect: _connect,
      );
    }

    return PlayerScreen(
      repository: repository,
      players: _players,
      selectedPlayerId: _selectedPlayerId,
      qualityLabel: _qualityLabel,
      playerActionError: _playerActionError,
      error: _playerError,
      showVolumeFeedback: _showVolumeFeedback,
      clock24HourFormat: _clock24HourFormat,
      onClock24HourFormatChanged: _setClockFormat,
      onSelectPlayer: _selectPlayer,
      onQueueCleared: _markPlayerIdle,
      onDisconnect: _disconnect,
    );
  }
}
