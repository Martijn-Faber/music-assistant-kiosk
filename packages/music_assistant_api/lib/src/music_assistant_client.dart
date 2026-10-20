import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'connection_state.dart';
import 'resources/auth_resource.dart';
import 'exceptions.dart';
import 'events.dart';
import 'extra_attribute_value.dart';
import 'generated/models/music_assistant_player.dart';
import 'generated/models/music_assistant_player_queue.dart';
import 'generated/models/music_assistant_queue_item.dart';
import 'resources/music_resource.dart';
import 'resources/players_resource.dart';

/// The active queue and its typed items fetched together for app presentation.
class MusicAssistantQueueSnapshot {
  const MusicAssistantQueueSnapshot({
    required this.queue,
    required this.items,
    required this.queueExtraAttributes,
    required this.itemExtraAttributesByQueueItemId,
    required this.albumByQueueItemId,
  });

  final MusicAssistantPlayerQueue queue;
  final List<MusicAssistantQueueItem> items;
  final MusicAssistantExtraAttributes queueExtraAttributes;

  /// Extra attributes keyed by queue item ID, including current/next summaries.
  final Map<String, MusicAssistantExtraAttributes>
  itemExtraAttributesByQueueItemId;
  final Map<String, MusicAssistantAlbumOrItemMapping> albumByQueueItemId;
}

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

  late final MusicResource music = MusicResource(sendCommand);
  late final AuthResource auth = AuthResource(
    sendCommand,
    sendUnauthenticatedCommand,
  );
  late final PlayersResource players = PlayersResource(
    all: _getPlayers,
    get: _getPlayer,
    setVolume: _setPlayerVolume,
    setGroupVolume: _setGroupVolume,
    groupVolumeUp: _groupVolumeUp,
    groupVolumeDown: _groupVolumeDown,
    subscribeToChanges: _subscribeToPlayerChanges,
  );

  final _pending = <String, Completer<Object?>>{};
  final _eventController = StreamController<MusicAssistantEvent>.broadcast();
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

  /// Events received from the server, with a typed envelope and raw payload.
  Stream<MusicAssistantEvent> get events => _eventController.stream;
  Stream<MusicAssistantConnectionState> get state => _stateController.stream;
  bool get isConnected => _socket != null && _authenticated;

  /// Listens to server events, optionally filtered by type or object ID.
  /// Returns a callback that cancels this subscription.
  void Function() subscribe(
    void Function(MusicAssistantEvent event) callback, {
    Set<MusicAssistantEventType>? eventTypes,
    Set<String>? objectIds,
  }) {
    final subscription = _eventController.stream.listen((event) {
      if (eventTypes != null && !eventTypes.contains(event.type)) return;
      if (objectIds != null && !objectIds.contains(event.objectId)) return;
      callback(event);
    });
    return () => subscription.cancel();
  }

  /// Listens for favorite-state changes for the media item identified by [uri].
  void Function() subscribeToMediaItemUpdates({
    required String uri,
    required void Function(MusicAssistantMediaItemUpdate update) onUpdated,
  }) => subscribe(
    (event) {
      final update = MusicAssistantMediaItemUpdate.fromEvent(event);
      if (update != null && update.uri == uri) onUpdated(update);
    },
    eventTypes: const {MusicAssistantEventType.mediaItemUpdated},
  );

  /// Listens for player additions, updates, and removals using SDK models.
  void Function() _subscribeToPlayerChanges({
    required void Function(MusicAssistantPlayer player) onChanged,
    required void Function(String playerId) onRemoved,
  }) => subscribe(
    (event) {
      if (event.type == MusicAssistantEventType.playerRemoved) {
        final playerId = event.objectId;
        if (playerId != null) onRemoved(playerId);
        return;
      }

      final data = event.data;
      if (data is! Map) return;
      final playerData = Map<String, dynamic>.from(data);
      final playerId = event.objectId ?? playerData['player_id'];
      if (playerId is! String) return;
      playerData['player_id'] = playerId;
      playerData['playback_state'] ??= playerData['state'];
      playerData['name'] ??= playerData['display_name'];
      playerData['group_members'] ??= playerData['group_childs'];
      playerData['extra_attributes'] ??= playerData['extra_data'];
      if (playerData['name'] is! String) playerData['name'] = playerId;

      try {
        onChanged(MusicAssistantPlayer.fromJson(playerData));
      } on Object {
        // Ignore malformed event payloads; a later player fetch can recover.
      }
    },
    eventTypes: {
      MusicAssistantEventType.playerAdded,
      MusicAssistantEventType.playerUpdated,
      MusicAssistantEventType.playerRemoved,
    },
  );

  Future<void> connect() => _connect(authenticate: true);

  /// Opens the WebSocket without sending an authentication command.
  Future<void> connectUnauthenticated() => _connect(authenticate: false);

  Future<void> _connect({required bool authenticate}) async {
    if (_socket != null) throw StateError('Already connected.');
    _closing = false;
    _stateController.add(MusicAssistantConnectionState.connecting);
    final socket = await WebSocket.connect(
      _webSocketUri(serverUrl).toString(),
    ).timeout(requestTimeout);
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
      if (authenticate) {
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
      }
      _stateController.add(MusicAssistantConnectionState.connected);
    } catch (_) {
      await disconnect();
      rethrow;
    }
  }

  /// Sends any Music Assistant WebSocket command, including commands added by
  /// server providers after this package version was released.
  Future<Object?> sendCommand(String command, {Map<String, Object?>? args}) =>
      _sendCommand(command, args: args);

  /// Sends an unauthenticated command over an open WebSocket connection.
  Future<Object?> sendUnauthenticatedCommand(
    String command, {
    Map<String, Object?>? args,
  }) => _sendCommand(command, args: args, allowUnauthenticated: true);

  /// Fetches a player and its current state by its Music Assistant player ID.
  Future<MusicAssistantPlayer> _getPlayer(String playerId) async {
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
  Future<List<MusicAssistantPlayer>> _getPlayers() async {
    final response = await sendCommand('players/all');
    if (response is! List) {
      throw const FormatException('The server returned invalid player data.');
    }
    return response
        .whereType<Map>()
        .map(
          (player) =>
              MusicAssistantPlayer.fromJson(Map<String, dynamic>.from(player)),
        )
        .toList(growable: false);
  }

  /// Sets the volume of an individual player.
  Future<void> _setPlayerVolume(String playerId, int volumeLevel) async {
    await sendCommand(
      'players/cmd/volume_set',
      args: {'player_id': playerId, 'volume_level': volumeLevel},
    );
  }

  /// Sets the shared volume of a player group.
  Future<void> _setGroupVolume(String playerId, int volumeLevel) async {
    await sendCommand(
      'players/cmd/group_volume',
      args: {'player_id': playerId, 'volume_level': volumeLevel},
    );
  }

  /// Increases the shared volume of a player group.
  Future<void> _groupVolumeUp(String playerId) async {
    await sendCommand(
      'players/cmd/group_volume_up',
      args: {'player_id': playerId},
    );
  }

  /// Decreases the shared volume of a player group.
  Future<void> _groupVolumeDown(String playerId) async {
    await sendCommand(
      'players/cmd/group_volume_down',
      args: {'player_id': playerId},
    );
  }

  /// Adds one or more players to an existing group player.
  Future<void> groupMany(String playerId, List<String> childPlayerIds) async {
    await sendCommand(
      'players/cmd/group_many',
      args: {'target_player': playerId, 'child_player_ids': childPlayerIds},
    );
  }

  /// Removes a player from its current sync group, if it belongs to one.
  Future<void> ungroupPlayer(String playerId) async {
    await sendCommand(
      'players/cmd/ungroup',
      args: {'player_id': playerId},
    );
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
        active: false,
        displayName: playerId,
        available: false,
        items: 0,
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
        .map(
          (item) =>
              MusicAssistantQueueItem.fromJson(Map<String, dynamic>.from(item)),
        )
        .toList(growable: false);
  }

  /// Fetches the active queue and its items as generated, typed models.
  Future<MusicAssistantQueueSnapshot> getActiveQueueSnapshot(
    String playerId, {
    int limit = 500,
  }) async {
    late final MusicAssistantPlayerQueue queue;
    late final MusicAssistantExtraAttributes queueExtraAttributes;
    final itemAttributesById = <String, MusicAssistantExtraAttributes>{};
    final albumsById = <String, MusicAssistantAlbumOrItemMapping>{};
    try {
      final queueResponse = await sendCommand(
        'player_queues/get_active_queue',
        args: {'player_id': playerId},
      );
      if (queueResponse == null) {
        queue = MusicAssistantPlayerQueue(
          queueId: playerId,
          active: false,
          displayName: playerId,
          available: false,
          items: 0,
          currentIndex: null,
        );
        queueExtraAttributes = const {};
      } else {
        if (queueResponse is! Map) {
          throw const FormatException(
            'The server returned invalid queue data.',
          );
        }
        final queueData = Map<String, dynamic>.from(queueResponse);
        queueExtraAttributes = _takeExtraAttributes(queueData);
        for (final key in ['current_item', 'next_item']) {
          final item = queueData[key];
          if (item is Map) {
            final itemData = Map<String, dynamic>.from(item);
            _prepareQueueItem(itemData, itemAttributesById, albumsById);
            queueData[key] = itemData;
          }
        }
        queue = MusicAssistantPlayerQueue.fromJson(queueData);
      }
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        FormatException('Failed to decode the active queue: $error'),
        stackTrace,
      );
    }
    late final List<MusicAssistantQueueItem> items;
    try {
      final itemsResponse = await sendCommand(
        'player_queues/items',
        args: {'queue_id': queue.queueId, 'limit': limit, 'offset': 0},
      );
      if (itemsResponse != null && itemsResponse is! List) {
        throw const FormatException('The server returned invalid queue items.');
      }
      final decodedItems = <MusicAssistantQueueItem>[];
      for (final value in itemsResponse as List? ?? const []) {
        if (value is! Map) continue;
        final itemData = Map<String, dynamic>.from(value);
        _prepareQueueItem(itemData, itemAttributesById, albumsById);
        decodedItems.add(MusicAssistantQueueItem.fromJson(itemData));
      }
      items = List.unmodifiable(decodedItems);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        FormatException(
          'Failed to load queue items for ${queue.queueId}: $error',
        ),
        stackTrace,
      );
    }
    return MusicAssistantQueueSnapshot(
      queue: queue,
      items: items,
      queueExtraAttributes: queueExtraAttributes,
      itemExtraAttributesByQueueItemId: Map.unmodifiable(itemAttributesById),
      albumByQueueItemId: Map.unmodifiable(albumsById),
    );
  }

  void _prepareQueueItem(
    Map<String, dynamic> itemData,
    Map<String, MusicAssistantExtraAttributes> extraAttributesById,
    Map<String, MusicAssistantAlbumOrItemMapping> albumsById,
  ) {
    // The Python QueueItem model intentionally compacts nested Track albums
    // to ItemMapping to reduce queue payload size. OpenAPI types Track.album
    // as a full Album, so preserve the compact mapping separately and omit it
    // only from the generated model's decode input.
    final attributes = _takeExtraAttributes(itemData);
    final itemId = itemData['queue_item_id'];
    if (attributes.isNotEmpty && itemId is String) {
      extraAttributesById[itemId] = attributes;
    }

    final rawMediaItem = itemData['media_item'];
    if (rawMediaItem is! Map) return;
    final mediaItem = Map<String, dynamic>.from(rawMediaItem);
    final rawAlbum = mediaItem['album'];
    if (rawAlbum is! Map) return;

    final album = Map<String, dynamic>.from(rawAlbum);
    final parsedAlbum = MusicAssistantAlbumOrItemMapping.fromJson(album);
    // A full Album is valid for the generated Track model. Only lift the
    // compact ItemMapping form, which that generated field cannot represent.
    if (album['provider_mappings'] is! List) {
      mediaItem.remove('album');
      itemData['media_item'] = mediaItem;
    }
    if (itemId is String) albumsById[itemId] = parsedAlbum;
  }

  MusicAssistantExtraAttributes _takeExtraAttributes(
    Map<String, dynamic> modelData,
  ) {
    // The server's OpenAPI schema says these map values are strings, but the
    // shared Python models define EXTRA_ATTRIBUTES_TYPES as str | int | float
    // | bool | None. Extract them before generated decoding so valid values
    // such as booleans are retained without changing the OpenAPI spec or
    // generated models.
    final raw = modelData.remove('extra_attributes');
    if (raw == null) return const {};
    if (raw is! Map) {
      throw const FormatException('extra_attributes must be an object.');
    }
    return Map.unmodifiable(
      raw.map(
        (key, value) => MapEntry(
          key.toString(),
          MusicAssistantExtraAttributeValue.fromJson(value),
        ),
      ),
    );
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
        completer.completeError(
          StateError('Disconnected from Music Assistant.'),
        );
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
        _eventController.add(MusicAssistantEvent.fromJson(data));
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
      _ => throw ArgumentError.value(
        serverUrl,
        'serverUrl',
        'Expected an http(s) URL.',
      ),
    };
    final basePath = uri.path.replaceFirst(RegExp(r'/+$'), '');
    final path = basePath.endsWith('/ws') ? basePath : '$basePath/ws';
    return uri.replace(scheme: scheme, path: path);
  }
}
