// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_tone_control_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantToneControlFilter _$MusicAssistantToneControlFilterFromJson(
  Map<String, dynamic> json,
) => _MusicAssistantToneControlFilter(
  enabled: json['enabled'] as bool,
  type: json['type'] == null
      ? MusicAssistantToneControlFilterType.toneControl
      : MusicAssistantToneControlFilterType.fromJson(json['type'] as String),
  bassLevel: (json['bass_level'] as num?)?.toDouble() ?? 0.0,
  midLevel: (json['mid_level'] as num?)?.toDouble() ?? 0.0,
  trebleLevel: (json['treble_level'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$MusicAssistantToneControlFilterToJson(
  _MusicAssistantToneControlFilter instance,
) => <String, dynamic>{
  'enabled': instance.enabled,
  'type': instance.type.toJson(),
  'bass_level': instance.bassLevel,
  'mid_level': instance.midLevel,
  'treble_level': instance.trebleLevel,
};
