// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_item_mapping.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantItemMapping _$MusicAssistantItemMappingFromJson(
  Map<String, dynamic> json,
) => _MusicAssistantItemMapping(
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
      ? MusicAssistantMediaType.unknown
      : MusicAssistantMediaType.fromJson(json['media_type'] as String),
  translationKey: json['translation_key'] as String?,
  available: json['available'] as bool? ?? true,
  image: json['image'] == null
      ? null
      : MusicAssistantMediaItemImage.fromJson(
          json['image'] as Map<String, dynamic>,
        ),
  year: (json['year'] as num?)?.toInt(),
);

Map<String, dynamic> _$MusicAssistantItemMappingToJson(
  _MusicAssistantItemMapping instance,
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
  'translation_key': instance.translationKey,
  'available': instance.available,
  'image': instance.image?.toJson(),
  'year': instance.year,
};
