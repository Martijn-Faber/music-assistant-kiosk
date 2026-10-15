/// MediaItemChapter
///
/// ```json
/// {
///     "properties": {
///         "position": {
///             "type": "integer"
///         },
///         "name": {
///             "type": "string"
///         },
///         "start": {
///             "type": "number"
///         },
///         "end": {
///             "type": "number",
///             "nullable": true
///         }
///     },
///     "type": "object",
///     "required": [
///         "position",
///         "name",
///         "start"
///     ]
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_media_item_chapter.freezed.dart';
part 'music_assistant_media_item_chapter.g.dart';

@freezed
abstract class MusicAssistantMediaItemChapter
    with _$MusicAssistantMediaItemChapter {
  const MusicAssistantMediaItemChapter._();

  @jsonSerializable
  const factory MusicAssistantMediaItemChapter({
    /// position
    @JsonKey(name: MusicAssistantMediaItemChapter.positionKey_)
    required int position,

    /// name
    @JsonKey(name: MusicAssistantMediaItemChapter.nameKey_)
    required String name,

    /// start
    @JsonKey(name: MusicAssistantMediaItemChapter.startKey_)
    required double start,

    /// end
    @JsonKey(name: MusicAssistantMediaItemChapter.endKey_) double? end,
  }) = _MusicAssistantMediaItemChapter;

  factory MusicAssistantMediaItemChapter.fromJson(Map<String, dynamic> json) =>
      _$MusicAssistantMediaItemChapterFromJson(json);

  static const String positionKey_ = 'position';

  static const String nameKey_ = 'name';

  static const String startKey_ = 'start';

  static const String endKey_ = 'end';
}
