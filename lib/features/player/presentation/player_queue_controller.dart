import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:music_assistant_api/music_assistant_api.dart';

import '../data/music_assistant_repository.dart';
import '../domain/recent_media_item.dart';

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
  List<MusicAssistantQueueItem> items = const [];
  // Temporary UI playback state used during artwork swipes; server player
  // state remains authoritative until the debounced play request is confirmed.
  MusicAssistantPlayerMedia? localPlaybackMedia;
  bool isQueueItemRequestInProgress = false;
  // Preserve the loading state if overlapping play requests finish at different
  // times (for example, a queue-sheet tap during an existing request).
  int _queueItemRequestCount = 0;
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

  Future<void> playQueueItem({required int index, String? queueItemId}) =>
      repository.playQueueItem(
        playerId,
        index: index,
        queueItemId: queueItemId,
      );

  void displayQueueItemLocally(MusicAssistantQueueItem item) {
    if (_disposed) return;
    localPlaybackMedia = playerMediaForQueueItem(item);
    notifyListeners();
  }

  void clearLocalPlaybackMedia() {
    if (_disposed || localPlaybackMedia == null) return;
    localPlaybackMedia = null;
    notifyListeners();
  }

  void beginQueueItemRequest() {
    _queueItemRequestCount++;
    _updateQueueItemRequestState();
  }

  void endQueueItemRequest() {
    if (_queueItemRequestCount > 0) _queueItemRequestCount--;
    _updateQueueItemRequestState();
  }

  void _updateQueueItemRequestState() {
    final inProgress = _queueItemRequestCount > 0;
    if (isQueueItemRequestInProgress == inProgress) return;
    isQueueItemRequestInProgress = inProgress;
    if (!_disposed) notifyListeners();
  }

  MusicAssistantPlayerMedia playerMediaForQueueItem(
    MusicAssistantQueueItem item,
  ) {
    // The now-playing UI expects player media; adapt queue metadata so titles,
    // artist, artwork, and palette can update before the server starts playback.
    final track = item.mediaItem;
    final artist = queueArtist(item);
    final album = track?.album?.name;
    return MusicAssistantPlayerMedia(
      uri: track?.uri ?? item.queueItemId,
      queueItemId: item.queueItemId,
      mediaType: track?.mediaType ?? MusicAssistantMediaType.track,
      title: track?.name ?? item.name,
      artist: artist,
      album: album,
      imageUrl: RecentMediaItem.imageUrlFromQueueItem(
        item,
        album: albumByQueueItemId[item.queueItemId],
      ),
      duration: item.duration ?? track?.duration,
      elapsedTime: 0,
      elapsedTimeLastUpdated: DateTime.now().millisecondsSinceEpoch / 1000,
    );
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
