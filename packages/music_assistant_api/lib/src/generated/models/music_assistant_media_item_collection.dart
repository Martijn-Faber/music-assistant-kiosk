/// MediaItemCollection
///
/// ```json
/// {
///     "properties": {
///         "title": {
///             "type": "string"
///         },
///         "sequence": {
///             "type": "number",
///             "nullable": true
///         }
///     },
///     "type": "object",
///     "required": [
///         "title"
///     ]
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_media_item_collection.freezed.dart';
part 'music_assistant_media_item_collection.g.dart';

@freezed
abstract class MusicAssistantMediaItemCollection
    with _$MusicAssistantMediaItemCollection {
  const MusicAssistantMediaItemCollection._();

  @jsonSerializable
  const factory MusicAssistantMediaItemCollection({
    /// title
    @JsonKey(name: MusicAssistantMediaItemCollection.titleKey_)
    required String title,

    /// sequence
    @JsonKey(name: MusicAssistantMediaItemCollection.sequenceKey_)
    double? sequence,
  }) = _MusicAssistantMediaItemCollection;

  factory MusicAssistantMediaItemCollection.fromJson(
    Map<String, dynamic> json,
  ) => _$MusicAssistantMediaItemCollectionFromJson(json);

  static const String titleKey_ = 'title';

  static const String sequenceKey_ = 'sequence';
}
