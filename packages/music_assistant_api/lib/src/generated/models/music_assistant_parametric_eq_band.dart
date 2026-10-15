/// ParametricEQBand
///
/// ```json
/// {
///     "properties": {
///         "frequency": {
///             "type": "number",
///             "default": 1000.0
///         },
///         "q": {
///             "type": "number",
///             "default": 1.0
///         },
///         "gain": {
///             "type": "number",
///             "default": 0.0
///         },
///         "type": {
///             "$ref": "#/components/schemas/ParametricEQBandType",
///             "default": "peak"
///         },
///         "enabled": {
///             "type": "boolean",
///             "default": true
///         },
///         "channel": {
///             "$ref": "#/components/schemas/AudioChannel",
///             "default": "ALL"
///         }
///     },
///     "type": "object"
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_parametric_eq_band.freezed.dart';
part 'music_assistant_parametric_eq_band.g.dart';

@freezed
abstract class MusicAssistantParametricEQBand
    with _$MusicAssistantParametricEQBand {
  const MusicAssistantParametricEQBand._();

  @jsonSerializable
  const factory MusicAssistantParametricEQBand({
    /// frequency
    @Default(1000.0)
    @JsonKey(name: MusicAssistantParametricEQBand.frequencyKey_)
    double frequency,

    /// q
    @Default(1.0) @JsonKey(name: MusicAssistantParametricEQBand.qKey_) double q,

    /// gain
    @Default(0.0)
    @JsonKey(name: MusicAssistantParametricEQBand.gainKey_)
    double gain,

    /// type
    @Default(MusicAssistantParametricEQBandType.peak)
    @JsonKey(name: MusicAssistantParametricEQBand.typeKey_)
    MusicAssistantParametricEQBandType type,

    /// enabled
    @Default(true)
    @JsonKey(name: MusicAssistantParametricEQBand.enabledKey_)
    bool enabled,

    /// channel
    @Default(MusicAssistantAudioChannel.all)
    @JsonKey(name: MusicAssistantParametricEQBand.channelKey_)
    MusicAssistantAudioChannel channel,
  }) = _MusicAssistantParametricEQBand;

  factory MusicAssistantParametricEQBand.fromJson(Map<String, dynamic> json) =>
      _$MusicAssistantParametricEQBandFromJson(json);

  static const String frequencyKey_ = 'frequency';

  static const String qKey_ = 'q';

  static const String gainKey_ = 'gain';

  static const String typeKey_ = 'type';

  static const String enabledKey_ = 'enabled';

  static const String channelKey_ = 'channel';
}
