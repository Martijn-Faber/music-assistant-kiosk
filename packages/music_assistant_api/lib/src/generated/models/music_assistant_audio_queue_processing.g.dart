// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_audio_queue_processing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantAudioQueueProcessing
_$MusicAssistantAudioQueueProcessingFromJson(Map<String, dynamic> json) =>
    _MusicAssistantAudioQueueProcessing(
      pcmFormat: json['pcm_format'] == null
          ? null
          : MusicAssistantAudioFormat.fromJson(
              json['pcm_format'] as Map<String, dynamic>,
            ),
      normalization: json['normalization'] == null
          ? null
          : MusicAssistantAudioNormalizationDetails.fromJson(
              json['normalization'] as Map<String, dynamic>,
            ),
      playbackSpeed: (json['playback_speed'] as num?)?.toDouble() ?? 1.0,
      crossfadeMode: json['crossfade_mode'] == null
          ? MusicAssistantCrossfadeMode.disabled
          : MusicAssistantCrossfadeMode.fromJson(
              json['crossfade_mode'] as String,
            ),
      overlayActive: json['overlay_active'] as bool? ?? false,
    );

Map<String, dynamic> _$MusicAssistantAudioQueueProcessingToJson(
  _MusicAssistantAudioQueueProcessing instance,
) => <String, dynamic>{
  'pcm_format': instance.pcmFormat?.toJson(),
  'normalization': instance.normalization?.toJson(),
  'playback_speed': instance.playbackSpeed,
  'crossfade_mode': instance.crossfadeMode.toJson(),
  'overlay_active': instance.overlayActive,
};
