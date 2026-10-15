/// RepeatMode
///
/// ```json
/// {
///     "type": "string",
///     "enum": [
///         "off",
///         "one",
///         "all",
///         "unknown"
///     ],
///     "description": "Enum: RepeatMode. Possible values: off, one, all, unknown"
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_repeat_mode.g.dart';

@JsonEnum(alwaysCreate: true)
enum MusicAssistantRepeatMode {
  @JsonValue('off')
  off,
  @JsonValue('one')
  one,
  @JsonValue('all')
  all,
  @JsonValue('unknown')
  unknown;

  factory MusicAssistantRepeatMode.fromJson(String json) =>
      MusicAssistantRepeatMode.values.firstWhere(
        (e) => e.toJson() == json,
        orElse: () => MusicAssistantRepeatMode.unknown,
      );

  String toJson() => _$MusicAssistantRepeatModeEnumMap[this]!;
}
