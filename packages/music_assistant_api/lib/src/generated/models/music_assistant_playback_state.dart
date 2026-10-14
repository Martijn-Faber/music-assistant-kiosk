/// PlaybackState
///
/// ```json
/// {
///     "type": "string",
///     "enum": [
///         "idle",
///         "paused",
///         "playing",
///         "unknown"
///     ],
///     "description": "Enum: PlaybackState. Possible values: idle, paused, playing, unknown"
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_playback_state.g.dart';

@JsonEnum(alwaysCreate: true)
enum MusicAssistantPlaybackState {
  @JsonValue('idle')
  idle,
  @JsonValue('paused')
  paused,
  @JsonValue('playing')
  playing,
  @JsonValue('unknown')
  unknown;

  factory MusicAssistantPlaybackState.fromJson(String json) =>
      MusicAssistantPlaybackState.values.firstWhere(
        (e) => e.toJson() == json,
        orElse: () => MusicAssistantPlaybackState.unknown,
      );

  String toJson() => _$MusicAssistantPlaybackStateEnumMap[this]!;
}
