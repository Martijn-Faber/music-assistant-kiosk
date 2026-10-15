// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_transpose_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantTransposeFilter _$MusicAssistantTransposeFilterFromJson(
  Map<String, dynamic> json,
) => _MusicAssistantTransposeFilter(
  enabled: json['enabled'] as bool,
  type: json['type'] == null
      ? MusicAssistantTransposeFilterType.transpose
      : MusicAssistantTransposeFilterType.fromJson(json['type'] as String),
  semitones: (json['semitones'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$MusicAssistantTransposeFilterToJson(
  _MusicAssistantTransposeFilter instance,
) => <String, dynamic>{
  'enabled': instance.enabled,
  'type': instance.type.toJson(),
  'semitones': instance.semitones,
};
