/// Radio
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
///             "default": "radio"
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
///         "duration": {
///             "type": "integer",
///             "nullable": true
///         },
///         "is_dynamic": {
///             "type": "boolean",
///             "default": false
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
part 'music_assistant_radio.freezed.dart';
part 'music_assistant_radio.g.dart';

@freezed
abstract class MusicAssistantRadio with _$MusicAssistantRadio {
  const MusicAssistantRadio._();

  @jsonSerializable
  const factory MusicAssistantRadio({
    /// itemId
    @JsonKey(name: MusicAssistantRadio.itemIdKey_) required String itemId,

    /// provider
    @JsonKey(name: MusicAssistantRadio.providerKey_) required String provider,

    /// name
    @JsonKey(name: MusicAssistantRadio.nameKey_) required String name,

    /// version
    @Default('') @JsonKey(name: MusicAssistantRadio.versionKey_) String version,

    /// sortName
    @JsonKey(name: MusicAssistantRadio.sortNameKey_) String? sortName,

    /// uri
    @JsonKey(name: MusicAssistantRadio.uriKey_) String? uri,

    /// externalIds
    @JsonKey(name: MusicAssistantRadio.externalIdsKey_)
    List<List<MusicAssistantExternalID>>? externalIds,

    /// isPlayable
    @Default(true)
    @JsonKey(name: MusicAssistantRadio.isPlayableKey_)
    bool isPlayable,

    /// mediaType
    @Default(MusicAssistantMediaType.radio)
    @JsonKey(name: MusicAssistantRadio.mediaTypeKey_)
    MusicAssistantMediaType mediaType,

    /// providerMappings
    @JsonKey(name: MusicAssistantRadio.providerMappingsKey_)
    required List<MusicAssistantProviderMapping> providerMappings,

    /// metadata
    @JsonKey(name: MusicAssistantRadio.metadataKey_)
    MusicAssistantMediaItemMetadata? metadata,

    /// favorite
    @Default(false)
    @JsonKey(name: MusicAssistantRadio.favoriteKey_)
    bool favorite,

    /// position
    @JsonKey(name: MusicAssistantRadio.positionKey_) int? position,

    /// dateAdded
    @JsonKey(name: MusicAssistantRadio.dateAddedKey_) DateTime? dateAdded,

    /// translationKey
    @JsonKey(name: MusicAssistantRadio.translationKeyKey_)
    String? translationKey,

    /// translationParams
    @JsonKey(name: MusicAssistantRadio.translationParamsKey_)
    List<String>? translationParams,

    /// duration
    @JsonKey(name: MusicAssistantRadio.durationKey_) int? duration,

    /// isDynamic
    @Default(false)
    @JsonKey(name: MusicAssistantRadio.isDynamicKey_)
    bool isDynamic,
  }) = _MusicAssistantRadio;

  factory MusicAssistantRadio.fromJson(Map<String, dynamic> json) =>
      _$MusicAssistantRadioFromJson(json);

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

  static const String durationKey_ = 'duration';

  static const String isDynamicKey_ = 'is_dynamic';
}
