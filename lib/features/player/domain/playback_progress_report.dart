class PlaybackProgressReport {
  const PlaybackProgressReport({
    required this.uri,
    required this.name,
    required this.durationSeconds,
    required this.secondsPlayed,
    required this.fullyPlayed,
    required this.isPlaying,
    this.artist,
    this.album,
    this.imageUrl,
  });

  final String uri;
  final String name;
  final int durationSeconds;
  final double secondsPlayed;
  final bool fullyPlayed;
  final bool isPlaying;
  final String? artist;
  final String? album;
  final String? imageUrl;

  factory PlaybackProgressReport.fromMap(Map<String, dynamic> data) {
    final duration = data['duration'];
    final secondsPlayed = data['seconds_played'];
    final fullyPlayed = data['fully_played'];
    final isPlaying = data['is_playing'];
    final uri = data['uri'];
    final name = data['name'];
    if (uri is! String ||
        name is! String ||
        duration is! num ||
        secondsPlayed is! num) {
      throw const FormatException('Invalid playback progress report.');
    }
    return PlaybackProgressReport(
      uri: uri,
      name: name,
      durationSeconds: duration.toInt(),
      secondsPlayed: secondsPlayed.toDouble(),
      fullyPlayed: fullyPlayed == true,
      isPlaying: isPlaying == true,
      artist: data['artist'] is String ? data['artist'] as String : null,
      album: data['album'] is String ? data['album'] as String : null,
      imageUrl: data['image_url'] is String
          ? data['image_url'] as String
          : null,
    );
  }
}
