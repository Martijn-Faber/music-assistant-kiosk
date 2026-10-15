/// DSPState
///
/// ```json
/// {
///     "type": "string",
///     "enum": [
///         "enabled",
///         "disabled",
///         "disabled_by_unsupported_group",
///         "unknown"
///     ],
///     "description": "Enum: DSPState. Possible values: enabled, disabled, disabled_by_unsupported_group, unknown"
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_dsp_state.g.dart';

@JsonEnum(alwaysCreate: true)
enum MusicAssistantDSPState {
  @JsonValue('enabled')
  enabled,
  @JsonValue('disabled')
  disabled,
  @JsonValue('disabled_by_unsupported_group')
  disabledByUnsupportedGroup,
  @JsonValue('unknown')
  unknown;

  factory MusicAssistantDSPState.fromJson(String json) =>
      MusicAssistantDSPState.values.firstWhere(
        (e) => e.toJson() == json,
        orElse: () => MusicAssistantDSPState.unknown,
      );

  String toJson() => _$MusicAssistantDSPStateEnumMap[this]!;
}
