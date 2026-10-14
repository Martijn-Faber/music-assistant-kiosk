// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_media_item_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantMediaItemImage _$MusicAssistantMediaItemImageFromJson(
  Map<String, dynamic> json,
) => _MusicAssistantMediaItemImage(
  provider: json['provider'] as String,
  proxyId: json['proxy_id'] as String?,
  path: json['path'] as String,
  type: json['type'] as String?,
);

Map<String, dynamic> _$MusicAssistantMediaItemImageToJson(
  _MusicAssistantMediaItemImage instance,
) => <String, dynamic>{
  'provider': instance.provider,
  'proxy_id': instance.proxyId,
  'path': instance.path,
  'type': instance.type,
};
