/// User
///
/// ```json
/// {
///     "properties": {
///         "user_id": {
///             "type": "string"
///         },
///         "username": {
///             "type": "string"
///         },
///         "role": {
///             "type": "string"
///         },
///         "enabled": {
///             "type": "boolean",
///             "default": true
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time"
///         },
///         "display_name": {
///             "type": "string",
///             "nullable": true
///         },
///         "avatar_url": {
///             "type": "string",
///             "nullable": true
///         },
///         "preferences": {
///             "type": "object",
///             "additionalProperties": {}
///         },
///         "provider_filter": {
///             "type": "array",
///             "items": {
///                 "type": "string"
///             }
///         },
///         "player_filter": {
///             "type": "array",
///             "items": {
///                 "type": "string"
///             }
///         }
///     },
///     "type": "object",
///     "required": [
///         "user_id",
///         "username",
///         "role"
///     ]
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_user.freezed.dart';
part 'music_assistant_user.g.dart';

@freezed
abstract class MusicAssistantUser with _$MusicAssistantUser {
  const MusicAssistantUser._();

  @jsonSerializable
  const factory MusicAssistantUser({
    /// userId
    @JsonKey(name: MusicAssistantUser.userIdKey_) required String userId,

    /// username
    @JsonKey(name: MusicAssistantUser.usernameKey_) required String username,

    /// role
    @JsonKey(name: MusicAssistantUser.roleKey_) required String role,

    /// enabled
    @Default(true) @JsonKey(name: MusicAssistantUser.enabledKey_) bool enabled,

    /// createdAt
    @JsonKey(name: MusicAssistantUser.createdAtKey_) DateTime? createdAt,

    /// displayName
    @JsonKey(name: MusicAssistantUser.displayNameKey_) String? displayName,

    /// avatarUrl
    @JsonKey(name: MusicAssistantUser.avatarUrlKey_) String? avatarUrl,

    /// preferences
    @JsonKey(name: MusicAssistantUser.preferencesKey_)
    Map<String, dynamic>? preferences,

    /// providerFilter
    @JsonKey(name: MusicAssistantUser.providerFilterKey_)
    List<String>? providerFilter,

    /// playerFilter
    @JsonKey(name: MusicAssistantUser.playerFilterKey_)
    List<String>? playerFilter,
  }) = _MusicAssistantUser;

  factory MusicAssistantUser.fromJson(Map<String, dynamic> json) =>
      _$MusicAssistantUserFromJson(json);

  static const String userIdKey_ = 'user_id';

  static const String usernameKey_ = 'username';

  static const String roleKey_ = 'role';

  static const String enabledKey_ = 'enabled';

  static const String createdAtKey_ = 'created_at';

  static const String displayNameKey_ = 'display_name';

  static const String avatarUrlKey_ = 'avatar_url';

  static const String preferencesKey_ = 'preferences';

  static const String providerFilterKey_ = 'provider_filter';

  static const String playerFilterKey_ = 'player_filter';
}
