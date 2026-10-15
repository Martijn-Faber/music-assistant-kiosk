/// OutputProtocol
///
/// ```json
/// {
///     "properties": {
///         "output_protocol_id": {
///             "type": "string"
///         },
///         "name": {
///             "type": "string"
///         },
///         "protocol_domain": {
///             "type": "string"
///         },
///         "is_native": {
///             "type": "boolean",
///             "default": false
///         },
///         "priority": {
///             "type": "integer",
///             "default": 100
///         },
///         "available": {
///             "type": "boolean",
///             "default": true
///         },
///         "derived_from": {
///             "type": "string",
///             "nullable": true
///         }
///     },
///     "type": "object",
///     "required": [
///         "output_protocol_id",
///         "name",
///         "protocol_domain"
///     ]
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_output_protocol.freezed.dart';
part 'music_assistant_output_protocol.g.dart';

@freezed
abstract class MusicAssistantOutputProtocol
    with _$MusicAssistantOutputProtocol {
  const MusicAssistantOutputProtocol._();

  @jsonSerializable
  const factory MusicAssistantOutputProtocol({
    /// outputProtocolId
    @JsonKey(name: MusicAssistantOutputProtocol.outputProtocolIdKey_)
    required String outputProtocolId,

    /// name
    @JsonKey(name: MusicAssistantOutputProtocol.nameKey_) required String name,

    /// protocolDomain
    @JsonKey(name: MusicAssistantOutputProtocol.protocolDomainKey_)
    required String protocolDomain,

    /// isNative
    @Default(false)
    @JsonKey(name: MusicAssistantOutputProtocol.isNativeKey_)
    bool isNative,

    /// priority
    @Default(100)
    @JsonKey(name: MusicAssistantOutputProtocol.priorityKey_)
    int priority,

    /// available
    @Default(true)
    @JsonKey(name: MusicAssistantOutputProtocol.availableKey_)
    bool available,

    /// derivedFrom
    @JsonKey(name: MusicAssistantOutputProtocol.derivedFromKey_)
    String? derivedFrom,
  }) = _MusicAssistantOutputProtocol;

  factory MusicAssistantOutputProtocol.fromJson(Map<String, dynamic> json) =>
      _$MusicAssistantOutputProtocolFromJson(json);

  static const String outputProtocolIdKey_ = 'output_protocol_id';

  static const String nameKey_ = 'name';

  static const String protocolDomainKey_ = 'protocol_domain';

  static const String isNativeKey_ = 'is_native';

  static const String priorityKey_ = 'priority';

  static const String availableKey_ = 'available';

  static const String derivedFromKey_ = 'derived_from';
}
