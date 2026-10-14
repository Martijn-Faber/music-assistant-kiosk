/// PlayerQueue
///
/// ```json
/// {
///     "properties": {
///         "queue_id": {
///             "type": "string"
///         },
///         "display_name": {
///             "type": "string"
///         },
///         "current_index": {
///             "type": "integer",
///             "nullable": true
///         },
///         "autoplay_enabled": {
///             "type": "boolean",
///             "default": false
///         },
///         "current_item": {
///             "$ref": "#/components/schemas/QueueItem",
///             "nullable": true
///         }
///     },
///     "type": "object",
///     "required": [
///         "queue_id",
///         "display_name",
///         "current_index"
///     ]
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_player_queue.freezed.dart';
part 'music_assistant_player_queue.g.dart';

@freezed
abstract class MusicAssistantPlayerQueue with _$MusicAssistantPlayerQueue {
  const MusicAssistantPlayerQueue._();

  @jsonSerializable
  const factory MusicAssistantPlayerQueue({
    /// queueId
    @JsonKey(name: MusicAssistantPlayerQueue.queueIdKey_)
    required String queueId,

    /// displayName
    @JsonKey(name: MusicAssistantPlayerQueue.displayNameKey_)
    required String displayName,

    /// currentIndex
    @JsonKey(name: MusicAssistantPlayerQueue.currentIndexKey_)
    required int? currentIndex,

    /// autoplayEnabled
    @Default(false)
    @JsonKey(name: MusicAssistantPlayerQueue.autoplayEnabledKey_)
    bool autoplayEnabled,

    /// currentItem
    @JsonKey(name: MusicAssistantPlayerQueue.currentItemKey_)
    MusicAssistantQueueItem? currentItem,
  }) = _MusicAssistantPlayerQueue;

  factory MusicAssistantPlayerQueue.fromJson(Map<String, dynamic> json) =>
      _$MusicAssistantPlayerQueueFromJson(json);

  static const String queueIdKey_ = 'queue_id';

  static const String displayNameKey_ = 'display_name';

  static const String currentIndexKey_ = 'current_index';

  static const String autoplayEnabledKey_ = 'autoplay_enabled';

  static const String currentItemKey_ = 'current_item';
}
