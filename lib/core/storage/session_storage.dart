import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SavedSession {
  const SavedSession({
    required this.serverUrl,
    required this.token,
    this.selectedPlayerId,
  });

  final String serverUrl;
  final String token;
  final String? selectedPlayerId;
}

class SessionStorage {
  static const _storage = FlutterSecureStorage();
  static const _serverKey = 'music_assistant_server';
  static const _tokenKey = 'music_assistant_token';
  static const _playerKey = 'music_assistant_player';

  Future<SavedSession?> readSession() async {
    final serverUrl = await _storage.read(key: _serverKey);
    final token = await _storage.read(key: _tokenKey);
    if (serverUrl == null || token == null) return null;

    return SavedSession(
      serverUrl: serverUrl,
      token: token,
      selectedPlayerId: await _storage.read(key: _playerKey),
    );
  }

  Future<String?> readSelectedPlayerId() => _storage.read(key: _playerKey);

  Future<void> saveCredentials({
    required String serverUrl,
    required String token,
  }) async {
    await _storage.write(key: _serverKey, value: serverUrl);
    await _storage.write(key: _tokenKey, value: token);
  }

  Future<void> saveSelectedPlayerId(String? playerId) =>
      _storage.write(key: _playerKey, value: playerId);

  Future<void> clearCredentials() async {
    await _storage.delete(key: _serverKey);
    await _storage.delete(key: _tokenKey);
  }
}
