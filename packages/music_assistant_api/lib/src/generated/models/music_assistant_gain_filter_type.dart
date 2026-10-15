/// MusicAssistantGainFilterType
///
/// ```json
/// {
///     "properties": {},
///     "type": "string",
///     "enum": [
///         "gain"
///     ]
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_gain_filter_type.g.dart';

@JsonEnum(alwaysCreate: true)
enum MusicAssistantGainFilterType {
  @JsonValue('gain')
  gain,
  @JsonValue('unknown')
  unknown;

  factory MusicAssistantGainFilterType.fromJson(String json) =>
      MusicAssistantGainFilterType.values.firstWhere(
        (e) => e.toJson() == json,
        orElse: () => MusicAssistantGainFilterType.unknown,
      );

  String toJson() => _$MusicAssistantGainFilterTypeEnumMap[this]!;
}
