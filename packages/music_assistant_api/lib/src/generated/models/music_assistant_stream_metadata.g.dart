// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_stream_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantStreamMetadata _$MusicAssistantStreamMetadataFromJson(
  Map<String, dynamic> json,
) => _MusicAssistantStreamMetadata(
  title: json['title'] as String,
  artist: json['artist'] as String?,
  album: json['album'] as String?,
  imageUrl: json['image_url'] as String?,
  duration: (json['duration'] as num?)?.toInt(),
  description: json['description'] as String?,
  uri: json['uri'] as String?,
  elapsedTime: (json['elapsed_time'] as num?)?.toInt(),
  elapsedTimeLastUpdated: (json['elapsed_time_last_updated'] as num?)
      ?.toDouble(),
);

Map<String, dynamic> _$MusicAssistantStreamMetadataToJson(
  _MusicAssistantStreamMetadata instance,
) => <String, dynamic>{
  'title': instance.title,
  'artist': instance.artist,
  'album': instance.album,
  'image_url': instance.imageUrl,
  'duration': instance.duration,
  'description': instance.description,
  'uri': instance.uri,
  'elapsed_time': instance.elapsedTime,
  'elapsed_time_last_updated': instance.elapsedTimeLastUpdated,
};
