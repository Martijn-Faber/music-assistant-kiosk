/// PlayerType
///
/// ```json
/// {
///     "type": "string",
///     "enum": [
///         "player",
///         "stereo_pair",
///         "group",
///         "protocol",
///         "display",
///         "visualizer",
///         "light",
///         "source",
///         "unknown"
///     ],
///     "description": "Enum: PlayerType. Possible values: player, stereo_pair, group, protocol, display, visualizer, light, source, unknown"
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_player_type.g.dart';

@JsonEnum(alwaysCreate: true)
enum MusicAssistantPlayerType {
  @JsonValue('player')
  player,
  @JsonValue('stereo_pair')
  stereoPair,
  @JsonValue('group')
  group,
  @JsonValue('protocol')
  protocol,
  @JsonValue('display')
  display,
  @JsonValue('visualizer')
  visualizer,
  @JsonValue('light')
  light,
  @JsonValue('source')
  source,
  @JsonValue('unknown')
  unknown;

  factory MusicAssistantPlayerType.fromJson(String json) =>
      MusicAssistantPlayerType.values.firstWhere(
        (e) => e.toJson() == json,
        orElse: () => MusicAssistantPlayerType.unknown,
      );

  String toJson() => _$MusicAssistantPlayerTypeEnumMap[this]!;
}
