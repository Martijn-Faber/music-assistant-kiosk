// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_convolution_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantConvolutionFilter _$MusicAssistantConvolutionFilterFromJson(
  Map<String, dynamic> json,
) => _MusicAssistantConvolutionFilter(
  enabled: json['enabled'] as bool,
  type: json['type'] == null
      ? MusicAssistantConvolutionFilterType.convolution
      : MusicAssistantConvolutionFilterType.fromJson(json['type'] as String),
  irId: json['ir_id'] as String? ?? '',
  gain: (json['gain'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$MusicAssistantConvolutionFilterToJson(
  _MusicAssistantConvolutionFilter instance,
) => <String, dynamic>{
  'enabled': instance.enabled,
  'type': instance.type.toJson(),
  'ir_id': instance.irId,
  'gain': instance.gain,
};
