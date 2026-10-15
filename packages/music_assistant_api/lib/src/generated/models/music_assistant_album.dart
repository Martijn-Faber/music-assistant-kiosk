/// Album
///
/// ```json
/// {
///     "properties": {
///         "item_id": {
///             "type": "string"
///         },
///         "provider": {
///             "type": "string"
///         },
///         "name": {
///             "type": "string"
///         },
///         "version": {
///             "type": "string",
///             "default": ""
///         },
///         "sort_name": {
///             "type": "string",
///             "nullable": true
///         },
///         "uri": {
///             "type": "string",
///             "nullable": true
///         },
///         "external_ids": {
///             "type": "array",
///             "items": {
///                 "type": "array",
///                 "items": {
///                     "$ref": "#/components/schemas/ExternalID"
///                 }
///             }
///         },
///         "is_playable": {
///             "type": "boolean",
///             "default": true
///         },
///         "media_type": {
///             "$ref": "#/components/schemas/MediaType",
///             "default": "album"
///         },
///         "provider_mappings": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/ProviderMapping"
///             }
///         },
///         "metadata": {
///             "$ref": "#/components/schemas/MediaItemMetadata"
///         },
///         "favorite": {
///             "type": "boolean",
///             "default": false
///         },
///         "position": {
///             "type": "integer",
///             "nullable": true
///         },
///         "date_added": {
///             "type": "string",
///             "format": "date-time",
///             "nullable": true
///         },
///         "year": {
///             "type": "integer",
///             "nullable": true
///         },
///         "artists": {
///             "type": "array",
///             "items": {
///                 "oneOf": [
///                     {
///                         "$ref": "#/components/schemas/Artist"
///                     },
///                     {
///                         "$ref": "#/components/schemas/ItemMapping"
///                     }
///                 ]
///             }
///         },
///         "album_type": {
///             "$ref": "#/components/schemas/AlbumType",
///             "default": "unknown"
///         }
///     },
///     "type": "object",
///     "required": [
///         "item_id",
///         "provider",
///         "name",
///         "provider_mappings"
///     ]
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_album.freezed.dart';
part 'music_assistant_album.g.dart';

@freezed
abstract class MusicAssistantAlbum with _$MusicAssistantAlbum {
  const MusicAssistantAlbum._();

  @jsonSerializable
  const factory MusicAssistantAlbum({
    /// itemId
    @JsonKey(name: MusicAssistantAlbum.itemIdKey_) required String itemId,

    /// provider
    @JsonKey(name: MusicAssistantAlbum.providerKey_) required String provider,

    /// name
    @JsonKey(name: MusicAssistantAlbum.nameKey_) required String name,

    /// version
    @Default('') @JsonKey(name: MusicAssistantAlbum.versionKey_) String version,

    /// sortName
    @JsonKey(name: MusicAssistantAlbum.sortNameKey_) String? sortName,

    /// uri
    @JsonKey(name: MusicAssistantAlbum.uriKey_) String? uri,

    /// externalIds
    @JsonKey(name: MusicAssistantAlbum.externalIdsKey_)
    List<List<MusicAssistantExternalID>>? externalIds,

    /// isPlayable
    @Default(true)
    @JsonKey(name: MusicAssistantAlbum.isPlayableKey_)
    bool isPlayable,

    /// mediaType
    @Default(MusicAssistantMediaType.album)
    @JsonKey(name: MusicAssistantAlbum.mediaTypeKey_)
    MusicAssistantMediaType mediaType,

    /// providerMappings
    @JsonKey(name: MusicAssistantAlbum.providerMappingsKey_)
    required List<MusicAssistantProviderMapping> providerMappings,

    /// metadata
    @JsonKey(name: MusicAssistantAlbum.metadataKey_)
    MusicAssistantMediaItemMetadata? metadata,

    /// favorite
    @Default(false)
    @JsonKey(name: MusicAssistantAlbum.favoriteKey_)
    bool favorite,

    /// position
    @JsonKey(name: MusicAssistantAlbum.positionKey_) int? position,

    /// dateAdded
    @JsonKey(name: MusicAssistantAlbum.dateAddedKey_) DateTime? dateAdded,

    /// year
    @JsonKey(name: MusicAssistantAlbum.yearKey_) int? year,

    /// artists
    @JsonKey(name: MusicAssistantAlbum.artistsKey_)
    List<MusicAssistantArtistOrItemMappingUnion>? artists,

    /// albumType
    @Default(MusicAssistantAlbumType.unknown)
    @JsonKey(name: MusicAssistantAlbum.albumTypeKey_)
    MusicAssistantAlbumType albumType,
  }) = _MusicAssistantAlbum;

  factory MusicAssistantAlbum.fromJson(Map<String, dynamic> json) =>
      _$MusicAssistantAlbumFromJson(json);

  static const String itemIdKey_ = 'item_id';

  static const String providerKey_ = 'provider';

  static const String nameKey_ = 'name';

  static const String versionKey_ = 'version';

  static const String sortNameKey_ = 'sort_name';

  static const String uriKey_ = 'uri';

  static const String externalIdsKey_ = 'external_ids';

  static const String isPlayableKey_ = 'is_playable';

  static const String mediaTypeKey_ = 'media_type';

  static const String providerMappingsKey_ = 'provider_mappings';

  static const String metadataKey_ = 'metadata';

  static const String favoriteKey_ = 'favorite';

  static const String positionKey_ = 'position';

  static const String dateAddedKey_ = 'date_added';

  static const String yearKey_ = 'year';

  static const String artistsKey_ = 'artists';

  static const String albumTypeKey_ = 'album_type';
}
