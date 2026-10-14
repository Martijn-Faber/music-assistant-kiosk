/// Radio
///
/// ```json
/// {
///     "properties": {
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
///         "provider_mappings": {
///             "type": "array",
///             "items": {
///                 "type": "object",
///                 "properties": {
///                     "provider_instance": {
///                         "type": "string"
///                     },
///                     "provider_domain": {
///                         "type": "string"
///                     }
///                 }
///             }
///         },
///         "uri": {
///             "type": "string",
///             "nullable": true
///         },
///         "media_type": {
///             "$ref": "#/components/schemas/MediaType",
///             "default": "radio"
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
part 'music_assistant_radio.freezed.dart';
part 'music_assistant_radio.g.dart';

@freezed
abstract class MusicAssistantRadio with _$MusicAssistantRadio {
  const MusicAssistantRadio._();

  @jsonSerializable
  const factory MusicAssistantRadio({
    /// favorite
    @Default(false)
    @JsonKey(name: MusicAssistantRadio.favoriteKey_)
    bool favorite,

    /// metadata
    @JsonKey(name: MusicAssistantRadio.metadataKey_)
    MusicAssistantMediaItemMetadata? metadata,

    /// itemId
    @JsonKey(name: MusicAssistantRadio.itemIdKey_) required String itemId,

    /// provider
    @JsonKey(name: MusicAssistantRadio.providerKey_) required String provider,

    /// name
    @JsonKey(name: MusicAssistantRadio.nameKey_) required String name,

    /// providerMappings
    @JsonKey(name: MusicAssistantRadio.providerMappingsKey_)
    List<MusicAssistantRadioProviderMappingsItem>? providerMappings,

    /// uri
    @JsonKey(name: MusicAssistantRadio.uriKey_) String? uri,

    /// mediaType
    @Default(MusicAssistantMediaType.radio)
    @JsonKey(name: MusicAssistantRadio.mediaTypeKey_)
    MusicAssistantMediaType mediaType,
  }) = _MusicAssistantRadio;

  factory MusicAssistantRadio.fromJson(Map<String, dynamic> json) =>
      _$MusicAssistantRadioFromJson(json);

  static const String favoriteKey_ = 'favorite';

  static const String metadataKey_ = 'metadata';

  static const String itemIdKey_ = 'item_id';

  static const String providerKey_ = 'provider';

  static const String nameKey_ = 'name';

  static const String providerMappingsKey_ = 'provider_mappings';

  static const String uriKey_ = 'uri';

  static const String mediaTypeKey_ = 'media_type';
}
