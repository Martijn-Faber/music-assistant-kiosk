/// CoreState
///
/// ```json
/// {
///     "type": "string",
///     "enum": [
///         "starting",
///         "running",
///         "stopping",
///         "stopped"
///     ],
///     "description": "Enum: CoreState. Possible values: starting, running, stopping, stopped"
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_core_state.g.dart';

@JsonEnum(alwaysCreate: true)
enum MusicAssistantCoreState {
  @JsonValue('starting')
  starting,
  @JsonValue('running')
  running,
  @JsonValue('stopping')
  stopping,
  @JsonValue('stopped')
  stopped,
  @JsonValue('unknown')
  unknown;

  factory MusicAssistantCoreState.fromJson(String json) =>
      MusicAssistantCoreState.values.firstWhere(
        (e) => e.toJson() == json,
        orElse: () => MusicAssistantCoreState.unknown,
      );

  String toJson() => _$MusicAssistantCoreStateEnumMap[this]!;
}
