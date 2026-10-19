import 'dart:async';

import 'package:flutter/foundation.dart';

import '../data/music_assistant_repository.dart';

/// Owns favorite lookup, event synchronization, caching, and updates.
class PlayerFavoriteViewModel extends ChangeNotifier {
  PlayerFavoriteViewModel({required this.repository, required this.uri}) {
    _listen();
    unawaited(load());
  }

  static final Map<String, bool> _favoriteCache = {};

  final MusicAssistantRepository repository;
  final String? uri;
  bool? favorite;
  bool isBusy = false;
  int _loadRevision = 0;
  int _favoriteEventRevision = 0;
  void Function()? _unsubscribe;
  bool _disposed = false;

  void _listen() {
    final itemUri = uri;
    if (itemUri == null || itemUri.isEmpty) return;
    _unsubscribe = repository.listenToMediaItemUpdates(
      uri: itemUri,
      onFavoriteUpdated: (value) {
        if (_disposed) return;
        _favoriteEventRevision++;
        _loadRevision++;
        _favoriteCache[itemUri] = value;
        favorite = value;
        notifyListeners();
      },
    );
  }

  Future<void> load() async {
    final itemUri = uri;
    if (itemUri == null || itemUri.isEmpty) return;
    final revision = ++_loadRevision;
    final cached = _favoriteCache[itemUri];
    if (cached != null) {
      favorite = cached;
      notifyListeners();
    }
    try {
      final item = await repository.fetchMediaItem(itemUri);
      final value = item['favorite'] == true;
      _favoriteCache[itemUri] = value;
      if (!_disposed && revision == _loadRevision) {
        favorite = value;
        notifyListeners();
      }
    } catch (_) {
      // The favorite action stays unavailable when metadata cannot be loaded.
    }
  }

  Future<void> toggle() async {
    final itemUri = uri;
    final current = favorite;
    if (itemUri == null || current == null || isBusy) return;
    final eventRevision = _favoriteEventRevision;
    isBusy = true;
    notifyListeners();
    try {
      await repository.setFavorite(itemUri, !current);
      if (_favoriteEventRevision == eventRevision) {
        _favoriteCache[itemUri] = !current;
        favorite = !current;
      }
    } finally {
      isBusy = false;
      if (!_disposed) notifyListeners();
    }
  }

  @override
  void dispose() {
    _disposed = true;
    _loadRevision++;
    _unsubscribe?.call();
    super.dispose();
  }
}
