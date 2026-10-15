/// PlayerOption
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
///         "translation_key": {
///             "type": "string",
///             "default": ""
///         },
///         "translation_params": {
///             "type": "array",
///             "items": {
///                 "type": "string"
///             },
///             "nullable": true
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
///         "read_only": {
///             "type": "boolean",
///             "default": false
///         },
///         "min_value": {
///             "type": "number",
///             "nullable": true
///         },
///         "max_value": {
///             "type": "number",
///             "nullable": true
///         },
///         "step": {
///             "type": "number",
///             "nullable": true
///         },
///         "options": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/PlayerOptionEntry"
///             },
///             "nullable": true
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
part 'music_assistant_player_option.freezed.dart';
part 'music_assistant_player_option.g.dart';

@freezed
abstract class MusicAssistantPlayerOption with _$MusicAssistantPlayerOption {
  const MusicAssistantPlayerOption._();

  @jsonSerializable
  const factory MusicAssistantPlayerOption({
    /// key
    @JsonKey(name: MusicAssistantPlayerOption.keyKey_) required String key,

    /// name
    @JsonKey(name: MusicAssistantPlayerOption.nameKey_) required String name,

    /// type
    @JsonKey(name: MusicAssistantPlayerOption.typeKey_)
    required MusicAssistantPlayerOptionType type,

    /// translationKey
    @Default('')
    @JsonKey(name: MusicAssistantPlayerOption.translationKeyKey_)
    String translationKey,

    /// translationParams
    @JsonKey(name: MusicAssistantPlayerOption.translationParamsKey_)
    List<String>? translationParams,

    /// value
    @JsonKey(name: MusicAssistantPlayerOption.valueKey_) required dynamic value,

    /// readOnly
    @Default(false)
    @JsonKey(name: MusicAssistantPlayerOption.readOnlyKey_)
    bool readOnly,

    /// minValue
    @JsonKey(name: MusicAssistantPlayerOption.minValueKey_) double? minValue,

    /// maxValue
    @JsonKey(name: MusicAssistantPlayerOption.maxValueKey_) double? maxValue,

    /// step
    @JsonKey(name: MusicAssistantPlayerOption.stepKey_) double? step,

    /// options
    @JsonKey(name: MusicAssistantPlayerOption.optionsKey_)
    List<MusicAssistantPlayerOptionEntry>? options,
  }) = _MusicAssistantPlayerOption;

  factory MusicAssistantPlayerOption.fromJson(Map<String, dynamic> json) =>
      _$MusicAssistantPlayerOptionFromJson(json);

  static const String keyKey_ = 'key';

  static const String nameKey_ = 'name';

  static const String typeKey_ = 'type';

  static const String translationKeyKey_ = 'translation_key';

  static const String translationParamsKey_ = 'translation_params';

  static const String valueKey_ = 'value';

  static const String readOnlyKey_ = 'read_only';

  static const String minValueKey_ = 'min_value';

  static const String maxValueKey_ = 'max_value';

  static const String stepKey_ = 'step';

  static const String optionsKey_ = 'options';
}
