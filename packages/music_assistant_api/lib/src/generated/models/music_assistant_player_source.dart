/// PlayerSource
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
///         "can_play_pause": {
///             "type": "boolean",
///             "default": false
///         },
///         "can_seek": {
///             "type": "boolean",
///             "default": false
///         },
///         "can_next_previous": {
///             "type": "boolean",
///             "default": false
///         },
///         "can_shuffle": {
///             "type": "boolean",
///             "default": false
///         },
///         "can_repeat": {
///             "type": "boolean",
///             "default": false
///         },
///         "shuffle_enabled": {
///             "type": "boolean",
///             "nullable": true
///         },
///         "repeat_mode": {
///             "$ref": "#/components/schemas/RepeatMode",
///             "nullable": true
///         },
///         "account_id": {
///             "type": "string",
///             "nullable": true
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
part 'music_assistant_player_source.freezed.dart';
part 'music_assistant_player_source.g.dart';

@freezed
abstract class MusicAssistantPlayerSource with _$MusicAssistantPlayerSource {
  const MusicAssistantPlayerSource._();

  @jsonSerializable
  const factory MusicAssistantPlayerSource({
    /// id
    @JsonKey(name: MusicAssistantPlayerSource.idKey_) required String id,

    /// name
    @JsonKey(name: MusicAssistantPlayerSource.nameKey_) required String name,

    /// passive
    @Default(false)
    @JsonKey(name: MusicAssistantPlayerSource.passiveKey_)
    bool passive,

    /// canPlayPause
    @Default(false)
    @JsonKey(name: MusicAssistantPlayerSource.canPlayPauseKey_)
    bool canPlayPause,

    /// canSeek
    @Default(false)
    @JsonKey(name: MusicAssistantPlayerSource.canSeekKey_)
    bool canSeek,

    /// canNextPrevious
    @Default(false)
    @JsonKey(name: MusicAssistantPlayerSource.canNextPreviousKey_)
    bool canNextPrevious,

    /// canShuffle
    @Default(false)
    @JsonKey(name: MusicAssistantPlayerSource.canShuffleKey_)
    bool canShuffle,

    /// canRepeat
    @Default(false)
    @JsonKey(name: MusicAssistantPlayerSource.canRepeatKey_)
    bool canRepeat,

    /// shuffleEnabled
    @JsonKey(name: MusicAssistantPlayerSource.shuffleEnabledKey_)
    bool? shuffleEnabled,

    /// repeatMode
    @JsonKey(name: MusicAssistantPlayerSource.repeatModeKey_)
    MusicAssistantRepeatMode? repeatMode,

    /// accountId
    @JsonKey(name: MusicAssistantPlayerSource.accountIdKey_) String? accountId,
  }) = _MusicAssistantPlayerSource;

  factory MusicAssistantPlayerSource.fromJson(Map<String, dynamic> json) =>
      _$MusicAssistantPlayerSourceFromJson(json);

  static const String idKey_ = 'id';

  static const String nameKey_ = 'name';

  static const String passiveKey_ = 'passive';

  static const String canPlayPauseKey_ = 'can_play_pause';

  static const String canSeekKey_ = 'can_seek';

  static const String canNextPreviousKey_ = 'can_next_previous';

  static const String canShuffleKey_ = 'can_shuffle';

  static const String canRepeatKey_ = 'can_repeat';

  static const String shuffleEnabledKey_ = 'shuffle_enabled';

  static const String repeatModeKey_ = 'repeat_mode';

  static const String accountIdKey_ = 'account_id';
}
