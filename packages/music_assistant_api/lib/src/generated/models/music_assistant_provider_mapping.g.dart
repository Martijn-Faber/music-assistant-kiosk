// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_provider_mapping.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantProviderMapping _$MusicAssistantProviderMappingFromJson(
  Map<String, dynamic> json,
) => _MusicAssistantProviderMapping(
  itemId: json['item_id'] as String,
  providerDomain: json['provider_domain'] as String,
  providerInstance: json['provider_instance'] as String,
  available: json['available'] as bool? ?? true,
  inLibrary: json['in_library'] as bool?,
  isUnique: json['is_unique'] as bool?,
  audioFormat: json['audio_format'] == null
      ? null
      : MusicAssistantAudioFormat.fromJson(
          json['audio_format'] as Map<String, dynamic>,
        ),
  url: json['url'] as String?,
  details: json['details'] as String?,
);

Map<String, dynamic> _$MusicAssistantProviderMappingToJson(
  _MusicAssistantProviderMapping instance,
) => <String, dynamic>{
  'item_id': instance.itemId,
  'provider_domain': instance.providerDomain,
  'provider_instance': instance.providerInstance,
  'available': instance.available,
  'in_library': instance.inLibrary,
  'is_unique': instance.isUnique,
  'audio_format': instance.audioFormat?.toJson(),
  'url': instance.url,
  'details': instance.details,
};
