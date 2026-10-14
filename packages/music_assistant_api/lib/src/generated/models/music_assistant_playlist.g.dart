// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_playlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantPlaylist _$MusicAssistantPlaylistFromJson(
  Map<String, dynamic> json,
) => _MusicAssistantPlaylist(
  owner: json['owner'] as String? ?? '',
  favorite: json['favorite'] as bool? ?? false,
  metadata: json['metadata'] == null
      ? null
      : MusicAssistantMediaItemMetadata.fromJson(
          json['metadata'] as Map<String, dynamic>,
        ),
  itemId: json['item_id'] as String,
  provider: json['provider'] as String,
  name: json['name'] as String,
  uri: json['uri'] as String?,
  mediaType: json['media_type'] == null
      ? MusicAssistantMediaType.playlist
      : MusicAssistantMediaType.fromJson(json['media_type'] as String),
);

Map<String, dynamic> _$MusicAssistantPlaylistToJson(
  _MusicAssistantPlaylist instance,
) => <String, dynamic>{
  'owner': instance.owner,
  'favorite': instance.favorite,
  'metadata': instance.metadata?.toJson(),
  'item_id': instance.itemId,
  'provider': instance.provider,
  'name': instance.name,
  'uri': instance.uri,
  'media_type': instance.mediaType.toJson(),
};
