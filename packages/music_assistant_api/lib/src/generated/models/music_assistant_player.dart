/// Player
///
/// ```json
/// {
///     "properties": {
///         "player_id": {
///             "type": "string"
///         },
///         "playback_state": {
///             "$ref": "#/components/schemas/PlaybackState",
///             "default": "idle"
///         },
///         "current_media": {
///             "$ref": "#/components/schemas/PlayerMedia",
///             "nullable": true
///         },
///         "volume_level": {
///             "type": "integer",
///             "nullable": true
///         },
///         "elapsed_time_last_updated": {
///             "type": "number",
///             "nullable": true
///         },
///         "group_members": {
///             "type": "array",
///             "items": {
///                 "type": "string"
///             }
///         },
///         "available": {
///             "type": "boolean"
///         },
///         "name": {
///             "type": "string"
///         },
///         "elapsed_time": {
///             "type": "number",
///             "nullable": true
///         }
///     },
///     "type": "object",
///     "required": [
///         "player_id",
///         "name"
///     ]
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_player.freezed.dart';
part 'music_assistant_player.g.dart';

@freezed
abstract class MusicAssistantPlayer with _$MusicAssistantPlayer {
  const MusicAssistantPlayer._();

  @jsonSerializable
  const factory MusicAssistantPlayer({
    /// playerId
    @JsonKey(name: MusicAssistantPlayer.playerIdKey_) required String playerId,

    /// playbackState
    @Default(MusicAssistantPlaybackState.idle)
    @JsonKey(name: MusicAssistantPlayer.playbackStateKey_)
    MusicAssistantPlaybackState playbackState,

    /// currentMedia
    @JsonKey(name: MusicAssistantPlayer.currentMediaKey_)
    MusicAssistantPlayerMedia? currentMedia,

    /// volumeLevel
    @JsonKey(name: MusicAssistantPlayer.volumeLevelKey_) int? volumeLevel,

    /// elapsedTimeLastUpdated
    @JsonKey(name: MusicAssistantPlayer.elapsedTimeLastUpdatedKey_)
    double? elapsedTimeLastUpdated,

    /// groupMembers
    @JsonKey(name: MusicAssistantPlayer.groupMembersKey_)
    List<String>? groupMembers,

    /// available
    @JsonKey(name: MusicAssistantPlayer.availableKey_) bool? available,

    /// name
    @JsonKey(name: MusicAssistantPlayer.nameKey_) required String name,

    /// elapsedTime
    @JsonKey(name: MusicAssistantPlayer.elapsedTimeKey_) double? elapsedTime,
  }) = _MusicAssistantPlayer;

  factory MusicAssistantPlayer.fromJson(Map<String, dynamic> json) =>
      _$MusicAssistantPlayerFromJson(json);

  static const String playerIdKey_ = 'player_id';

  static const String playbackStateKey_ = 'playback_state';

  static const String currentMediaKey_ = 'current_media';

  static const String volumeLevelKey_ = 'volume_level';

  static const String elapsedTimeLastUpdatedKey_ = 'elapsed_time_last_updated';

  static const String groupMembersKey_ = 'group_members';

  static const String availableKey_ = 'available';

  static const String nameKey_ = 'name';

  static const String elapsedTimeKey_ = 'elapsed_time';
}
