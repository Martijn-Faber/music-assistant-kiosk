import 'package:music_assistant/auth_helpers.dart' as music_auth;
import 'package:music_assistant/music_assistant.dart';

import '../domain/player_summary.dart';
import '../domain/playback_progress_report.dart';
import '../domain/recent_media_item.dart';
import '../domain/radio_station.dart';

class MusicAssistantRepository {
  MusicAssistantRepository._(this._client);

  final MusicAssistantClient _client;

  String get serverUrl => _client.serverUrl;
  String get token => _client.token;

  static Future<MusicAssistantRepository> login({
    required String serverUrl,
    required String username,
    required String password,
  }) async {
    final (_, token) = await music_auth.loginWithToken(
      serverUrl,
      username,
      password,
      tokenName: 'Living Room Clock',
    );
    return _connect(serverUrl, token);
  }

  static Future<MusicAssistantRepository> resume({
    required String serverUrl,
    required String token,
  }) => _connect(serverUrl, token);

  static Future<MusicAssistantRepository> _connect(
    String serverUrl,
    String token,
  ) async {
    final client = MusicAssistantClient(serverUrl: serverUrl, token: token);
    try {
      await client.connect();
      return MusicAssistantRepository._(client);
    } catch (_) {
      await client.disconnect();
      rethrow;
    }
  }

  Future<List<PlayerSummary>> fetchPlayers() async {
    final response = await _client.sendCommand('players/all');
    if (response is! List) {
      throw const FormatException(
        'The server returned an invalid player list.',
      );
    }

    return response
        .whereType<Map>()
        .map(
          (player) => PlayerSummary.fromMap(Map<String, dynamic>.from(player)),
        )
        .toList();
  }

  Future<String?> fetchQualityLabel(String playerId) async {
    final queue = await _client.playerQueues.getActiveQueue(playerId);
    final audioFormat = queue?.currentItem?.streamdetails?.audioFormat;
    if (audioFormat == null) return null;

    final codec = audioFormat.codecType.value.toLowerCase();
    final contentType = audioFormat.contentType.value.toLowerCase();
    final format = codec == '?' ? contentType : codec;
    const losslessFormats = {
      'flac',
      'wav',
      'aiff',
      'alac',
      'ape',
      'wavpack',
      'dsf',
      'dff',
      'pcm',
      's16le',
      's24le',
      's32le',
    };

    if (losslessFormats.contains(format)) {
      return audioFormat.sampleRate > 48000 || audioFormat.bitDepth > 16
          ? 'HI-RES LOSSLESS'
          : 'LOSSLESS';
    }
    if (format.isEmpty || format == '?') return null;

    final bitRate = audioFormat.bitRate;
    if (bitRate != null && bitRate > 0) {
      return '${format.toUpperCase()} · ${(bitRate / 1000).round()} KBPS';
    }
    return format.toUpperCase();
  }

  Future<List<RadioStation>> fetchRadioStations() async {
    final response = await _client.sendCommand('music/radios/library_items');
    final rawItems = switch (response) {
      List<dynamic> items => items,
      Map<dynamic, dynamic> result when result['items'] is List =>
        result['items'] as List<dynamic>,
      _ => const <dynamic>[],
    };

    final stations = <RadioStation>[];
    for (final item in rawItems.whereType<Map>()) {
      try {
        stations.add(RadioStation.fromMap(Map<String, dynamic>.from(item)));
      } on FormatException {
        continue;
      }
    }
    return stations;
  }

  Future<List<RecentMediaItem>> fetchRecentlyPlayed() async {
    final response = await _client.sendCommand(
      'music/recently_played_items',
      args: {
        'limit': 5,
        'media_types': ['track', 'album', 'playlist'],
      },
    );
    final items = switch (response) {
      List<dynamic> values => values,
      Map<dynamic, dynamic> result when result['items'] is List =>
        result['items'] as List<dynamic>,
      _ => const <dynamic>[],
    };
    final recentItems = [
      for (final item in items.whereType<Map>())
        if (_recentItemOrNull(Map<String, dynamic>.from(item))
            case final value?)
          value,
    ];
    return Future.wait(recentItems.map(_loadRecentArtwork));
  }

  Future<RecentMediaItem> _loadRecentArtwork(RecentMediaItem item) async {
    if (item.imageUrl != null) return item;
    try {
      final response = await _client.sendCommand(
        'music/item_by_uri',
        args: {'uri': item.uri},
      );
      if (response is Map) {
        final imageUrl = RecentMediaItem.imageUrlFromMap(
          Map<String, dynamic>.from(response),
        );
        if (imageUrl != null) return item.withImageUrl(imageUrl);
      }
    } catch (_) {
      // Artwork is optional; keep the recent item usable without it.
    }
    return item;
  }

  RecentMediaItem? _recentItemOrNull(Map<String, dynamic> item) {
    try {
      return RecentMediaItem.fromMap(item);
    } on FormatException {
      return null;
    }
  }

  Future<void> playRadio(String playerId, RadioStation station) async {
    final queue = await _client.playerQueues.getActiveQueue(playerId);

    final mediaUri = station.media['uri'];
    final uri = mediaUri is String
        ? mediaUri
        : station.id.contains('://')
        ? station.id
        : null;
    await _client.playerQueues.playMedia(
      queue?.queueId ?? playerId,
      uri ?? station.media,
    );
  }

  Future<void> playRecentItem(String playerId, RecentMediaItem item) async {
    final queue = await _client.playerQueues.getActiveQueue(playerId);
    await _client.playerQueues.playMedia(
      queue?.queueId ?? playerId,
      item.uri,
      radioMode: item.mediaType.toLowerCase() == 'radio',
    );
  }

  void Function() listenToPlayerEvents({
    required void Function(PlayerSummary player) onChanged,
    required void Function(String playerId) onRemoved,
    required void Function(String playerId, PlaybackProgressReport report)
    onProgress,
  }) {
    return _client.subscribe(
      (event) {
        if (event.type == EventType.mediaItemPlayed) {
          final data = event.data;
          if (data is! Map) return;
          final playerId = data['player_id'];
          if (playerId is! String || playerId.isEmpty) return;
          try {
            onProgress(
              playerId,
              PlaybackProgressReport.fromMap(Map<String, dynamic>.from(data)),
            );
          } on FormatException {
            return;
          }
          return;
        }

        if (event.type == EventType.playerRemoved) {
          final playerId = event.objectId;
          if (playerId != null) onRemoved(playerId);
          return;
        }

        final data = event.data;
        if (data is! Map) return;
        final playerData = Map<String, dynamic>.from(data);
        final playerId = event.objectId ?? playerData['player_id'];
        if (playerId is! String) return;
        playerData['player_id'] = playerId;

        try {
          onChanged(PlayerSummary.fromMap(playerData));
        } on FormatException {
          return;
        }
      },
      eventTypes: {
        EventType.playerAdded,
        EventType.playerUpdated,
        EventType.playerRemoved,
        EventType.mediaItemPlayed,
      },
    );
  }

  Future<void> adjustVolume(String playerId, {required bool increase}) async {
    if (increase) {
      await _client.players.groupVolumeUp(playerId);
    } else {
      await _client.players.groupVolumeDown(playerId);
    }
  }

  Future<void> setGroupVolume(String playerId, int volumeLevel) =>
      _client.players.groupVolume(playerId, volumeLevel);

  Future<void> togglePlayback(String playerId) =>
      _client.players.playPause(playerId);

  Future<void> previousTrack(String playerId) =>
      _client.players.previousTrack(playerId);

  Future<void> nextTrack(String playerId) =>
      _client.players.nextTrack(playerId);

  Future<void> disconnect() => _client.disconnect();
}
