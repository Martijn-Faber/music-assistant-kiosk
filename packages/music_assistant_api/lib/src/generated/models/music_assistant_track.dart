/// Track
///
/// ```json
/// {
///     "properties": {
///         "album": {
///             "type": "object",
///             "properties": {
///                 "uri": {
///                     "type": "string",
///                     "nullable": true
///                 },
///                 "image_url": {
///                     "type": "string",
///                     "nullable": true
///                 },
///                 "name": {
///                     "type": "string"
///                 }
///             },
///             "nullable": true
///         },
///         "artists": {
///             "type": "array",
///             "items": {
///                 "type": "object",
///                 "properties": {
///                     "name": {
///                         "type": "string"
///                     },
///                     "uri": {
///                         "type": "string",
///                         "nullable": true
///                     }
///                 }
///             }
///         },
///         "item_id": {
///             "type": "string"
///         },
///         "provider": {
///             "type": "string"
///         },
///         "metadata": {
///             "$ref": "#/components/schemas/MediaItemMetadata",
///             "nullable": true
///         },
///         "duration": {
///             "type": "integer",
///             "default": 0
///         },
///         "name": {
///             "type": "string"
///         },
///         "media_type": {
///             "$ref": "#/components/schemas/MediaType",
///             "default": "track"
///         },
///         "uri": {
///             "type": "string",
///             "nullable": true
///         },
///         "favorite": {
///             "type": "boolean",
///             "default": false
///         }
///     },
///     "type": "object",
///     "required": [
///         "item_id",
///         "provider",
///         "name"
///     ]
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_track.freezed.dart';
part 'music_assistant_track.g.dart';

@freezed
abstract class MusicAssistantTrack with _$MusicAssistantTrack {
  const MusicAssistantTrack._();

  @jsonSerializable
  const factory MusicAssistantTrack({
    /// album
    @JsonKey(name: MusicAssistantTrack.albumKey_)
    MusicAssistantTrackAlbum? album,

    /// artists
    @JsonKey(name: MusicAssistantTrack.artistsKey_)
    List<MusicAssistantTrackArtistsItem>? artists,

    /// itemId
    @JsonKey(name: MusicAssistantTrack.itemIdKey_) required String itemId,

    /// provider
    @JsonKey(name: MusicAssistantTrack.providerKey_) required String provider,

    /// metadata
    @JsonKey(name: MusicAssistantTrack.metadataKey_)
    MusicAssistantMediaItemMetadata? metadata,

    /// duration
    @Default(0) @JsonKey(name: MusicAssistantTrack.durationKey_) int duration,

    /// name
    @JsonKey(name: MusicAssistantTrack.nameKey_) required String name,

    /// mediaType
    @Default(MusicAssistantMediaType.track)
    @JsonKey(name: MusicAssistantTrack.mediaTypeKey_)
    MusicAssistantMediaType mediaType,

    /// uri
    @JsonKey(name: MusicAssistantTrack.uriKey_) String? uri,

    /// favorite
    @Default(false)
    @JsonKey(name: MusicAssistantTrack.favoriteKey_)
    bool favorite,
  }) = _MusicAssistantTrack;

  factory MusicAssistantTrack.fromJson(Map<String, dynamic> json) =>
      _$MusicAssistantTrackFromJson(json);

  static const String albumKey_ = 'album';

  static const String artistsKey_ = 'artists';

  static const String itemIdKey_ = 'item_id';

  static const String providerKey_ = 'provider';

  static const String metadataKey_ = 'metadata';

  static const String durationKey_ = 'duration';

  static const String nameKey_ = 'name';

  static const String mediaTypeKey_ = 'media_type';

  static const String uriKey_ = 'uri';

  static const String favoriteKey_ = 'favorite';
}
