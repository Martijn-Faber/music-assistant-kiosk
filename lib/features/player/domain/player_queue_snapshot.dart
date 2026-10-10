class PlayerQueueSnapshot {
  const PlayerQueueSnapshot({
    required this.playerName,
    required this.currentIndex,
    required this.items,
  });

  final String playerName;
  final int? currentIndex;
  final List<Map<String, dynamic>> items;
}
