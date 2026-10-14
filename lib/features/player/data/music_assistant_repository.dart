import 'dart:convert';
import 'dart:io';

import 'package:app/models/media_item_palette.dart';
import 'package:music_assistant/auth_helpers.dart' as music_auth;
import 'package:music_assistant/music_assistant.dart';
import 'package:music_assistant_api/music_assistant_api.dart' as mass;

import '../domain/player_queue_snapshot.dart';
import '../domain/playback_quality_info.dart';
import '../domain/recent_media_item.dart';
import '../domain/radio_station.dart';
import '../domain/playlist.dart';

class MusicAssistantRepository {
  MusicAssistantRepository._(this._client, this._playerApiClient);

  final MusicAssistantClient _client;
  final mass.MusicAssistantClient _playerApiClient;

  String get serverUrl => _client.serverUrl;
  String get token => _client.token;

  static Future<bool> probeServerTimeAt(String serverUrl) async {
    final client = HttpClient();
    try {
      final uri = Uri.parse(serverUrl).resolve('/api');
      final request = await client.postUrl(uri);
      request.headers.contentType = ContentType.json;
      request.write(jsonEncode({'command': 'time'}));
      final response = await request.close();
      await response.drain<void>();
      return response.statusCode == HttpStatus.ok ||
          response.statusCode == HttpStatus.unauthorized;
    } finally {
      client.close(force: true);
    }
  }

  static Future<MusicAssistantRepository> resume({
    required String serverUrl,
    required String token,
  }) => _connect(serverUrl, token);

  static Future<MusicAssistantRepository> connectWithLoginToken({
    required String serverUrl,
    required String loginToken,
  }) async {
    final token = await music_auth.createLongLivedToken(
      serverUrl,
      loginToken,
      tokenName: 'Living Room Clock',
    );
    return _connect(serverUrl, token);
  }

  static Future<MusicAssistantRepository> _connect(
    String serverUrl,
    String token,
  ) async {
    final client = MusicAssistantClient(serverUrl: serverUrl, token: token);
    final playerApiClient = mass.MusicAssistantClient(
      serverUrl: serverUrl,
      token: token,
    );
    try {
      await client.connect();
      await playerApiClient.connect();
      return MusicAssistantRepository._(client, playerApiClient);
    } catch (_) {
      await client.disconnect();
      await playerApiClient.dispose();
      rethrow;
    }
  }

  Future<List<mass.MusicAssistantPlayer>> fetchPlayers() async =>
      (await _playerApiClient.getPlayers()).toList();

  Future<mass.MusicAssistantPlayer> fetchPlayer(String playerId) async {
    return await _playerApiClient.getPlayer(playerId);
  }

  Future<mass.MusicAssistantServerInfoMessage> fetchServerInfo() async {
    final response = await _client.sendCommand('info');
    if (response is! Map) {
      throw const FormatException('The server returned invalid info.');
    }
    return mass.MusicAssistantServerInfoMessage.fromJson(
      Map<String, dynamic>.from(response),
    );
  }

  Future<Map<String, dynamic>> fetchMediaItem(String uri) async {
    final response = await _client.sendCommand(
      'music/item_by_uri',
      args: {'uri': uri},
    );
    if (response is! Map) {
      throw const FormatException('The server returned invalid media info.');
    }
    return Map<String, dynamic>.from(response);
  }

  Future<void> setFavorite(String uri, bool favorite) async {
    if (favorite) {
      await _client.sendCommand(
        'music/favorites/add_item',
        args: {'item': uri},
      );
      return;
    }
    final item = await fetchMediaItem(uri);
    final itemId = item['item_id'];
    final mediaType = item['media_type'];
    if (itemId is! String || mediaType is! String) {
      throw const FormatException(
        'The media item cannot be removed from favorites.',
      );
    }
    await _client.sendCommand(
      'music/favorites/remove_item',
      args: {'media_type': mediaType, 'library_item_id': itemId},
    );
  }

  Future<String?> fetchQualityLabel(String playerId) async {
    return (await fetchPlaybackQualityInfo(playerId))?.qualityLabel;
  }

  Future<PlaybackQualityInfo?> fetchPlaybackQualityInfo(String playerId) async {
    final queue = await _client.playerQueues.getActiveQueue(playerId);
    final currentItem = queue?.currentItem;
    final streamDetails = currentItem?.streamdetails;
    final audioFormat = streamDetails?.audioFormat;
    if (currentItem == null || (streamDetails == null && audioFormat == null)) {
      return null;
    }

    final codec = audioFormat?.codecType.value.toLowerCase();
    final contentType = audioFormat?.contentType.value.toLowerCase();
    final format = codec == null || codec == '?' ? contentType : codec;
    String? qualityLabel;
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

    if (audioFormat != null &&
        format != null &&
        losslessFormats.contains(format)) {
      qualityLabel = audioFormat.sampleRate > 48000 || audioFormat.bitDepth > 16
          ? 'HI-RES LOSSLESS'
          : 'LOSSLESS';
    } else if (format != null && format.isNotEmpty && format != '?') {
      final bitRate = audioFormat?.bitRate;
      qualityLabel = bitRate != null && bitRate > 0
          ? '${format.toUpperCase()} · ${(bitRate / 1000).round()} KBPS'
          : format.toUpperCase();
    }

    final mediaProvider = currentItem.mediaItem?['provider'];
    final source =
        streamDetails?.provider ??
        (mediaProvider is String ? mediaProvider : null);
    return PlaybackQualityInfo(
      source: source,
      streamType: streamDetails?.streamType?.value,
      codec: codec == null || codec == '?' ? null : codec,
      container: contentType == null || contentType == '?' ? null : contentType,
      sampleRateHz: audioFormat?.sampleRate,
      bitDepth: audioFormat?.bitDepth,
      channels: audioFormat?.channels,
      bitRate: audioFormat?.bitRate,
      qualityLabel: qualityLabel,
    );
  }

  Future<PlayerQueueSnapshot> fetchQueue(String playerId) async {
    final queue = await _client.playerQueues.getActiveQueue(playerId);
    final queueId = queue?.queueId ?? playerId;
    final response = await _client.sendCommand(
      'player_queues/items',
      args: {'queue_id': queueId, 'limit': 500, 'offset': 0},
    );
    final items = response is List
        ? response
              .whereType<Map>()
              .map((item) => Map<String, dynamic>.from(item))
              .toList(growable: false)
        : const <Map<String, dynamic>>[];
    return PlayerQueueSnapshot(
      playerName: queue?.displayName ?? playerId,
      currentIndex: queue?.currentIndex,
      items: items,
      autoplayEnabled: queue?.dontStopTheMusicEnabled ?? false,
    );
  }

  Future<void> setQueueAutoplay(String playerId, bool enabled) async {
    final queue = await _client.playerQueues.getActiveQueue(playerId);
    await _client.playerQueues.dontStopTheMusic(
      queue?.queueId ?? playerId,
      enabled,
    );
  }

  Future<void> clearQueue(String playerId) async {
    final queue = await _client.playerQueues.getActiveQueue(playerId);
    final queueId = queue?.queueId ?? playerId;
    await _client.playerQueues.stop(queueId);
    await _client.playerQueues.clear(queueId);
  }

  Future<void> removeQueueItem(
    String playerId, {
    required int index,
    String? queueItemId,
  }) async {
    final queue = await _client.playerQueues.getActiveQueue(playerId);
    await _client.playerQueues.deleteItem(
      queue?.queueId ?? playerId,
      queueItemId ?? index,
    );
  }

  Future<void> playQueueItem(
    String playerId, {
    required int index,
    String? queueItemId,
  }) async {
    final queue = await _client.playerQueues.getActiveQueue(playerId);
    await _client.playerQueues.playIndex(
      queue?.queueId ?? playerId,
      queueItemId ?? index,
    );
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

  Future<MediaItemPalette?> fetchImagePalette(String imageId) async {
  final response = await _client.sendCommand(
    'metadata/get_image_palette',
    args: {'image_id': imageId},
  );
  if (response is Map) {
    return MediaItemPalette.fromJson(Map<String, dynamic>.from(response));
  }
  return null;
}

  Future<String?> fetchProviderIcon(String provider) async {
    final response = await _client.sendCommand(
      'providers/icon',
      args: {'provider': provider},
    );
    if (response is String && response.startsWith('data:image/')) {
      return response;
    }
    return null;
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

  Future<List<Playlist>> fetchPlaylists() async {
    try {
      final response = await _client.sendCommand(
        'music/playlists/library_items',
        args: {'favorite': true},
      );
      final rawItems = switch (response) {
        List<dynamic> items => items,
        Map<dynamic, dynamic> result when result['items'] is List =>
          result['items'] as List<dynamic>,
        _ => const <dynamic>[],
      };
      return [
        for (final item in rawItems.whereType<Map>())
          Playlist.fromJson(Map<String, dynamic>.from(item)),
      ].where((playlist) => playlist.uri.isNotEmpty).toList();
    } catch (_) {
      return [];
    }
  }

  Future<void> playPlaylist(String playerId, Playlist playlist) async {
    final queue = await _client.playerQueues.getActiveQueue(playerId);
    await _client.playerQueues.playMedia(
      queue?.queueId ?? playerId,
      playlist.uri,
    );
  }

  void Function() listenToPlayerEvents({
    required void Function(mass.MusicAssistantPlayer player) onChanged,
    required void Function(String playerId) onRemoved,
  }) {
    return _client.subscribe(
      (event) {
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
        if (playerData['name'] is! String) playerData['name'] = playerId;

        final mass.MusicAssistantPlayer player;
        try {
          player = mass.MusicAssistantPlayer.fromJson(playerData);
        } catch (_) {
          return;
        }
        onChanged(player);
      },
      eventTypes: {
        EventType.playerAdded,
        EventType.playerUpdated,
        EventType.playerRemoved,
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

  Future<void> setPlayerVolume(String playerId, int volumeLevel) async {
    // Music Assistant expects `volume_level` for this command. The SDK's
    // volumeSet helper sends `volume`, which the server does not recognize.
    await _client.sendCommand(
      'players/cmd/volume_set',
      args: {'player_id': playerId, 'volume_level': volumeLevel},
    );
  }

  Future<void> togglePlayback(String playerId) =>
      _client.players.playPause(playerId);

  Future<void> previousTrack(String playerId) =>
      _client.players.previousTrack(playerId);

  Future<void> nextTrack(String playerId) =>
      _client.players.nextTrack(playerId);

  Future<void> disconnect() async {
    await Future.wait([_client.disconnect(), _playerApiClient.dispose()]);
  }
}
