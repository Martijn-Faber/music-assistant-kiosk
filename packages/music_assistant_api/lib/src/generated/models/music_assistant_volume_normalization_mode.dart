/// VolumeNormalizationMode
///
/// ```json
/// {
///     "type": "string",
///     "enum": [
///         "disabled",
///         "dynamic",
///         "measurement_only",
///         "fallback_fixed_gain",
///         "fixed_gain",
///         "fallback_dynamic",
///         "source",
///         "unknown"
///     ],
///     "description": "Enum: VolumeNormalizationMode. Possible values: disabled, dynamic, measurement_only, fallback_fixed_gain, fixed_gain, fallback_dynamic, source, unknown"
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_volume_normalization_mode.g.dart';

@JsonEnum(alwaysCreate: true)
enum MusicAssistantVolumeNormalizationMode {
  @JsonValue('disabled')
  disabled,
  @JsonValue('dynamic')
  $dynamic,
  @JsonValue('measurement_only')
  measurementOnly,
  @JsonValue('fallback_fixed_gain')
  fallbackFixedGain,
  @JsonValue('fixed_gain')
  fixedGain,
  @JsonValue('fallback_dynamic')
  fallbackDynamic,
  @JsonValue('source')
  source,
  @JsonValue('unknown')
  unknown;

  factory MusicAssistantVolumeNormalizationMode.fromJson(String json) =>
      MusicAssistantVolumeNormalizationMode.values.firstWhere(
        (e) => e.toJson() == json,
        orElse: () => MusicAssistantVolumeNormalizationMode.unknown,
      );

  String toJson() => _$MusicAssistantVolumeNormalizationModeEnumMap[this]!;
}
