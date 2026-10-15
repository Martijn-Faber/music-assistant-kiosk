// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_audio_format.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantAudioFormat _$MusicAssistantAudioFormatFromJson(
  Map<String, dynamic> json,
) => _MusicAssistantAudioFormat(
  contentType: json['content_type'] == null
      ? MusicAssistantContentType.value61
      : MusicAssistantContentType.fromJson(json['content_type'] as String),
  codecType: json['codec_type'] == null
      ? MusicAssistantContentType.value61
      : MusicAssistantContentType.fromJson(json['codec_type'] as String),
  sampleRate: (json['sample_rate'] as num?)?.toInt() ?? 44100,
  bitDepth: (json['bit_depth'] as num?)?.toInt() ?? 16,
  channels: (json['channels'] as num?)?.toInt() ?? 2,
  outputFormatStr: json['output_format_str'] as String? ?? '',
  bitRate: (json['bit_rate'] as num?)?.toInt(),
);

Map<String, dynamic> _$MusicAssistantAudioFormatToJson(
  _MusicAssistantAudioFormat instance,
) => <String, dynamic>{
  'content_type': instance.contentType.toJson(),
  'codec_type': instance.codecType.toJson(),
  'sample_rate': instance.sampleRate,
  'bit_depth': instance.bitDepth,
  'channels': instance.channels,
  'output_format_str': instance.outputFormatStr,
  'bit_rate': instance.bitRate,
};
