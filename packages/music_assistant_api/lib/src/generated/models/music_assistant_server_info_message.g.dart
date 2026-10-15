// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_server_info_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantServerInfoMessage _$MusicAssistantServerInfoMessageFromJson(
  Map<String, dynamic> json,
) => _MusicAssistantServerInfoMessage(
  serverId: json['server_id'] as String,
  serverVersion: json['server_version'] as String,
  schemaVersion: (json['schema_version'] as num).toInt(),
  minSupportedSchemaVersion: (json['min_supported_schema_version'] as num)
      .toInt(),
  baseUrl: json['base_url'] as String?,
  homeassistantAddon: json['homeassistant_addon'] as bool? ?? false,
  onboardDone: json['onboard_done'] as bool? ?? false,
  name: json['name'] as String?,
  status: json['status'] == null
      ? MusicAssistantCoreState.running
      : MusicAssistantCoreState.fromJson(json['status'] as String),
  internalUrl: json['internal_url'] as String?,
  externalUrl: json['external_url'] as String?,
  hasRemoteAccess: json['has_remote_access'] as bool? ?? false,
);

Map<String, dynamic> _$MusicAssistantServerInfoMessageToJson(
  _MusicAssistantServerInfoMessage instance,
) => <String, dynamic>{
  'server_id': instance.serverId,
  'server_version': instance.serverVersion,
  'schema_version': instance.schemaVersion,
  'min_supported_schema_version': instance.minSupportedSchemaVersion,
  'base_url': instance.baseUrl,
  'homeassistant_addon': instance.homeassistantAddon,
  'onboard_done': instance.onboardDone,
  'name': instance.name,
  'status': instance.status.toJson(),
  'internal_url': instance.internalUrl,
  'external_url': instance.externalUrl,
  'has_remote_access': instance.hasRemoteAccess,
};
