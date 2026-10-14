// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_player_media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantPlayerMedia _$MusicAssistantPlayerMediaFromJson(
  Map<String, dynamic> json,
) => _MusicAssistantPlayerMedia(
  palette: json['palette'] == null
      ? null
      : MusicAssistantMediaItemPalette.fromJson(
          json['palette'] as Map<String, dynamic>,
        ),
  imageUrl: json['image_url'] as String?,
  duration: (json['duration'] as num?)?.toInt(),
  title: json['title'] as String?,
  artist: json['artist'] as String?,
  mediaType: json['media_type'] == null
      ? MusicAssistantMediaType.unknown
      : MusicAssistantMediaType.fromJson(json['media_type'] as String),
  uri: json['uri'] as String,
  album: json['album'] as String?,
);

Map<String, dynamic> _$MusicAssistantPlayerMediaToJson(
  _MusicAssistantPlayerMedia instance,
) => <String, dynamic>{
  'palette': instance.palette?.toJson(),
  'image_url': instance.imageUrl,
  'duration': instance.duration,
  'title': instance.title,
  'artist': instance.artist,
  'media_type': instance.mediaType.toJson(),
  'uri': instance.uri,
  'album': instance.album,
};
