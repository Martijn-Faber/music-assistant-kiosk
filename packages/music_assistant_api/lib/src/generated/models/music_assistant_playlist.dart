/// Playlist
///
/// ```json
/// {
///     "properties": {
///         "owner": {
///             "type": "string",
///             "default": ""
///         },
///         "favorite": {
///             "type": "boolean",
///             "default": false
///         },
///         "metadata": {
///             "$ref": "#/components/schemas/MediaItemMetadata",
///             "nullable": true
///         },
///         "item_id": {
///             "type": "string"
///         },
///         "provider": {
///             "type": "string"
///         },
///         "name": {
///             "type": "string"
///         },
///         "uri": {
///             "type": "string",
///             "nullable": true
///         },
///         "media_type": {
///             "$ref": "#/components/schemas/MediaType",
///             "default": "playlist"
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
part 'music_assistant_playlist.freezed.dart';
part 'music_assistant_playlist.g.dart';

@freezed
abstract class MusicAssistantPlaylist with _$MusicAssistantPlaylist {
  const MusicAssistantPlaylist._();

  @jsonSerializable
  const factory MusicAssistantPlaylist({
    /// owner
    @Default('') @JsonKey(name: MusicAssistantPlaylist.ownerKey_) String owner,

    /// favorite
    @Default(false)
    @JsonKey(name: MusicAssistantPlaylist.favoriteKey_)
    bool favorite,

    /// metadata
    @JsonKey(name: MusicAssistantPlaylist.metadataKey_)
    MusicAssistantMediaItemMetadata? metadata,

    /// itemId
    @JsonKey(name: MusicAssistantPlaylist.itemIdKey_) required String itemId,

    /// provider
    @JsonKey(name: MusicAssistantPlaylist.providerKey_)
    required String provider,

    /// name
    @JsonKey(name: MusicAssistantPlaylist.nameKey_) required String name,

    /// uri
    @JsonKey(name: MusicAssistantPlaylist.uriKey_) String? uri,

    /// mediaType
    @Default(MusicAssistantMediaType.playlist)
    @JsonKey(name: MusicAssistantPlaylist.mediaTypeKey_)
    MusicAssistantMediaType mediaType,
  }) = _MusicAssistantPlaylist;

  factory MusicAssistantPlaylist.fromJson(Map<String, dynamic> json) =>
      _$MusicAssistantPlaylistFromJson(json);

  static const String ownerKey_ = 'owner';

  static const String favoriteKey_ = 'favorite';

  static const String metadataKey_ = 'metadata';

  static const String itemIdKey_ = 'item_id';

  static const String providerKey_ = 'provider';

  static const String nameKey_ = 'name';

  static const String uriKey_ = 'uri';

  static const String mediaTypeKey_ = 'media_type';
}
