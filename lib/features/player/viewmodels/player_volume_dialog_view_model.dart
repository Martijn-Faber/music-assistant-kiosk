import 'package:flutter/foundation.dart';
import 'package:music_assistant_api/music_assistant_api.dart';

import '../data/music_assistant_repository.dart';

/// Loads group volume targets and coordinates volume updates for the dialog.
class PlayerVolumeDialogViewModel extends ChangeNotifier {
  PlayerVolumeDialogViewModel({required this.repository, required this.player}) {
    _targetsFuture = _loadTargets();
    final targetIds = {player.playerId, ...?player.groupMembers};
    _unsubscribe = repository.listenToPlayerEvents(
      onChanged: (updatedPlayer) {
        if (_disposed ||
            !targetIds.contains(updatedPlayer.playerId) ||
            updatedPlayer.volumeLevel == null ||
            _adjustingPlayerIds.contains(updatedPlayer.playerId) ||
            (_ignoreVolumeEventsUntil[updatedPlayer.playerId]?.isAfter(
                  DateTime.now(),
                ) ??
                false)) {
          return;
        }
        _volumeLevels[updatedPlayer.playerId] = updatedPlayer.volumeLevel!
            .clamp(0, 100)
            .toInt();
        notifyListeners();
      },
      onRemoved: (_) {},
    );
  }

  final MusicAssistantRepository repository;
  final MusicAssistantPlayer player;
  late final Future<List<MusicAssistantPlayer>> _targetsFuture;
  final Map<String, int> _volumeLevels = {};
  final Map<String, DateTime> _ignoreVolumeEventsUntil = {};
  final Set<String> _adjustingPlayerIds = {};
  String? savingPlayerId;
  late final void Function() _unsubscribe;
  bool _disposed = false;

  Future<List<MusicAssistantPlayer>> get targets => _targetsFuture;
  int volumeFor(String playerId) => _volumeLevels[playerId] ?? 0;
  bool isSaving(String playerId) => savingPlayerId == playerId;

  void setAdjusting(String playerId, bool adjusting) {
    if (adjusting) {
      _adjustingPlayerIds.add(playerId);
    } else {
      _adjustingPlayerIds.remove(playerId);
    }
  }

  void previewVolume(String playerId, double value) {
    _volumeLevels[playerId] = value.round();
    notifyListeners();
  }

  Future<List<MusicAssistantPlayer>> _loadTargets() async {
    final players = await repository.fetchPlayers();
    final memberIds = player.groupMembers ?? const <String>[];
    final targets = memberIds.isEmpty
        ? players.where((item) => item.playerId == player.playerId).toList()
        : players
              .where(
                (item) =>
                    memberIds.contains(item.playerId) ||
                    memberIds.contains(item.name),
              )
              .toList();
    final resolved = targets.isEmpty ? [player] : targets;
    for (final target in resolved) {
      _volumeLevels.putIfAbsent(
        target.playerId,
        () => target.volumeLevel?.clamp(0, 100).toInt() ?? 0,
      );
    }
    return resolved;
  }

  Future<void> saveVolume(String playerId, double value) async {
    final volume = value.round().clamp(0, 100).toInt();
    savingPlayerId = playerId;
    _adjustingPlayerIds.add(playerId);
    _volumeLevels[playerId] = volume;
    notifyListeners();
    try {
      await repository.setPlayerVolume(playerId, volume);
      _ignoreVolumeEventsUntil[playerId] = DateTime.now().add(
        const Duration(seconds: 2),
      );
    } finally {
      savingPlayerId = null;
      _adjustingPlayerIds.remove(playerId);
      if (!_disposed) notifyListeners();
    }
  }

  @override
  void dispose() {
    _disposed = true;
    _unsubscribe();
    super.dispose();
  }
}
