import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'connection_state.dart';
import 'exceptions.dart';
import 'generated/models/music_assistant_player.dart';
import 'generated/models/music_assistant_player_queue.dart';
import 'generated/models/music_assistant_queue_item.dart';

/// WebSocket client for Music Assistant's command API.
///
/// Every server command is available through [sendCommand]. Typed convenience
/// methods can be layered over it without limiting access to new server APIs.
class MusicAssistantClient {
  MusicAssistantClient({
    required this.serverUrl,
    required this.token,
    this.requestTimeout = const Duration(seconds: 30),
  });

  final String serverUrl;
  final String token;
  final Duration requestTimeout;

  final _pending = <String, Completer<Object?>>{};
  final _eventController = StreamController<Map<String, dynamic>>.broadcast();
  final _stateController =
      StreamController<MusicAssistantConnectionState>.broadcast();

  WebSocket? _socket;
  StreamSubscription<Object?>? _socketSubscription;
  Completer<Map<String, dynamic>>? _serverInfoCompleter;
  int _requestSequence = 0;
  bool _authenticated = false;
  bool _closing = false;

  Map<String, dynamic>? serverInfo;
  Map<String, dynamic>? user;

  Stream<Map<String, dynamic>> get events => _eventController.stream;
  Stream<MusicAssistantConnectionState> get state => _stateController.stream;
  bool get isConnected => _socket != null && _authenticated;

  Future<void> connect() async {
    if (_socket != null) throw StateError('Already connected.');
    _closing = false;
    _stateController.add(MusicAssistantConnectionState.connecting);
    final socket = await WebSocket.connect(_webSocketUri(serverUrl).toString())
        .timeout(requestTimeout);
    _socket = socket;
    _serverInfoCompleter = Completer<Map<String, dynamic>>();
    _socketSubscription = socket.listen(
      _handleFrame,
      onError: (Object error) => _handleSocketError(error),
      onDone: _handleSocketClosed,
      cancelOnError: false,
    );

    try {
      serverInfo = await _serverInfoCompleter!.future.timeout(requestTimeout);
      final authResult = await _sendCommand(
        'auth',
        args: {'token': token},
        allowUnauthenticated: true,
      );
      if (authResult is! Map || authResult['authenticated'] != true) {
        throw const MusicAssistantApiException('Authentication failed.');
      }
      user = authResult['user'] is Map
          ? Map<String, dynamic>.from(authResult['user'] as Map)
          : null;
      _authenticated = true;
      _stateController.add(MusicAssistantConnectionState.connected);
    } catch (_) {
      await disconnect();
      rethrow;
    }
  }

  /// Sends any Music Assistant WebSocket command, including commands added by
  /// server providers after this package version was released.
  Future<Object?> sendCommand(
    String command, {
    Map<String, Object?>? args,
  }) => _sendCommand(command, args: args);

  /// Fetches a player and its current state by its Music Assistant player ID.
  Future<MusicAssistantPlayer> getPlayer(String playerId) async {
    final response = await sendCommand(
      'players/get',
      args: {'player_id': playerId},
    );
    if (response is! Map) {
      throw const FormatException('The server returned invalid player data.');
    }
    return MusicAssistantPlayer.fromJson(Map<String, dynamic>.from(response));
  }

  /// Fetches all players and their current states.
  Future<List<MusicAssistantPlayer>> getPlayers() async {
    final response = await sendCommand('players/all');
    if (response is! List) {
      throw const FormatException('The server returned invalid player data.');
    }
    return response
        .whereType<Map>()
        .map(
          (player) => MusicAssistantPlayer.fromJson(
            Map<String, dynamic>.from(player),
          ),
        )
        .toList(growable: false);
  }

  /// Fetches the active queue for a player.
  Future<MusicAssistantPlayerQueue> getActiveQueue(String playerId) async {
    final queueResponse = await sendCommand(
      'player_queues/get_active_queue',
      args: {'player_id': playerId},
    );
    if (queueResponse == null) {
      return MusicAssistantPlayerQueue(
        queueId: playerId,
        displayName: playerId,
        currentIndex: null,
      );
    }
    if (queueResponse is! Map) {
      throw const FormatException('The server returned invalid queue data.');
    }
    return MusicAssistantPlayerQueue.fromJson(
      Map<String, dynamic>.from(queueResponse),
    );
  }

  /// Fetches a page of items from a queue.
  Future<List<MusicAssistantQueueItem>> getQueueItems(
    String queueId, {
    int limit = 500,
    int offset = 0,
  }) async {
    final itemsResponse = await sendCommand(
      'player_queues/items',
      args: {'queue_id': queueId, 'limit': limit, 'offset': offset},
    );
    if (itemsResponse != null && itemsResponse is! List) {
      throw const FormatException('The server returned invalid queue items.');
    }
    return (itemsResponse as List? ?? const [])
        .whereType<Map>()
        .map((item) => MusicAssistantQueueItem.fromJson(
              Map<String, dynamic>.from(item),
            ))
        .toList(growable: false);
  }

  Future<Object?> _sendCommand(
    String command, {
    Map<String, Object?>? args,
    bool allowUnauthenticated = false,
  }) async {
    if (_socket == null || (!_authenticated && !allowUnauthenticated)) {
      throw StateError('Connect and authenticate before sending commands.');
    }

    final messageId =
        '${DateTime.now().microsecondsSinceEpoch}-${_requestSequence++}';
    final completer = Completer<Object?>();
    _pending[messageId] = completer;
    final message = <String, Object?>{
      'message_id': messageId,
      'command': command,
      if (args != null) 'args': args,
    };

    try {
      _socket!.add(jsonEncode(message));
      return await completer.future.timeout(requestTimeout);
    } on TimeoutException {
      throw TimeoutException('Music Assistant command timed out: $command');
    } finally {
      _pending.remove(messageId);
    }
  }

  Future<void> disconnect() async {
    _closing = true;
    _authenticated = false;
    for (final completer in _pending.values) {
      if (!completer.isCompleted) {
        completer.completeError(StateError('Disconnected from Music Assistant.'));
      }
    }
    _pending.clear();
    final subscription = _socketSubscription;
    _socketSubscription = null;
    await subscription?.cancel();
    final socket = _socket;
    _socket = null;
    await socket?.close();
    _stateController.add(MusicAssistantConnectionState.disconnected);
  }

  Future<void> dispose() async {
    await disconnect();
    await _eventController.close();
    await _stateController.close();
  }

  void _handleFrame(Object? frame) {
    try {
      final Object? decoded = jsonDecode(switch (frame) {
        String value => value,
        List<int> bytes => utf8.decode(bytes),
        _ => throw const FormatException('Unsupported WebSocket frame.'),
      });
      if (decoded is! Map) return;
      final data = Map<String, dynamic>.from(decoded);

      if (data['event'] is String) {
        _eventController.add(data);
        return;
      }
      if (data['server_id'] is String && data['message_id'] == null) {
        final info = _serverInfoCompleter;
        if (info != null && !info.isCompleted) {
          info.complete(data);
        }
        return;
      }

      final messageId = data['message_id'];
      if (messageId is! String) return;
      final completer = _pending.remove(messageId);
      if (completer == null || completer.isCompleted) return;

      if (data.containsKey('error') || data.containsKey('error_code')) {
        final error = data['error'];
        final message = error is Map && error['message'] is String
            ? error['message'] as String
            : data['details'] is String
            ? data['details'] as String
            : 'Music Assistant rejected the command.';
        completer.completeError(
          MusicAssistantApiException(
            message,
            code: data['error_code'] is int ? data['error_code'] as int : null,
            details: error ?? data['details'],
          ),
        );
      } else if (data.containsKey('result')) {
        completer.complete(data['result']);
      } else {
        completer.completeError(
          const MusicAssistantApiException('Invalid command response.'),
        );
      }
    } catch (error, stackTrace) {
      _eventController.addError(error, stackTrace);
    }
  }

  void _handleSocketError(Object error) {
    _failPending(error);
  }

  void _handleSocketClosed() {
    _authenticated = false;
    _socket = null;
    _failPending(StateError('Music Assistant WebSocket closed.'));
    if (!_closing) {
      _stateController.add(MusicAssistantConnectionState.disconnected);
    }
  }

  void _failPending(Object error, [StackTrace? stackTrace]) {
    for (final completer in _pending.values) {
      if (!completer.isCompleted) completer.completeError(error, stackTrace);
    }
    _pending.clear();
  }

  static Uri _webSocketUri(String serverUrl) {
    final uri = Uri.parse(serverUrl);
    final scheme = switch (uri.scheme) {
      'http' => 'ws',
      'https' => 'wss',
      'ws' || 'wss' => uri.scheme,
      _ => throw ArgumentError.value(serverUrl, 'serverUrl', 'Expected an http(s) URL.'),
    };
    final basePath = uri.path.replaceFirst(RegExp(r'/+$'), '');
    final path = basePath.endsWith('/ws') ? basePath : '$basePath/ws';
    return uri.replace(scheme: scheme, path: path);
  }
}
