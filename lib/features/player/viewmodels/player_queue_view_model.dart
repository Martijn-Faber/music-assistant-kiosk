import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:music_assistant_api/music_assistant_api.dart';

import '../data/music_assistant_repository.dart';

/// Owns the SDK queue and queue items shared by now playing and the queue sheet.
class PlayerQueueViewModel extends ChangeNotifier {
  PlayerQueueViewModel({
    required this.repository,
    required this.playerId,
    this.currentPlayingUri,
  }) {
    _unsubscribeFromQueueEvents = repository.listenToQueueEvents(
      playerId: playerId,
      onEvent: _onQueueEvent,
    );
    _unsubscribeFromPlayerEvents = repository.listenToPlayerEvents(
      onChanged: (player) {
        if (_disposed) return;
        final uri = player.currentMedia?.uri;
        if (player.playerId == playerId &&
            uri != null &&
            uri != currentPlayingUri) {
          currentPlayingUri = uri;
          notifyListeners();
        }
      },
      onRemoved: (_) {},
    );
  }

  final MusicAssistantRepository repository;
  final String playerId;
  String? currentPlayingUri;

  MusicAssistantPlayerQueue? queue;
  bool get isDynamic => queue?.isDynamic ?? false;
  List<MusicAssistantQueueItem> items = const [];
  MusicAssistantExtraAttributes queueExtraAttributes = const {};
  Map<String, MusicAssistantExtraAttributes> itemExtraAttributesByQueueItemId =
      const {};
  Map<String, MusicAssistantAlbumOrItemMapping> albumByQueueItemId = const {};
  bool isUpdatingShuffle = false;
  bool isUpdatingAutoplay = false;
  Future<void>? _loading;
  Timer? _refreshTimer;
  void Function()? _unsubscribeFromQueueEvents;
  void Function()? _unsubscribeFromPlayerEvents;
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

  Future<void> setShuffleEnabled(bool enabled) async {
    final previousQueue = queue;
    isUpdatingShuffle = true;
    if (previousQueue != null) {
      queue = previousQueue.copyWith(shuffleEnabled: enabled);
    }
    notifyListeners();
    try {
      await repository.setQueueShuffle(playerId, enabled);
      await refresh();
    } catch (_) {
      queue = previousQueue;
      rethrow;
    } finally {
      isUpdatingShuffle = false;
      if (!_disposed) notifyListeners();
    }
  }

  Future<void> setAutoplayEnabled(bool enabled) async {
    final previousQueue = queue;
    isUpdatingAutoplay = true;
    if (previousQueue != null) {
      queue = previousQueue.copyWith(autoplayEnabled: enabled);
    }
    notifyListeners();
    try {
      await repository.setQueueAutoplay(playerId, enabled);
      await refresh();
    } catch (_) {
      queue = previousQueue;
      rethrow;
    } finally {
      isUpdatingAutoplay = false;
      if (!_disposed) notifyListeners();
    }
  }

  Future<void> clear() => repository.clearQueue(playerId);

  Future<void> removeItem({required int index, String? queueItemId}) =>
      repository.removeQueueItem(
        playerId,
        index: index,
        queueItemId: queueItemId,
      );

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
    _unsubscribeFromPlayerEvents?.call();
    super.dispose();
  }
}
