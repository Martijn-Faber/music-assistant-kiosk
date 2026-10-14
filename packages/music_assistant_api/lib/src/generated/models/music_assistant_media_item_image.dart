/// MediaItemImage
///
/// ```json
/// {
///     "properties": {
///         "provider": {
///             "type": "string"
///         },
///         "proxy_id": {
///             "type": "string",
///             "nullable": true
///         },
///         "path": {
///             "type": "string"
///         },
///         "type": {
///             "type": "string",
///             "nullable": true
///         }
///     },
///     "type": "object",
///     "required": [
///         "path",
///         "provider"
///     ]
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_media_item_image.freezed.dart';
part 'music_assistant_media_item_image.g.dart';

@freezed
abstract class MusicAssistantMediaItemImage
    with _$MusicAssistantMediaItemImage {
  const MusicAssistantMediaItemImage._();

  @jsonSerializable
  const factory MusicAssistantMediaItemImage({
    /// provider
    @JsonKey(name: MusicAssistantMediaItemImage.providerKey_)
    required String provider,

    /// proxyId
    @JsonKey(name: MusicAssistantMediaItemImage.proxyIdKey_) String? proxyId,

    /// path
    @JsonKey(name: MusicAssistantMediaItemImage.pathKey_) required String path,

    /// type
    @JsonKey(name: MusicAssistantMediaItemImage.typeKey_) String? type,
  }) = _MusicAssistantMediaItemImage;

  factory MusicAssistantMediaItemImage.fromJson(Map<String, dynamic> json) =>
      _$MusicAssistantMediaItemImageFromJson(json);

  static const String providerKey_ = 'provider';

  static const String proxyIdKey_ = 'proxy_id';

  static const String pathKey_ = 'path';

  static const String typeKey_ = 'type';
}
