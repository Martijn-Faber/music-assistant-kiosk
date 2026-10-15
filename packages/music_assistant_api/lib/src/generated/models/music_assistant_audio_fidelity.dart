/// AudioFidelity
///
/// ```json
/// {
///     "properties": {
///         "quality": {
///             "$ref": "#/components/schemas/AudioQuality",
///             "default": "unknown"
///         },
///         "bit_perfect": {
///             "type": "boolean",
///             "nullable": true
///         }
///     },
///     "type": "object"
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_audio_fidelity.freezed.dart';
part 'music_assistant_audio_fidelity.g.dart';

@freezed
abstract class MusicAssistantAudioFidelity with _$MusicAssistantAudioFidelity {
  const MusicAssistantAudioFidelity._();

  @jsonSerializable
  const factory MusicAssistantAudioFidelity({
    /// quality
    @Default(MusicAssistantAudioQuality.unknown)
    @JsonKey(name: MusicAssistantAudioFidelity.qualityKey_)
    MusicAssistantAudioQuality quality,

    /// bitPerfect
    @JsonKey(name: MusicAssistantAudioFidelity.bitPerfectKey_) bool? bitPerfect,
  }) = _MusicAssistantAudioFidelity;

  factory MusicAssistantAudioFidelity.fromJson(Map<String, dynamic> json) =>
      _$MusicAssistantAudioFidelityFromJson(json);

  static const String qualityKey_ = 'quality';

  static const String bitPerfectKey_ = 'bit_perfect';
}
