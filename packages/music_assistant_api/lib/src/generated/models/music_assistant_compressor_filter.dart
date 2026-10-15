/// CompressorFilter
///
/// ```json
/// {
///     "properties": {
///         "enabled": {
///             "type": "boolean"
///         },
///         "type": {
///             "enum": [
///                 "compressor"
///             ],
///             "type": "string",
///             "default": "compressor"
///         },
///         "threshold": {
///             "type": "number",
///             "default": -18.0
///         },
///         "ratio": {
///             "type": "number",
///             "default": 2.0
///         },
///         "attack": {
///             "type": "number",
///             "default": 20.0
///         },
///         "release": {
///             "type": "number",
///             "default": 250.0
///         },
///         "knee": {
///             "type": "number",
///             "default": 9.0
///         },
///         "makeup": {
///             "type": "number",
///             "default": 0.0
///         }
///     },
///     "type": "object",
///     "required": [
///         "enabled"
///     ]
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_compressor_filter.freezed.dart';
part 'music_assistant_compressor_filter.g.dart';

@freezed
abstract class MusicAssistantCompressorFilter
    with _$MusicAssistantCompressorFilter {
  const MusicAssistantCompressorFilter._();

  @jsonSerializable
  const factory MusicAssistantCompressorFilter({
    /// enabled
    @JsonKey(name: MusicAssistantCompressorFilter.enabledKey_)
    required bool enabled,

    /// type
    @Default(MusicAssistantCompressorFilterType.compressor)
    @JsonKey(name: MusicAssistantCompressorFilter.typeKey_)
    MusicAssistantCompressorFilterType type,

    /// threshold
    @Default(-18.0)
    @JsonKey(name: MusicAssistantCompressorFilter.thresholdKey_)
    double threshold,

    /// ratio
    @Default(2.0)
    @JsonKey(name: MusicAssistantCompressorFilter.ratioKey_)
    double ratio,

    /// attack
    @Default(20.0)
    @JsonKey(name: MusicAssistantCompressorFilter.attackKey_)
    double attack,

    /// release
    @Default(250.0)
    @JsonKey(name: MusicAssistantCompressorFilter.releaseKey_)
    double release,

    /// knee
    @Default(9.0)
    @JsonKey(name: MusicAssistantCompressorFilter.kneeKey_)
    double knee,

    /// makeup
    @Default(0.0)
    @JsonKey(name: MusicAssistantCompressorFilter.makeupKey_)
    double makeup,
  }) = _MusicAssistantCompressorFilter;

  factory MusicAssistantCompressorFilter.fromJson(Map<String, dynamic> json) =>
      _$MusicAssistantCompressorFilterFromJson(json);

  static const String enabledKey_ = 'enabled';

  static const String typeKey_ = 'type';

  static const String thresholdKey_ = 'threshold';

  static const String ratioKey_ = 'ratio';

  static const String attackKey_ = 'attack';

  static const String releaseKey_ = 'release';

  static const String kneeKey_ = 'knee';

  static const String makeupKey_ = 'makeup';
}
