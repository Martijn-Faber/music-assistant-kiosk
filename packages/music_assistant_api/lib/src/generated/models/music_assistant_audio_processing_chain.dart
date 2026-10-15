/// AudioProcessingChain
///
/// ```json
/// {
///     "properties": {
///         "input_fidelity": {
///             "$ref": "#/components/schemas/AudioFidelity"
///         },
///         "queue_processing": {
///             "$ref": "#/components/schemas/AudioQueueProcessing",
///             "nullable": true
///         },
///         "outputs": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AudioOutputDetails"
///             }
///         }
///     },
///     "type": "object"
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_audio_processing_chain.freezed.dart';
part 'music_assistant_audio_processing_chain.g.dart';

@freezed
abstract class MusicAssistantAudioProcessingChain
    with _$MusicAssistantAudioProcessingChain {
  const MusicAssistantAudioProcessingChain._();

  @jsonSerializable
  const factory MusicAssistantAudioProcessingChain({
    /// inputFidelity
    @JsonKey(name: MusicAssistantAudioProcessingChain.inputFidelityKey_)
    MusicAssistantAudioFidelity? inputFidelity,

    /// queueProcessing
    @JsonKey(name: MusicAssistantAudioProcessingChain.queueProcessingKey_)
    MusicAssistantAudioQueueProcessing? queueProcessing,

    /// outputs
    @JsonKey(name: MusicAssistantAudioProcessingChain.outputsKey_)
    List<MusicAssistantAudioOutputDetails>? outputs,
  }) = _MusicAssistantAudioProcessingChain;

  factory MusicAssistantAudioProcessingChain.fromJson(
    Map<String, dynamic> json,
  ) => _$MusicAssistantAudioProcessingChainFromJson(json);

  static const String inputFidelityKey_ = 'input_fidelity';

  static const String queueProcessingKey_ = 'queue_processing';

  static const String outputsKey_ = 'outputs';
}
