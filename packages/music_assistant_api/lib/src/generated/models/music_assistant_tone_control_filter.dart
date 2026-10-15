/// ToneControlFilter
///
/// ```json
/// {
///     "properties": {
///         "enabled": {
///             "type": "boolean"
///         },
///         "type": {
///             "enum": [
///                 "tone_control"
///             ],
///             "type": "string",
///             "default": "tone_control"
///         },
///         "bass_level": {
///             "type": "number",
///             "default": 0.0
///         },
///         "mid_level": {
///             "type": "number",
///             "default": 0.0
///         },
///         "treble_level": {
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
part 'music_assistant_tone_control_filter.freezed.dart';
part 'music_assistant_tone_control_filter.g.dart';

@freezed
abstract class MusicAssistantToneControlFilter
    with _$MusicAssistantToneControlFilter {
  const MusicAssistantToneControlFilter._();

  @jsonSerializable
  const factory MusicAssistantToneControlFilter({
    /// enabled
    @JsonKey(name: MusicAssistantToneControlFilter.enabledKey_)
    required bool enabled,

    /// type
    @Default(MusicAssistantToneControlFilterType.toneControl)
    @JsonKey(name: MusicAssistantToneControlFilter.typeKey_)
    MusicAssistantToneControlFilterType type,

    /// bassLevel
    @Default(0.0)
    @JsonKey(name: MusicAssistantToneControlFilter.bassLevelKey_)
    double bassLevel,

    /// midLevel
    @Default(0.0)
    @JsonKey(name: MusicAssistantToneControlFilter.midLevelKey_)
    double midLevel,

    /// trebleLevel
    @Default(0.0)
    @JsonKey(name: MusicAssistantToneControlFilter.trebleLevelKey_)
    double trebleLevel,
  }) = _MusicAssistantToneControlFilter;

  factory MusicAssistantToneControlFilter.fromJson(Map<String, dynamic> json) =>
      _$MusicAssistantToneControlFilterFromJson(json);

  static const String enabledKey_ = 'enabled';

  static const String typeKey_ = 'type';

  static const String bassLevelKey_ = 'bass_level';

  static const String midLevelKey_ = 'mid_level';

  static const String trebleLevelKey_ = 'treble_level';
}
