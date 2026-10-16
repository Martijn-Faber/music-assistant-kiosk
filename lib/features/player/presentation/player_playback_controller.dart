import 'package:flutter/foundation.dart';
import 'package:music_assistant_api/music_assistant_api.dart';

import '../data/music_assistant_repository.dart';

/// Owns optimistic now-playing state and requests that change the active item.
class PlayerPlaybackController extends ChangeNotifier {
  PlayerPlaybackController({required this.repository, required this.playerId});

  final MusicAssistantRepository repository;
  final String playerId;

  // Optimistic UI media is separate from the server-reported player media.
  MusicAssistantPlayerMedia? localDisplayedMedia;
  bool isPlaybackRequestInProgress = false;
  // Queue-sheet taps and artwork swipes share this controller, so keep the
  // loading state active until every overlapping request has finished.
  int _requestCount = 0;
  bool _disposed = false;

  void displayQueueItemLocally(
    MusicAssistantQueueItem item, {
    required String? artist,
    required String? imageUrl,
  }) {
    if (_disposed) return;
    // Adapt queue metadata to the player model so the now-playing UI can show
    // the selected track before the server has started it.
    final track = item.mediaItem;
    localDisplayedMedia = MusicAssistantPlayerMedia(
      uri: track?.uri ?? item.queueItemId,
      queueItemId: item.queueItemId,
      mediaType: track?.mediaType ?? MusicAssistantMediaType.track,
      title: track?.name ?? item.name,
      artist: artist,
      album: track?.album?.name,
      imageUrl: imageUrl,
      duration: item.duration ?? track?.duration,
      elapsedTime: 0,
      elapsedTimeLastUpdated: DateTime.now().millisecondsSinceEpoch / 1000,
    );
    notifyListeners();
  }

  void clearLocalDisplayedMedia() {
    if (_disposed || localDisplayedMedia == null) return;
    localDisplayedMedia = null;
    notifyListeners();
  }

  Future<void> playQueueItem({required int index, String? queueItemId}) async {
    _beginRequest();
    try {
      await repository.playQueueItem(
        playerId,
        index: index,
        queueItemId: queueItemId,
      );
    } finally {
      _endRequest();
    }
  }

  Future<void> skipToNextTrack() async {
    _beginRequest();
    try {
      await repository.nextTrack(playerId);
    } finally {
      _endRequest();
    }
  }

  void _beginRequest() {
    _requestCount++;
    _updateRequestState();
  }

  void _endRequest() {
    if (_requestCount > 0) _requestCount--;
    _updateRequestState();
  }

  void _updateRequestState() {
    final inProgress = _requestCount > 0;
    if (isPlaybackRequestInProgress == inProgress) return;
    isPlaybackRequestInProgress = inProgress;
    if (!_disposed) notifyListeners();
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }
}
