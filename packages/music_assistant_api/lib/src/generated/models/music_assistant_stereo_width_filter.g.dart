// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_stereo_width_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantStereoWidthFilter _$MusicAssistantStereoWidthFilterFromJson(
  Map<String, dynamic> json,
) => _MusicAssistantStereoWidthFilter(
  enabled: json['enabled'] as bool,
  type: json['type'] == null
      ? MusicAssistantStereoWidthFilterType.stereoWidth
      : MusicAssistantStereoWidthFilterType.fromJson(json['type'] as String),
  width: (json['width'] as num?)?.toDouble() ?? 1.0,
);

Map<String, dynamic> _$MusicAssistantStereoWidthFilterToJson(
  _MusicAssistantStereoWidthFilter instance,
) => <String, dynamic>{
  'enabled': instance.enabled,
  'type': instance.type.toJson(),
  'width': instance.width,
};
