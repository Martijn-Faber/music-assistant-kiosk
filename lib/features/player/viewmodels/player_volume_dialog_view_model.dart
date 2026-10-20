import 'package:flutter/foundation.dart';
import 'package:music_assistant_api/music_assistant_api.dart';

import '../data/music_assistant_repository.dart';

/// Loads group volume targets and coordinates volume updates for the dialog.
class PlayerVolumeDialogViewModel extends ChangeNotifier {
  PlayerVolumeDialogViewModel({required this.repository, required this.player}) {
    _currentMemberIds = {...?player.groupMembers};
    _targetsFuture = _loadTargets();
    _allPlayersFuture = repository.fetchPlayers();
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
  late Future<List<MusicAssistantPlayer>> _targetsFuture;
  late final Future<List<MusicAssistantPlayer>> _allPlayersFuture;
  final Map<String, int> _volumeLevels = {};
  final Map<String, DateTime> _ignoreVolumeEventsUntil = {};
  final Set<String> _adjustingPlayerIds = {};
  late final Set<String> _currentMemberIds;
  String? savingPlayerId;
  late final void Function() _unsubscribe;
  bool _disposed = false;

  Future<List<MusicAssistantPlayer>> get targets => _targetsFuture;
  Future<List<MusicAssistantPlayer>> get allPlayers => _allPlayersFuture;
  Set<String> get currentMemberIds => _currentMemberIds;
  List<String> get groupablePlayerIds => player.canGroupWith ?? const [];
  int volumeFor(String playerId) => _volumeLevels[playerId] ?? 0;
  bool isSaving(String playerId) => savingPlayerId == playerId;

  bool canAddToGroup(MusicAssistantPlayer candidate) =>
      candidate.type != MusicAssistantPlayerType.group &&
      currentMemberIds.contains(candidate.playerId) == false &&
      (groupablePlayerIds.contains(candidate.playerId) ||
          candidate.canGroupWith?.contains(player.playerId) == true);

  Future<void> addToGroup(String playerId) async {
    await repository.addPlayerToGroup(player.playerId, playerId);
    _currentMemberIds.add(playerId);
    _targetsFuture = _loadTargets();
    notifyListeners();
  }

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
    final currentGroup = await repository.fetchPlayer(player.playerId);
    _currentMemberIds
      ..clear()
      ..addAll(currentGroup.groupMembers ?? const <String>[]);
    final memberIds = _currentMemberIds;
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
