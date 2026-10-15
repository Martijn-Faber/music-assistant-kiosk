/// Playlist
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
///             "default": "playlist"
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
///         "translation_key": {
///             "type": "string",
///             "nullable": true
///         },
///         "translation_params": {
///             "type": "array",
///             "items": {
///                 "type": "string"
///             },
///             "nullable": true
///         },
///         "owner": {
///             "type": "string",
///             "default": ""
///         },
///         "is_editable": {
///             "type": "boolean",
///             "default": false
///         },
///         "is_dynamic": {
///             "type": "boolean",
///             "default": false
///         },
///         "supported_mediatypes": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/MediaType"
///             }
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
part 'music_assistant_playlist.freezed.dart';
part 'music_assistant_playlist.g.dart';

@freezed
abstract class MusicAssistantPlaylist with _$MusicAssistantPlaylist {
  const MusicAssistantPlaylist._();

  @jsonSerializable
  const factory MusicAssistantPlaylist({
    /// itemId
    @JsonKey(name: MusicAssistantPlaylist.itemIdKey_) required String itemId,

    /// provider
    @JsonKey(name: MusicAssistantPlaylist.providerKey_)
    required String provider,

    /// name
    @JsonKey(name: MusicAssistantPlaylist.nameKey_) required String name,

    /// version
    @Default('')
    @JsonKey(name: MusicAssistantPlaylist.versionKey_)
    String version,

    /// sortName
    @JsonKey(name: MusicAssistantPlaylist.sortNameKey_) String? sortName,

    /// uri
    @JsonKey(name: MusicAssistantPlaylist.uriKey_) String? uri,

    /// externalIds
    @JsonKey(name: MusicAssistantPlaylist.externalIdsKey_)
    List<List<MusicAssistantExternalID>>? externalIds,

    /// isPlayable
    @Default(true)
    @JsonKey(name: MusicAssistantPlaylist.isPlayableKey_)
    bool isPlayable,

    /// mediaType
    @Default(MusicAssistantMediaType.playlist)
    @JsonKey(name: MusicAssistantPlaylist.mediaTypeKey_)
    MusicAssistantMediaType mediaType,

    /// providerMappings
    @JsonKey(name: MusicAssistantPlaylist.providerMappingsKey_)
    required List<MusicAssistantProviderMapping> providerMappings,

    /// metadata
    @JsonKey(name: MusicAssistantPlaylist.metadataKey_)
    MusicAssistantMediaItemMetadata? metadata,

    /// favorite
    @Default(false)
    @JsonKey(name: MusicAssistantPlaylist.favoriteKey_)
    bool favorite,

    /// position
    @JsonKey(name: MusicAssistantPlaylist.positionKey_) int? position,

    /// dateAdded
    @JsonKey(name: MusicAssistantPlaylist.dateAddedKey_) DateTime? dateAdded,

    /// translationKey
    @JsonKey(name: MusicAssistantPlaylist.translationKeyKey_)
    String? translationKey,

    /// translationParams
    @JsonKey(name: MusicAssistantPlaylist.translationParamsKey_)
    List<String>? translationParams,

    /// owner
    @Default('') @JsonKey(name: MusicAssistantPlaylist.ownerKey_) String owner,

    /// isEditable
    @Default(false)
    @JsonKey(name: MusicAssistantPlaylist.isEditableKey_)
    bool isEditable,

    /// isDynamic
    @Default(false)
    @JsonKey(name: MusicAssistantPlaylist.isDynamicKey_)
    bool isDynamic,

    /// supportedMediatypes
    @JsonKey(name: MusicAssistantPlaylist.supportedMediatypesKey_)
    List<MusicAssistantMediaType>? supportedMediatypes,
  }) = _MusicAssistantPlaylist;

  factory MusicAssistantPlaylist.fromJson(Map<String, dynamic> json) =>
      _$MusicAssistantPlaylistFromJson(json);

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

  static const String translationKeyKey_ = 'translation_key';

  static const String translationParamsKey_ = 'translation_params';

  static const String ownerKey_ = 'owner';

  static const String isEditableKey_ = 'is_editable';

  static const String isDynamicKey_ = 'is_dynamic';

  static const String supportedMediatypesKey_ = 'supported_mediatypes';
}
