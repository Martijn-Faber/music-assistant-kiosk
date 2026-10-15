// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_active_source_audio_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantActiveSourceAudioDetails
_$MusicAssistantActiveSourceAudioDetailsFromJson(Map<String, dynamic> json) =>
    _MusicAssistantActiveSourceAudioDetails(
      inputFormat: MusicAssistantAudioFormat.fromJson(
        json['input_format'] as Map<String, dynamic>,
      ),
      inputFidelity: json['input_fidelity'] == null
          ? null
          : MusicAssistantAudioFidelity.fromJson(
              json['input_fidelity'] as Map<String, dynamic>,
            ),
      crossfadeMode: json['crossfade_mode'] == null
          ? MusicAssistantCrossfadeMode.unknown
          : MusicAssistantCrossfadeMode.fromJson(
              json['crossfade_mode'] as String,
            ),
      volumeNormalizationMode: json['volume_normalization_mode'] == null
          ? MusicAssistantVolumeNormalizationMode.unknown
          : MusicAssistantVolumeNormalizationMode.fromJson(
              json['volume_normalization_mode'] as String,
            ),
      outputs: (json['outputs'] as List<dynamic>?)
          ?.map(
            (e) => MusicAssistantAudioOutputDetails.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    );

Map<String, dynamic> _$MusicAssistantActiveSourceAudioDetailsToJson(
  _MusicAssistantActiveSourceAudioDetails instance,
) => <String, dynamic>{
  'input_format': instance.inputFormat.toJson(),
  'input_fidelity': instance.inputFidelity?.toJson(),
  'crossfade_mode': instance.crossfadeMode.toJson(),
  'volume_normalization_mode': instance.volumeNormalizationMode.toJson(),
  'outputs': instance.outputs?.map((e) => e.toJson()).toList(),
};
