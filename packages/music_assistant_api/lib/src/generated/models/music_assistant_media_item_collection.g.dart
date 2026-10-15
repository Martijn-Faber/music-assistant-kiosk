// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_media_item_collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantMediaItemCollection _$MusicAssistantMediaItemCollectionFromJson(
  Map<String, dynamic> json,
) => _MusicAssistantMediaItemCollection(
  title: json['title'] as String,
  sequence: (json['sequence'] as num?)?.toDouble(),
);

Map<String, dynamic> _$MusicAssistantMediaItemCollectionToJson(
  _MusicAssistantMediaItemCollection instance,
) => <String, dynamic>{'title': instance.title, 'sequence': instance.sequence};
