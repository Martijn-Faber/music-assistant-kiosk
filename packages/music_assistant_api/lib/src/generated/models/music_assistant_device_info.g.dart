// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_device_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantDeviceInfo _$MusicAssistantDeviceInfoFromJson(
  Map<String, dynamic> json,
) => _MusicAssistantDeviceInfo(
  model: json['model'] as String? ?? 'Unknown model',
  manufacturer: json['manufacturer'] as String? ?? 'Unknown Manufacturer',
  softwareVersion: json['software_version'] as String?,
  modelId: json['model_id'] as String?,
  manufacturerId: json['manufacturer_id'] as String?,
  identifiers: (json['identifiers'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String),
  ),
);

Map<String, dynamic> _$MusicAssistantDeviceInfoToJson(
  _MusicAssistantDeviceInfo instance,
) => <String, dynamic>{
  'model': instance.model,
  'manufacturer': instance.manufacturer,
  'software_version': instance.softwareVersion,
  'model_id': instance.modelId,
  'manufacturer_id': instance.manufacturerId,
  'identifiers': instance.identifiers,
};
