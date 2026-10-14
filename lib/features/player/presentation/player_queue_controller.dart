import 'dart:async';

import 'package:flutter/foundation.dart';

import '../data/music_assistant_repository.dart';
import '../domain/player_queue_snapshot.dart';

/// Owns the queue snapshot shared by now playing and the queue sheet.
class PlayerQueueController extends ChangeNotifier {
  PlayerQueueController({required this.repository, required this.playerId}) {
    _unsubscribeFromQueueEvents = repository.listenToQueueEvents(
      playerId: playerId,
      onEvent: _onQueueEvent,
    );
  }

  final MusicAssistantRepository repository;
  final String playerId;

  PlayerQueueSnapshot? snapshot;
  Future<PlayerQueueSnapshot>? _loading;
  Timer? _refreshTimer;
  void Function()? _unsubscribeFromQueueEvents;
  bool _disposed = false;

  Future<PlayerQueueSnapshot> load() {
    final current = snapshot;
    if (current != null) return Future.value(current);
    return _loading ??= _fetch();
  }

  Future<PlayerQueueSnapshot> refresh() async {
    final currentLoad = _loading;
    if (currentLoad != null) {
      try {
        await currentLoad;
      } catch (_) {
        // Try a fresh request below if the initial load failed.
      }
    }
    return _loading ??= _fetch();
  }

  Future<PlayerQueueSnapshot> _fetch() async {
    try {
      final result = await repository.fetchQueue(playerId);
      if (!_disposed) {
        snapshot = result;
        notifyListeners();
      }
      return result;
    } finally {
      _loading = null;
    }
  }

  void _onQueueEvent(Map<String, dynamic> event) {
    final type = event['event'];
    if (type != 'queue_items_updated' &&
        type != 'queue_added' &&
        type != 'queue_updated') {
      return;
    }
    // One queue operation can emit several events; fetch once after they settle.
    _refreshTimer?.cancel();
    _refreshTimer = Timer(const Duration(milliseconds: 320), () {
      unawaited(
        refresh().then<void>((_) {}, onError: (Object _, StackTrace __) {}),
      );
    });
  }

  @override
  void dispose() {
    _disposed = true;
    _refreshTimer?.cancel();
    _unsubscribeFromQueueEvents?.call();
    super.dispose();
  }
}
