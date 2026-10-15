// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_parametric_eq_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantParametricEQFilter _$MusicAssistantParametricEQFilterFromJson(
  Map<String, dynamic> json,
) => _MusicAssistantParametricEQFilter(
  enabled: json['enabled'] as bool,
  preamp: (json['preamp'] as num?)?.toDouble() ?? 0.0,
  perChannelPreamp: (json['per_channel_preamp'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, (e as num).toDouble()),
  ),
  type: json['type'] == null
      ? MusicAssistantParametricEQFilterType.parametricEq
      : MusicAssistantParametricEQFilterType.fromJson(json['type'] as String),
  bands: (json['bands'] as List<dynamic>?)
      ?.map(
        (e) =>
            MusicAssistantParametricEQBand.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$MusicAssistantParametricEQFilterToJson(
  _MusicAssistantParametricEQFilter instance,
) => <String, dynamic>{
  'enabled': instance.enabled,
  'preamp': instance.preamp,
  'per_channel_preamp': instance.perChannelPreamp,
  'type': instance.type.toJson(),
  'bands': instance.bands?.map((e) => e.toJson()).toList(),
};
