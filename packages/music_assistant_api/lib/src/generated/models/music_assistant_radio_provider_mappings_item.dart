/// MusicAssistantRadioProviderMappingsItem
///
/// ```json
/// {
///     "properties": {
///         "provider_instance": {
///             "type": "string"
///         },
///         "provider_domain": {
///             "type": "string"
///         }
///     },
///     "type": "object"
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_radio_provider_mappings_item.freezed.dart';
part 'music_assistant_radio_provider_mappings_item.g.dart';

@freezed
abstract class MusicAssistantRadioProviderMappingsItem
    with _$MusicAssistantRadioProviderMappingsItem {
  const MusicAssistantRadioProviderMappingsItem._();

  @jsonSerializable
  const factory MusicAssistantRadioProviderMappingsItem({
    /// providerInstance
    @JsonKey(name: MusicAssistantRadioProviderMappingsItem.providerInstanceKey_)
    String? providerInstance,

    /// providerDomain
    @JsonKey(name: MusicAssistantRadioProviderMappingsItem.providerDomainKey_)
    String? providerDomain,
  }) = _MusicAssistantRadioProviderMappingsItem;

  factory MusicAssistantRadioProviderMappingsItem.fromJson(
    Map<String, dynamic> json,
  ) => _$MusicAssistantRadioProviderMappingsItemFromJson(json);

  static const String providerInstanceKey_ = 'provider_instance';

  static const String providerDomainKey_ = 'provider_domain';
}
