/// MusicAssistantSafetyLimiterFilterType
///
/// ```json
/// {
///     "properties": {},
///     "type": "string",
///     "enum": [
///         "safety_limiter"
///     ]
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_safety_limiter_filter_type.g.dart';

@JsonEnum(alwaysCreate: true)
enum MusicAssistantSafetyLimiterFilterType {
  @JsonValue('safety_limiter')
  safetyLimiter,
  @JsonValue('unknown')
  unknown;

  factory MusicAssistantSafetyLimiterFilterType.fromJson(String json) =>
      MusicAssistantSafetyLimiterFilterType.values.firstWhere(
        (e) => e.toJson() == json,
        orElse: () => MusicAssistantSafetyLimiterFilterType.unknown,
      );

  String toJson() => _$MusicAssistantSafetyLimiterFilterTypeEnumMap[this]!;
}
