// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_gain_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantGainFilter _$MusicAssistantGainFilterFromJson(
  Map<String, dynamic> json,
) => _MusicAssistantGainFilter(
  enabled: json['enabled'] as bool,
  type: json['type'] == null
      ? MusicAssistantGainFilterType.gain
      : MusicAssistantGainFilterType.fromJson(json['type'] as String),
  gain: (json['gain'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$MusicAssistantGainFilterToJson(
  _MusicAssistantGainFilter instance,
) => <String, dynamic>{
  'enabled': instance.enabled,
  'type': instance.type.toJson(),
  'gain': instance.gain,
};
