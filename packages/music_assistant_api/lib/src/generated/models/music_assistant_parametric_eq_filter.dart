/// ParametricEQFilter
///
/// ```json
/// {
///     "properties": {
///         "enabled": {
///             "type": "boolean"
///         },
///         "preamp": {
///             "type": "number",
///             "default": 0.0,
///             "nullable": true
///         },
///         "per_channel_preamp": {
///             "type": "object",
///             "additionalProperties": {
///                 "type": "number"
///             }
///         },
///         "type": {
///             "enum": [
///                 "parametric_eq"
///             ],
///             "type": "string",
///             "default": "parametric_eq"
///         },
///         "bands": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/ParametricEQBand"
///             }
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
part 'music_assistant_parametric_eq_filter.freezed.dart';
part 'music_assistant_parametric_eq_filter.g.dart';

@freezed
abstract class MusicAssistantParametricEQFilter
    with _$MusicAssistantParametricEQFilter {
  const MusicAssistantParametricEQFilter._();

  @jsonSerializable
  const factory MusicAssistantParametricEQFilter({
    /// enabled
    @JsonKey(name: MusicAssistantParametricEQFilter.enabledKey_)
    required bool enabled,

    /// preamp
    @Default(0.0)
    @JsonKey(name: MusicAssistantParametricEQFilter.preampKey_)
    double? preamp,

    /// perChannelPreamp
    @JsonKey(name: MusicAssistantParametricEQFilter.perChannelPreampKey_)
    Map<String, double>? perChannelPreamp,

    /// type
    @Default(MusicAssistantParametricEQFilterType.parametricEq)
    @JsonKey(name: MusicAssistantParametricEQFilter.typeKey_)
    MusicAssistantParametricEQFilterType type,

    /// bands
    @JsonKey(name: MusicAssistantParametricEQFilter.bandsKey_)
    List<MusicAssistantParametricEQBand>? bands,
  }) = _MusicAssistantParametricEQFilter;

  factory MusicAssistantParametricEQFilter.fromJson(
    Map<String, dynamic> json,
  ) => _$MusicAssistantParametricEQFilterFromJson(json);

  static const String enabledKey_ = 'enabled';

  static const String preampKey_ = 'preamp';

  static const String perChannelPreampKey_ = 'per_channel_preamp';

  static const String typeKey_ = 'type';

  static const String bandsKey_ = 'bands';
}
