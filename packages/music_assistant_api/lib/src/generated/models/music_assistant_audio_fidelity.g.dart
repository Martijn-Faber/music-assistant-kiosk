// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_audio_fidelity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantAudioFidelity _$MusicAssistantAudioFidelityFromJson(
  Map<String, dynamic> json,
) => _MusicAssistantAudioFidelity(
  quality: json['quality'] == null
      ? MusicAssistantAudioQuality.unknown
      : MusicAssistantAudioQuality.fromJson(json['quality'] as String),
  bitPerfect: json['bit_perfect'] as bool?,
);

Map<String, dynamic> _$MusicAssistantAudioFidelityToJson(
  _MusicAssistantAudioFidelity instance,
) => <String, dynamic>{
  'quality': instance.quality.toJson(),
  'bit_perfect': instance.bitPerfect,
};
