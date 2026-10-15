import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:music_assistant_api/music_assistant_api.dart';

/// Starts a short-lived callback on the clock and asks Music Assistant to
/// return its OAuth session token there after Home Assistant sign-in.
class QrAuthSession {
  QrAuthSession._(
    this.qrUrl,
    this._authorizationUrl,
    this._server,
    this._sessionId,
    Completer<String> tokenCompleter,
    Completer<void> openedCompleter,
  ) : _tokenCompleter = tokenCompleter,
      token = tokenCompleter.future,
      _openedCompleter = openedCompleter,
      opened = openedCompleter.future {
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

  final String qrUrl;
  final String _authorizationUrl;
  final HttpServer _server;
  final String _sessionId;
  final Completer<String> _tokenCompleter;
  final Future<String> token;
  final Completer<void> _openedCompleter;
  final Future<void> opened;
  bool hasOpened = false;
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
      final qrUrl = Uri(
        scheme: 'http',
        host: localAddress,
        port: callbackServer.port,
        path: '/oauth/start',
        queryParameters: {'session': sessionId},
      );

      final authClient = MusicAssistantClient(
        serverUrl: serverUrl,
        token: '',
      );
      late final String authorizationUrl;
      try {
        await authClient.connectUnauthenticated();
        final providers = await authClient.auth.providers();
        final provider = providers
            .where(
              (provider) =>
                  provider.providerType == 'homeassistant' &&
                  provider.requiresRedirect,
            )
            .firstOrNull;
        if (provider == null) {
          throw const QrAuthException(
            'This Music Assistant server does not offer Home Assistant sign-in. Enable its Home Assistant authentication provider, then try again.',
          );
        }
        authorizationUrl = await authClient.auth.authorizationUrl(
          providerId: provider.providerId,
          returnUrl: returnUrl.toString(),
        );
      } finally {
        await authClient.disconnect();
      }

      return QrAuthSession._(
        qrUrl.toString(),
        authorizationUrl,
        callbackServer,
        sessionId,
        Completer<String>(),
        Completer<void>(),
      );
    } catch (_) {
      await callbackServer?.close(force: true);
      rethrow;
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
    if (!_closed &&
        request.method == 'GET' &&
        uri.path == '/oauth/start' &&
        uri.queryParameters['session'] == _sessionId) {
      hasOpened = true;
      if (!_openedCompleter.isCompleted) _openedCompleter.complete();
      request.response
        ..statusCode = HttpStatus.found
        ..headers.set(HttpHeaders.locationHeader, _authorizationUrl)
        ..headers.set(HttpHeaders.cacheControlHeader, 'no-store');
      unawaited(request.response.close());
      return;
    }
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
