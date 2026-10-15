/// MusicAssistantCompressorFilterType
///
/// ```json
/// {
///     "properties": {},
///     "type": "string",
///     "enum": [
///         "compressor"
///     ]
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_compressor_filter_type.g.dart';

@JsonEnum(alwaysCreate: true)
enum MusicAssistantCompressorFilterType {
  @JsonValue('compressor')
  compressor,
  @JsonValue('unknown')
  unknown;

  factory MusicAssistantCompressorFilterType.fromJson(String json) =>
      MusicAssistantCompressorFilterType.values.firstWhere(
        (e) => e.toJson() == json,
        orElse: () => MusicAssistantCompressorFilterType.unknown,
      );

  String toJson() => _$MusicAssistantCompressorFilterTypeEnumMap[this]!;
}
