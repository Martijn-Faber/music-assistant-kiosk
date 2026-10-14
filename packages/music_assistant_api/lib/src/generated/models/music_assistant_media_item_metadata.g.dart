// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_media_item_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantMediaItemMetadata _$MusicAssistantMediaItemMetadataFromJson(
  Map<String, dynamic> json,
) => _MusicAssistantMediaItemMetadata(
  images: (json['images'] as List<dynamic>?)
      ?.map(
        (e) => MusicAssistantMediaItemImage.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  description: json['description'] as String?,
);

Map<String, dynamic> _$MusicAssistantMediaItemMetadataToJson(
  _MusicAssistantMediaItemMetadata instance,
) => <String, dynamic>{
  'images': instance.images?.map((e) => e.toJson()).toList(),
  'description': instance.description,
};
