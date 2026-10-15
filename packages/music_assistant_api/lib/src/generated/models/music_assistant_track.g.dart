// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantTrack _$MusicAssistantTrackFromJson(Map<String, dynamic> json) =>
    _MusicAssistantTrack(
      itemId: json['item_id'] as String,
      provider: json['provider'] as String,
      name: json['name'] as String,
      version: json['version'] as String? ?? '',
      sortName: json['sort_name'] as String?,
      uri: json['uri'] as String?,
      externalIds: (json['external_ids'] as List<dynamic>?)
          ?.map(
            (e) => (e as List<dynamic>)
                .map((e) => MusicAssistantExternalID.fromJson(e as String))
                .toList(),
          )
          .toList(),
      isPlayable: json['is_playable'] as bool? ?? true,
      mediaType: json['media_type'] == null
          ? MusicAssistantMediaType.track
          : MusicAssistantMediaType.fromJson(json['media_type'] as String),
      providerMappings: (json['provider_mappings'] as List<dynamic>)
          .map(
            (e) => MusicAssistantProviderMapping.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
      metadata: json['metadata'] == null
          ? null
          : MusicAssistantMediaItemMetadata.fromJson(
              json['metadata'] as Map<String, dynamic>,
            ),
      favorite: json['favorite'] as bool? ?? false,
      position: (json['position'] as num?)?.toInt(),
      dateAdded: json['date_added'] == null
          ? null
          : DateTime.parse(json['date_added'] as String),
      duration: (json['duration'] as num?)?.toInt() ?? 0,
      artists: (json['artists'] as List<dynamic>?)
          ?.map(
            (e) => MusicAssistantArtistOrItemMappingUnion.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
      lastPlayed: (json['last_played'] as num?)?.toInt() ?? 0,
      album: json['album'] == null
          ? null
          : MusicAssistantAlbum.fromJson(json['album'] as Map<String, dynamic>),
      discNumber: (json['disc_number'] as num?)?.toInt() ?? 0,
      trackNumber: (json['track_number'] as num?)?.toInt() ?? 0,
      audioMetadata: json['audio_metadata'] == null
          ? null
          : MusicAssistantAudioMetadata.fromJson(
              json['audio_metadata'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$MusicAssistantTrackToJson(
  _MusicAssistantTrack instance,
) => <String, dynamic>{
  'item_id': instance.itemId,
  'provider': instance.provider,
  'name': instance.name,
  'version': instance.version,
  'sort_name': instance.sortName,
  'uri': instance.uri,
  'external_ids': instance.externalIds
      ?.map((e) => e.map((e) => e.toJson()).toList())
      .toList(),
  'is_playable': instance.isPlayable,
  'media_type': instance.mediaType.toJson(),
  'provider_mappings': instance.providerMappings
      .map((e) => e.toJson())
      .toList(),
  'metadata': instance.metadata?.toJson(),
  'favorite': instance.favorite,
  'position': instance.position,
  'date_added': instance.dateAdded?.toIso8601String(),
  'duration': instance.duration,
  'artists': instance.artists?.map((e) => e.toJson()).toList(),
  'last_played': instance.lastPlayed,
  'album': instance.album?.toJson(),
  'disc_number': instance.discNumber,
  'track_number': instance.trackNumber,
  'audio_metadata': instance.audioMetadata?.toJson(),
};
