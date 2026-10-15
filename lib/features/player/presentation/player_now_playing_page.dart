import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/design_system/glass_tokens.dart';
import 'package:music_assistant_api/music_assistant_api.dart';

import '../data/music_assistant_repository.dart';
import '../domain/playback_quality_info.dart';
import 'player_glass_widgets.dart';
import 'player_queue_controller.dart';
import 'queue_artwork_stack.dart';
import 'provider_identity.dart';

/// The full-screen page shown while the selected player has an active item.
class NowPlayingPage extends StatefulWidget {
  const NowPlayingPage({
    super.key,
    required this.player,
    required this.repository,
    required this.onShowQueue,
    required this.qualityLabel,
    required this.playerActionError,
    required this.error,
  });

  final MusicAssistantPlayer player;
  final MusicAssistantRepository repository;
  final ValueChanged<PlayerQueueController> onShowQueue;
  final String? qualityLabel;
  final String? playerActionError;
  final String? error;

  @override
  State<NowPlayingPage> createState() => _NowPlayingPageState();
}

class _NowPlayingPageState extends State<NowPlayingPage>
    with AutomaticKeepAliveClientMixin<NowPlayingPage> {
  MusicAssistantPlayer get player => widget.player;
  MusicAssistantRepository get repository => widget.repository;
  ValueChanged<PlayerQueueController> get onShowQueue => widget.onShowQueue;
  String? get qualityLabel => widget.qualityLabel;
  String? get playerActionError => widget.playerActionError;
  String? get error => widget.error;

  @override
  bool get wantKeepAlive => true;

  late PlayerQueueController _queueController;

  @override
  void initState() {
    super.initState();
    _createQueueController();
  }

  void _createQueueController() {
    _queueController = PlayerQueueController(
      repository: repository,
      playerId: player.playerId,
    );
    unawaited(
      _queueController.load().then<void>(
        (_) {},
        onError: (Object _, StackTrace __) {},
      ),
    );
  }

  @override
  void didUpdateWidget(covariant NowPlayingPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.player.playerId != widget.player.playerId ||
        oldWidget.repository != widget.repository) {
      _queueController.dispose();
      _createQueueController();
    }
  }

  @override
  void dispose() {
    _queueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return LayoutBuilder(
    builder: (context, constraints) {
      final wide = constraints.maxWidth > constraints.maxHeight;
      final compact = constraints.maxWidth < 560;
      final desktop = constraints.maxWidth >= 900;
      final artworkSize = (desktop
          ? (constraints.maxHeight * .64).clamp(200.0, 560.0).toDouble()
          : (constraints.maxHeight - 16)
                .clamp(compact ? 116.0 : 150.0, compact ? 176.0 : 220.0)
                .toDouble()) * .9;
      final artwork = QueueArtworkStack(
        player: player,
        repository: repository,
        queueController: _queueController,
        size: artworkSize,
      );
      final details = _details(
        context,
        compact,
        desktop,
        artworkSize,
        centered: !wide,
      );
      final sideInset = compact ? 22.0 : desktop ? 64.0 : 48.0;
      if (wide) {
        return Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: sideInset,
                vertical: compact
                    ? 16
                    : desktop
                    ? 36
                    : 28,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: desktop ? 1440 : constraints.maxWidth,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Center(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 560),
                            child: details,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: desktop
                            ? 64
                            : compact
                            ? 20
                            : 40,
                      ),
                      artwork,
                    ],
                  ),
                ),
              ),
            ),
            Positioned(top: 14, right: sideInset, child: _headerActions()),
          ],
        );
      }
      return Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(28, 64, 28, 86),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [artwork, const SizedBox(height: 18), details],
            ),
          ),
          Positioned(top: 12, right: 28, child: _headerActions()),
        ],
      );
    },
    );
  }

  Widget _details(
    BuildContext context,
    bool compact,
    bool desktop,
    double artworkSize, {
    required bool centered,
  }) {
    final trackInfo = _trackInfo(compact, desktop, centered: centered);
    if (!centered) {
      return SizedBox(
        // The layout delegate can place the pill above the artwork's top edge.
        // Keep extra hit-test space around the layout without changing the
        // visual alignment of the track info with the artwork.
        height: artworkSize + 128,
        child: CustomMultiChildLayout(
          delegate: _TrackInfoPillLayoutDelegate(),
          children: [
            LayoutId(
              id: _TrackInfoPillLayoutDelegate.trackInfo,
              child: trackInfo,
            ),
            LayoutId(
              id: _TrackInfoPillLayoutDelegate.pill,
        child: _qualityVolumePill(context),
            ),
          ],
        ),
      );
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _qualityVolumePill(context),
        SizedBox(height: compact ? 10 : 16),
        _trackInfo(compact, desktop, centered: true),
      ],
    );
  }

  Widget _headerActions() => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      _FavoriteButton(
        repository: repository,
        uri: player.currentMedia?.uri,
      ),
      const SizedBox(width: 8),
      Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(999),
        child: InkWell(
          onTap: () => onShowQueue(_queueController),
          borderRadius: BorderRadius.circular(999),
          child: const GlassPill(
            padding: EdgeInsets.all(12),
            tint: Color(0x22202730),
            child: Icon(
              CupertinoIcons.music_note_list,
              color: Colors.white,
              size: GlassTokens.iconSizeM,
            ),
          ),
        ),
      ),
    ],
  );

  Widget _qualityVolumePill(BuildContext context) => Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: () => _showPlaybackInfo(context),
      borderRadius: BorderRadius.circular(999),
      child: GlassPill(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        tint: const Color(0x22202730),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              player.available == false
                  ? CupertinoIcons.exclamationmark_circle
                  : CupertinoIcons.waveform,
              size: GlassTokens.iconSizeS,
              color: player.available == false
                  ? const Color(0xFFFF8E7C)
                  : Colors.white,
            ),
            const SizedBox(width: 8),
            Text(
              player.available == false
                  ? 'UNAVAILABLE'
                  : qualityLabel ?? 'QUALITY UNKNOWN',
              style: const TextStyle(color: Colors.white, fontSize: GlassTokens.fontSize12),
            ),


          ],
        ),
      ),
    ),
  );

  Future<void> _showPlaybackInfo(BuildContext context) async {
    final details = repository.fetchPlaybackQualityInfo(player.playerId);
    await showDialog<void>(
      context: context,
      builder: (_) => _PlaybackQualityDialog(
        repository: repository,
        details: details,
        trackTitle: player.currentMedia?.title,
        artist: player.currentMedia?.artist,
        fallbackQualityLabel: qualityLabel,
      ),
    );
  }

  Widget _trackInfo(bool compact, bool desktop, {required bool centered}) {
    final artist = player.currentMedia?.artist?.trim();
    final album = player.currentMedia?.album?.trim();
    final hasArtist = artist?.isNotEmpty == true;
    final hasAlbum = album?.isNotEmpty == true;
    final hasSeekBar =
        player.currentMedia?.mediaType != MusicAssistantMediaType.radio &&
        player.currentMedia?.duration != null &&
        player.currentMedia!.duration! > 0;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: centered
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          player.currentMedia?.title ?? 'Nothing is playing',
          textAlign: centered ? TextAlign.center : TextAlign.start,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: const Color(0xFFF1F4EA),
            fontSize: desktop
                ? 46
                : compact
                ? 28
                : 40,
            fontWeight: FontWeight.w700,
          ),
        ),
        if (hasArtist || hasAlbum) ...[
          SizedBox(height: compact ? 4 : 8),
          Text(
            [if (hasArtist) artist!, if (hasAlbum) album!].join(' — '),
            textAlign: centered ? TextAlign.center : TextAlign.start,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: const Color(0xFFD8E0DB),
              fontSize: desktop
                  ? 20
                  : compact
                  ? 17
                  : 19,
            ),
          ),
        ],
        AnimatedSize(
          duration: const Duration(milliseconds: 240),
          curve: Curves.easeInOut,
          alignment: Alignment.topCenter,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            switchInCurve: Curves.easeOut,
            switchOutCurve: Curves.easeIn,
            transitionBuilder: (child, animation) => SizeTransition(
              sizeFactor: animation,
              axisAlignment: -1,
              child: FadeTransition(opacity: animation, child: child),
            ),
            child: hasSeekBar
                ? Padding(
                    key: const ValueKey('seek-bar-visible'),
                    padding: EdgeInsets.only(top: compact ? 12 : 18),
                    child: _TrackProgressBar(
                      player: player,
                      centered: centered,
                    ),
                  )
                : const SizedBox(
                    key: ValueKey('seek-bar-hidden'),
                    width: 0,
                    height: 0,
                  ),
          ),
        ),
        if (playerActionError != null) ...[
          const SizedBox(height: 8),
          Text(
            playerActionError!,
            style: const TextStyle(color: Color(0xFFFF8E7C), fontSize: GlassTokens.fontSize11),
          ),
        ],
        if (error != null) ...[
          const SizedBox(height: 6),
          Text(
            error!,
            style: const TextStyle(color: Color(0xFFFF8E7C), fontSize: GlassTokens.fontSize11),
          ),
        ],
      ],
    );
  }
}

class _TrackInfoPillLayoutDelegate extends MultiChildLayoutDelegate {
  _TrackInfoPillLayoutDelegate();

  static const trackInfo = 'track-info';
  static const pill = 'pill';

  @override
  void performLayout(Size size) {
    final infoSize = layoutChild(
      trackInfo,
      // Keep the child height unconstrained so its wrapped title and seek bar
      // are measured together; this lets the pill sit above the full block.
      BoxConstraints(maxWidth: size.width),
    );
    final infoTop = (size.height - infoSize.height) / 2;
    positionChild(trackInfo, Offset(0, infoTop));

    final pillSize = layoutChild(
      pill,
      BoxConstraints(maxWidth: size.width, maxHeight: size.height),
    );
    // The track block can be taller than the artwork area when the title
    // wraps. Allow the pill to move above that area's top instead of clamping
    // it back down on top of the title.
    final pillTop = infoTop - pillSize.height - 12;
    positionChild(pill, Offset(0, pillTop));
  }

  @override
  bool shouldRelayout(covariant _TrackInfoPillLayoutDelegate oldDelegate) =>
      false;
}

class _TrackProgressBar extends StatefulWidget {
  const _TrackProgressBar({required this.player, required this.centered});

  final MusicAssistantPlayer player;
  final bool centered;

  @override
  State<_TrackProgressBar> createState() => _TrackProgressBarState();
}

class _TrackProgressBarState extends State<_TrackProgressBar> {
  Timer? _timer;
  DateTime _now = DateTime.now();
  DateTime _localPositionStartedAt = DateTime.now();
  double _localPositionAtStart = 0;

  bool get _isPlaying =>
      widget.player.playbackState == MusicAssistantPlaybackState.playing;

  @override
  void initState() {
    super.initState();
    _localPositionAtStart = widget.player.elapsedTime ?? 0;
    _localPositionStartedAt = _now;
    _updateTimer();
  }

  @override
  void didUpdateWidget(covariant _TrackProgressBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    final trackChanged =
        oldWidget.player.currentMedia?.uri != widget.player.currentMedia?.uri ||
        oldWidget.player.currentMedia?.title !=
            widget.player.currentMedia?.title ||
        oldWidget.player.currentMedia?.imageUrl !=
            widget.player.currentMedia?.imageUrl;
    final positionChanged =
        oldWidget.player.elapsedTime != widget.player.elapsedTime ||
        oldWidget.player.elapsedTimeLastUpdated !=
            widget.player.elapsedTimeLastUpdated;
    if (trackChanged) {
      _localPositionAtStart = widget.player.elapsedTime ?? 0;
      _localPositionStartedAt = DateTime.now();
      _now = _localPositionStartedAt;
    } else if (positionChanged) {
      // Re-anchor from the newest server sample so periodic position events
      // don't make the progress bar jump back to an older local estimate.
      _localPositionStartedAt = DateTime.now();
      _localPositionAtStart = _positionAt(
        _localPositionStartedAt,
        widget.player,
      );
      _now = _localPositionStartedAt;
    } else if (oldWidget.player.playbackState !=
        widget.player.playbackState) {
      _localPositionStartedAt = DateTime.now();
      _localPositionAtStart = _positionAt(
        _localPositionStartedAt,
        oldWidget.player,
      );
      _now = _localPositionStartedAt;
    }
    if (oldWidget.player.playbackState != widget.player.playbackState ||
        oldWidget.player.currentMedia?.duration !=
            widget.player.currentMedia?.duration) {
      _updateTimer();
    }
  }

  void _updateTimer() {
    _timer?.cancel();
    if (_isPlaying && (widget.player.currentMedia?.duration ?? 0) > 0) {
      // The visible time labels only have one-second precision. Let Flutter
      // animate the bar between those updates instead of rebuilding this
      // widget tree four times per second.
      _timer = Timer.periodic(const Duration(seconds: 1), (_) {
        if (mounted) setState(() => _now = DateTime.now());
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final duration = widget.player.currentMedia!.duration!;
    final position = _positionAt(_now, widget.player);
    final elapsed = position.floor().clamp(0, duration);
    final progress = (position / duration).clamp(0.0, 1.0).toDouble();

    return Column(
      crossAxisAlignment: widget.centered
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: progress, end: progress),
            duration: const Duration(seconds: 1),
            curve: Curves.linear,
            builder: (context, animatedProgress, _) => ClipRRect(
              borderRadius: BorderRadius.circular(999),
              child: LinearProgressIndicator(
                value: animatedProgress,
                minHeight: 4,
                color: Colors.white,
                backgroundColor: const Color(0x55FFFFFF),
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_formatTime(elapsed), style: _timeStyle),
            Text(_formatTime(duration), style: _timeStyle),
          ],
        ),
      ],
    );
  }

  double _positionAt(DateTime time, MusicAssistantPlayer player) {
    final elapsed = player.elapsedTime;
    final updatedAt = player.elapsedTimeLastUpdated;
    if (elapsed != null &&
        updatedAt != null &&
        player.playbackState == MusicAssistantPlaybackState.playing) {
      final updatedAtSeconds = updatedAt.abs() > 1000000000000
          ? updatedAt / 1000
          : updatedAt;
      final difference = time.millisecondsSinceEpoch / 1000 - updatedAtSeconds;
      if (difference >= 0 &&
          difference < (player.currentMedia?.duration ?? 86400)) {
        return elapsed + difference;
      }
    }
    final localElapsed =
        _localPositionAtStart +
        (player.playbackState == MusicAssistantPlaybackState.playing
            ? time.difference(_localPositionStartedAt).inMilliseconds / 1000
            : 0);
    return localElapsed;
  }

  TextStyle get _timeStyle => const TextStyle(
    color: Color(0xCCD8E0DB),
    fontSize: GlassTokens.fontSize10,
    fontWeight: FontWeight.w500,
    fontFeatures: [FontFeature.tabularFigures()],
  );

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainder = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainder.toString().padLeft(2, '0')}';
  }
}

class _FavoriteButton extends StatefulWidget {
  const _FavoriteButton({required this.repository, required this.uri});

  final MusicAssistantRepository repository;
  final String? uri;

  @override
  State<_FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<_FavoriteButton> {
  static final Map<String, bool> _favoriteCache = {};
  bool? _favorite;
  bool _busy = false;
  int _loadRevision = 0;

  @override
  void initState() {
    super.initState();
    _load();
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
  void didUpdateWidget(covariant _FavoriteButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.uri != widget.uri) {
      _favorite = null;
      _load();
    }
  }

  Future<void> _toggle() async {
    final uri = widget.uri;
    final current = _favorite;
    if (uri == null || current == null || _busy) return;
    setState(() => _busy = true);
    try {
      await widget.repository.setFavorite(uri, !current);
      _favoriteCache[uri] = !current;
      if (mounted) setState(() => _favorite = !current);
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not update favorite.')),
        );
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) => Material(
    color: Colors.transparent,
    borderRadius: BorderRadius.circular(999),
    child: InkWell(
      onTap: _favorite == null || _busy ? null : _toggle,
      borderRadius: BorderRadius.circular(999),
      child: GlassPill(
        padding: const EdgeInsets.all(12),
        tint: const Color(0x22202730),
        child: _busy
            ? const SizedBox.square(
                dimension: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : Icon(
                _favorite == true
                    ? CupertinoIcons.heart_fill
                    : CupertinoIcons.heart,
                color: Colors.white,
                size: GlassTokens.iconSizeM,
              ),
      ),
    ),
  );
}

class _PlaybackQualityDialog extends StatelessWidget {
  const _PlaybackQualityDialog({
    required this.repository,
    required this.details,
    required this.trackTitle,
    required this.artist,
    required this.fallbackQualityLabel,
  });

  final MusicAssistantRepository repository;
  final Future<PlaybackQualityInfo?> details;
  final String? trackTitle;
  final String? artist;
  final String? fallbackQualityLabel;

  @override
  Widget build(BuildContext context) => Dialog(
    backgroundColor: Colors.transparent,
    insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
    child: GlassSurface(
      borderRadius: 24,
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
      tint: const Color(0xEE141D20),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 420),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Playback details',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: GlassTokens.fontSize20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(CupertinoIcons.xmark, color: Colors.white70),
                  ),
                ],
              ),
              if (trackTitle?.trim().isNotEmpty == true) ...[
                Text(
                  trackTitle!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white, fontSize: GlassTokens.fontSize15),
                ),
                if (artist?.trim().isNotEmpty == true)
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: Text(
                      artist!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.white60),
                    ),
                  ),
                const SizedBox(height: 12),
              ],
              FutureBuilder<PlaybackQualityInfo?>(
                future: details,
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      ),
                    );
                  }
                  if (snapshot.hasError) {
                    return const Text(
                      'Could not load playback details.',
                      style: TextStyle(color: Colors.white70),
                    );
                  }
                  final info = snapshot.data;
                  if (info == null) {
                    return _detailRows([
                      MapEntry('Quality', fallbackQualityLabel ?? 'Unknown'),
                      const MapEntry(
                        'Source',
                        'Playback details are unavailable',
                      ),
                    ]);
                  }
                  final rows = <MapEntry<String, String>>[];
                  void add(String label, String? value) {
                    if (value?.trim().isNotEmpty == true) {
                      rows.add(MapEntry(label, value!.trim()));
                    }
                  }

                  add('Stream', _prettify(info.streamType));
                  add('Quality', info.qualityLabel ?? fallbackQualityLabel);
                  add('Codec', info.codec?.toUpperCase());
                  add('Container', info.container?.toUpperCase());
                  if (info.sampleRateHz != null && info.sampleRateHz! > 0) {
                    add(
                      'Sample rate',
                      '${(info.sampleRateHz! / 1000).toStringAsFixed(info.sampleRateHz! % 1000 == 0 ? 0 : 1)} kHz',
                    );
                  }
                  if (info.bitDepth != null && info.bitDepth! > 0) {
                    add('Bit depth', '${info.bitDepth} bit');
                  }
                  if (info.channels != null && info.channels! > 0) {
                    add('Channels', '${info.channels}');
                  }
                  if (info.bitRate != null && info.bitRate! > 0) {
                    add('Bitrate', '${(info.bitRate! / 1000).round()} kbps');
                  }
                  final provider = info.source;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (provider != null) ...[
                        Row(
                          children: [
                            ProviderIdentity(
                              repository: repository,
                              providerId: provider,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                      ],
                      _detailRows(rows),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    ),
  );

  Widget _detailRows(List<MapEntry<String, String>> rows) => Column(
    children: [
      for (final row in rows)
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 7),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  row.key,
                  style: const TextStyle(color: Colors.white60, fontSize: GlassTokens.fontSize13),
                ),
              ),
              const SizedBox(width: 16),
              Flexible(
                child: Text(
                  row.value,
                  textAlign: TextAlign.right,
                  style: const TextStyle(color: Colors.white, fontSize: GlassTokens.fontSize13),
                ),
              ),
            ],
          ),
        ),
    ],
  );

  String? _prettify(String? value) => value
      ?.split('_')
      .where((part) => part.isNotEmpty)
      .map((part) => '${part[0].toUpperCase()}${part.substring(1)}')
      .join(' ');
}

class NothingPlayingPage extends StatelessWidget {
  const NothingPlayingPage({super.key});

  @override
  Widget build(BuildContext context) => const Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(CupertinoIcons.waveform, size: GlassTokens.iconSizeXl, color: Color(0xDDE9F0EB)),
        SizedBox(height: 12),
        Text(
          'Nothing is playing',
          style: TextStyle(
            color: Color(0xFFF1F4EA),
            fontSize: GlassTokens.fontSize20,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 6),
        Text(
          'Swipe to choose something to play',
          style: TextStyle(color: Color(0xFFD8E0DB), fontSize: GlassTokens.fontSize12),
        ),
      ],
    ),
  );
}
