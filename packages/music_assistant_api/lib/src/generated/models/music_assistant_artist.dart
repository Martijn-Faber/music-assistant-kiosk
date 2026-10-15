/// Artist
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
///             "default": "artist"
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
///         "artist_type": {
///             "$ref": "#/components/schemas/ArtistType",
///             "default": "singer"
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
part 'music_assistant_artist.freezed.dart';
part 'music_assistant_artist.g.dart';

@freezed
abstract class MusicAssistantArtist with _$MusicAssistantArtist {
  const MusicAssistantArtist._();

  @jsonSerializable
  const factory MusicAssistantArtist({
    /// itemId
    @JsonKey(name: MusicAssistantArtist.itemIdKey_) required String itemId,

    /// provider
    @JsonKey(name: MusicAssistantArtist.providerKey_) required String provider,

    /// name
    @JsonKey(name: MusicAssistantArtist.nameKey_) required String name,

    /// version
    @Default('')
    @JsonKey(name: MusicAssistantArtist.versionKey_)
    String version,

    /// sortName
    @JsonKey(name: MusicAssistantArtist.sortNameKey_) String? sortName,

    /// uri
    @JsonKey(name: MusicAssistantArtist.uriKey_) String? uri,

    /// externalIds
    @JsonKey(name: MusicAssistantArtist.externalIdsKey_)
    List<List<MusicAssistantExternalID>>? externalIds,

    /// isPlayable
    @Default(true)
    @JsonKey(name: MusicAssistantArtist.isPlayableKey_)
    bool isPlayable,

    /// mediaType
    @Default(MusicAssistantMediaType.artist)
    @JsonKey(name: MusicAssistantArtist.mediaTypeKey_)
    MusicAssistantMediaType mediaType,

    /// providerMappings
    @JsonKey(name: MusicAssistantArtist.providerMappingsKey_)
    required List<MusicAssistantProviderMapping> providerMappings,

    /// metadata
    @JsonKey(name: MusicAssistantArtist.metadataKey_)
    MusicAssistantMediaItemMetadata? metadata,

    /// favorite
    @Default(false)
    @JsonKey(name: MusicAssistantArtist.favoriteKey_)
    bool favorite,

    /// position
    @JsonKey(name: MusicAssistantArtist.positionKey_) int? position,

    /// dateAdded
    @JsonKey(name: MusicAssistantArtist.dateAddedKey_) DateTime? dateAdded,

    /// artistType
    @Default(MusicAssistantArtistType.singer)
    @JsonKey(name: MusicAssistantArtist.artistTypeKey_)
    MusicAssistantArtistType artistType,
  }) = _MusicAssistantArtist;

  factory MusicAssistantArtist.fromJson(Map<String, dynamic> json) =>
      _$MusicAssistantArtistFromJson(json);

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

  static const String artistTypeKey_ = 'artist_type';
}
