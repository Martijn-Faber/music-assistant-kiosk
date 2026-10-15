// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_compressor_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantCompressorFilter _$MusicAssistantCompressorFilterFromJson(
  Map<String, dynamic> json,
) => _MusicAssistantCompressorFilter(
  enabled: json['enabled'] as bool,
  type: json['type'] == null
      ? MusicAssistantCompressorFilterType.compressor
      : MusicAssistantCompressorFilterType.fromJson(json['type'] as String),
  threshold: (json['threshold'] as num?)?.toDouble() ?? -18.0,
  ratio: (json['ratio'] as num?)?.toDouble() ?? 2.0,
  attack: (json['attack'] as num?)?.toDouble() ?? 20.0,
  release: (json['release'] as num?)?.toDouble() ?? 250.0,
  knee: (json['knee'] as num?)?.toDouble() ?? 9.0,
  makeup: (json['makeup'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$MusicAssistantCompressorFilterToJson(
  _MusicAssistantCompressorFilter instance,
) => <String, dynamic>{
  'enabled': instance.enabled,
  'type': instance.type.toJson(),
  'threshold': instance.threshold,
  'ratio': instance.ratio,
  'attack': instance.attack,
  'release': instance.release,
  'knee': instance.knee,
  'makeup': instance.makeup,
};
