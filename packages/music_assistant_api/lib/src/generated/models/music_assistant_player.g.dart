// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantPlayer _$MusicAssistantPlayerFromJson(
  Map<String, dynamic> json,
) => _MusicAssistantPlayer(
  playerId: json['player_id'] as String,
  playbackState: json['playback_state'] == null
      ? MusicAssistantPlaybackState.idle
      : MusicAssistantPlaybackState.fromJson(json['playback_state'] as String),
  currentMedia: json['current_media'] == null
      ? null
      : MusicAssistantPlayerMedia.fromJson(
          json['current_media'] as Map<String, dynamic>,
        ),
  volumeLevel: (json['volume_level'] as num?)?.toInt(),
  elapsedTimeLastUpdated: (json['elapsed_time_last_updated'] as num?)
      ?.toDouble(),
  groupMembers: (json['group_members'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  available: json['available'] as bool?,
  name: json['name'] as String,
  elapsedTime: (json['elapsed_time'] as num?)?.toDouble(),
);

Map<String, dynamic> _$MusicAssistantPlayerToJson(
  _MusicAssistantPlayer instance,
) => <String, dynamic>{
  'player_id': instance.playerId,
  'playback_state': instance.playbackState.toJson(),
  'current_media': instance.currentMedia?.toJson(),
  'volume_level': instance.volumeLevel,
  'elapsed_time_last_updated': instance.elapsedTimeLastUpdated,
  'group_members': instance.groupMembers,
  'available': instance.available,
  'name': instance.name,
  'elapsed_time': instance.elapsedTime,
};
