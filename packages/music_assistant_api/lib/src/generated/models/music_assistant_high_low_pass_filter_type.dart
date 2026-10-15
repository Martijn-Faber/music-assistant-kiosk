/// MusicAssistantHighLowPassFilterType
///
/// ```json
/// {
///     "properties": {},
///     "type": "string",
///     "enum": [
///         "high_low_pass"
///     ]
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_high_low_pass_filter_type.g.dart';

@JsonEnum(alwaysCreate: true)
enum MusicAssistantHighLowPassFilterType {
  @JsonValue('high_low_pass')
  highLowPass,
  @JsonValue('unknown')
  unknown;

  factory MusicAssistantHighLowPassFilterType.fromJson(String json) =>
      MusicAssistantHighLowPassFilterType.values.firstWhere(
        (e) => e.toJson() == json,
        orElse: () => MusicAssistantHighLowPassFilterType.unknown,
      );

  String toJson() => _$MusicAssistantHighLowPassFilterTypeEnumMap[this]!;
}
