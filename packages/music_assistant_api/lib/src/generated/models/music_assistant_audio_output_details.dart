/// AudioOutputDetails
///
/// ```json
/// {
///     "properties": {
///         "player_ids": {
///             "type": "array",
///             "items": {
///                 "type": "string"
///             }
///         },
///         "dsp": {
///             "$ref": "#/components/schemas/AudioDSPDetails"
///         },
///         "source_channel": {
///             "$ref": "#/components/schemas/AudioChannel",
///             "nullable": true
///         },
///         "output_format": {
///             "$ref": "#/components/schemas/AudioFormat",
///             "nullable": true
///         },
///         "fidelity": {
///             "$ref": "#/components/schemas/AudioFidelity"
///         }
///     },
///     "type": "object"
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_audio_output_details.freezed.dart';
part 'music_assistant_audio_output_details.g.dart';

@freezed
abstract class MusicAssistantAudioOutputDetails
    with _$MusicAssistantAudioOutputDetails {
  const MusicAssistantAudioOutputDetails._();

  @jsonSerializable
  const factory MusicAssistantAudioOutputDetails({
    /// playerIds
    @JsonKey(name: MusicAssistantAudioOutputDetails.playerIdsKey_)
    List<String>? playerIds,

    /// dsp
    @JsonKey(name: MusicAssistantAudioOutputDetails.dspKey_)
    MusicAssistantAudioDSPDetails? dsp,

    /// sourceChannel
    @JsonKey(name: MusicAssistantAudioOutputDetails.sourceChannelKey_)
    MusicAssistantAudioChannel? sourceChannel,

    /// outputFormat
    @JsonKey(name: MusicAssistantAudioOutputDetails.outputFormatKey_)
    MusicAssistantAudioFormat? outputFormat,

    /// fidelity
    @JsonKey(name: MusicAssistantAudioOutputDetails.fidelityKey_)
    MusicAssistantAudioFidelity? fidelity,
  }) = _MusicAssistantAudioOutputDetails;

  factory MusicAssistantAudioOutputDetails.fromJson(
    Map<String, dynamic> json,
  ) => _$MusicAssistantAudioOutputDetailsFromJson(json);

  static const String playerIdsKey_ = 'player_ids';

  static const String dspKey_ = 'dsp';

  static const String sourceChannelKey_ = 'source_channel';

  static const String outputFormatKey_ = 'output_format';

  static const String fidelityKey_ = 'fidelity';
}
