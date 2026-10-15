// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_high_low_pass_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantHighLowPassFilter _$MusicAssistantHighLowPassFilterFromJson(
  Map<String, dynamic> json,
) => _MusicAssistantHighLowPassFilter(
  enabled: json['enabled'] as bool,
  type: json['type'] == null
      ? MusicAssistantHighLowPassFilterType.highLowPass
      : MusicAssistantHighLowPassFilterType.fromJson(json['type'] as String),
  mode: json['mode'] == null
      ? MusicAssistantHighLowPassMode.highPass
      : MusicAssistantHighLowPassMode.fromJson(json['mode'] as String),
  frequency: (json['frequency'] as num?)?.toDouble() ?? 80.0,
  slope: json['slope'] == null
      ? MusicAssistantHighLowPassSlope.value12
      : MusicAssistantHighLowPassSlope.fromJson((json['slope'] as num).toInt()),
);

Map<String, dynamic> _$MusicAssistantHighLowPassFilterToJson(
  _MusicAssistantHighLowPassFilter instance,
) => <String, dynamic>{
  'enabled': instance.enabled,
  'type': instance.type.toJson(),
  'mode': instance.mode.toJson(),
  'frequency': instance.frequency,
  'slope': instance.slope.toJson(),
};
