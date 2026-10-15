/// ActiveSourceAudioDetails
///
/// ```json
/// {
///     "properties": {
///         "input_format": {
///             "$ref": "#/components/schemas/AudioFormat"
///         },
///         "input_fidelity": {
///             "$ref": "#/components/schemas/AudioFidelity"
///         },
///         "crossfade_mode": {
///             "$ref": "#/components/schemas/CrossfadeMode",
///             "default": "unknown"
///         },
///         "volume_normalization_mode": {
///             "$ref": "#/components/schemas/VolumeNormalizationMode",
///             "default": "unknown"
///         },
///         "outputs": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AudioOutputDetails"
///             }
///         }
///     },
///     "type": "object",
///     "required": [
///         "input_format"
///     ]
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_active_source_audio_details.freezed.dart';
part 'music_assistant_active_source_audio_details.g.dart';

@freezed
abstract class MusicAssistantActiveSourceAudioDetails
    with _$MusicAssistantActiveSourceAudioDetails {
  const MusicAssistantActiveSourceAudioDetails._();

  @jsonSerializable
  const factory MusicAssistantActiveSourceAudioDetails({
    /// inputFormat
    @JsonKey(name: MusicAssistantActiveSourceAudioDetails.inputFormatKey_)
    required MusicAssistantAudioFormat inputFormat,

    /// inputFidelity
    @JsonKey(name: MusicAssistantActiveSourceAudioDetails.inputFidelityKey_)
    MusicAssistantAudioFidelity? inputFidelity,

    /// crossfadeMode
    @Default(MusicAssistantCrossfadeMode.unknown)
    @JsonKey(name: MusicAssistantActiveSourceAudioDetails.crossfadeModeKey_)
    MusicAssistantCrossfadeMode crossfadeMode,

    /// volumeNormalizationMode
    @Default(MusicAssistantVolumeNormalizationMode.unknown)
    @JsonKey(
      name: MusicAssistantActiveSourceAudioDetails.volumeNormalizationModeKey_,
    )
    MusicAssistantVolumeNormalizationMode volumeNormalizationMode,

    /// outputs
    @JsonKey(name: MusicAssistantActiveSourceAudioDetails.outputsKey_)
    List<MusicAssistantAudioOutputDetails>? outputs,
  }) = _MusicAssistantActiveSourceAudioDetails;

  factory MusicAssistantActiveSourceAudioDetails.fromJson(
    Map<String, dynamic> json,
  ) => _$MusicAssistantActiveSourceAudioDetailsFromJson(json);

  static const String inputFormatKey_ = 'input_format';

  static const String inputFidelityKey_ = 'input_fidelity';

  static const String crossfadeModeKey_ = 'crossfade_mode';

  static const String volumeNormalizationModeKey_ = 'volume_normalization_mode';

  static const String outputsKey_ = 'outputs';
}
