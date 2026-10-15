/// QueueItem
///
/// ```json
/// {
///     "properties": {
///         "queue_id": {
///             "type": "string"
///         },
///         "queue_item_id": {
///             "type": "string"
///         },
///         "name": {
///             "type": "string"
///         },
///         "duration": {
///             "type": "integer",
///             "nullable": true
///         },
///         "sort_index": {
///             "type": "integer",
///             "default": 0
///         },
///         "streamdetails": {
///             "$ref": "#/components/schemas/StreamDetails",
///             "nullable": true
///         },
///         "media_item": {
///             "$ref": "#/components/schemas/Track",
///             "nullable": true
///         },
///         "image": {
///             "$ref": "#/components/schemas/MediaItemImage",
///             "nullable": true
///         },
///         "index": {
///             "type": "integer",
///             "default": 0
///         },
///         "available": {
///             "type": "boolean",
///             "default": true
///         },
///         "extra_attributes": {
///             "type": "object",
///             "additionalProperties": {
///                 "type": "string",
///                 "nullable": true
///             }
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
    /// queueId
    @JsonKey(name: MusicAssistantQueueItem.queueIdKey_) required String queueId,

    /// queueItemId
    @JsonKey(name: MusicAssistantQueueItem.queueItemIdKey_)
    required String queueItemId,

    /// name
    @JsonKey(name: MusicAssistantQueueItem.nameKey_) required String name,

    /// duration
    @JsonKey(name: MusicAssistantQueueItem.durationKey_) int? duration,

    /// sortIndex
    @Default(0)
    @JsonKey(name: MusicAssistantQueueItem.sortIndexKey_)
    int sortIndex,

    /// streamdetails
    @JsonKey(name: MusicAssistantQueueItem.streamdetailsKey_)
    MusicAssistantStreamDetails? streamdetails,

    /// mediaItem
    @JsonKey(name: MusicAssistantQueueItem.mediaItemKey_)
    MusicAssistantTrack? mediaItem,

    /// image
    @JsonKey(name: MusicAssistantQueueItem.imageKey_)
    MusicAssistantMediaItemImage? image,

    /// index
    @Default(0) @JsonKey(name: MusicAssistantQueueItem.indexKey_) int index,

    /// available
    @Default(true)
    @JsonKey(name: MusicAssistantQueueItem.availableKey_)
    bool available,

    /// extraAttributes
    @JsonKey(name: MusicAssistantQueueItem.extraAttributesKey_)
    Map<String, String?>? extraAttributes,
  }) = _MusicAssistantQueueItem;

  factory MusicAssistantQueueItem.fromJson(Map<String, dynamic> json) =>
      _$MusicAssistantQueueItemFromJson(json);

  static const String queueIdKey_ = 'queue_id';

  static const String queueItemIdKey_ = 'queue_item_id';

  static const String nameKey_ = 'name';

  static const String durationKey_ = 'duration';

  static const String sortIndexKey_ = 'sort_index';

  static const String streamdetailsKey_ = 'streamdetails';

  static const String mediaItemKey_ = 'media_item';

  static const String imageKey_ = 'image';

  static const String indexKey_ = 'index';

  static const String availableKey_ = 'available';

  static const String extraAttributesKey_ = 'extra_attributes';
}
