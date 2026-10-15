/// CrossfadeMode
///
/// ```json
/// {
///     "type": "string",
///     "enum": [
///         "smart_crossfade",
///         "standard_crossfade",
///         "disabled",
///         "source",
///         "unknown"
///     ],
///     "description": "Enum: CrossfadeMode. Possible values: smart_crossfade, standard_crossfade, disabled, source, unknown"
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_crossfade_mode.g.dart';

@JsonEnum(alwaysCreate: true)
enum MusicAssistantCrossfadeMode {
  @JsonValue('smart_crossfade')
  smartCrossfade,
  @JsonValue('standard_crossfade')
  standardCrossfade,
  @JsonValue('disabled')
  disabled,
  @JsonValue('source')
  source,
  @JsonValue('unknown')
  unknown;

  factory MusicAssistantCrossfadeMode.fromJson(String json) =>
      MusicAssistantCrossfadeMode.values.firstWhere(
        (e) => e.toJson() == json,
        orElse: () => MusicAssistantCrossfadeMode.unknown,
      );

  String toJson() => _$MusicAssistantCrossfadeModeEnumMap[this]!;
}
