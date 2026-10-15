/// AudioDSPDetails
///
/// ```json
/// {
///     "properties": {
///         "state": {
///             "$ref": "#/components/schemas/DSPState",
///             "default": "unknown"
///         },
///         "input_gain": {
///             "type": "number",
///             "default": 0.0
///         },
///         "filters": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AudioDSPFilter"
///             }
///         },
///         "output_gain": {
///             "type": "number",
///             "default": 0.0
///         },
///         "preset_id": {
///             "type": "string",
///             "nullable": true
///         }
///     },
///     "type": "object"
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_audio_dsp_details.freezed.dart';
part 'music_assistant_audio_dsp_details.g.dart';

@freezed
abstract class MusicAssistantAudioDSPDetails
    with _$MusicAssistantAudioDSPDetails {
  const MusicAssistantAudioDSPDetails._();

  @jsonSerializable
  const factory MusicAssistantAudioDSPDetails({
    /// state
    @Default(MusicAssistantDSPState.unknown)
    @JsonKey(name: MusicAssistantAudioDSPDetails.stateKey_)
    MusicAssistantDSPState state,

    /// inputGain
    @Default(0.0)
    @JsonKey(name: MusicAssistantAudioDSPDetails.inputGainKey_)
    double inputGain,

    /// filters
    @JsonKey(name: MusicAssistantAudioDSPDetails.filtersKey_)
    List<MusicAssistantAudioDSPFilter>? filters,

    /// outputGain
    @Default(0.0)
    @JsonKey(name: MusicAssistantAudioDSPDetails.outputGainKey_)
    double outputGain,

    /// presetId
    @JsonKey(name: MusicAssistantAudioDSPDetails.presetIdKey_) String? presetId,
  }) = _MusicAssistantAudioDSPDetails;

  factory MusicAssistantAudioDSPDetails.fromJson(Map<String, dynamic> json) =>
      _$MusicAssistantAudioDSPDetailsFromJson(json);

  static const String stateKey_ = 'state';

  static const String inputGainKey_ = 'input_gain';

  static const String filtersKey_ = 'filters';

  static const String outputGainKey_ = 'output_gain';

  static const String presetIdKey_ = 'preset_id';
}
