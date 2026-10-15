/// ConvolutionFilter
///
/// ```json
/// {
///     "properties": {
///         "enabled": {
///             "type": "boolean"
///         },
///         "type": {
///             "enum": [
///                 "convolution"
///             ],
///             "type": "string",
///             "default": "convolution"
///         },
///         "ir_id": {
///             "type": "string",
///             "default": ""
///         },
///         "gain": {
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
part 'music_assistant_convolution_filter.freezed.dart';
part 'music_assistant_convolution_filter.g.dart';

@freezed
abstract class MusicAssistantConvolutionFilter
    with _$MusicAssistantConvolutionFilter {
  const MusicAssistantConvolutionFilter._();

  @jsonSerializable
  const factory MusicAssistantConvolutionFilter({
    /// enabled
    @JsonKey(name: MusicAssistantConvolutionFilter.enabledKey_)
    required bool enabled,

    /// type
    @Default(MusicAssistantConvolutionFilterType.convolution)
    @JsonKey(name: MusicAssistantConvolutionFilter.typeKey_)
    MusicAssistantConvolutionFilterType type,

    /// irId
    @Default('')
    @JsonKey(name: MusicAssistantConvolutionFilter.irIdKey_)
    String irId,

    /// gain
    @Default(0.0)
    @JsonKey(name: MusicAssistantConvolutionFilter.gainKey_)
    double gain,
  }) = _MusicAssistantConvolutionFilter;

  factory MusicAssistantConvolutionFilter.fromJson(Map<String, dynamic> json) =>
      _$MusicAssistantConvolutionFilterFromJson(json);

  static const String enabledKey_ = 'enabled';

  static const String typeKey_ = 'type';

  static const String irIdKey_ = 'ir_id';

  static const String gainKey_ = 'gain';
}
