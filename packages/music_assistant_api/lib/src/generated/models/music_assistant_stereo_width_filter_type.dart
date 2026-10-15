/// MusicAssistantStereoWidthFilterType
///
/// ```json
/// {
///     "properties": {},
///     "type": "string",
///     "enum": [
///         "stereo_width"
///     ]
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_stereo_width_filter_type.g.dart';

@JsonEnum(alwaysCreate: true)
enum MusicAssistantStereoWidthFilterType {
  @JsonValue('stereo_width')
  stereoWidth,
  @JsonValue('unknown')
  unknown;

  factory MusicAssistantStereoWidthFilterType.fromJson(String json) =>
      MusicAssistantStereoWidthFilterType.values.firstWhere(
        (e) => e.toJson() == json,
        orElse: () => MusicAssistantStereoWidthFilterType.unknown,
      );

  String toJson() => _$MusicAssistantStereoWidthFilterTypeEnumMap[this]!;
}
