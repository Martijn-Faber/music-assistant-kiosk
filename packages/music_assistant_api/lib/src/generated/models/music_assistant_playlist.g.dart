// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_playlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantPlaylist _$MusicAssistantPlaylistFromJson(
  Map<String, dynamic> json,
) => _MusicAssistantPlaylist(
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
      ? MusicAssistantMediaType.playlist
      : MusicAssistantMediaType.fromJson(json['media_type'] as String),
  providerMappings: (json['provider_mappings'] as List<dynamic>)
      .map(
        (e) =>
            MusicAssistantProviderMapping.fromJson(e as Map<String, dynamic>),
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
  translationKey: json['translation_key'] as String?,
  translationParams: (json['translation_params'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  owner: json['owner'] as String? ?? '',
  isEditable: json['is_editable'] as bool? ?? false,
  isDynamic: json['is_dynamic'] as bool? ?? false,
  supportedMediatypes: (json['supported_mediatypes'] as List<dynamic>?)
      ?.map((e) => MusicAssistantMediaType.fromJson(e as String))
      .toList(),
);

Map<String, dynamic> _$MusicAssistantPlaylistToJson(
  _MusicAssistantPlaylist instance,
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
  'translation_key': instance.translationKey,
  'translation_params': instance.translationParams,
  'owner': instance.owner,
  'is_editable': instance.isEditable,
  'is_dynamic': instance.isDynamic,
  'supported_mediatypes': instance.supportedMediatypes
      ?.map((e) => e.toJson())
      .toList(),
};
