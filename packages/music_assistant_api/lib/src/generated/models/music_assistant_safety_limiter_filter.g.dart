// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_safety_limiter_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantSafetyLimiterFilter _$MusicAssistantSafetyLimiterFilterFromJson(
  Map<String, dynamic> json,
) => _MusicAssistantSafetyLimiterFilter(
  enabled: json['enabled'] as bool,
  type: json['type'] == null
      ? MusicAssistantSafetyLimiterFilterType.safetyLimiter
      : MusicAssistantSafetyLimiterFilterType.fromJson(json['type'] as String),
  ceiling: (json['ceiling'] as num?)?.toDouble() ?? -2.0,
);

Map<String, dynamic> _$MusicAssistantSafetyLimiterFilterToJson(
  _MusicAssistantSafetyLimiterFilter instance,
) => <String, dynamic>{
  'enabled': instance.enabled,
  'type': instance.type.toJson(),
  'ceiling': instance.ceiling,
};
