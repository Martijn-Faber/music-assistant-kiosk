/// LifeSpan
///
/// ```json
/// {
///     "properties": {
///         "begin": {
///             "type": "string",
///             "nullable": true
///         },
///         "end": {
///             "type": "string",
///             "nullable": true
///         },
///         "ended": {
///             "type": "boolean",
///             "default": false
///         }
///     },
///     "type": "object"
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_life_span.freezed.dart';
part 'music_assistant_life_span.g.dart';

@freezed
abstract class MusicAssistantLifeSpan with _$MusicAssistantLifeSpan {
  const MusicAssistantLifeSpan._();

  @jsonSerializable
  const factory MusicAssistantLifeSpan({
    /// begin
    @JsonKey(name: MusicAssistantLifeSpan.beginKey_) String? begin,

    /// end
    @JsonKey(name: MusicAssistantLifeSpan.endKey_) String? end,

    /// ended
    @Default(false) @JsonKey(name: MusicAssistantLifeSpan.endedKey_) bool ended,
  }) = _MusicAssistantLifeSpan;

  factory MusicAssistantLifeSpan.fromJson(Map<String, dynamic> json) =>
      _$MusicAssistantLifeSpanFromJson(json);

  static const String beginKey_ = 'begin';

  static const String endKey_ = 'end';

  static const String endedKey_ = 'ended';
}
