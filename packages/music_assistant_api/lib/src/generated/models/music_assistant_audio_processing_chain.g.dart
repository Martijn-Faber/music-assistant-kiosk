// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_audio_processing_chain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantAudioProcessingChain
_$MusicAssistantAudioProcessingChainFromJson(Map<String, dynamic> json) =>
    _MusicAssistantAudioProcessingChain(
      inputFidelity: json['input_fidelity'] == null
          ? null
          : MusicAssistantAudioFidelity.fromJson(
              json['input_fidelity'] as Map<String, dynamic>,
            ),
      queueProcessing: json['queue_processing'] == null
          ? null
          : MusicAssistantAudioQueueProcessing.fromJson(
              json['queue_processing'] as Map<String, dynamic>,
            ),
      outputs: (json['outputs'] as List<dynamic>?)
          ?.map(
            (e) => MusicAssistantAudioOutputDetails.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    );

Map<String, dynamic> _$MusicAssistantAudioProcessingChainToJson(
  _MusicAssistantAudioProcessingChain instance,
) => <String, dynamic>{
  'input_fidelity': instance.inputFidelity?.toJson(),
  'queue_processing': instance.queueProcessing?.toJson(),
  'outputs': instance.outputs?.map((e) => e.toJson()).toList(),
};
