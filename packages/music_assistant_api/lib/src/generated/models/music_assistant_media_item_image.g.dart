// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_media_item_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantMediaItemImage _$MusicAssistantMediaItemImageFromJson(
  Map<String, dynamic> json,
) => _MusicAssistantMediaItemImage(
  type: MusicAssistantImageType.fromJson(json['type'] as String),
  path: json['path'] as String,
  provider: json['provider'] as String,
  remotelyAccessible: json['remotely_accessible'] as bool? ?? false,
  proxyId: json['proxy_id'] as String?,
);

Map<String, dynamic> _$MusicAssistantMediaItemImageToJson(
  _MusicAssistantMediaItemImage instance,
) => <String, dynamic>{
  'type': instance.type.toJson(),
  'path': instance.path,
  'provider': instance.provider,
  'remotely_accessible': instance.remotelyAccessible,
  'proxy_id': instance.proxyId,
};
