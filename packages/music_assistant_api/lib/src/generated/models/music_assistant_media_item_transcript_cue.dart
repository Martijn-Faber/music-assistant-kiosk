/// MediaItemTranscriptCue
///
/// ```json
/// {
///     "properties": {
///         "start": {
///             "type": "number"
///         },
///         "end": {
///             "type": "number",
///             "nullable": true
///         },
///         "text": {
///             "type": "string"
///         },
///         "speaker": {
///             "type": "string",
///             "nullable": true
///         }
///     },
///     "type": "object",
///     "required": [
///         "start",
///         "text"
///     ]
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_media_item_transcript_cue.freezed.dart';
part 'music_assistant_media_item_transcript_cue.g.dart';

@freezed
abstract class MusicAssistantMediaItemTranscriptCue
    with _$MusicAssistantMediaItemTranscriptCue {
  const MusicAssistantMediaItemTranscriptCue._();

  @jsonSerializable
  const factory MusicAssistantMediaItemTranscriptCue({
    /// start
    @JsonKey(name: MusicAssistantMediaItemTranscriptCue.startKey_)
    required double start,

    /// end
    @JsonKey(name: MusicAssistantMediaItemTranscriptCue.endKey_) double? end,

    /// text
    @JsonKey(name: MusicAssistantMediaItemTranscriptCue.textKey_)
    required String text,

    /// speaker
    @JsonKey(name: MusicAssistantMediaItemTranscriptCue.speakerKey_)
    String? speaker,
  }) = _MusicAssistantMediaItemTranscriptCue;

  factory MusicAssistantMediaItemTranscriptCue.fromJson(
    Map<String, dynamic> json,
  ) => _$MusicAssistantMediaItemTranscriptCueFromJson(json);

  static const String startKey_ = 'start';

  static const String endKey_ = 'end';

  static const String textKey_ = 'text';

  static const String speakerKey_ = 'speaker';
}
