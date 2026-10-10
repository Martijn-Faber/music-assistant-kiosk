import 'playback_progress_report.dart';

class PlayerSummary {
  const PlayerSummary({
    required this.id,
    required this.name,
    required this.playbackState,
    this.available,
    this.volumeLevel,
    this.title,
    this.mediaUri,
    this.artist,
    this.album,
    this.imageUrl,
    this.groupMembers = const [],
    this.durationSeconds,
    this.elapsedTimeSeconds,
    this.elapsedTimeLastUpdated,
  });

  final String id;
  final String name;
  final String playbackState;
  final bool? available;
  final int? volumeLevel;
  final String? title;
  final String? mediaUri;
  final String? artist;
  final String? album;
  final String? imageUrl;
  final List<String>? groupMembers;
  final int? durationSeconds;
  final double? elapsedTimeSeconds;
  final double? elapsedTimeLastUpdated;

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
    mediaUri: mediaUri,
    artist: artist,
    album: album,
    imageUrl: imageUrl,
    groupMembers: groupMembers,
    durationSeconds: durationSeconds,
    elapsedTimeSeconds: elapsedTimeSeconds,
    elapsedTimeLastUpdated: elapsedTimeLastUpdated,
  );

  PlayerSummary withPlaybackProgress(PlaybackProgressReport report) {
    final newItem =
        mediaUri != report.uri && (mediaUri != null || title != report.name);
    return PlayerSummary(
      id: id,
      name: name,
      playbackState: report.isPlaying ? 'playing' : 'paused',
      available: available,
      volumeLevel: volumeLevel,
      title: report.name,
      mediaUri: report.uri,
      artist: report.artist ?? (newItem ? null : artist),
      album: report.album ?? (newItem ? null : album),
      imageUrl: report.imageUrl ?? (newItem ? null : imageUrl),
      groupMembers: groupMembers,
      durationSeconds: report.durationSeconds,
      elapsedTimeSeconds: report.secondsPlayed,
      elapsedTimeLastUpdated: DateTime.now().millisecondsSinceEpoch / 1000,
    );
  }

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
    final elapsedTime = data['elapsed_time'] ?? media?['elapsed_time'];
    final elapsedTimeLastUpdated =
        data['elapsed_time_last_updated'] ??
        media?['elapsed_time_last_updated'];
    final duration = media?['duration'];
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
      mediaUri: _mapString(media, 'uri'),
      artist: _mapString(media, 'artist'),
      album: _mapString(media, 'album'),
      imageUrl: _mapString(media, 'image_url'),
      groupMembers: groupMembers,
      durationSeconds: duration is num ? duration.toInt() : null,
      elapsedTimeSeconds: elapsedTime is num ? elapsedTime.toDouble() : null,
      elapsedTimeLastUpdated: elapsedTimeLastUpdated is num
          ? elapsedTimeLastUpdated.toDouble()
          : null,
    );
  }

  static String? _stringValue(dynamic value) => value is String ? value : null;

  static String? _mapString(Map? values, String key) =>
      _stringValue(values?[key]);
}
