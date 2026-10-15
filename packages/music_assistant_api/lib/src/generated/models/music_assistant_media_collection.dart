/// MediaCollection
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
///             "default": "collection"
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
///         "items": {
///             "type": "array",
///             "items": {
///                 "type": "object"
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
part 'music_assistant_media_collection.freezed.dart';
part 'music_assistant_media_collection.g.dart';

@freezed
abstract class MusicAssistantMediaCollection
    with _$MusicAssistantMediaCollection {
  const MusicAssistantMediaCollection._();

  @jsonSerializable
  const factory MusicAssistantMediaCollection({
    /// itemId
    @JsonKey(name: MusicAssistantMediaCollection.itemIdKey_)
    required String itemId,

    /// provider
    @JsonKey(name: MusicAssistantMediaCollection.providerKey_)
    required String provider,

    /// name
    @JsonKey(name: MusicAssistantMediaCollection.nameKey_) required String name,

    /// version
    @Default('')
    @JsonKey(name: MusicAssistantMediaCollection.versionKey_)
    String version,

    /// sortName
    @JsonKey(name: MusicAssistantMediaCollection.sortNameKey_) String? sortName,

    /// uri
    @JsonKey(name: MusicAssistantMediaCollection.uriKey_) String? uri,

    /// externalIds
    @JsonKey(name: MusicAssistantMediaCollection.externalIdsKey_)
    List<List<MusicAssistantExternalID>>? externalIds,

    /// isPlayable
    @Default(true)
    @JsonKey(name: MusicAssistantMediaCollection.isPlayableKey_)
    bool isPlayable,

    /// mediaType
    @Default(MusicAssistantMediaType.collection)
    @JsonKey(name: MusicAssistantMediaCollection.mediaTypeKey_)
    MusicAssistantMediaType mediaType,

    /// providerMappings
    @JsonKey(name: MusicAssistantMediaCollection.providerMappingsKey_)
    required List<MusicAssistantProviderMapping> providerMappings,

    /// metadata
    @JsonKey(name: MusicAssistantMediaCollection.metadataKey_)
    MusicAssistantMediaItemMetadata? metadata,

    /// favorite
    @Default(false)
    @JsonKey(name: MusicAssistantMediaCollection.favoriteKey_)
    bool favorite,

    /// position
    @JsonKey(name: MusicAssistantMediaCollection.positionKey_) int? position,

    /// dateAdded
    @JsonKey(name: MusicAssistantMediaCollection.dateAddedKey_)
    DateTime? dateAdded,

    /// items
    @JsonKey(name: MusicAssistantMediaCollection.itemsKey_)
    List<Map<String, dynamic>>? items,
  }) = _MusicAssistantMediaCollection;

  factory MusicAssistantMediaCollection.fromJson(Map<String, dynamic> json) =>
      _$MusicAssistantMediaCollectionFromJson(json);

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

  static const String itemsKey_ = 'items';
}
