/// HighLowPassMode
///
/// ```json
/// {
///     "type": "string",
///     "enum": [
///         "high_pass",
///         "low_pass"
///     ],
///     "description": "Enum: HighLowPassMode. Possible values: high_pass, low_pass"
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_high_low_pass_mode.g.dart';

@JsonEnum(alwaysCreate: true)
enum MusicAssistantHighLowPassMode {
  @JsonValue('high_pass')
  highPass,
  @JsonValue('low_pass')
  lowPass,
  @JsonValue('unknown')
  unknown;

  factory MusicAssistantHighLowPassMode.fromJson(String json) =>
      MusicAssistantHighLowPassMode.values.firstWhere(
        (e) => e.toJson() == json,
        orElse: () => MusicAssistantHighLowPassMode.unknown,
      );

  String toJson() => _$MusicAssistantHighLowPassModeEnumMap[this]!;
}
