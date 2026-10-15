/// MediaItemLink
///
/// ```json
/// {
///     "properties": {
///         "type": {
///             "$ref": "#/components/schemas/LinkType"
///         },
///         "url": {
///             "type": "string"
///         }
///     },
///     "type": "object",
///     "required": [
///         "type",
///         "url"
///     ]
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_media_item_link.freezed.dart';
part 'music_assistant_media_item_link.g.dart';

@freezed
abstract class MusicAssistantMediaItemLink with _$MusicAssistantMediaItemLink {
  const MusicAssistantMediaItemLink._();

  @jsonSerializable
  const factory MusicAssistantMediaItemLink({
    /// type
    @JsonKey(name: MusicAssistantMediaItemLink.typeKey_)
    required MusicAssistantLinkType type,

    /// url
    @JsonKey(name: MusicAssistantMediaItemLink.urlKey_) required String url,
  }) = _MusicAssistantMediaItemLink;

  factory MusicAssistantMediaItemLink.fromJson(Map<String, dynamic> json) =>
      _$MusicAssistantMediaItemLinkFromJson(json);

  static const String typeKey_ = 'type';

  static const String urlKey_ = 'url';
}
