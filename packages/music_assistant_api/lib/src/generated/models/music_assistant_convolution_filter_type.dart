/// MusicAssistantConvolutionFilterType
///
/// ```json
/// {
///     "properties": {},
///     "type": "string",
///     "enum": [
///         "convolution"
///     ]
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_convolution_filter_type.g.dart';

@JsonEnum(alwaysCreate: true)
enum MusicAssistantConvolutionFilterType {
  @JsonValue('convolution')
  convolution,
  @JsonValue('unknown')
  unknown;

  factory MusicAssistantConvolutionFilterType.fromJson(String json) =>
      MusicAssistantConvolutionFilterType.values.firstWhere(
        (e) => e.toJson() == json,
        orElse: () => MusicAssistantConvolutionFilterType.unknown,
      );

  String toJson() => _$MusicAssistantConvolutionFilterTypeEnumMap[this]!;
}
