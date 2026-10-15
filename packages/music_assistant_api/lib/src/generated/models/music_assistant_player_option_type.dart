/// PlayerOptionType
///
/// ```json
/// {
///     "type": "string",
///     "enum": [
///         "boolean",
///         "integer",
///         "float",
///         "string"
///     ],
///     "description": "Enum: PlayerOptionType. Possible values: boolean, integer, float, string"
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_player_option_type.g.dart';

@JsonEnum(alwaysCreate: true)
enum MusicAssistantPlayerOptionType {
  @JsonValue('boolean')
  boolean,
  @JsonValue('integer')
  integer,
  @JsonValue('float')
  float,
  @JsonValue('string')
  string,
  @JsonValue('unknown')
  unknown;

  factory MusicAssistantPlayerOptionType.fromJson(String json) =>
      MusicAssistantPlayerOptionType.values.firstWhere(
        (e) => e.toJson() == json,
        orElse: () => MusicAssistantPlayerOptionType.unknown,
      );

  String toJson() => _$MusicAssistantPlayerOptionTypeEnumMap[this]!;
}
