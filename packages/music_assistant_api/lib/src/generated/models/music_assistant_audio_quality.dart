/// AudioQuality
///
/// ```json
/// {
///     "type": "string",
///     "enum": [
///         "unknown",
///         "low",
///         "standard",
///         "lossless",
///         "hi_res"
///     ],
///     "description": "Enum: AudioQuality. Possible values: unknown, low, standard, lossless, hi_res"
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_audio_quality.g.dart';

@JsonEnum(alwaysCreate: true)
enum MusicAssistantAudioQuality {
  @JsonValue('unknown')
  unknown,
  @JsonValue('low')
  low,
  @JsonValue('standard')
  standard,
  @JsonValue('lossless')
  lossless,
  @JsonValue('hi_res')
  hiRes;

  factory MusicAssistantAudioQuality.fromJson(String json) =>
      MusicAssistantAudioQuality.values.firstWhere(
        (e) => e.toJson() == json,
        orElse: () => MusicAssistantAudioQuality.unknown,
      );

  String toJson() => _$MusicAssistantAudioQualityEnumMap[this]!;
}
