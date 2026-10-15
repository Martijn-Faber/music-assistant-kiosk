/// ParametricEQBandType
///
/// ```json
/// {
///     "type": "string",
///     "enum": [
///         "peak",
///         "high_shelf",
///         "low_shelf",
///         "high_pass",
///         "low_pass",
///         "notch",
///         "unknown"
///     ],
///     "description": "Enum: ParametricEQBandType. Possible values: peak, high_shelf, low_shelf, high_pass, low_pass, notch, unknown"
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_parametric_eq_band_type.g.dart';

@JsonEnum(alwaysCreate: true)
enum MusicAssistantParametricEQBandType {
  @JsonValue('peak')
  peak,
  @JsonValue('high_shelf')
  highShelf,
  @JsonValue('low_shelf')
  lowShelf,
  @JsonValue('high_pass')
  highPass,
  @JsonValue('low_pass')
  lowPass,
  @JsonValue('notch')
  notch,
  @JsonValue('unknown')
  unknown;

  factory MusicAssistantParametricEQBandType.fromJson(String json) =>
      MusicAssistantParametricEQBandType.values.firstWhere(
        (e) => e.toJson() == json,
        orElse: () => MusicAssistantParametricEQBandType.unknown,
      );

  String toJson() => _$MusicAssistantParametricEQBandTypeEnumMap[this]!;
}
