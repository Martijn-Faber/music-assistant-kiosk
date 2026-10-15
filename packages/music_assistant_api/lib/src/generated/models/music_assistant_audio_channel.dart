/// AudioChannel
///
/// ```json
/// {
///     "type": "string",
///     "enum": [
///         "ALL",
///         "FL",
///         "FR"
///     ],
///     "description": "Enum: AudioChannel. Possible values: ALL, FL, FR"
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_audio_channel.g.dart';

@JsonEnum(alwaysCreate: true)
enum MusicAssistantAudioChannel {
  @JsonValue('ALL')
  all,
  @JsonValue('FL')
  fl,
  @JsonValue('FR')
  fr,
  @JsonValue('unknown')
  unknown;

  factory MusicAssistantAudioChannel.fromJson(String json) =>
      MusicAssistantAudioChannel.values.firstWhere(
        (e) => e.toJson() == json,
        orElse: () => MusicAssistantAudioChannel.unknown,
      );

  String toJson() => _$MusicAssistantAudioChannelEnumMap[this]!;
}
