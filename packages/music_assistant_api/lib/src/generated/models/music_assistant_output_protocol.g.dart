// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_output_protocol.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantOutputProtocol _$MusicAssistantOutputProtocolFromJson(
  Map<String, dynamic> json,
) => _MusicAssistantOutputProtocol(
  outputProtocolId: json['output_protocol_id'] as String,
  name: json['name'] as String,
  protocolDomain: json['protocol_domain'] as String,
  isNative: json['is_native'] as bool? ?? false,
  priority: (json['priority'] as num?)?.toInt() ?? 100,
  available: json['available'] as bool? ?? true,
  derivedFrom: json['derived_from'] as String?,
);

Map<String, dynamic> _$MusicAssistantOutputProtocolToJson(
  _MusicAssistantOutputProtocol instance,
) => <String, dynamic>{
  'output_protocol_id': instance.outputProtocolId,
  'name': instance.name,
  'protocol_domain': instance.protocolDomain,
  'is_native': instance.isNative,
  'priority': instance.priority,
  'available': instance.available,
  'derived_from': instance.derivedFrom,
};
