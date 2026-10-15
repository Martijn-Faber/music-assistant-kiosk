/// PlayerMedia
///
/// ```json
/// {
///     "properties": {
///         "uri": {
///             "type": "string"
///         },
///         "media_type": {
///             "$ref": "#/components/schemas/MediaType",
///             "default": "unknown"
///         },
///         "title": {
///             "type": "string",
///             "nullable": true
///         },
///         "artist": {
///             "type": "string",
///             "nullable": true
///         },
///         "album": {
///             "type": "string",
///             "nullable": true
///         },
///         "album_artist": {
///             "type": "string",
///             "nullable": true
///         },
///         "image_url": {
///             "type": "string",
///             "nullable": true
///         },
///         "palette": {
///             "$ref": "#/components/schemas/MediaItemPalette",
///             "nullable": true
///         },
///         "duration": {
///             "type": "integer",
///             "nullable": true
///         },
///         "stream_duration": {
///             "type": "integer",
///             "nullable": true
///         },
///         "source_id": {
///             "type": "string",
///             "nullable": true
///         },
///         "queue_item_id": {
///             "type": "string",
///             "nullable": true
///         },
///         "custom_data": {
///             "type": "object",
///             "nullable": true,
///             "additionalProperties": {
///                 "$ref": "#/components/schemas/Any"
///             }
///         },
///         "elapsed_time": {
///             "type": "integer",
///             "nullable": true
///         },
///         "elapsed_time_last_updated": {
///             "type": "number",
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
    /// uri
    @JsonKey(name: MusicAssistantPlayerMedia.uriKey_) required String uri,

    /// mediaType
    @Default(MusicAssistantMediaType.unknown)
    @JsonKey(name: MusicAssistantPlayerMedia.mediaTypeKey_)
    MusicAssistantMediaType mediaType,

    /// title
    @JsonKey(name: MusicAssistantPlayerMedia.titleKey_) String? title,

    /// artist
    @JsonKey(name: MusicAssistantPlayerMedia.artistKey_) String? artist,

    /// album
    @JsonKey(name: MusicAssistantPlayerMedia.albumKey_) String? album,

    /// albumArtist
    @JsonKey(name: MusicAssistantPlayerMedia.albumArtistKey_)
    String? albumArtist,

    /// imageUrl
    @JsonKey(name: MusicAssistantPlayerMedia.imageUrlKey_) String? imageUrl,

    /// palette
    @JsonKey(name: MusicAssistantPlayerMedia.paletteKey_)
    MusicAssistantMediaItemPalette? palette,

    /// duration
    @JsonKey(name: MusicAssistantPlayerMedia.durationKey_) int? duration,

    /// streamDuration
    @JsonKey(name: MusicAssistantPlayerMedia.streamDurationKey_)
    int? streamDuration,

    /// sourceId
    @JsonKey(name: MusicAssistantPlayerMedia.sourceIdKey_) String? sourceId,

    /// queueItemId
    @JsonKey(name: MusicAssistantPlayerMedia.queueItemIdKey_)
    String? queueItemId,

    /// customData
    @JsonKey(name: MusicAssistantPlayerMedia.customDataKey_)
    Map<String, MusicAssistantAny>? customData,

    /// elapsedTime
    @JsonKey(name: MusicAssistantPlayerMedia.elapsedTimeKey_) int? elapsedTime,

    /// elapsedTimeLastUpdated
    @JsonKey(name: MusicAssistantPlayerMedia.elapsedTimeLastUpdatedKey_)
    double? elapsedTimeLastUpdated,
  }) = _MusicAssistantPlayerMedia;

  factory MusicAssistantPlayerMedia.fromJson(Map<String, dynamic> json) =>
      _$MusicAssistantPlayerMediaFromJson(json);

  static const String uriKey_ = 'uri';

  static const String mediaTypeKey_ = 'media_type';

  static const String titleKey_ = 'title';

  static const String artistKey_ = 'artist';

  static const String albumKey_ = 'album';

  static const String albumArtistKey_ = 'album_artist';

  static const String imageUrlKey_ = 'image_url';

  static const String paletteKey_ = 'palette';

  static const String durationKey_ = 'duration';

  static const String streamDurationKey_ = 'stream_duration';

  static const String sourceIdKey_ = 'source_id';

  static const String queueItemIdKey_ = 'queue_item_id';

  static const String customDataKey_ = 'custom_data';

  static const String elapsedTimeKey_ = 'elapsed_time';

  static const String elapsedTimeLastUpdatedKey_ = 'elapsed_time_last_updated';
}
