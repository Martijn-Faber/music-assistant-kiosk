/// PlayerOptionEntry
///
/// ```json
/// {
///     "properties": {
///         "key": {
///             "type": "string"
///         },
///         "name": {
///             "type": "string"
///         },
///         "type": {
///             "$ref": "#/components/schemas/PlayerOptionType"
///         },
///         "value": {
///             "oneOf": [
///                 {
///                     "type": "boolean"
///                 },
///                 {
///                     "type": "number"
///                 },
///                 {
///                     "type": "integer"
///                 },
///                 {
///                     "type": "string"
///                 }
///             ]
///         },
///         "translation_key": {
///             "type": "string",
///             "default": ""
///         }
///     },
///     "type": "object",
///     "required": [
///         "key",
///         "name",
///         "type",
///         "value"
///     ]
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_player_option_entry.freezed.dart';
part 'music_assistant_player_option_entry.g.dart';

@freezed
abstract class MusicAssistantPlayerOptionEntry
    with _$MusicAssistantPlayerOptionEntry {
  const MusicAssistantPlayerOptionEntry._();

  @jsonSerializable
  const factory MusicAssistantPlayerOptionEntry({
    /// key
    @JsonKey(name: MusicAssistantPlayerOptionEntry.keyKey_) required String key,

    /// name
    @JsonKey(name: MusicAssistantPlayerOptionEntry.nameKey_)
    required String name,

    /// type
    @JsonKey(name: MusicAssistantPlayerOptionEntry.typeKey_)
    required MusicAssistantPlayerOptionType type,

    /// value
    @JsonKey(name: MusicAssistantPlayerOptionEntry.valueKey_)
    required dynamic value,

    /// translationKey
    @Default('')
    @JsonKey(name: MusicAssistantPlayerOptionEntry.translationKeyKey_)
    String translationKey,
  }) = _MusicAssistantPlayerOptionEntry;

  factory MusicAssistantPlayerOptionEntry.fromJson(Map<String, dynamic> json) =>
      _$MusicAssistantPlayerOptionEntryFromJson(json);

  static const String keyKey_ = 'key';

  static const String nameKey_ = 'name';

  static const String typeKey_ = 'type';

  static const String valueKey_ = 'value';

  static const String translationKeyKey_ = 'translation_key';
}
