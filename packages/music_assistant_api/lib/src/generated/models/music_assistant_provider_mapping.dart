/// ProviderMapping
///
/// ```json
/// {
///     "properties": {
///         "item_id": {
///             "type": "string"
///         },
///         "provider_domain": {
///             "type": "string"
///         },
///         "provider_instance": {
///             "type": "string"
///         },
///         "available": {
///             "type": "boolean",
///             "default": true
///         },
///         "in_library": {
///             "type": "boolean",
///             "nullable": true
///         },
///         "is_unique": {
///             "type": "boolean",
///             "nullable": true
///         },
///         "audio_format": {
///             "$ref": "#/components/schemas/AudioFormat"
///         },
///         "url": {
///             "type": "string",
///             "nullable": true
///         },
///         "details": {
///             "type": "string",
///             "nullable": true
///         }
///     },
///     "type": "object",
///     "required": [
///         "item_id",
///         "provider_domain",
///         "provider_instance"
///     ]
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_provider_mapping.freezed.dart';
part 'music_assistant_provider_mapping.g.dart';

@freezed
abstract class MusicAssistantProviderMapping
    with _$MusicAssistantProviderMapping {
  const MusicAssistantProviderMapping._();

  @jsonSerializable
  const factory MusicAssistantProviderMapping({
    /// itemId
    @JsonKey(name: MusicAssistantProviderMapping.itemIdKey_)
    required String itemId,

    /// providerDomain
    @JsonKey(name: MusicAssistantProviderMapping.providerDomainKey_)
    required String providerDomain,

    /// providerInstance
    @JsonKey(name: MusicAssistantProviderMapping.providerInstanceKey_)
    required String providerInstance,

    /// available
    @Default(true)
    @JsonKey(name: MusicAssistantProviderMapping.availableKey_)
    bool available,

    /// inLibrary
    @JsonKey(name: MusicAssistantProviderMapping.inLibraryKey_) bool? inLibrary,

    /// isUnique
    @JsonKey(name: MusicAssistantProviderMapping.isUniqueKey_) bool? isUnique,

    /// audioFormat
    @JsonKey(name: MusicAssistantProviderMapping.audioFormatKey_)
    MusicAssistantAudioFormat? audioFormat,

    /// url
    @JsonKey(name: MusicAssistantProviderMapping.urlKey_) String? url,

    /// details
    @JsonKey(name: MusicAssistantProviderMapping.detailsKey_) String? details,
  }) = _MusicAssistantProviderMapping;

  factory MusicAssistantProviderMapping.fromJson(Map<String, dynamic> json) =>
      _$MusicAssistantProviderMappingFromJson(json);

  static const String itemIdKey_ = 'item_id';

  static const String providerDomainKey_ = 'provider_domain';

  static const String providerInstanceKey_ = 'provider_instance';

  static const String availableKey_ = 'available';

  static const String inLibraryKey_ = 'in_library';

  static const String isUniqueKey_ = 'is_unique';

  static const String audioFormatKey_ = 'audio_format';

  static const String urlKey_ = 'url';

  static const String detailsKey_ = 'details';
}
