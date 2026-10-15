import 'dart:convert';
import 'dart:io';

import 'exceptions.dart';
import 'generated/models/music_assistant_server_info_message.dart';

/// HTTP endpoints from the Music Assistant OpenAPI document.
class MusicAssistantRestClient {
  MusicAssistantRestClient({required this.serverUrl, this.token});

  final String serverUrl;
  final String? token;

  Future<MusicAssistantServerInfoMessage> getServerInfo() async {
    final response = await _request('GET', '/info');
    if (response is! Map) {
      throw const FormatException('The server returned invalid info.');
    }
    return MusicAssistantServerInfoMessage.fromJson(
      Map<String, dynamic>.from(response),
    );
  }

  Future<Map<String, dynamic>> setup({
    required String username,
    required String password,
    String? displayName,
  }) async {
    final response = await _request(
      'POST',
      '/setup',
      body: {
        'username': username,
        'password': password,
        if (displayName != null) 'display_name': displayName,
      },
    );
    if (response is! Map) {
      throw const FormatException('The server returned an invalid setup response.');
    }
    return Map<String, dynamic>.from(response);
  }

  /// Executes any Music Assistant command over its HTTP RPC endpoint.
  Future<Object?> sendCommand(
    String command, {
    Map<String, Object?>? args,
  }) => _request(
    'POST',
    '/api',
    authenticated: true,
    body: {
      'command': command,
      if (args != null) 'args': args,
    },
  );

  Future<Object?> _request(
    String method,
    String path, {
    bool authenticated = false,
    Map<String, Object?>? body,
  }) async {
    final client = HttpClient()..connectionTimeout = const Duration(seconds: 15);
    try {
      final uri = Uri.parse(serverUrl).resolve(path);
      final request = switch (method) {
        'GET' => await client.getUrl(uri),
        'POST' => await client.postUrl(uri),
        _ => throw ArgumentError.value(method, 'method'),
      };
      request.headers.set(HttpHeaders.acceptHeader, ContentType.json.mimeType);
      if (body != null) request.headers.contentType = ContentType.json;
      if (authenticated) {
        final accessToken = token;
        if (accessToken == null || accessToken.isEmpty) {
          throw StateError('An access token is required for this endpoint.');
        }
        request.headers.set(HttpHeaders.authorizationHeader, 'Bearer $accessToken');
      }
      if (body != null) request.write(jsonEncode(body));

      final response = await request.close();
      final text = await utf8.decoder.bind(response).join();
      Object? decoded;
      if (text.isNotEmpty) {
        try {
          decoded = jsonDecode(text);
        } on FormatException {
          decoded = text;
        }
      }
      if (response.statusCode < 200 || response.statusCode >= 300) {
        final message = decoded is Map && decoded['message'] is String
            ? decoded['message'] as String
            : 'Music Assistant returned HTTP ${response.statusCode}.';
        throw MusicAssistantApiException(
          message,
          code: response.statusCode,
          details: decoded,
        );
      }
      return decoded;
    } finally {
      client.close(force: true);
    }
  }
}
