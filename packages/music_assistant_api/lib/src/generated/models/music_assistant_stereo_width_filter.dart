/// StereoWidthFilter
///
/// ```json
/// {
///     "properties": {
///         "enabled": {
///             "type": "boolean"
///         },
///         "type": {
///             "enum": [
///                 "stereo_width"
///             ],
///             "type": "string",
///             "default": "stereo_width"
///         },
///         "width": {
///             "type": "number",
///             "default": 1.0
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
part 'music_assistant_stereo_width_filter.freezed.dart';
part 'music_assistant_stereo_width_filter.g.dart';

@freezed
abstract class MusicAssistantStereoWidthFilter
    with _$MusicAssistantStereoWidthFilter {
  const MusicAssistantStereoWidthFilter._();

  @jsonSerializable
  const factory MusicAssistantStereoWidthFilter({
    /// enabled
    @JsonKey(name: MusicAssistantStereoWidthFilter.enabledKey_)
    required bool enabled,

    /// type
    @Default(MusicAssistantStereoWidthFilterType.stereoWidth)
    @JsonKey(name: MusicAssistantStereoWidthFilter.typeKey_)
    MusicAssistantStereoWidthFilterType type,

    /// width
    @Default(1.0)
    @JsonKey(name: MusicAssistantStereoWidthFilter.widthKey_)
    double width,
  }) = _MusicAssistantStereoWidthFilter;

  factory MusicAssistantStereoWidthFilter.fromJson(Map<String, dynamic> json) =>
      _$MusicAssistantStereoWidthFilterFromJson(json);

  static const String enabledKey_ = 'enabled';

  static const String typeKey_ = 'type';

  static const String widthKey_ = 'width';
}
