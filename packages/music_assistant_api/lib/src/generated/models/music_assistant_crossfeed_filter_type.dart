/// MusicAssistantCrossfeedFilterType
///
/// ```json
/// {
///     "properties": {},
///     "type": "string",
///     "enum": [
///         "crossfeed"
///     ]
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_crossfeed_filter_type.g.dart';

@JsonEnum(alwaysCreate: true)
enum MusicAssistantCrossfeedFilterType {
  @JsonValue('crossfeed')
  crossfeed,
  @JsonValue('unknown')
  unknown;

  factory MusicAssistantCrossfeedFilterType.fromJson(String json) =>
      MusicAssistantCrossfeedFilterType.values.firstWhere(
        (e) => e.toJson() == json,
        orElse: () => MusicAssistantCrossfeedFilterType.unknown,
      );

  String toJson() => _$MusicAssistantCrossfeedFilterTypeEnumMap[this]!;
}
