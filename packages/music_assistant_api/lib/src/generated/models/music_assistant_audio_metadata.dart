/// AudioMetadata
///
/// ```json
/// {
///     "properties": {
///         "bpm": {
///             "type": "number",
///             "nullable": true
///         },
///         "musical_key": {
///             "type": "string",
///             "nullable": true
///         }
///     },
///     "type": "object"
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_audio_metadata.freezed.dart';
part 'music_assistant_audio_metadata.g.dart';

@freezed
abstract class MusicAssistantAudioMetadata with _$MusicAssistantAudioMetadata {
  const MusicAssistantAudioMetadata._();

  @jsonSerializable
  const factory MusicAssistantAudioMetadata({
    /// bpm
    @JsonKey(name: MusicAssistantAudioMetadata.bpmKey_) double? bpm,

    /// musicalKey
    @JsonKey(name: MusicAssistantAudioMetadata.musicalKeyKey_)
    String? musicalKey,
  }) = _MusicAssistantAudioMetadata;

  factory MusicAssistantAudioMetadata.fromJson(Map<String, dynamic> json) =>
      _$MusicAssistantAudioMetadataFromJson(json);

  static const String bpmKey_ = 'bpm';

  static const String musicalKeyKey_ = 'musical_key';
}
