// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_media_item_chapter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantMediaItemChapter _$MusicAssistantMediaItemChapterFromJson(
  Map<String, dynamic> json,
) => _MusicAssistantMediaItemChapter(
  position: (json['position'] as num).toInt(),
  name: json['name'] as String,
  start: (json['start'] as num).toDouble(),
  end: (json['end'] as num?)?.toDouble(),
);

Map<String, dynamic> _$MusicAssistantMediaItemChapterToJson(
  _MusicAssistantMediaItemChapter instance,
) => <String, dynamic>{
  'position': instance.position,
  'name': instance.name,
  'start': instance.start,
  'end': instance.end,
};
