/// ItemMapping
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
///             "default": "unknown"
///         },
///         "translation_key": {
///             "type": "string",
///             "nullable": true
///         },
///         "available": {
///             "type": "boolean",
///             "default": true
///         },
///         "image": {
///             "$ref": "#/components/schemas/MediaItemImage",
///             "nullable": true
///         },
///         "year": {
///             "type": "integer",
///             "nullable": true
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
part 'music_assistant_item_mapping.freezed.dart';
part 'music_assistant_item_mapping.g.dart';

@freezed
abstract class MusicAssistantItemMapping with _$MusicAssistantItemMapping {
  const MusicAssistantItemMapping._();

  @jsonSerializable
  const factory MusicAssistantItemMapping({
    /// itemId
    @JsonKey(name: MusicAssistantItemMapping.itemIdKey_) required String itemId,

    /// provider
    @JsonKey(name: MusicAssistantItemMapping.providerKey_)
    required String provider,

    /// name
    @JsonKey(name: MusicAssistantItemMapping.nameKey_) required String name,

    /// version
    @Default('')
    @JsonKey(name: MusicAssistantItemMapping.versionKey_)
    String version,

    /// sortName
    @JsonKey(name: MusicAssistantItemMapping.sortNameKey_) String? sortName,

    /// uri
    @JsonKey(name: MusicAssistantItemMapping.uriKey_) String? uri,

    /// externalIds
    @JsonKey(name: MusicAssistantItemMapping.externalIdsKey_)
    List<List<MusicAssistantExternalID>>? externalIds,

    /// isPlayable
    @Default(true)
    @JsonKey(name: MusicAssistantItemMapping.isPlayableKey_)
    bool isPlayable,

    /// mediaType
    @Default(MusicAssistantMediaType.unknown)
    @JsonKey(name: MusicAssistantItemMapping.mediaTypeKey_)
    MusicAssistantMediaType mediaType,

    /// translationKey
    @JsonKey(name: MusicAssistantItemMapping.translationKeyKey_)
    String? translationKey,

    /// available
    @Default(true)
    @JsonKey(name: MusicAssistantItemMapping.availableKey_)
    bool available,

    /// image
    @JsonKey(name: MusicAssistantItemMapping.imageKey_)
    MusicAssistantMediaItemImage? image,

    /// year
    @JsonKey(name: MusicAssistantItemMapping.yearKey_) int? year,
  }) = _MusicAssistantItemMapping;

  factory MusicAssistantItemMapping.fromJson(Map<String, dynamic> json) =>
      _$MusicAssistantItemMappingFromJson(json);

  static const String itemIdKey_ = 'item_id';

  static const String providerKey_ = 'provider';

  static const String nameKey_ = 'name';

  static const String versionKey_ = 'version';

  static const String sortNameKey_ = 'sort_name';

  static const String uriKey_ = 'uri';

  static const String externalIdsKey_ = 'external_ids';

  static const String isPlayableKey_ = 'is_playable';

  static const String mediaTypeKey_ = 'media_type';

  static const String translationKeyKey_ = 'translation_key';

  static const String availableKey_ = 'available';

  static const String imageKey_ = 'image';

  static const String yearKey_ = 'year';
}
