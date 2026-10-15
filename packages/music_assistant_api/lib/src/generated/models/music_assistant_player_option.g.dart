// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_player_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantPlayerOption _$MusicAssistantPlayerOptionFromJson(
  Map<String, dynamic> json,
) => _MusicAssistantPlayerOption(
  key: json['key'] as String,
  name: json['name'] as String,
  type: MusicAssistantPlayerOptionType.fromJson(json['type'] as String),
  translationKey: json['translation_key'] as String? ?? '',
  translationParams: (json['translation_params'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  value: json['value'],
  readOnly: json['read_only'] as bool? ?? false,
  minValue: (json['min_value'] as num?)?.toDouble(),
  maxValue: (json['max_value'] as num?)?.toDouble(),
  step: (json['step'] as num?)?.toDouble(),
  options: (json['options'] as List<dynamic>?)
      ?.map(
        (e) =>
            MusicAssistantPlayerOptionEntry.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$MusicAssistantPlayerOptionToJson(
  _MusicAssistantPlayerOption instance,
) => <String, dynamic>{
  'key': instance.key,
  'name': instance.name,
  'type': instance.type.toJson(),
  'translation_key': instance.translationKey,
  'translation_params': instance.translationParams,
  'value': instance.value,
  'read_only': instance.readOnly,
  'min_value': instance.minValue,
  'max_value': instance.maxValue,
  'step': instance.step,
  'options': instance.options?.map((e) => e.toJson()).toList(),
};
