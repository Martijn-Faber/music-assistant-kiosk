/// AudioNormalizationMeasurementSource
///
/// ```json
/// {
///     "type": "string",
///     "enum": [
///         "unknown",
///         "track",
///         "album",
///         "live",
///         "fallback"
///     ],
///     "description": "Enum: AudioNormalizationMeasurementSource. Possible values: unknown, track, album, live, fallback"
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_audio_normalization_measurement_source.g.dart';

@JsonEnum(alwaysCreate: true)
enum MusicAssistantAudioNormalizationMeasurementSource {
  @JsonValue('unknown')
  unknown,
  @JsonValue('track')
  track,
  @JsonValue('album')
  album,
  @JsonValue('live')
  live,
  @JsonValue('fallback')
  fallback;

  factory MusicAssistantAudioNormalizationMeasurementSource.fromJson(
    String json,
  ) => MusicAssistantAudioNormalizationMeasurementSource.values.firstWhere(
    (e) => e.toJson() == json,
    orElse: () => MusicAssistantAudioNormalizationMeasurementSource.unknown,
  );

  String toJson() =>
      _$MusicAssistantAudioNormalizationMeasurementSourceEnumMap[this]!;
}
