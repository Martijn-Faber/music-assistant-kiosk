import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:music_assistant_api/music_assistant_api.dart';

import '../data/music_assistant_repository.dart';

/// Owns the SDK queue and queue items shared by now playing and the queue sheet.
class PlayerQueueController extends ChangeNotifier {
  PlayerQueueController({required this.repository, required this.playerId}) {
    _unsubscribeFromQueueEvents = repository.listenToQueueEvents(
      playerId: playerId,
      onEvent: _onQueueEvent,
    );
  }

  final MusicAssistantRepository repository;
  final String playerId;

  MusicAssistantPlayerQueue? queue;
  bool get isDynamic => queue?.isDynamic ?? false;
  List<MusicAssistantQueueItem> items = const [];
  MusicAssistantExtraAttributes queueExtraAttributes = const {};
  Map<String, MusicAssistantExtraAttributes> itemExtraAttributesByQueueItemId =
      const {};
  Map<String, MusicAssistantAlbumOrItemMapping> albumByQueueItemId = const {};
  Future<void>? _loading;
  Timer? _refreshTimer;
  void Function()? _unsubscribeFromQueueEvents;
  bool _disposed = false;

  Future<void> load() {
    if (queue != null) return Future.value();
    return _loading ??= _fetch();
  }

  Future<void> refresh() async {
    final currentLoad = _loading;
    if (currentLoad != null) {
      try {
        await currentLoad;
      } catch (_) {
        // Try a fresh request below if the initial load failed.
      }
    }
    await (_loading ??= _fetch());
  }

  String? queueArtist(MusicAssistantQueueItem item) {
    final artists = item.mediaItem?.artists
        ?.map((artist) => switch (artist) {
          MusicAssistantArtistOrItemMappingUnionArtist(:final value) =>
            value.name,
          MusicAssistantArtistOrItemMappingUnionItemMapping(:final value) =>
            value.name,
          MusicAssistantArtistOrItemMappingUnionFallback(:final value) =>
            value['name'] as String?,
        })
        .whereType<String>()
        .where((name) => name.isNotEmpty)
        .toList();
    return artists == null || artists.isEmpty ? null : artists.join(', ');
  }

  String queueTrackTitle(MusicAssistantQueueItem item) {
    final title = item.mediaItem?.name;
    return title != null && title.isNotEmpty ? title : item.name;
  }

  Future<void> _fetch() async {
    try {
      final snapshot = await repository.fetchActiveQueueSnapshot(playerId);
      if (!_disposed) {
        queue = snapshot.queue;
        items = snapshot.items;
        queueExtraAttributes = snapshot.queueExtraAttributes;
        itemExtraAttributesByQueueItemId =
            snapshot.itemExtraAttributesByQueueItemId;
        albumByQueueItemId = snapshot.albumByQueueItemId;
        notifyListeners();
      }
    } finally {
      _loading = null;
    }
  }

  void _onQueueEvent(MusicAssistantEvent event) {
    final type = event.eventName;
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
