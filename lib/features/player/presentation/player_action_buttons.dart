import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../design_system/glass_icon_button.dart';
import '../../../design_system/glass_icon_toggle_button.dart';
import '../../../design_system/global_snackbar.dart';
import '../data/music_assistant_repository.dart';

class PlayerFavoriteButton extends StatefulWidget {
  const PlayerFavoriteButton({
    super.key,
    required this.repository,
    required this.uri,
  });

  final MusicAssistantRepository repository;
  final String? uri;

  @override
  State<PlayerFavoriteButton> createState() => _PlayerFavoriteButtonState();
}

class _PlayerFavoriteButtonState extends State<PlayerFavoriteButton> {
  static final Map<String, bool> _favoriteCache = {};
  bool? _favorite;
  bool _busy = false;
  int _loadRevision = 0;
  int _favoriteEventRevision = 0;
  void Function()? _unsubscribeFromMediaItemUpdates;

  @override
  void initState() {
    super.initState();
    _listenForFavoriteUpdates();
    _load();
  }

  void _listenForFavoriteUpdates() {
    _unsubscribeFromMediaItemUpdates?.call();
    final uri = widget.uri;
    if (uri == null || uri.isEmpty) return;
    _unsubscribeFromMediaItemUpdates = widget.repository
        .listenToMediaItemUpdates(
          uri: uri,
          onFavoriteUpdated: (favorite) {
            _favoriteEventRevision++;
            // Invalidate an initial fetch that started before this newer event.
            _loadRevision++;
            _favoriteCache[uri] = favorite;
            if (mounted && widget.uri == uri) {
              setState(() => _favorite = favorite);
            }
          },
        );
  }

  Future<void> _load() async {
    final uri = widget.uri;
    if (uri == null || uri.isEmpty) return;
    final revision = ++_loadRevision;
    final cached = _favoriteCache[uri];
    if (cached != null && mounted) setState(() => _favorite = cached);
    try {
      final item = await widget.repository.fetchMediaItem(uri);
      final isFavorite = item['favorite'] == true;
      _favoriteCache[uri] = isFavorite;
      if (mounted && revision == _loadRevision && widget.uri == uri) {
        setState(() => _favorite = isFavorite);
      }
    } catch (_) {}
  }

  @override
  void didUpdateWidget(covariant PlayerFavoriteButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.uri != widget.uri ||
        oldWidget.repository != widget.repository) {
      _favorite = null;
      _listenForFavoriteUpdates();
      _load();
    }
  }

  @override
  void dispose() {
    _unsubscribeFromMediaItemUpdates?.call();
    super.dispose();
  }

  Future<void> _toggle() async {
    final uri = widget.uri;
    final current = _favorite;
    if (uri == null || current == null || _busy) return;
    final eventRevision = _favoriteEventRevision;
    setState(() => _busy = true);
    try {
      await widget.repository.setFavorite(uri, !current);
      // A media_item_updated event may have reported a newer value while the
      // request was pending. Only apply this optimistic value if none arrived.
      if (_favoriteEventRevision == eventRevision) {
        _favoriteCache[uri] = !current;
        if (mounted && widget.uri == uri) setState(() => _favorite = !current);
      }
    } catch (error) {
      debugPrint('Could not update favorite: $error');
      if (mounted) {
        GlobalSnackbarHost.show(
          context,
          message: 'Could not update favorite.',
          kind: GlobalSnackbarKind.error,
        );
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) => GlassIconToggleButton(
        icon: CupertinoIcons.heart,
        selectedIcon: CupertinoIcons.heart_fill,
        type: GlassIconButtonType.primary,
        tooltip: _favorite == true ? 'Remove from favorites' : 'Add to favorites',
        disabled: _favorite == null,
        isSelected: _favorite == true,
        isLoading: _busy,
        onPressed: _toggle,
      );
}

class PlayerQueueButton extends StatelessWidget {
  const PlayerQueueButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => GlassIconButton(
        icon: CupertinoIcons.music_note_list,
        type: GlassIconButtonType.primary,
        tooltip: 'Show queue',
        onPressed: onPressed,
      );
}
