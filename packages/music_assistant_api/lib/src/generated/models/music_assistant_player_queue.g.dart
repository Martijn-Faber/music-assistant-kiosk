// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_player_queue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantPlayerQueue _$MusicAssistantPlayerQueueFromJson(
  Map<String, dynamic> json,
) => _MusicAssistantPlayerQueue(
  queueId: json['queue_id'] as String,
  displayName: json['display_name'] as String,
  currentIndex: (json['current_index'] as num?)?.toInt(),
  autoplayEnabled: json['autoplay_enabled'] as bool? ?? false,
  currentItem: json['current_item'] == null
      ? null
      : MusicAssistantQueueItem.fromJson(
          json['current_item'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$MusicAssistantPlayerQueueToJson(
  _MusicAssistantPlayerQueue instance,
) => <String, dynamic>{
  'queue_id': instance.queueId,
  'display_name': instance.displayName,
  'current_index': instance.currentIndex,
  'autoplay_enabled': instance.autoplayEnabled,
  'current_item': instance.currentItem?.toJson(),
};
