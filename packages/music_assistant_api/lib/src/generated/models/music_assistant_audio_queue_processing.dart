/// AudioQueueProcessing
///
/// ```json
/// {
///     "properties": {
///         "pcm_format": {
///             "$ref": "#/components/schemas/AudioFormat",
///             "nullable": true
///         },
///         "normalization": {
///             "$ref": "#/components/schemas/AudioNormalizationDetails",
///             "nullable": true
///         },
///         "playback_speed": {
///             "type": "number",
///             "default": 1.0
///         },
///         "crossfade_mode": {
///             "$ref": "#/components/schemas/CrossfadeMode",
///             "default": "disabled"
///         },
///         "overlay_active": {
///             "type": "boolean",
///             "default": false
///         }
///     },
///     "type": "object"
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_audio_queue_processing.freezed.dart';
part 'music_assistant_audio_queue_processing.g.dart';

@freezed
abstract class MusicAssistantAudioQueueProcessing
    with _$MusicAssistantAudioQueueProcessing {
  const MusicAssistantAudioQueueProcessing._();

  @jsonSerializable
  const factory MusicAssistantAudioQueueProcessing({
    /// pcmFormat
    @JsonKey(name: MusicAssistantAudioQueueProcessing.pcmFormatKey_)
    MusicAssistantAudioFormat? pcmFormat,

    /// normalization
    @JsonKey(name: MusicAssistantAudioQueueProcessing.normalizationKey_)
    MusicAssistantAudioNormalizationDetails? normalization,

    /// playbackSpeed
    @Default(1.0)
    @JsonKey(name: MusicAssistantAudioQueueProcessing.playbackSpeedKey_)
    double playbackSpeed,

    /// crossfadeMode
    @Default(MusicAssistantCrossfadeMode.disabled)
    @JsonKey(name: MusicAssistantAudioQueueProcessing.crossfadeModeKey_)
    MusicAssistantCrossfadeMode crossfadeMode,

    /// overlayActive
    @Default(false)
    @JsonKey(name: MusicAssistantAudioQueueProcessing.overlayActiveKey_)
    bool overlayActive,
  }) = _MusicAssistantAudioQueueProcessing;

  factory MusicAssistantAudioQueueProcessing.fromJson(
    Map<String, dynamic> json,
  ) => _$MusicAssistantAudioQueueProcessingFromJson(json);

  static const String pcmFormatKey_ = 'pcm_format';

  static const String normalizationKey_ = 'normalization';

  static const String playbackSpeedKey_ = 'playback_speed';

  static const String crossfadeModeKey_ = 'crossfade_mode';

  static const String overlayActiveKey_ = 'overlay_active';
}
