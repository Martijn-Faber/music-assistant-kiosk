// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_audio_dsp_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantAudioDSPDetails _$MusicAssistantAudioDSPDetailsFromJson(
  Map<String, dynamic> json,
) => _MusicAssistantAudioDSPDetails(
  state: json['state'] == null
      ? MusicAssistantDSPState.unknown
      : MusicAssistantDSPState.fromJson(json['state'] as String),
  inputGain: (json['input_gain'] as num?)?.toDouble() ?? 0.0,
  filters: (json['filters'] as List<dynamic>?)
      ?.map(
        (e) => MusicAssistantAudioDSPFilter.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  outputGain: (json['output_gain'] as num?)?.toDouble() ?? 0.0,
  presetId: json['preset_id'] as String?,
);

Map<String, dynamic> _$MusicAssistantAudioDSPDetailsToJson(
  _MusicAssistantAudioDSPDetails instance,
) => <String, dynamic>{
  'state': instance.state.toJson(),
  'input_gain': instance.inputGain,
  'filters': instance.filters?.map((e) => e.toJson()).toList(),
  'output_gain': instance.outputGain,
  'preset_id': instance.presetId,
};
