// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_audio_normalization_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantAudioNormalizationDetails
_$MusicAssistantAudioNormalizationDetailsFromJson(Map<String, dynamic> json) =>
    _MusicAssistantAudioNormalizationDetails(
      mode: json['mode'] == null
          ? MusicAssistantVolumeNormalizationMode.unknown
          : MusicAssistantVolumeNormalizationMode.fromJson(
              json['mode'] as String,
            ),
      measurementSource: json['measurement_source'] == null
          ? MusicAssistantAudioNormalizationMeasurementSource.unknown
          : MusicAssistantAudioNormalizationMeasurementSource.fromJson(
              json['measurement_source'] as String,
            ),
      targetLufs: (json['target_lufs'] as num?)?.toDouble(),
      measuredLufs: (json['measured_lufs'] as num?)?.toDouble(),
      appliedGainDb: (json['applied_gain_db'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MusicAssistantAudioNormalizationDetailsToJson(
  _MusicAssistantAudioNormalizationDetails instance,
) => <String, dynamic>{
  'mode': instance.mode.toJson(),
  'measurement_source': instance.measurementSource.toJson(),
  'target_lufs': instance.targetLufs,
  'measured_lufs': instance.measuredLufs,
  'applied_gain_db': instance.appliedGainDb,
};
