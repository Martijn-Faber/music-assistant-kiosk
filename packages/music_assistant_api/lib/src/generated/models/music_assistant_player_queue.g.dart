// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_player_queue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantPlayerQueue _$MusicAssistantPlayerQueueFromJson(
  Map<String, dynamic> json,
) => _MusicAssistantPlayerQueue(
  queueId: json['queue_id'] as String,
  active: json['active'] as bool,
  displayName: json['display_name'] as String,
  available: json['available'] as bool,
  items: (json['items'] as num).toInt(),
  shuffleEnabled: json['shuffle_enabled'] as bool? ?? false,
  repeatMode: json['repeat_mode'] == null
      ? MusicAssistantRepeatMode.off
      : MusicAssistantRepeatMode.fromJson(json['repeat_mode'] as String),
  crossfadeEnabled: json['crossfade_enabled'] as bool? ?? false,
  autoplayEnabled: json['autoplay_enabled'] as bool? ?? false,
  overlayEnabled: json['overlay_enabled'] as bool? ?? false,
  overlaySource: json['overlay_source'] == null
      ? null
      : MusicAssistantItemMapping.fromJson(
          json['overlay_source'] as Map<String, dynamic>,
        ),
  overlayVolume: (json['overlay_volume'] as num?)?.toInt() ?? 100,
  smartFadesActive: json['smart_fades_active'] as bool? ?? false,
  smartShuffleActive: json['smart_shuffle_active'] as bool? ?? false,
  currentIndex: (json['current_index'] as num?)?.toInt(),
  indexInBuffer: (json['index_in_buffer'] as num?)?.toInt(),
  ended: json['ended'] as bool? ?? false,
  elapsedTime: (json['elapsed_time'] as num?)?.toDouble() ?? 0,
  elapsedTimeLastUpdated: (json['elapsed_time_last_updated'] as num?)
      ?.toDouble(),
  playbackSpeed: (json['playback_speed'] as num?)?.toDouble() ?? 1.0,
  state: json['state'] == null
      ? MusicAssistantPlaybackState.idle
      : MusicAssistantPlaybackState.fromJson(json['state'] as String),
  currentItem: json['current_item'] == null
      ? null
      : MusicAssistantQueueItem.fromJson(
          json['current_item'] as Map<String, dynamic>,
        ),
  nextItem: json['next_item'] == null
      ? null
      : MusicAssistantQueueItem.fromJson(
          json['next_item'] as Map<String, dynamic>,
        ),
  sources: (json['sources'] as List<dynamic>?)
      ?.map(
        (e) => MusicAssistantItemMapping.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  flowMode: json['flow_mode'] as bool? ?? false,
  resumePos: (json['resume_pos'] as num?)?.toInt() ?? 0,
  isDynamic: json['is_dynamic'] as bool? ?? false,
  extraAttributes: (json['extra_attributes'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$MusicAssistantPlayerQueueToJson(
  _MusicAssistantPlayerQueue instance,
) => <String, dynamic>{
  'queue_id': instance.queueId,
  'active': instance.active,
  'display_name': instance.displayName,
  'available': instance.available,
  'items': instance.items,
  'shuffle_enabled': instance.shuffleEnabled,
  'repeat_mode': instance.repeatMode.toJson(),
  'crossfade_enabled': instance.crossfadeEnabled,
  'autoplay_enabled': instance.autoplayEnabled,
  'overlay_enabled': instance.overlayEnabled,
  'overlay_source': instance.overlaySource?.toJson(),
  'overlay_volume': instance.overlayVolume,
  'smart_fades_active': instance.smartFadesActive,
  'smart_shuffle_active': instance.smartShuffleActive,
  'current_index': instance.currentIndex,
  'index_in_buffer': instance.indexInBuffer,
  'ended': instance.ended,
  'elapsed_time': instance.elapsedTime,
  'elapsed_time_last_updated': instance.elapsedTimeLastUpdated,
  'playback_speed': instance.playbackSpeed,
  'state': instance.state.toJson(),
  'current_item': instance.currentItem?.toJson(),
  'next_item': instance.nextItem?.toJson(),
  'sources': instance.sources?.map((e) => e.toJson()).toList(),
  'flow_mode': instance.flowMode,
  'resume_pos': instance.resumePos,
  'is_dynamic': instance.isDynamic,
  'extra_attributes': instance.extraAttributes,
};
