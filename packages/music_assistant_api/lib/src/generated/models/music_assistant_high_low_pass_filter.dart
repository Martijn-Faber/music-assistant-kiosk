/// HighLowPassFilter
///
/// ```json
/// {
///     "properties": {
///         "enabled": {
///             "type": "boolean"
///         },
///         "type": {
///             "enum": [
///                 "high_low_pass"
///             ],
///             "type": "string",
///             "default": "high_low_pass"
///         },
///         "mode": {
///             "$ref": "#/components/schemas/HighLowPassMode",
///             "default": "high_pass"
///         },
///         "frequency": {
///             "type": "number",
///             "default": 80.0
///         },
///         "slope": {
///             "$ref": "#/components/schemas/HighLowPassSlope",
///             "default": 12
///         }
///     },
///     "type": "object",
///     "required": [
///         "enabled"
///     ]
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_high_low_pass_filter.freezed.dart';
part 'music_assistant_high_low_pass_filter.g.dart';

@freezed
abstract class MusicAssistantHighLowPassFilter
    with _$MusicAssistantHighLowPassFilter {
  const MusicAssistantHighLowPassFilter._();

  @jsonSerializable
  const factory MusicAssistantHighLowPassFilter({
    /// enabled
    @JsonKey(name: MusicAssistantHighLowPassFilter.enabledKey_)
    required bool enabled,

    /// type
    @Default(MusicAssistantHighLowPassFilterType.highLowPass)
    @JsonKey(name: MusicAssistantHighLowPassFilter.typeKey_)
    MusicAssistantHighLowPassFilterType type,

    /// mode
    @Default(MusicAssistantHighLowPassMode.highPass)
    @JsonKey(name: MusicAssistantHighLowPassFilter.modeKey_)
    MusicAssistantHighLowPassMode mode,

    /// frequency
    @Default(80.0)
    @JsonKey(name: MusicAssistantHighLowPassFilter.frequencyKey_)
    double frequency,

    /// slope
    @Default(MusicAssistantHighLowPassSlope.value12)
    @JsonKey(name: MusicAssistantHighLowPassFilter.slopeKey_)
    MusicAssistantHighLowPassSlope slope,
  }) = _MusicAssistantHighLowPassFilter;

  factory MusicAssistantHighLowPassFilter.fromJson(Map<String, dynamic> json) =>
      _$MusicAssistantHighLowPassFilterFromJson(json);

  static const String enabledKey_ = 'enabled';

  static const String typeKey_ = 'type';

  static const String modeKey_ = 'mode';

  static const String frequencyKey_ = 'frequency';

  static const String slopeKey_ = 'slope';
}
