// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_stream_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantStreamDetails _$MusicAssistantStreamDetailsFromJson(
  Map<String, dynamic> json,
) => _MusicAssistantStreamDetails(
  provider: json['provider'] as String,
  mediaType: json['media_type'] == null
      ? MusicAssistantMediaType.track
      : MusicAssistantMediaType.fromJson(json['media_type'] as String),
  streamType: json['stream_type'] == null
      ? MusicAssistantStreamType.custom
      : MusicAssistantStreamType.fromJson(json['stream_type'] as String),
  audioFormat: MusicAssistantAudioFormat.fromJson(
    json['audio_format'] as Map<String, dynamic>,
  ),
  itemId: json['item_id'] as String,
);

Map<String, dynamic> _$MusicAssistantStreamDetailsToJson(
  _MusicAssistantStreamDetails instance,
) => <String, dynamic>{
  'provider': instance.provider,
  'media_type': instance.mediaType.toJson(),
  'stream_type': instance.streamType.toJson(),
  'audio_format': instance.audioFormat.toJson(),
  'item_id': instance.itemId,
};
