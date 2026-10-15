import '../generated/models/music_assistant_player.dart';

typedef PlayerChangesListener =
    void Function() Function({
      required void Function(MusicAssistantPlayer player) onChanged,
      required void Function(String playerId) onRemoved,
    });

class PlayersResource {
  const PlayersResource({
    required Future<List<MusicAssistantPlayer>> Function() all,
    required Future<MusicAssistantPlayer> Function(String playerId) get,
    required Future<void> Function(String playerId, int volumeLevel) setVolume,
    required Future<void> Function(String playerId, int volumeLevel)
    setGroupVolume,
    required Future<void> Function(String playerId) groupVolumeUp,
    required Future<void> Function(String playerId) groupVolumeDown,
    required PlayerChangesListener subscribeToChanges,
  }) : _all = all,
       _get = get,
       _setVolume = setVolume,
       _setGroupVolume = setGroupVolume,
       _groupVolumeUp = groupVolumeUp,
       _groupVolumeDown = groupVolumeDown,
       _subscribeToChanges = subscribeToChanges;

  final Future<List<MusicAssistantPlayer>> Function() _all;
  final Future<MusicAssistantPlayer> Function(String playerId) _get;
  final Future<void> Function(String playerId, int volumeLevel) _setVolume;
  final Future<void> Function(String playerId, int volumeLevel) _setGroupVolume;
  final Future<void> Function(String playerId) _groupVolumeUp;
  final Future<void> Function(String playerId) _groupVolumeDown;
  final PlayerChangesListener _subscribeToChanges;

  Future<List<MusicAssistantPlayer>> all() => _all();

  Future<MusicAssistantPlayer> get(String playerId) => _get(playerId);

  Future<void> setVolume(String playerId, int volumeLevel) =>
      _setVolume(playerId, volumeLevel);

  Future<void> setGroupVolume(String playerId, int volumeLevel) =>
      _setGroupVolume(playerId, volumeLevel);

  Future<void> groupVolumeUp(String playerId) => _groupVolumeUp(playerId);

  Future<void> groupVolumeDown(String playerId) => _groupVolumeDown(playerId);

  void Function() subscribeToChanges({
    required void Function(MusicAssistantPlayer player) onChanged,
    required void Function(String playerId) onRemoved,
  }) => _subscribeToChanges(onChanged: onChanged, onRemoved: onRemoved);
}
