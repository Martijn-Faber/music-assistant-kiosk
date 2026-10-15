// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_media_item_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantMediaItemLink _$MusicAssistantMediaItemLinkFromJson(
  Map<String, dynamic> json,
) => _MusicAssistantMediaItemLink(
  type: MusicAssistantLinkType.fromJson(json['type'] as String),
  url: json['url'] as String,
);

Map<String, dynamic> _$MusicAssistantMediaItemLinkToJson(
  _MusicAssistantMediaItemLink instance,
) => <String, dynamic>{'type': instance.type.toJson(), 'url': instance.url};
