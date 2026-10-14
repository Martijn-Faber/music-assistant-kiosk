/// ServerInfoMessage
///
/// ```json
/// {
///     "properties": {
///         "name": {
///             "type": "string",
///             "nullable": true
///         },
///         "min_supported_schema_version": {
///             "type": "integer"
///         },
///         "server_version": {
///             "type": "string"
///         },
///         "server_id": {
///             "type": "string"
///         },
///         "status": {
///             "type": "string",
///             "default": "running"
///         },
///         "schema_version": {
///             "type": "integer"
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
    /// name
    @JsonKey(name: MusicAssistantServerInfoMessage.nameKey_) String? name,

    /// minSupportedSchemaVersion
    @JsonKey(
      name: MusicAssistantServerInfoMessage.minSupportedSchemaVersionKey_,
    )
    required int minSupportedSchemaVersion,

    /// serverVersion
    @JsonKey(name: MusicAssistantServerInfoMessage.serverVersionKey_)
    required String serverVersion,

    /// serverId
    @JsonKey(name: MusicAssistantServerInfoMessage.serverIdKey_)
    required String serverId,

    /// status
    @Default('running')
    @JsonKey(name: MusicAssistantServerInfoMessage.statusKey_)
    String status,

    /// schemaVersion
    @JsonKey(name: MusicAssistantServerInfoMessage.schemaVersionKey_)
    required int schemaVersion,
  }) = _MusicAssistantServerInfoMessage;

  factory MusicAssistantServerInfoMessage.fromJson(Map<String, dynamic> json) =>
      _$MusicAssistantServerInfoMessageFromJson(json);

  static const String nameKey_ = 'name';

  static const String minSupportedSchemaVersionKey_ =
      'min_supported_schema_version';

  static const String serverVersionKey_ = 'server_version';

  static const String serverIdKey_ = 'server_id';

  static const String statusKey_ = 'status';

  static const String schemaVersionKey_ = 'schema_version';
}
