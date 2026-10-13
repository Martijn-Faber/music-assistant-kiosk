import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

/// Starts a short-lived callback on the clock and asks Music Assistant to
/// return its OAuth session token there after Home Assistant sign-in.
class QrAuthSession {
  QrAuthSession._(
    this.authorizationUrl,
    this._server,
    this._sessionId,
    Completer<String> tokenCompleter,
  ) : _tokenCompleter = tokenCompleter,
      token = tokenCompleter.future {
    unawaited(token.then<void>((_) {}, onError: (Object _, StackTrace __) {}));
    _server.listen(_handleRequest);
    _expiry = Timer(const Duration(minutes: 10), () {
      if (!_tokenCompleter.isCompleted) {
        _tokenCompleter.completeError(
          TimeoutException('Sign-in expired. Please scan a new QR code.'),
        );
      }
      unawaited(close());
    });
  }

  final String authorizationUrl;
  final HttpServer _server;
  final String _sessionId;
  final Completer<String> _tokenCompleter;
  final Future<String> token;
  late final Timer _expiry;
  bool _closed = false;

  static Future<QrAuthSession> start(String serverUrl) async {
    HttpServer? callbackServer;
    try {
      callbackServer = await HttpServer.bind(InternetAddress.anyIPv4, 0);
      final localAddress = await _findLocalIpv4();
      final sessionId = _secureRandomToken();
      final returnUrl = Uri(
        scheme: 'http',
        host: localAddress,
        port: callbackServer.port,
        path: '/oauth/callback',
        queryParameters: {'session': sessionId},
      );

      final providers = await _sendPublicCommand(serverUrl, 'auth/providers');
      if (providers is! List) {
        throw const FormatException('Music Assistant returned invalid login providers.');
      }
      final provider = providers.whereType<Map>().firstWhere(
        (entry) {
          final providerId = '${entry['provider_id'] ?? ''}'
              .toLowerCase()
              .replaceAll(RegExp('[^a-z]'), '');
          final providerType = '${entry['provider_type'] ?? ''}'
              .toLowerCase()
              .replaceAll(RegExp('[^a-z]'), '');
          return entry['requires_redirect'] == true &&
              (providerId.contains('homeassistant') ||
                  providerType.contains('homeassistant') ||
                  providerType == 'hass');
        },
        orElse: () => const <String, dynamic>{},
      );
      final providerId = provider['provider_id'];
      if (providerId is! String) {
        throw const QrAuthException(
          'This Music Assistant server does not offer Home Assistant sign-in. Enable its Home Assistant authentication provider, then try again.',
        );
      }

      final result = await _sendPublicCommand(
        serverUrl,
        'auth/authorization_url',
        args: {'provider_id': providerId, 'return_url': returnUrl.toString()},
      );
      final authorizationUrl = result is Map
          ? result['authorization_url']
          : null;
      if (authorizationUrl is! String || authorizationUrl.isEmpty) {
        throw const QrAuthException(
          'Music Assistant could not start Home Assistant sign-in.',
        );
      }

      return QrAuthSession._(
        authorizationUrl,
        callbackServer,
        sessionId,
        Completer<String>(),
      );
    } catch (_) {
      await callbackServer?.close(force: true);
      rethrow;
    }
  }

  static Future<dynamic> _sendPublicCommand(
    String serverUrl,
    String command, {
    Map<String, dynamic>? args,
  }) async {
    final client = HttpClient()..connectionTimeout = const Duration(seconds: 12);
    try {
      final request = await client.postUrl(Uri.parse(serverUrl).resolve('/api'));
      request.headers.contentType = ContentType.json;
      request.write(
        jsonEncode({
          'message_id': _secureRandomToken(),
          'command': command,
          if (args != null) 'args': args,
        }),
      );
      final response = await request.close();
      final body = await utf8.decoder.bind(response).join();
      if (response.statusCode != HttpStatus.ok) {
        throw QrAuthException(
          'Music Assistant rejected the sign-in request (HTTP ${response.statusCode}).',
        );
      }
      final decoded = jsonDecode(body);
      if (decoded is Map && decoded['error'] != null) {
        final error = decoded['error'];
        throw QrAuthException(
          error is Map && error['message'] is String
              ? error['message'] as String
              : error is String
              ? error
              : 'Music Assistant could not start sign-in.',
        );
      }
      return decoded;
    } on SocketException catch (error) {
      throw QrAuthException('Could not reach Music Assistant: ${error.message}');
    } finally {
      client.close(force: true);
    }
  }

  static String _secureRandomToken() {
    final random = Random.secure();
    return base64Url.encode(List<int>.generate(32, (_) => random.nextInt(256)));
  }

  static Future<String> _findLocalIpv4() async {
    final interfaces = await NetworkInterface.list(
      type: InternetAddressType.IPv4,
      includeLoopback: false,
      includeLinkLocal: false,
    );
    for (final interface in interfaces) {
      for (final address in interface.addresses) {
        final parts = address.address.split('.').map(int.tryParse).toList();
        final isPrivate = parts.length == 4 &&
            parts.every((part) => part != null) &&
            (parts[0] == 10 ||
                (parts[0] == 172 && parts[1]! >= 16 && parts[1]! <= 31) ||
                (parts[0] == 192 && parts[1] == 168));
        if (isPrivate && !address.isLoopback && !address.isLinkLocal) {
          return address.address;
        }
      }
    }
    throw const QrAuthException(
      'The clock is not connected to a local network that your phone can reach.',
    );
  }

  void _handleRequest(HttpRequest request) {
    final uri = request.uri;
    if (_closed ||
        request.method != 'GET' ||
        uri.path != '/oauth/callback' ||
        uri.queryParameters['session'] != _sessionId) {
      request.response
        ..statusCode = HttpStatus.notFound
        ..write('This sign-in link is no longer valid. Return to the clock and scan again.');
      unawaited(request.response.close());
      return;
    }

    final error = uri.queryParameters['error'];
    final returnedToken = uri.queryParameters['code'];
    final receivedToken = error == null && returnedToken != null && returnedToken.isNotEmpty;
    final response = request.response
      ..headers.contentType = ContentType.html
      ..headers.set(HttpHeaders.cacheControlHeader, 'no-store, no-cache, must-revalidate')
      ..headers.set('Referrer-Policy', 'no-referrer');
    if (error != null) {
      response
        ..statusCode = HttpStatus.badRequest
        ..write(_callbackPage('Sign-in was cancelled. You can close this page.'));
      if (!_tokenCompleter.isCompleted) {
        _tokenCompleter.completeError(QrAuthException('Home Assistant sign-in was cancelled.'));
      }
    } else if (returnedToken == null || returnedToken.isEmpty) {
      response
        ..statusCode = HttpStatus.badRequest
        ..write(_callbackPage('Music Assistant did not return a sign-in token.'));
      if (!_tokenCompleter.isCompleted) {
        _tokenCompleter.completeError(
          const QrAuthException('Music Assistant did not return a sign-in token.'),
        );
      }
    } else {
      response.write(_callbackPage('Connected. You can return to the clock.'));
      if (!_tokenCompleter.isCompleted) _tokenCompleter.complete(returnedToken);
    }
    unawaited(response.close().whenComplete(() {
      if (receivedToken) unawaited(close());
    }));
  }

  static String _callbackPage(String message) => '''<!doctype html>
<html><head><meta name="viewport" content="width=device-width,initial-scale=1">
<meta name="referrer" content="no-referrer"><title>Music Assistant</title></head>
<body style="font:16px system-ui;background:#090d12;color:#fff;display:grid;place-items:center;min-height:90vh;text-align:center">
<main><h2>$message</h2><p>This page can now be closed.</p></main>
<script>history.replaceState(null, '', location.pathname);</script></body></html>''';

  Future<void> close() async {
    if (_closed) return;
    _closed = true;
    _expiry.cancel();
    if (!_tokenCompleter.isCompleted) {
      _tokenCompleter.completeError(StateError('Sign-in was cancelled.'));
    }
    await _server.close(force: true);
  }
}

class QrAuthException implements Exception {
  const QrAuthException(this.message);
  final String message;
  @override
  String toString() => message;
}
