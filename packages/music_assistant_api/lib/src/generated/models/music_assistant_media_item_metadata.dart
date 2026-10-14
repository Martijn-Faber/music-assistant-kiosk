/// MediaItemMetadata
///
/// ```json
/// {
///     "properties": {
///         "images": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/MediaItemImage"
///             },
///             "nullable": true
///         },
///         "description": {
///             "type": "string",
///             "nullable": true
///         }
///     },
///     "type": "object"
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_media_item_metadata.freezed.dart';
part 'music_assistant_media_item_metadata.g.dart';

@freezed
abstract class MusicAssistantMediaItemMetadata
    with _$MusicAssistantMediaItemMetadata {
  const MusicAssistantMediaItemMetadata._();

  @jsonSerializable
  const factory MusicAssistantMediaItemMetadata({
    /// images
    @JsonKey(name: MusicAssistantMediaItemMetadata.imagesKey_)
    List<MusicAssistantMediaItemImage>? images,

    /// description
    @JsonKey(name: MusicAssistantMediaItemMetadata.descriptionKey_)
    String? description,
  }) = _MusicAssistantMediaItemMetadata;

  factory MusicAssistantMediaItemMetadata.fromJson(Map<String, dynamic> json) =>
      _$MusicAssistantMediaItemMetadataFromJson(json);

  static const String imagesKey_ = 'images';

  static const String descriptionKey_ = 'description';
}
