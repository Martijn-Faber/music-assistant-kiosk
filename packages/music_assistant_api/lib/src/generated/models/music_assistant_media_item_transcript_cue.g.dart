// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_media_item_transcript_cue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantMediaItemTranscriptCue
_$MusicAssistantMediaItemTranscriptCueFromJson(Map<String, dynamic> json) =>
    _MusicAssistantMediaItemTranscriptCue(
      start: (json['start'] as num).toDouble(),
      end: (json['end'] as num?)?.toDouble(),
      text: json['text'] as String,
      speaker: json['speaker'] as String?,
    );

Map<String, dynamic> _$MusicAssistantMediaItemTranscriptCueToJson(
  _MusicAssistantMediaItemTranscriptCue instance,
) => <String, dynamic>{
  'start': instance.start,
  'end': instance.end,
  'text': instance.text,
  'speaker': instance.speaker,
};
