import '../generated/models/music_assistant_queue_item.dart';

/// Queue state and items returned by the SDK's queue snapshot request.
class MusicAssistantQueueSnapshot {
  const MusicAssistantQueueSnapshot({
    required this.queueId,
    required this.displayName,
    required this.currentIndex,
    required this.indexInBuffer,
    required this.autoplayEnabled,
    required this.items,
  });

  final String queueId;
  final String? displayName;
  final int? currentIndex;
  final int? indexInBuffer;
  final bool autoplayEnabled;
  final List<MusicAssistantQueueItem> items;
}
