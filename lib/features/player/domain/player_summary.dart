class PlayerSummary {
  const PlayerSummary({
    required this.id,
    required this.name,
    required this.playbackState,
    this.available,
    this.volumeLevel,
    this.title,
    this.artist,
    this.album,
    this.imageUrl,
    this.groupMembers = const [],
  });

  final String id;
  final String name;
  final String playbackState;
  final bool? available;
  final int? volumeLevel;
  final String? title;
  final String? artist;
  final String? album;
  final String? imageUrl;
  final List<String>? groupMembers;

  /// Number of output players in a group, or null for a single player.
  int? get groupMemberCount =>
      (groupMembers?.length ?? 0) > 1 ? groupMembers!.length : null;

  PlayerSummary withVolumeLevel(int? value) => PlayerSummary(
    id: id,
    name: name,
    playbackState: playbackState,
    available: available,
    volumeLevel: value,
    title: title,
    artist: artist,
    album: album,
    imageUrl: imageUrl,
    groupMembers: groupMembers,
  );

  factory PlayerSummary.fromMap(Map<String, dynamic> data) {
    final id = data['player_id'];
    if (id is! String || id.isEmpty) {
      throw const FormatException('A player response is missing its id.');
    }

    final rawMedia = data['current_media'];
    final media = rawMedia is Map ? rawMedia : null;
    final available = data['available'];
    final volumeLevel = data['group_volume'] ?? data['volume_level'];
    final rawGroupMembers = data['group_members'] ?? data['group_childs'];
    final groupMembers = rawGroupMembers is List
        ? rawGroupMembers.whereType<String>().toList(growable: false)
        : const <String>[];

    return PlayerSummary(
      id: id,
      name: _stringValue(data['name']) ?? id,
      playbackState: _stringValue(data['playback_state']) ?? 'idle',
      available: available is bool ? available : null,
      volumeLevel: volumeLevel is num ? volumeLevel.toInt() : null,
      title: _mapString(media, 'title'),
      artist: _mapString(media, 'artist'),
      album: _mapString(media, 'album'),
      imageUrl: _mapString(media, 'image_url'),
      groupMembers: groupMembers,
    );
  }

  static String? _stringValue(dynamic value) => value is String ? value : null;

  static String? _mapString(Map? values, String key) =>
      _stringValue(values?[key]);
}
