/// TransposeFilter
///
/// ```json
/// {
///     "properties": {
///         "enabled": {
///             "type": "boolean"
///         },
///         "type": {
///             "enum": [
///                 "transpose"
///             ],
///             "type": "string",
///             "default": "transpose"
///         },
///         "semitones": {
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
part 'music_assistant_transpose_filter.freezed.dart';
part 'music_assistant_transpose_filter.g.dart';

@freezed
abstract class MusicAssistantTransposeFilter
    with _$MusicAssistantTransposeFilter {
  const MusicAssistantTransposeFilter._();

  @jsonSerializable
  const factory MusicAssistantTransposeFilter({
    /// enabled
    @JsonKey(name: MusicAssistantTransposeFilter.enabledKey_)
    required bool enabled,

    /// type
    @Default(MusicAssistantTransposeFilterType.transpose)
    @JsonKey(name: MusicAssistantTransposeFilter.typeKey_)
    MusicAssistantTransposeFilterType type,

    /// semitones
    @Default(0.0)
    @JsonKey(name: MusicAssistantTransposeFilter.semitonesKey_)
    double semitones,
  }) = _MusicAssistantTransposeFilter;

  factory MusicAssistantTransposeFilter.fromJson(Map<String, dynamic> json) =>
      _$MusicAssistantTransposeFilterFromJson(json);

  static const String enabledKey_ = 'enabled';

  static const String typeKey_ = 'type';

  static const String semitonesKey_ = 'semitones';
}
