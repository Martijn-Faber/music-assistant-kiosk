// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_audio_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantAudioMetadata _$MusicAssistantAudioMetadataFromJson(
  Map<String, dynamic> json,
) => _MusicAssistantAudioMetadata(
  bpm: (json['bpm'] as num?)?.toDouble(),
  musicalKey: json['musical_key'] as String?,
);

Map<String, dynamic> _$MusicAssistantAudioMetadataToJson(
  _MusicAssistantAudioMetadata instance,
) => <String, dynamic>{'bpm': instance.bpm, 'musical_key': instance.musicalKey};
