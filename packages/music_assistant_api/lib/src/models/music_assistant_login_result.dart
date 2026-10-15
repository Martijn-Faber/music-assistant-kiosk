import '../generated/models/music_assistant_user.dart';

/// Result returned after authenticating with a username and password.
class MusicAssistantLoginResult {
  const MusicAssistantLoginResult({required this.token, required this.user});

  final String token;
  final MusicAssistantUser user;

  factory MusicAssistantLoginResult.fromJson(Map<String, dynamic> json) {
    final rawUser = json['user'];
    if (rawUser is! Map) {
      throw const FormatException('The server returned invalid login user data.');
    }
    return MusicAssistantLoginResult(
      token: json['token'] as String,
      user: MusicAssistantUser.fromJson(Map<String, dynamic>.from(rawUser)),
    );
  }
}
