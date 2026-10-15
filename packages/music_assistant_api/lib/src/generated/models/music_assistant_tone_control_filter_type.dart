/// MusicAssistantToneControlFilterType
///
/// ```json
/// {
///     "properties": {},
///     "type": "string",
///     "enum": [
///         "tone_control"
///     ]
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_tone_control_filter_type.g.dart';

@JsonEnum(alwaysCreate: true)
enum MusicAssistantToneControlFilterType {
  @JsonValue('tone_control')
  toneControl,
  @JsonValue('unknown')
  unknown;

  factory MusicAssistantToneControlFilterType.fromJson(String json) =>
      MusicAssistantToneControlFilterType.values.firstWhere(
        (e) => e.toJson() == json,
        orElse: () => MusicAssistantToneControlFilterType.unknown,
      );

  String toJson() => _$MusicAssistantToneControlFilterTypeEnumMap[this]!;
}
