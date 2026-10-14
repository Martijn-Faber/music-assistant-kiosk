// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_queue_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantQueueItem _$MusicAssistantQueueItemFromJson(
  Map<String, dynamic> json,
) => _MusicAssistantQueueItem(
  streamdetails: json['streamdetails'] == null
      ? null
      : MusicAssistantStreamDetails.fromJson(
          json['streamdetails'] as Map<String, dynamic>,
        ),
  index: (json['index'] as num?)?.toInt() ?? 0,
  image: json['image'] == null
      ? null
      : MusicAssistantMediaItemImage.fromJson(
          json['image'] as Map<String, dynamic>,
        ),
  mediaItem: json['media_item'] == null
      ? null
      : MusicAssistantTrack.fromJson(
          json['media_item'] as Map<String, dynamic>,
        ),
  sortIndex: (json['sort_index'] as num?)?.toInt() ?? 0,
  name: json['name'] as String,
  duration: (json['duration'] as num?)?.toInt(),
  queueItemId: json['queue_item_id'] as String,
  queueId: json['queue_id'] as String,
);

Map<String, dynamic> _$MusicAssistantQueueItemToJson(
  _MusicAssistantQueueItem instance,
) => <String, dynamic>{
  'streamdetails': instance.streamdetails?.toJson(),
  'index': instance.index,
  'image': instance.image?.toJson(),
  'media_item': instance.mediaItem?.toJson(),
  'sort_index': instance.sortIndex,
  'name': instance.name,
  'duration': instance.duration,
  'queue_item_id': instance.queueItemId,
  'queue_id': instance.queueId,
};
