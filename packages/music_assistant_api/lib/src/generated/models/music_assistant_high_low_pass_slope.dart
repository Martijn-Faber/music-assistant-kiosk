/// HighLowPassSlope
///
/// ```json
/// {
///     "type": "integer",
///     "enum": [
///         12,
///         24,
///         48
///     ],
///     "description": "Enum: HighLowPassSlope. Possible values: 12, 24, 48"
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_high_low_pass_slope.g.dart';

@JsonEnum(alwaysCreate: true)
enum MusicAssistantHighLowPassSlope {
  @JsonValue(12)
  value12,
  @JsonValue(24)
  value24,
  @JsonValue(48)
  value48,
  @JsonValue(-1)
  unknown;

  factory MusicAssistantHighLowPassSlope.fromJson(int json) =>
      MusicAssistantHighLowPassSlope.values.firstWhere(
        (e) => e.toJson() == json,
        orElse: () => MusicAssistantHighLowPassSlope.unknown,
      );

  int toJson() => _$MusicAssistantHighLowPassSlopeEnumMap[this]!;
}
