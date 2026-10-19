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
  static const _clock24HourKey = 'clock_24_hour_format';
  static const _localeKey = 'app_locale';
  static const _onboardingCompleteKey = 'onboarding_complete';

  Future<bool> readOnboardingComplete() async =>
      await _storage.read(key: _onboardingCompleteKey) == 'true';

  Future<void> saveOnboardingComplete(bool complete) async {
    if (complete) {
      await _storage.write(key: _onboardingCompleteKey, value: 'true');
    } else {
      await _storage.delete(key: _onboardingCompleteKey);
    }
  }

  Future<String?> readLocale() => _storage.read(key: _localeKey);

  Future<void> saveLocale(String languageCode) =>
      _storage.write(key: _localeKey, value: languageCode);

  Future<bool?> readClock24HourFormat() async {
    final value = await _storage.read(key: _clock24HourKey);
    return switch (value) {
      'true' => true,
      'false' => false,
      _ => null,
    };
  }

  Future<void> saveClock24HourFormat(bool? value) async {
    if (value == null) {
      await _storage.delete(key: _clock24HourKey);
    } else {
      await _storage.write(key: _clock24HourKey, value: value.toString());
    }
  }

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
