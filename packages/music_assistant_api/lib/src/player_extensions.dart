import 'generated/models/music_assistant_player.dart';

extension MusicAssistantPlayerVolume on MusicAssistantPlayer {
  /// The shared group level when available, otherwise the player's own level.
  int? get effectiveVolumeLevel => groupVolume ?? volumeLevel;
}
