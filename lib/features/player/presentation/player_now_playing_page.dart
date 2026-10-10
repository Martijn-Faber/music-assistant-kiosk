import 'dart:async';

import 'package:flutter/material.dart';

import '../data/music_assistant_repository.dart';
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
      final details = _details(compact, desktop, artworkSize, centered: !wide);
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
    bool compact,
    bool desktop,
    double artworkSize, {
    required bool centered,
  }) {
    final trackInfo = _trackInfo(compact, desktop, centered: centered);
    if (!centered) {
      return SizedBox(
        height: artworkSize,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Align(alignment: Alignment.topLeft, child: _qualityVolumePill()),
            Center(child: trackInfo),
          ],
        ),
      );
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _qualityVolumePill(),
        SizedBox(height: compact ? 10 : 16),
        _trackInfo(compact, desktop, centered: true),
      ],
    );
  }

  Widget _qualityVolumePill() => GlassPill(
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
  );

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
      ],
    );
  }
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
