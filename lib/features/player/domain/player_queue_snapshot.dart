class PlayerQueueSnapshot {
  const PlayerQueueSnapshot({
    required this.playerName,
    required this.queueId,
    required this.currentIndex,
    required this.items,
    required this.autoplayEnabled,
  });

  final String playerName;
  final String queueId;
  final int? currentIndex;
  final List<Map<String, dynamic>> items;
  final bool autoplayEnabled;
}
