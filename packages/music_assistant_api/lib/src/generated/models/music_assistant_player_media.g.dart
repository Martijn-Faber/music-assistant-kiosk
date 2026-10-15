// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_player_media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantPlayerMedia _$MusicAssistantPlayerMediaFromJson(
  Map<String, dynamic> json,
) => _MusicAssistantPlayerMedia(
  uri: json['uri'] as String,
  mediaType: json['media_type'] == null
      ? MusicAssistantMediaType.unknown
      : MusicAssistantMediaType.fromJson(json['media_type'] as String),
  title: json['title'] as String?,
  artist: json['artist'] as String?,
  album: json['album'] as String?,
  albumArtist: json['album_artist'] as String?,
  imageUrl: json['image_url'] as String?,
  palette: json['palette'] == null
      ? null
      : MusicAssistantMediaItemPalette.fromJson(
          json['palette'] as Map<String, dynamic>,
        ),
  duration: (json['duration'] as num?)?.toInt(),
  streamDuration: (json['stream_duration'] as num?)?.toInt(),
  sourceId: json['source_id'] as String?,
  queueItemId: json['queue_item_id'] as String?,
  customData: (json['custom_data'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as Map<String, dynamic>),
  ),
  elapsedTime: (json['elapsed_time'] as num?)?.toInt(),
  elapsedTimeLastUpdated: (json['elapsed_time_last_updated'] as num?)
      ?.toDouble(),
);

Map<String, dynamic> _$MusicAssistantPlayerMediaToJson(
  _MusicAssistantPlayerMedia instance,
) => <String, dynamic>{
  'uri': instance.uri,
  'media_type': instance.mediaType.toJson(),
  'title': instance.title,
  'artist': instance.artist,
  'album': instance.album,
  'album_artist': instance.albumArtist,
  'image_url': instance.imageUrl,
  'palette': instance.palette?.toJson(),
  'duration': instance.duration,
  'stream_duration': instance.streamDuration,
  'source_id': instance.sourceId,
  'queue_item_id': instance.queueItemId,
  'custom_data': instance.customData,
  'elapsed_time': instance.elapsedTime,
  'elapsed_time_last_updated': instance.elapsedTimeLastUpdated,
};
