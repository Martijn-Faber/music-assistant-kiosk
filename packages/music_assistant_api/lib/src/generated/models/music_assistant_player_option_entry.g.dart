// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_player_option_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantPlayerOptionEntry _$MusicAssistantPlayerOptionEntryFromJson(
  Map<String, dynamic> json,
) => _MusicAssistantPlayerOptionEntry(
  key: json['key'] as String,
  name: json['name'] as String,
  type: MusicAssistantPlayerOptionType.fromJson(json['type'] as String),
  value: json['value'],
  translationKey: json['translation_key'] as String? ?? '',
);

Map<String, dynamic> _$MusicAssistantPlayerOptionEntryToJson(
  _MusicAssistantPlayerOptionEntry instance,
) => <String, dynamic>{
  'key': instance.key,
  'name': instance.name,
  'type': instance.type.toJson(),
  'value': instance.value,
  'translation_key': instance.translationKey,
};
