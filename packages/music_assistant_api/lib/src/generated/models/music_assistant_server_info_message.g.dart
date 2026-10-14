// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_server_info_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantServerInfoMessage _$MusicAssistantServerInfoMessageFromJson(
  Map<String, dynamic> json,
) => _MusicAssistantServerInfoMessage(
  name: json['name'] as String?,
  minSupportedSchemaVersion: (json['min_supported_schema_version'] as num)
      .toInt(),
  serverVersion: json['server_version'] as String,
  serverId: json['server_id'] as String,
  status: json['status'] as String? ?? 'running',
  schemaVersion: (json['schema_version'] as num).toInt(),
);

Map<String, dynamic> _$MusicAssistantServerInfoMessageToJson(
  _MusicAssistantServerInfoMessage instance,
) => <String, dynamic>{
  'name': instance.name,
  'min_supported_schema_version': instance.minSupportedSchemaVersion,
  'server_version': instance.serverVersion,
  'server_id': instance.serverId,
  'status': instance.status,
  'schema_version': instance.schemaVersion,
};
