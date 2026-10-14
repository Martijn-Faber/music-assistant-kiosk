// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_audio_format.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantAudioFormat _$MusicAssistantAudioFormatFromJson(
  Map<String, dynamic> json,
) => _MusicAssistantAudioFormat(
  bitRate: (json['bit_rate'] as num?)?.toInt(),
  contentType: json['content_type'] == null
      ? MusicAssistantContentType.value61
      : MusicAssistantContentType.fromJson(json['content_type'] as String),
  bitDepth: (json['bit_depth'] as num?)?.toInt() ?? 16,
  sampleRate: (json['sample_rate'] as num?)?.toInt() ?? 44100,
  channels: (json['channels'] as num?)?.toInt() ?? 2,
  codecType: json['codec_type'] == null
      ? MusicAssistantContentType.value61
      : MusicAssistantContentType.fromJson(json['codec_type'] as String),
);

Map<String, dynamic> _$MusicAssistantAudioFormatToJson(
  _MusicAssistantAudioFormat instance,
) => <String, dynamic>{
  'bit_rate': instance.bitRate,
  'content_type': instance.contentType.toJson(),
  'bit_depth': instance.bitDepth,
  'sample_rate': instance.sampleRate,
  'channels': instance.channels,
  'codec_type': instance.codecType.toJson(),
};
