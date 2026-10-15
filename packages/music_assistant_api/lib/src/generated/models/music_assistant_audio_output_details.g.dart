// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_audio_output_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantAudioOutputDetails _$MusicAssistantAudioOutputDetailsFromJson(
  Map<String, dynamic> json,
) => _MusicAssistantAudioOutputDetails(
  playerIds: (json['player_ids'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  dsp: json['dsp'] == null
      ? null
      : MusicAssistantAudioDSPDetails.fromJson(
          json['dsp'] as Map<String, dynamic>,
        ),
  sourceChannel: json['source_channel'] == null
      ? null
      : MusicAssistantAudioChannel.fromJson(json['source_channel'] as String),
  outputFormat: json['output_format'] == null
      ? null
      : MusicAssistantAudioFormat.fromJson(
          json['output_format'] as Map<String, dynamic>,
        ),
  fidelity: json['fidelity'] == null
      ? null
      : MusicAssistantAudioFidelity.fromJson(
          json['fidelity'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$MusicAssistantAudioOutputDetailsToJson(
  _MusicAssistantAudioOutputDetails instance,
) => <String, dynamic>{
  'player_ids': instance.playerIds,
  'dsp': instance.dsp?.toJson(),
  'source_channel': instance.sourceChannel?.toJson(),
  'output_format': instance.outputFormat?.toJson(),
  'fidelity': instance.fidelity?.toJson(),
};
