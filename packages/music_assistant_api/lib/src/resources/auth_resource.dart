import '../generated/models/music_assistant_user.dart';
import '../generated/models/music_assistant_login_result.dart';

/// Authentication endpoints.
class AuthResource {
  const AuthResource(this._sendCommand, this._sendUnauthenticatedCommand);

  final Future<Object?> Function(
    String command, {
    Map<String, Object?>? args,
  }) _sendCommand;
  final Future<Object?> Function(
    String command, {
    Map<String, Object?>? args,
  }) _sendUnauthenticatedCommand;

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

  /// Starts an OAuth sign-in flow without authenticating the WebSocket first.
  Future<String> authorizationUrl({
    required String providerId,
    required String returnUrl,
  }) async {
    final response = await _sendUnauthenticatedCommand(
      'auth/authorization_url',
      args: {'provider_id': providerId, 'return_url': returnUrl},
    );
    final url = response is Map ? response['authorization_url'] : null;
    if (url is! String || url.isEmpty) {
      throw const FormatException(
        'The server returned an invalid authorization URL.',
      );
    }
    return url;
  }

  /// Authenticates with a provider without authenticating the WebSocket first.
  Future<MusicAssistantLoginResult> login({
    String? providerId,
    required String username,
    required String password,
  }) async {
    final response = await _sendUnauthenticatedCommand(
      'auth/login',
      args: {
        if (providerId != null) 'provider_id': providerId,
        'credentials': {'username': username, 'password': password},
      },
    );
    if (response is! Map) {
      throw const FormatException('The server returned an invalid login response.');
    }
    return MusicAssistantLoginResult.fromJson(
      Map<String, dynamic>.from(response),
    );
  }
}
