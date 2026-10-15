// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_media_collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantMediaCollection _$MusicAssistantMediaCollectionFromJson(
  Map<String, dynamic> json,
) => _MusicAssistantMediaCollection(
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
      ? MusicAssistantMediaType.collection
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
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => e as Map<String, dynamic>)
      .toList(),
);

Map<String, dynamic> _$MusicAssistantMediaCollectionToJson(
  _MusicAssistantMediaCollection instance,
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
  'items': instance.items,
};
