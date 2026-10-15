// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_queue_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantQueueItem _$MusicAssistantQueueItemFromJson(
  Map<String, dynamic> json,
) => _MusicAssistantQueueItem(
  queueId: json['queue_id'] as String,
  queueItemId: json['queue_item_id'] as String,
  name: json['name'] as String,
  duration: (json['duration'] as num?)?.toInt(),
  sortIndex: (json['sort_index'] as num?)?.toInt() ?? 0,
  streamdetails: json['streamdetails'] == null
      ? null
      : MusicAssistantStreamDetails.fromJson(
          json['streamdetails'] as Map<String, dynamic>,
        ),
  mediaItem: json['media_item'] == null
      ? null
      : MusicAssistantTrack.fromJson(
          json['media_item'] as Map<String, dynamic>,
        ),
  image: json['image'] == null
      ? null
      : MusicAssistantMediaItemImage.fromJson(
          json['image'] as Map<String, dynamic>,
        ),
  index: (json['index'] as num?)?.toInt() ?? 0,
  available: json['available'] as bool? ?? true,
  extraAttributes: (json['extra_attributes'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$MusicAssistantQueueItemToJson(
  _MusicAssistantQueueItem instance,
) => <String, dynamic>{
  'queue_id': instance.queueId,
  'queue_item_id': instance.queueItemId,
  'name': instance.name,
  'duration': instance.duration,
  'sort_index': instance.sortIndex,
  'streamdetails': instance.streamdetails?.toJson(),
  'media_item': instance.mediaItem?.toJson(),
  'image': instance.image?.toJson(),
  'index': instance.index,
  'available': instance.available,
  'extra_attributes': instance.extraAttributes,
};
