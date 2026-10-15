/// PlayerSoundMode
///
/// ```json
/// {
///     "properties": {
///         "id": {
///             "type": "string"
///         },
///         "name": {
///             "type": "string"
///         },
///         "passive": {
///             "type": "boolean",
///             "default": false
///         },
///         "translation_key": {
///             "type": "string",
///             "default": ""
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "name"
///     ]
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_player_sound_mode.freezed.dart';
part 'music_assistant_player_sound_mode.g.dart';

@freezed
abstract class MusicAssistantPlayerSoundMode
    with _$MusicAssistantPlayerSoundMode {
  const MusicAssistantPlayerSoundMode._();

  @jsonSerializable
  const factory MusicAssistantPlayerSoundMode({
    /// id
    @JsonKey(name: MusicAssistantPlayerSoundMode.idKey_) required String id,

    /// name
    @JsonKey(name: MusicAssistantPlayerSoundMode.nameKey_) required String name,

    /// passive
    @Default(false)
    @JsonKey(name: MusicAssistantPlayerSoundMode.passiveKey_)
    bool passive,

    /// translationKey
    @Default('')
    @JsonKey(name: MusicAssistantPlayerSoundMode.translationKeyKey_)
    String translationKey,
  }) = _MusicAssistantPlayerSoundMode;

  factory MusicAssistantPlayerSoundMode.fromJson(Map<String, dynamic> json) =>
      _$MusicAssistantPlayerSoundModeFromJson(json);

  static const String idKey_ = 'id';

  static const String nameKey_ = 'name';

  static const String passiveKey_ = 'passive';

  static const String translationKeyKey_ = 'translation_key';
}
