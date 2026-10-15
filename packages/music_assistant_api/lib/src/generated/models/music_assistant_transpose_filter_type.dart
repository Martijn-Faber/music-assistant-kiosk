/// MusicAssistantTransposeFilterType
///
/// ```json
/// {
///     "properties": {},
///     "type": "string",
///     "enum": [
///         "transpose"
///     ]
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_transpose_filter_type.g.dart';

@JsonEnum(alwaysCreate: true)
enum MusicAssistantTransposeFilterType {
  @JsonValue('transpose')
  transpose,
  @JsonValue('unknown')
  unknown;

  factory MusicAssistantTransposeFilterType.fromJson(String json) =>
      MusicAssistantTransposeFilterType.values.firstWhere(
        (e) => e.toJson() == json,
        orElse: () => MusicAssistantTransposeFilterType.unknown,
      );

  String toJson() => _$MusicAssistantTransposeFilterTypeEnumMap[this]!;
}
