import '../generated/models/music_assistant_user.dart';

/// Authentication endpoints.
class AuthResource {
  const AuthResource(this._sendCommand);

  final Future<Object?> Function(
    String command, {
    Map<String, Object?>? args,
  }) _sendCommand;

  /// Returns the account authenticated on this connection.
  Future<MusicAssistantUser> me() async {
    final response = await _sendCommand('auth/me');
    if (response is! Map) {
      throw const FormatException('The server returned invalid user data.');
    }
    return MusicAssistantUser.fromJson(Map<String, dynamic>.from(response));
  }

  /// Revokes the token used by this connection.
  Future<void> logout() async {
    await _sendCommand('auth/logout');
  }
}
