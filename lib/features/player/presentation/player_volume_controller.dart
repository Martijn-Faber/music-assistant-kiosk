import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:music_assistant_api/music_assistant_api.dart';

import '../data/music_assistant_repository.dart';

class PlayerVolumeController extends ChangeNotifier {
  PlayerVolumeController({
    required bool Function() isMounted,
    required String? Function() selectedPlayerId,
    required MusicAssistantRepository? Function() repository,
    required List<MusicAssistantPlayer> Function() players,
    required void Function(MusicAssistantPlayer player) onPlayerUpdated,
    required VoidCallback onActionError,
  }) : _isMounted = isMounted,
       _selectedPlayerId = selectedPlayerId,
       _repository = repository,
       _players = players,
       _onPlayerUpdated = onPlayerUpdated,
       _onActionError = onActionError;

  final bool Function() _isMounted;
  final String? Function() _selectedPlayerId;
  final MusicAssistantRepository? Function() _repository;
  final List<MusicAssistantPlayer> Function() _players;
  final void Function(MusicAssistantPlayer player) _onPlayerUpdated;
  final VoidCallback _onActionError;

  final Set<String> _hardwareVolumePending = {};
  Timer? _feedbackTimer;
  Timer? _reconcileTimer;
  Timer? _commandThrottleTimer;
  bool? _queuedVolumeIncrease;
  int _commandsInFlight = 0;
  int _refreshRequest = 0;
  DateTime? _lastCommandAt;
  bool _visible = false;

  bool get visible => _visible;

  bool isHardwareVolumePending(String playerId) =>
      _hardwareVolumePending.contains(playerId);

  void handleHardwareButton(
    MusicAssistantRepository repository,
    String playerId, {
    required bool increase,
  }) {
    _show();
    final request = ++_refreshRequest;
    _hardwareVolumePending.add(playerId);
    _scheduleReadback(repository, playerId, request);

    const throttleInterval = Duration(milliseconds: 180);
    final lastSentAt = _lastCommandAt;
    final canSendNow =
        _commandThrottleTimer == null &&
        (lastSentAt == null ||
            DateTime.now().difference(lastSentAt) >= throttleInterval);

    if (canSendNow) {
      _dispatchCommand(
        repository,
        playerId,
        increase: increase,
        request: request,
      );
      return;
    }

    // Collapse repeats inside the throttle window to the latest direction.
    _queuedVolumeIncrease = increase;
    _scheduleQueuedCommand(repository, playerId);
  }

  void onPlayerVolumeChanged(
    MusicAssistantRepository repository,
    String playerId, {
    required bool hardwarePending,
  }) {
    // TODO(volume-popup-stale-value): This is a known unresolved issue: the
    // popup can still lag behind the Music Assistant frontend (for example,
    // 39% here while the frontend reports 42%). Revisit how server events,
    // readback, and group/player volume fields are reconciled.
    _refreshRequest++;
    if (hardwarePending) {
      _scheduleReadback(repository, playerId, _refreshRequest);
    } else {
      _show();
    }
  }

  void _show() {
    _feedbackTimer?.cancel();
    if (!_visible) {
      _visible = true;
      notifyListeners();
    }
    _feedbackTimer = Timer(const Duration(milliseconds: 1800), () {
      _feedbackTimer = null;
      _visible = false;
      notifyListeners();
    });
  }

  void _scheduleQueuedCommand(
    MusicAssistantRepository repository,
    String playerId,
  ) {
    if (!_isMounted() ||
        _commandThrottleTimer != null ||
        _queuedVolumeIncrease == null) {
      return;
    }

    const throttleInterval = Duration(milliseconds: 180);
    final lastSentAt = _lastCommandAt;
    final elapsed = lastSentAt == null
        ? throttleInterval
        : DateTime.now().difference(lastSentAt);
    final remaining = elapsed >= throttleInterval
        ? Duration.zero
        : throttleInterval - elapsed;
    _commandThrottleTimer = Timer(remaining, () {
      _commandThrottleTimer = null;
      final queuedDirection = _queuedVolumeIncrease;
      _queuedVolumeIncrease = null;
      if (queuedDirection == null || !_isMounted()) return;
      if (!identical(_repository(), repository) ||
          _selectedPlayerId() != playerId) {
        _hardwareVolumePending.remove(playerId);
        return;
      }
      _dispatchCommand(
        repository,
        playerId,
        increase: queuedDirection,
        request: _refreshRequest,
      );
    });
  }

  void _dispatchCommand(
    MusicAssistantRepository repository,
    String playerId, {
    required bool increase,
    required int request,
  }) {
    _lastCommandAt = DateTime.now();
    _commandsInFlight++;
    unawaited(
      _sendCommand(
        repository,
        playerId,
        increase: increase,
        request: request,
      ),
    );
  }

  Future<void> _sendCommand(
    MusicAssistantRepository repository,
    String playerId, {
    required bool increase,
    required int request,
  }) async {
    try {
      await repository.adjustVolume(playerId, increase: increase);
      await SystemSound.play(SystemSoundType.click);
      if (request == _refreshRequest) {
        _scheduleReadback(repository, playerId, request);
      }
    } catch (_) {
      if (request == _refreshRequest) {
        _hardwareVolumePending.remove(playerId);
        if (_isMounted()) _onActionError();
      }
    } finally {
      _commandsInFlight--;
      _scheduleQueuedCommand(repository, playerId);
      if (request == _refreshRequest &&
          _queuedVolumeIncrease == null &&
          _commandThrottleTimer == null) {
        _scheduleReadback(repository, playerId, request);
      }
    }
  }

  void _scheduleReadback(
    MusicAssistantRepository repository,
    String playerId,
    int request,
  ) {
    _reconcileTimer?.cancel();
    _reconcileTimer = Timer(const Duration(milliseconds: 500), () {
      if (_commandsInFlight > 0 ||
          _queuedVolumeIncrease != null ||
          _commandThrottleTimer != null) {
        _scheduleReadback(repository, playerId, request);
        return;
      }
      unawaited(_refreshPlayer(repository, playerId, request));
    });
  }

  Future<void> _refreshPlayer(
    MusicAssistantRepository repository,
    String playerId,
    int request,
  ) async {
    try {
      if (!_isCurrent(repository, playerId, request)) return;
      final refreshedPlayer = await repository.fetchPlayer(playerId);
      if (!_isCurrent(repository, playerId, request)) return;

      final currentPlayer = _players()
          .where((player) => player.playerId == playerId)
          .firstOrNull;
      final playerWithVolume = refreshedPlayer.copyWith(
        volumeLevel: refreshedPlayer.volumeLevel ?? currentPlayer?.volumeLevel,
        groupVolume: refreshedPlayer.groupVolume ?? currentPlayer?.groupVolume,
      );
      _hardwareVolumePending.remove(playerId);
      _onPlayerUpdated(playerWithVolume);
    } catch (_) {
      if (request == _refreshRequest) _hardwareVolumePending.remove(playerId);
    }
  }

  bool _isCurrent(
    MusicAssistantRepository repository,
    String playerId,
    int request,
  ) =>
      _isMounted() &&
      request == _refreshRequest &&
      identical(_repository(), repository) &&
      _selectedPlayerId() == playerId;

  @override
  void dispose() {
    _feedbackTimer?.cancel();
    _reconcileTimer?.cancel();
    _commandThrottleTimer?.cancel();
    super.dispose();
  }
}
