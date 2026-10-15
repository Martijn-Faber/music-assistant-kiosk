/// SafetyLimiterFilter
///
/// ```json
/// {
///     "properties": {
///         "enabled": {
///             "type": "boolean"
///         },
///         "type": {
///             "enum": [
///                 "safety_limiter"
///             ],
///             "type": "string",
///             "default": "safety_limiter"
///         },
///         "ceiling": {
///             "type": "number",
///             "default": -2.0
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
part 'music_assistant_safety_limiter_filter.freezed.dart';
part 'music_assistant_safety_limiter_filter.g.dart';

@freezed
abstract class MusicAssistantSafetyLimiterFilter
    with _$MusicAssistantSafetyLimiterFilter {
  const MusicAssistantSafetyLimiterFilter._();

  @jsonSerializable
  const factory MusicAssistantSafetyLimiterFilter({
    /// enabled
    @JsonKey(name: MusicAssistantSafetyLimiterFilter.enabledKey_)
    required bool enabled,

    /// type
    @Default(MusicAssistantSafetyLimiterFilterType.safetyLimiter)
    @JsonKey(name: MusicAssistantSafetyLimiterFilter.typeKey_)
    MusicAssistantSafetyLimiterFilterType type,

    /// ceiling
    @Default(-2.0)
    @JsonKey(name: MusicAssistantSafetyLimiterFilter.ceilingKey_)
    double ceiling,
  }) = _MusicAssistantSafetyLimiterFilter;

  factory MusicAssistantSafetyLimiterFilter.fromJson(
    Map<String, dynamic> json,
  ) => _$MusicAssistantSafetyLimiterFilterFromJson(json);

  static const String enabledKey_ = 'enabled';

  static const String typeKey_ = 'type';

  static const String ceilingKey_ = 'ceiling';
}
