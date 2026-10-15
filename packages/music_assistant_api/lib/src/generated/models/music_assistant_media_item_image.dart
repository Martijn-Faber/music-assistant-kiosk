/// MediaItemImage
///
/// ```json
/// {
///     "properties": {
///         "type": {
///             "$ref": "#/components/schemas/ImageType"
///         },
///         "path": {
///             "type": "string"
///         },
///         "provider": {
///             "type": "string"
///         },
///         "remotely_accessible": {
///             "type": "boolean",
///             "default": false
///         },
///         "proxy_id": {
///             "type": "string",
///             "nullable": true
///         }
///     },
///     "type": "object",
///     "required": [
///         "type",
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
    /// type
    @JsonKey(name: MusicAssistantMediaItemImage.typeKey_)
    required MusicAssistantImageType type,

    /// path
    @JsonKey(name: MusicAssistantMediaItemImage.pathKey_) required String path,

    /// provider
    @JsonKey(name: MusicAssistantMediaItemImage.providerKey_)
    required String provider,

    /// remotelyAccessible
    @Default(false)
    @JsonKey(name: MusicAssistantMediaItemImage.remotelyAccessibleKey_)
    bool remotelyAccessible,

    /// proxyId
    @JsonKey(name: MusicAssistantMediaItemImage.proxyIdKey_) String? proxyId,
  }) = _MusicAssistantMediaItemImage;

  factory MusicAssistantMediaItemImage.fromJson(Map<String, dynamic> json) =>
      _$MusicAssistantMediaItemImageFromJson(json);

  static const String typeKey_ = 'type';

  static const String pathKey_ = 'path';

  static const String providerKey_ = 'provider';

  static const String remotelyAccessibleKey_ = 'remotely_accessible';

  static const String proxyIdKey_ = 'proxy_id';
}
