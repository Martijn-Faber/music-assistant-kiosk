/// PlayerMedia
///
/// ```json
/// {
///     "properties": {
///         "palette": {
///             "$ref": "#/components/schemas/MediaItemPalette",
///             "nullable": true
///         },
///         "image_url": {
///             "type": "string",
///             "nullable": true
///         },
///         "duration": {
///             "type": "integer",
///             "nullable": true
///         },
///         "title": {
///             "type": "string",
///             "nullable": true
///         },
///         "artist": {
///             "type": "string",
///             "nullable": true
///         },
///         "media_type": {
///             "$ref": "#/components/schemas/MediaType",
///             "default": "unknown"
///         },
///         "uri": {
///             "type": "string"
///         },
///         "album": {
///             "type": "string",
///             "nullable": true
///         }
///     },
///     "type": "object",
///     "required": [
///         "uri"
///     ]
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_player_media.freezed.dart';
part 'music_assistant_player_media.g.dart';

@freezed
abstract class MusicAssistantPlayerMedia with _$MusicAssistantPlayerMedia {
  const MusicAssistantPlayerMedia._();

  @jsonSerializable
  const factory MusicAssistantPlayerMedia({
    /// palette
    @JsonKey(name: MusicAssistantPlayerMedia.paletteKey_)
    MusicAssistantMediaItemPalette? palette,

    /// imageUrl
    @JsonKey(name: MusicAssistantPlayerMedia.imageUrlKey_) String? imageUrl,

    /// duration
    @JsonKey(name: MusicAssistantPlayerMedia.durationKey_) int? duration,

    /// title
    @JsonKey(name: MusicAssistantPlayerMedia.titleKey_) String? title,

    /// artist
    @JsonKey(name: MusicAssistantPlayerMedia.artistKey_) String? artist,

    /// mediaType
    @Default(MusicAssistantMediaType.unknown)
    @JsonKey(name: MusicAssistantPlayerMedia.mediaTypeKey_)
    MusicAssistantMediaType mediaType,

    /// uri
    @JsonKey(name: MusicAssistantPlayerMedia.uriKey_) required String uri,

    /// album
    @JsonKey(name: MusicAssistantPlayerMedia.albumKey_) String? album,
  }) = _MusicAssistantPlayerMedia;

  factory MusicAssistantPlayerMedia.fromJson(Map<String, dynamic> json) =>
      _$MusicAssistantPlayerMediaFromJson(json);

  static const String paletteKey_ = 'palette';

  static const String imageUrlKey_ = 'image_url';

  static const String durationKey_ = 'duration';

  static const String titleKey_ = 'title';

  static const String artistKey_ = 'artist';

  static const String mediaTypeKey_ = 'media_type';

  static const String uriKey_ = 'uri';

  static const String albumKey_ = 'album';
}
