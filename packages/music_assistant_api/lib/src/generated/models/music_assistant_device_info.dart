/// DeviceInfo
///
/// ```json
/// {
///     "properties": {
///         "model": {
///             "type": "string",
///             "default": "Unknown model"
///         },
///         "manufacturer": {
///             "type": "string",
///             "default": "Unknown Manufacturer"
///         },
///         "software_version": {
///             "type": "string",
///             "nullable": true
///         },
///         "model_id": {
///             "type": "string",
///             "nullable": true
///         },
///         "manufacturer_id": {
///             "type": "string",
///             "nullable": true
///         },
///         "identifiers": {
///             "type": "object",
///             "additionalProperties": {
///                 "type": "string"
///             }
///         }
///     },
///     "type": "object"
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_device_info.freezed.dart';
part 'music_assistant_device_info.g.dart';

@freezed
abstract class MusicAssistantDeviceInfo with _$MusicAssistantDeviceInfo {
  const MusicAssistantDeviceInfo._();

  @jsonSerializable
  const factory MusicAssistantDeviceInfo({
    /// model
    @Default('Unknown model')
    @JsonKey(name: MusicAssistantDeviceInfo.modelKey_)
    String model,

    /// manufacturer
    @Default('Unknown Manufacturer')
    @JsonKey(name: MusicAssistantDeviceInfo.manufacturerKey_)
    String manufacturer,

    /// softwareVersion
    @JsonKey(name: MusicAssistantDeviceInfo.softwareVersionKey_)
    String? softwareVersion,

    /// modelId
    @JsonKey(name: MusicAssistantDeviceInfo.modelIdKey_) String? modelId,

    /// manufacturerId
    @JsonKey(name: MusicAssistantDeviceInfo.manufacturerIdKey_)
    String? manufacturerId,

    /// identifiers
    @JsonKey(name: MusicAssistantDeviceInfo.identifiersKey_)
    Map<String, String>? identifiers,
  }) = _MusicAssistantDeviceInfo;

  factory MusicAssistantDeviceInfo.fromJson(Map<String, dynamic> json) =>
      _$MusicAssistantDeviceInfoFromJson(json);

  static const String modelKey_ = 'model';

  static const String manufacturerKey_ = 'manufacturer';

  static const String softwareVersionKey_ = 'software_version';

  static const String modelIdKey_ = 'model_id';

  static const String manufacturerIdKey_ = 'manufacturer_id';

  static const String identifiersKey_ = 'identifiers';
}
