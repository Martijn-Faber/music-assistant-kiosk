// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_parametric_eq_band.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantParametricEQBand _$MusicAssistantParametricEQBandFromJson(
  Map<String, dynamic> json,
) => _MusicAssistantParametricEQBand(
  frequency: (json['frequency'] as num?)?.toDouble() ?? 1000.0,
  q: (json['q'] as num?)?.toDouble() ?? 1.0,
  gain: (json['gain'] as num?)?.toDouble() ?? 0.0,
  type: json['type'] == null
      ? MusicAssistantParametricEQBandType.peak
      : MusicAssistantParametricEQBandType.fromJson(json['type'] as String),
  enabled: json['enabled'] as bool? ?? true,
  channel: json['channel'] == null
      ? MusicAssistantAudioChannel.all
      : MusicAssistantAudioChannel.fromJson(json['channel'] as String),
);

Map<String, dynamic> _$MusicAssistantParametricEQBandToJson(
  _MusicAssistantParametricEQBand instance,
) => <String, dynamic>{
  'frequency': instance.frequency,
  'q': instance.q,
  'gain': instance.gain,
  'type': instance.type.toJson(),
  'enabled': instance.enabled,
  'channel': instance.channel.toJson(),
};
