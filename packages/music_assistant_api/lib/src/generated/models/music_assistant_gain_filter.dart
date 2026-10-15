/// GainFilter
///
/// ```json
/// {
///     "properties": {
///         "enabled": {
///             "type": "boolean"
///         },
///         "type": {
///             "enum": [
///                 "gain"
///             ],
///             "type": "string",
///             "default": "gain"
///         },
///         "gain": {
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
part 'music_assistant_gain_filter.freezed.dart';
part 'music_assistant_gain_filter.g.dart';

@freezed
abstract class MusicAssistantGainFilter with _$MusicAssistantGainFilter {
  const MusicAssistantGainFilter._();

  @jsonSerializable
  const factory MusicAssistantGainFilter({
    /// enabled
    @JsonKey(name: MusicAssistantGainFilter.enabledKey_) required bool enabled,

    /// type
    @Default(MusicAssistantGainFilterType.gain)
    @JsonKey(name: MusicAssistantGainFilter.typeKey_)
    MusicAssistantGainFilterType type,

    /// gain
    @Default(0.0) @JsonKey(name: MusicAssistantGainFilter.gainKey_) double gain,
  }) = _MusicAssistantGainFilter;

  factory MusicAssistantGainFilter.fromJson(Map<String, dynamic> json) =>
      _$MusicAssistantGainFilterFromJson(json);

  static const String enabledKey_ = 'enabled';

  static const String typeKey_ = 'type';

  static const String gainKey_ = 'gain';
}
