/// QueueItem
///
/// ```json
/// {
///     "properties": {
///         "streamdetails": {
///             "$ref": "#/components/schemas/StreamDetails",
///             "nullable": true
///         },
///         "index": {
///             "type": "integer",
///             "default": 0
///         },
///         "image": {
///             "$ref": "#/components/schemas/MediaItemImage",
///             "nullable": true
///         },
///         "media_item": {
///             "$ref": "#/components/schemas/Track",
///             "nullable": true
///         },
///         "sort_index": {
///             "type": "integer",
///             "default": 0
///         },
///         "name": {
///             "type": "string"
///         },
///         "duration": {
///             "type": "integer",
///             "nullable": true
///         },
///         "queue_item_id": {
///             "type": "string"
///         },
///         "queue_id": {
///             "type": "string"
///         }
///     },
///     "type": "object",
///     "required": [
///         "queue_id",
///         "queue_item_id",
///         "name"
///     ]
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_queue_item.freezed.dart';
part 'music_assistant_queue_item.g.dart';

@freezed
abstract class MusicAssistantQueueItem with _$MusicAssistantQueueItem {
  const MusicAssistantQueueItem._();

  @jsonSerializable
  const factory MusicAssistantQueueItem({
    /// streamdetails
    @JsonKey(name: MusicAssistantQueueItem.streamdetailsKey_)
    MusicAssistantStreamDetails? streamdetails,

    /// index
    @Default(0) @JsonKey(name: MusicAssistantQueueItem.indexKey_) int index,

    /// image
    @JsonKey(name: MusicAssistantQueueItem.imageKey_)
    MusicAssistantMediaItemImage? image,

    /// mediaItem
    @JsonKey(name: MusicAssistantQueueItem.mediaItemKey_)
    MusicAssistantTrack? mediaItem,

    /// sortIndex
    @Default(0)
    @JsonKey(name: MusicAssistantQueueItem.sortIndexKey_)
    int sortIndex,

    /// name
    @JsonKey(name: MusicAssistantQueueItem.nameKey_) required String name,

    /// duration
    @JsonKey(name: MusicAssistantQueueItem.durationKey_) int? duration,

    /// queueItemId
    @JsonKey(name: MusicAssistantQueueItem.queueItemIdKey_)
    required String queueItemId,

    /// queueId
    @JsonKey(name: MusicAssistantQueueItem.queueIdKey_) required String queueId,
  }) = _MusicAssistantQueueItem;

  factory MusicAssistantQueueItem.fromJson(Map<String, dynamic> json) =>
      _$MusicAssistantQueueItemFromJson(json);

  static const String streamdetailsKey_ = 'streamdetails';

  static const String indexKey_ = 'index';

  static const String imageKey_ = 'image';

  static const String mediaItemKey_ = 'media_item';

  static const String sortIndexKey_ = 'sort_index';

  static const String nameKey_ = 'name';

  static const String durationKey_ = 'duration';

  static const String queueItemIdKey_ = 'queue_item_id';

  static const String queueIdKey_ = 'queue_id';
}
