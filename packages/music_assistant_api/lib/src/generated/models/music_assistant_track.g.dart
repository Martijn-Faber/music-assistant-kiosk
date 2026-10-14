// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantTrack _$MusicAssistantTrackFromJson(Map<String, dynamic> json) =>
    _MusicAssistantTrack(
      album: json['album'] == null
          ? null
          : MusicAssistantTrackAlbum.fromJson(
              json['album'] as Map<String, dynamic>,
            ),
      artists: (json['artists'] as List<dynamic>?)
          ?.map(
            (e) => MusicAssistantTrackArtistsItem.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
      itemId: json['item_id'] as String,
      provider: json['provider'] as String,
      metadata: json['metadata'] == null
          ? null
          : MusicAssistantMediaItemMetadata.fromJson(
              json['metadata'] as Map<String, dynamic>,
            ),
      duration: (json['duration'] as num?)?.toInt() ?? 0,
      name: json['name'] as String,
      mediaType: json['media_type'] == null
          ? MusicAssistantMediaType.track
          : MusicAssistantMediaType.fromJson(json['media_type'] as String),
      uri: json['uri'] as String?,
      favorite: json['favorite'] as bool? ?? false,
    );

Map<String, dynamic> _$MusicAssistantTrackToJson(
  _MusicAssistantTrack instance,
) => <String, dynamic>{
  'album': instance.album?.toJson(),
  'artists': instance.artists?.map((e) => e.toJson()).toList(),
  'item_id': instance.itemId,
  'provider': instance.provider,
  'metadata': instance.metadata?.toJson(),
  'duration': instance.duration,
  'name': instance.name,
  'media_type': instance.mediaType.toJson(),
  'uri': instance.uri,
  'favorite': instance.favorite,
};
