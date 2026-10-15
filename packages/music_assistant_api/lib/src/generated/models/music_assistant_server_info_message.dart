/// ServerInfoMessage
///
/// ```json
/// {
///     "properties": {
///         "server_id": {
///             "type": "string"
///         },
///         "server_version": {
///             "type": "string"
///         },
///         "schema_version": {
///             "type": "integer"
///         },
///         "min_supported_schema_version": {
///             "type": "integer"
///         },
///         "base_url": {
///             "type": "string",
///             "nullable": true
///         },
///         "homeassistant_addon": {
///             "type": "boolean",
///             "default": false
///         },
///         "onboard_done": {
///             "type": "boolean",
///             "default": false
///         },
///         "name": {
///             "type": "string",
///             "nullable": true
///         },
///         "status": {
///             "$ref": "#/components/schemas/CoreState",
///             "default": "running"
///         },
///         "internal_url": {
///             "type": "string",
///             "nullable": true
///         },
///         "external_url": {
///             "type": "string",
///             "nullable": true
///         },
///         "has_remote_access": {
///             "type": "boolean",
///             "default": false
///         }
///     },
///     "type": "object",
///     "required": [
///         "server_id",
///         "server_version",
///         "schema_version",
///         "min_supported_schema_version"
///     ]
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_server_info_message.freezed.dart';
part 'music_assistant_server_info_message.g.dart';

@freezed
abstract class MusicAssistantServerInfoMessage
    with _$MusicAssistantServerInfoMessage {
  const MusicAssistantServerInfoMessage._();

  @jsonSerializable
  const factory MusicAssistantServerInfoMessage({
    /// serverId
    @JsonKey(name: MusicAssistantServerInfoMessage.serverIdKey_)
    required String serverId,

    /// serverVersion
    @JsonKey(name: MusicAssistantServerInfoMessage.serverVersionKey_)
    required String serverVersion,

    /// schemaVersion
    @JsonKey(name: MusicAssistantServerInfoMessage.schemaVersionKey_)
    required int schemaVersion,

    /// minSupportedSchemaVersion
    @JsonKey(
      name: MusicAssistantServerInfoMessage.minSupportedSchemaVersionKey_,
    )
    required int minSupportedSchemaVersion,

    /// baseUrl
    @JsonKey(name: MusicAssistantServerInfoMessage.baseUrlKey_) String? baseUrl,

    /// homeassistantAddon
    @Default(false)
    @JsonKey(name: MusicAssistantServerInfoMessage.homeassistantAddonKey_)
    bool homeassistantAddon,

    /// onboardDone
    @Default(false)
    @JsonKey(name: MusicAssistantServerInfoMessage.onboardDoneKey_)
    bool onboardDone,

    /// name
    @JsonKey(name: MusicAssistantServerInfoMessage.nameKey_) String? name,

    /// status
    @Default(MusicAssistantCoreState.running)
    @JsonKey(name: MusicAssistantServerInfoMessage.statusKey_)
    MusicAssistantCoreState status,

    /// internalUrl
    @JsonKey(name: MusicAssistantServerInfoMessage.internalUrlKey_)
    String? internalUrl,

    /// externalUrl
    @JsonKey(name: MusicAssistantServerInfoMessage.externalUrlKey_)
    String? externalUrl,

    /// hasRemoteAccess
    @Default(false)
    @JsonKey(name: MusicAssistantServerInfoMessage.hasRemoteAccessKey_)
    bool hasRemoteAccess,
  }) = _MusicAssistantServerInfoMessage;

  factory MusicAssistantServerInfoMessage.fromJson(Map<String, dynamic> json) =>
      _$MusicAssistantServerInfoMessageFromJson(json);

  static const String serverIdKey_ = 'server_id';

  static const String serverVersionKey_ = 'server_version';

  static const String schemaVersionKey_ = 'schema_version';

  static const String minSupportedSchemaVersionKey_ =
      'min_supported_schema_version';

  static const String baseUrlKey_ = 'base_url';

  static const String homeassistantAddonKey_ = 'homeassistant_addon';

  static const String onboardDoneKey_ = 'onboard_done';

  static const String nameKey_ = 'name';

  static const String statusKey_ = 'status';

  static const String internalUrlKey_ = 'internal_url';

  static const String externalUrlKey_ = 'external_url';

  static const String hasRemoteAccessKey_ = 'has_remote_access';
}
