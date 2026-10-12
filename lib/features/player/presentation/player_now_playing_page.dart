import 'dart:async';

import 'package:flutter/material.dart';

import '../data/music_assistant_repository.dart';
import '../domain/playback_quality_info.dart';
import '../domain/player_summary.dart';
import 'artwork_image.dart';
import 'player_glass_widgets.dart';

/// The full-screen page shown while the selected player has an active item.
class NowPlayingPage extends StatelessWidget {
  const NowPlayingPage({
    super.key,
    required this.player,
    required this.repository,
    required this.onShowQueue,
    required this.qualityLabel,
    required this.playerActionError,
    required this.error,
  });

  final PlayerSummary player;
  final MusicAssistantRepository repository;
  final VoidCallback onShowQueue;
  final String? qualityLabel;
  final String? playerActionError;
  final String? error;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      final wide = constraints.maxWidth > constraints.maxHeight;
      final compact = constraints.maxWidth < 560;
      final desktop = constraints.maxWidth >= 900;
      final artworkSize = desktop
          ? (constraints.maxHeight * .64).clamp(200.0, 560.0).toDouble()
          : (constraints.maxHeight - 16)
                .clamp(compact ? 116.0 : 150.0, compact ? 176.0 : 220.0)
                .toDouble();
      final artwork = SizedBox.square(
        dimension: artworkSize,
        child: Stack(
          fit: StackFit.expand,
          children: [
            ArtworkImage(
              imageUrl: player.imageUrl,
              serverUrl: repository.serverUrl,
              token: repository.token,
              size: artworkSize,
            ),
            Positioned(
              right: 12,
              bottom: 12,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: onShowQueue,
                  borderRadius: BorderRadius.circular(999),
                  child: const GlassPill(
                    padding: EdgeInsets.all(11),
                    tint: Color(0x66202730),
                    child: Icon(
                      Icons.queue_music_rounded,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
      final details = _details(
        context,
        compact,
        desktop,
        artworkSize,
        centered: !wide,
      );
      if (wide) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: compact
                ? 22
                : desktop
                ? 64
                : 48,
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
        );
      }
      return SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(28, 28, 28, 86),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [artwork, const SizedBox(height: 18), details],
        ),
      );
    },
  );

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
                  ? Icons.error_outline_rounded
                  : Icons.graphic_eq_rounded,
              size: 15,
              color: player.available == false
                  ? const Color(0xFFFF8E7C)
                  : Colors.white,
            ),
            const SizedBox(width: 8),
            Text(
              player.available == false
                  ? 'UNAVAILABLE'
                  : qualityLabel ?? 'QUALITY UNKNOWN',
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),


          ],
        ),
      ),
    ),
  );

  Future<void> _showPlaybackInfo(BuildContext context) async {
    final details = repository.fetchPlaybackQualityInfo(player.id);
    await showDialog<void>(
      context: context,
      builder: (_) => _PlaybackQualityDialog(
        details: details,
        trackTitle: player.title,
        artist: player.artist,
        fallbackQualityLabel: qualityLabel,
      ),
    );
  }

  Widget _trackInfo(bool compact, bool desktop, {required bool centered}) {
    final artist = player.artist?.trim();
    final album = player.album?.trim();
    final hasArtist = artist?.isNotEmpty == true;
    final hasAlbum = album?.isNotEmpty == true;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: centered
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          player.title ?? 'Nothing is playing',
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
        if (player.durationSeconds != null && player.durationSeconds! > 0) ...[
          SizedBox(height: compact ? 12 : 18),
          _TrackProgressBar(player: player, centered: centered),
        ],
        if (playerActionError != null) ...[
          const SizedBox(height: 8),
          Text(
            playerActionError!,
            style: const TextStyle(color: Color(0xFFFF8E7C), fontSize: 11),
          ),
        ],
        if (error != null) ...[
          const SizedBox(height: 6),
          Text(
            error!,
            style: const TextStyle(color: Color(0xFFFF8E7C), fontSize: 11),
          ),
        ],
        // _buildPaletteTestView(player),
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

  final PlayerSummary player;
  final bool centered;

  @override
  State<_TrackProgressBar> createState() => _TrackProgressBarState();
}

class _TrackProgressBarState extends State<_TrackProgressBar> {
  Timer? _timer;
  DateTime _now = DateTime.now();
  DateTime _localPositionStartedAt = DateTime.now();
  double _localPositionAtStart = 0;

  bool get _isPlaying => widget.player.playbackState.toLowerCase() == 'playing';

  @override
  void initState() {
    super.initState();
    _localPositionAtStart = widget.player.elapsedTimeSeconds ?? 0;
    _localPositionStartedAt = _now;
    _updateTimer();
  }

  @override
  void didUpdateWidget(covariant _TrackProgressBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    final trackChanged =
        oldWidget.player.mediaUri != widget.player.mediaUri ||
        oldWidget.player.title != widget.player.title ||
        oldWidget.player.imageUrl != widget.player.imageUrl;
    final positionChanged =
        oldWidget.player.elapsedTimeSeconds !=
            widget.player.elapsedTimeSeconds ||
        oldWidget.player.elapsedTimeLastUpdated !=
            widget.player.elapsedTimeLastUpdated;
    if (trackChanged) {
      _localPositionAtStart = widget.player.elapsedTimeSeconds ?? 0;
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
    } else if (oldWidget.player.playbackState.toLowerCase() !=
        widget.player.playbackState.toLowerCase()) {
      _localPositionStartedAt = DateTime.now();
      _localPositionAtStart = _positionAt(
        _localPositionStartedAt,
        oldWidget.player,
      );
      _now = _localPositionStartedAt;
    }
    if (oldWidget.player.playbackState != widget.player.playbackState ||
        oldWidget.player.durationSeconds != widget.player.durationSeconds) {
      _updateTimer();
    }
  }

  void _updateTimer() {
    _timer?.cancel();
    if (_isPlaying && (widget.player.durationSeconds ?? 0) > 0) {
      _timer = Timer.periodic(const Duration(milliseconds: 250), (_) {
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
    final duration = widget.player.durationSeconds!;
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
          child: ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 4,
              color: Colors.white,
              backgroundColor: const Color(0x55FFFFFF),
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

  double _positionAt(DateTime time, PlayerSummary player) {
    final elapsed = player.elapsedTimeSeconds;
    final updatedAt = player.elapsedTimeLastUpdated;
    if (elapsed != null &&
        updatedAt != null &&
        player.playbackState.toLowerCase() == 'playing') {
      final updatedAtSeconds = updatedAt.abs() > 1000000000000
          ? updatedAt / 1000
          : updatedAt;
      final difference = time.millisecondsSinceEpoch / 1000 - updatedAtSeconds;
      if (difference >= 0 && difference < (player.durationSeconds ?? 86400)) {
        return elapsed + difference;
      }
    }
    final localElapsed =
        _localPositionAtStart +
        (player.playbackState.toLowerCase() == 'playing'
            ? time.difference(_localPositionStartedAt).inMilliseconds / 1000
            : 0);
    return localElapsed;
  }

  TextStyle get _timeStyle => const TextStyle(
    color: Color(0xCCD8E0DB),
    fontSize: 10,
    fontWeight: FontWeight.w500,
    fontFeatures: [FontFeature.tabularFigures()],
  );

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainder = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainder.toString().padLeft(2, '0')}';
  }
}

class _PlaybackQualityDialog extends StatelessWidget {
  const _PlaybackQualityDialog({
    required this.details,
    required this.trackTitle,
    required this.artist,
    required this.fallbackQualityLabel,
  });

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
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close_rounded, color: Colors.white70),
                  ),
                ],
              ),
              if (trackTitle?.trim().isNotEmpty == true) ...[
                Text(
                  trackTitle!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white, fontSize: 15),
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

                  add('Source', info.source?.toUpperCase());
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
                  return _detailRows(rows);
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
                  style: const TextStyle(color: Colors.white60, fontSize: 13),
                ),
              ),
              const SizedBox(width: 16),
              Flexible(
                child: Text(
                  row.value,
                  textAlign: TextAlign.right,
                  style: const TextStyle(color: Colors.white, fontSize: 13),
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
        Icon(Icons.graphic_eq_rounded, size: 42, color: Color(0xDDE9F0EB)),
        SizedBox(height: 12),
        Text(
          'Nothing is playing',
          style: TextStyle(
            color: Color(0xFFF1F4EA),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 6),
        Text(
          'Swipe to choose something to play',
          style: TextStyle(color: Color(0xFFD8E0DB), fontSize: 12),
        ),
      ],
    ),
  );
}

// Test widget om het server-kleurenpalet direct op het scherm te tonen
Widget _buildPaletteTestView(PlayerSummary? player) {
  final palette = player?.palette;
  if (palette == null || palette.isEmpty) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text('Geen palet beschikbaar', style: TextStyle(color: Colors.white70, fontSize: 12)),
    );
  }

  print('Nieuw ontvangen palet:');

  return Container(
    padding: const EdgeInsets.all(12),
    margin: const EdgeInsets.symmetric(vertical: 8),
    decoration: BoxDecoration(
      color: Colors.black45,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: Colors.white24),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Server Kleurenpalet Test',
          style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: palette.entries.map((entry) {
            final rgb = entry.value;
            Color color = Colors.transparent;
            if (rgb is List && rgb.length >= 3) {
              color = Color.fromARGB(
                255,
                (rgb[0] as num).toInt().clamp(0, 255),
                (rgb[1] as num).toInt().clamp(0, 255),
                (rgb[2] as num).toInt().clamp(0, 255),
              );
            }

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 1.5),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  entry.key,
                  style: const TextStyle(color: Colors.white70, fontSize: 9),
                ),
              ],
            );
          }).toList(),
        ),
      ],
    ),
  );
}