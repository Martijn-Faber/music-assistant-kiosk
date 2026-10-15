// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_stream_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantStreamDetails _$MusicAssistantStreamDetailsFromJson(
  Map<String, dynamic> json,
) => _MusicAssistantStreamDetails(
  provider: json['provider'] as String,
  itemId: json['item_id'] as String,
  audioFormat: MusicAssistantAudioFormat.fromJson(
    json['audio_format'] as Map<String, dynamic>,
  ),
  mediaType: json['media_type'] == null
      ? MusicAssistantMediaType.track
      : MusicAssistantMediaType.fromJson(json['media_type'] as String),
  streamType: json['stream_type'] == null
      ? MusicAssistantStreamType.custom
      : MusicAssistantStreamType.fromJson(json['stream_type'] as String),
  duration: (json['duration'] as num?)?.toInt(),
  size: (json['size'] as num?)?.toInt(),
  streamMetadata: json['stream_metadata'] == null
      ? null
      : MusicAssistantStreamMetadata.fromJson(
          json['stream_metadata'] as Map<String, dynamic>,
        ),
  audioProcessing: json['audio_processing'] == null
      ? null
      : MusicAssistantAudioProcessingChain.fromJson(
          json['audio_processing'] as Map<String, dynamic>,
        ),
  loudness: (json['loudness'] as num?)?.toDouble(),
  loudnessAlbum: (json['loudness_album'] as num?)?.toDouble(),
  preferAlbumLoudness: json['prefer_album_loudness'] as bool? ?? false,
  volumeNormalizationMode: json['volume_normalization_mode'] == null
      ? null
      : MusicAssistantVolumeNormalizationMode.fromJson(
          json['volume_normalization_mode'] as String,
        ),
  volumeNormalizationGainCorrect:
      (json['volume_normalization_gain_correct'] as num?)?.toDouble(),
  targetLoudness: (json['target_loudness'] as num?)?.toDouble(),
);

Map<String, dynamic> _$MusicAssistantStreamDetailsToJson(
  _MusicAssistantStreamDetails instance,
) => <String, dynamic>{
  'provider': instance.provider,
  'item_id': instance.itemId,
  'audio_format': instance.audioFormat.toJson(),
  'media_type': instance.mediaType.toJson(),
  'stream_type': instance.streamType.toJson(),
  'duration': instance.duration,
  'size': instance.size,
  'stream_metadata': instance.streamMetadata?.toJson(),
  'audio_processing': instance.audioProcessing?.toJson(),
  'loudness': instance.loudness,
  'loudness_album': instance.loudnessAlbum,
  'prefer_album_loudness': instance.preferAlbumLoudness,
  'volume_normalization_mode': instance.volumeNormalizationMode?.toJson(),
  'volume_normalization_gain_correct': instance.volumeNormalizationGainCorrect,
  'target_loudness': instance.targetLoudness,
};
