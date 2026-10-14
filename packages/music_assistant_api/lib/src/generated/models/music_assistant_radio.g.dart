// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_radio.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantRadio _$MusicAssistantRadioFromJson(Map<String, dynamic> json) =>
    _MusicAssistantRadio(
      favorite: json['favorite'] as bool? ?? false,
      metadata: json['metadata'] == null
          ? null
          : MusicAssistantMediaItemMetadata.fromJson(
              json['metadata'] as Map<String, dynamic>,
            ),
      itemId: json['item_id'] as String,
      provider: json['provider'] as String,
      name: json['name'] as String,
      providerMappings: (json['provider_mappings'] as List<dynamic>?)
          ?.map(
            (e) => MusicAssistantRadioProviderMappingsItem.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
      uri: json['uri'] as String?,
      mediaType: json['media_type'] == null
          ? MusicAssistantMediaType.radio
          : MusicAssistantMediaType.fromJson(json['media_type'] as String),
    );

Map<String, dynamic> _$MusicAssistantRadioToJson(
  _MusicAssistantRadio instance,
) => <String, dynamic>{
  'favorite': instance.favorite,
  'metadata': instance.metadata?.toJson(),
  'item_id': instance.itemId,
  'provider': instance.provider,
  'name': instance.name,
  'provider_mappings': instance.providerMappings
      ?.map((e) => e.toJson())
      .toList(),
  'uri': instance.uri,
  'media_type': instance.mediaType.toJson(),
};
