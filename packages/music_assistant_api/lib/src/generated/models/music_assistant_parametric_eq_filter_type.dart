/// MusicAssistantParametricEQFilterType
///
/// ```json
/// {
///     "properties": {},
///     "type": "string",
///     "enum": [
///         "parametric_eq"
///     ]
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_parametric_eq_filter_type.g.dart';

@JsonEnum(alwaysCreate: true)
enum MusicAssistantParametricEQFilterType {
  @JsonValue('parametric_eq')
  parametricEq,
  @JsonValue('unknown')
  unknown;

  factory MusicAssistantParametricEQFilterType.fromJson(String json) =>
      MusicAssistantParametricEQFilterType.values.firstWhere(
        (e) => e.toJson() == json,
        orElse: () => MusicAssistantParametricEQFilterType.unknown,
      );

  String toJson() => _$MusicAssistantParametricEQFilterTypeEnumMap[this]!;
}
