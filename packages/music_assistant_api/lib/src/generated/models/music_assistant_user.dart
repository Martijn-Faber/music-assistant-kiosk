/// The authenticated Music Assistant account.
class MusicAssistantUser {
  const MusicAssistantUser({
    required this.userId,
    required this.username,
    this.displayName,
    this.avatarUrl,
    this.role,
  });

  final String userId;
  final String username;
  final String? displayName;
  final String? avatarUrl;
  final String? role;

  factory MusicAssistantUser.fromJson(Map<String, dynamic> json) =>
      MusicAssistantUser(
        userId: json['user_id'] as String,
        username: json['username'] as String,
        displayName: json['display_name'] as String?,
        avatarUrl: json['avatar_url'] as String?,
        role: json['role'] as String?,
      );
}
