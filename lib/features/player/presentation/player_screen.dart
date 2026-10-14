import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:app/design_system/glass_tokens.dart';
import 'package:flutter/material.dart';
import 'package:app/design_system/glass_tokens.dart';

import '../data/music_assistant_repository.dart';
import '../domain/player_summary.dart';
import '../../screensaver/presentation/clock_screensaver_page.dart';
import '../../idle/presentation/idle_player_page.dart';
import '../../settings/presentation/player_settings_page.dart';
import 'album_backdrop.dart';
import 'player_glass_widgets.dart';
import 'player_now_playing_page.dart';
import 'player_queue_sheet.dart';
import 'player_volume_dialog.dart';

class PlayerScreen extends StatelessWidget {
  // Keep the pager alive while SessionGate rebuilds PlayerScreen for player
  // updates. Recreating this key on every build reset the selected page to
  // the player page whenever metadata or volume changed.
  static final GlobalKey<_PlayerPagesState> _pagerKey =
      GlobalKey<_PlayerPagesState>();

  const PlayerScreen({
    super.key,
    required this.repository,
    required this.serverInfo,
    required this.players,
    required this.selectedPlayerId,
    required this.qualityLabel,
    required this.playerActionError,
    required this.error,
    required this.showVolumeFeedback,
    required this.clock24HourFormat,
    required this.onClock24HourFormatChanged,
    required this.onSelectPlayer,
    required this.onQueueCleared,
    required this.onDisconnect,
  });

  final MusicAssistantRepository repository;
  final Map<String, dynamic>? serverInfo;
  final List<PlayerSummary> players;
  final String? selectedPlayerId;
  final String? qualityLabel;
  final String? playerActionError;
  final String? error;
  final bool showVolumeFeedback;
  final bool? clock24HourFormat;
  final ValueChanged<bool?> onClock24HourFormatChanged;
  final ValueChanged<String> onSelectPlayer;
  final ValueChanged<String> onQueueCleared;
  final VoidCallback onDisconnect;

  PlayerSummary? get _selectedPlayer =>
      players.where((player) => player.id == selectedPlayerId).firstOrNull;

  @override
  Widget build(BuildContext context) {
    final player = _selectedPlayer;
    final isIdle =
        player != null &&
        (player.title?.trim().isNotEmpty != true) &&
        player.playbackState.toLowerCase() != 'playing';

    return Scaffold(
      backgroundColor: const Color(0xFF101819),
      body: AlbumBackdrop(
        imageUrl: isIdle ? null : player?.imageUrl,
        palette: player?.palette,
        serverUrl: repository.serverUrl,
        token: repository.token,
        child: Stack(
          fit: StackFit.expand,
          children: [
            SafeArea(child: Center(child: _playerContent(context, player))),
            if (player != null)
              Positioned(
                left: 0,
                right: 0,
                top: 12,
                child: SafeArea(
                  bottom: false,
                  child: IgnorePointer(
                    child: Center(
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 180),
                        transitionBuilder: (child, animation) => FadeTransition(
                          opacity: animation,
                          child: SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(0, 0.12),
                              end: Offset.zero,
                            ).animate(animation),
                            child: child,
                          ),
                        ),
                        child: showVolumeFeedback
                            ? _volumeFeedbackBar(player)
                            : const SizedBox.shrink(
                                key: ValueKey('volume-feedback-hidden'),
                              ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _volumeFeedbackBar(PlayerSummary player) {
    final volume = player.volumeLevel?.clamp(0, 100);
    return GlassPill(
      key: const ValueKey('volume-feedback-visible'),
      constraints: const BoxConstraints(maxWidth: 300),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            volume == 0 ? CupertinoIcons.speaker_slash : CupertinoIcons.speaker_2,
            color: Colors.white,
            size: GlassTokens.iconSizeS,
          ),
          const SizedBox(width: 12),
          if (volume == null)
            Container(
              width: 144,
              height: 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),
              ),
            )
          else
            SizedBox(
              width: 144,
              child: TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: volume / 100, end: volume / 100),
                duration: const Duration(milliseconds: 320),
                curve: Curves.easeOutCubic,
                builder: (context, animatedVolume, _) => ClipRRect(
                  borderRadius: BorderRadius.circular(999),
                  child: LinearProgressIndicator(
                    value: animatedVolume,
                    minHeight: 5,
                    backgroundColor: Colors.transparent,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          const SizedBox(width: 10),
          Text(
            volume == null ? '—' : '$volume%',
            style: const TextStyle(
              color: Colors.white,
              fontSize: GlassTokens.fontSize12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _playerContent(BuildContext context, PlayerSummary? player) {
    final settingsPage = PlayerSettingsPage(
      serverInfo: serverInfo,
      players: players,
      selectedPlayerId: selectedPlayerId,
      serverAddress:
          Uri.tryParse(repository.serverUrl)?.authority ?? repository.serverUrl,
      deviceName: player?.name,
      clock24HourFormat: clock24HourFormat,
      onClock24HourFormatChanged: onClock24HourFormatChanged,
      onSelectPlayer: onSelectPlayer,
      onSignOut: onDisconnect,
    );
    if (player == null) {
      return _PlayerPages(
        isIdle: true,
        playerName: 'No player selected',
        groupMemberCount: null,
        repository: repository,
        player: null,
        pages: [
          ClockScreensaverPage(alwaysUse24HourFormat: clock24HourFormat),
          const NothingPlayingPage(),
          const NothingPlayingPage(),
          settingsPage,
        ],
      );
    }

    final hasCurrentTrack = player.title?.trim().isNotEmpty ?? false;
    final isPlaying = player.playbackState.toLowerCase() == 'playing';
    final idleHome = IdlePlayerPage(
      key: ValueKey('${repository.serverUrl}:$selectedPlayerId'),
      repository: repository,
      player: player,
      onPlaybackStarted: () => _pagerKey.currentState?._openPlayerPage(),
    );
    final isIdle = !hasCurrentTrack && !isPlaying;
    final nowPlayingLabel = hasCurrentTrack
        ? [
            player.title!.trim(),
            if (player.artist?.trim().isNotEmpty == true) player.artist!.trim(),
          ].join(' · ')
        : isPlaying
        ? 'Music is playing'
        : null;
    final playerView = isIdle
        ? const NothingPlayingPage()
        : NowPlayingPage(
            player: player,
            repository: repository,
            onShowQueue: () => showModalBottomSheet<void>(
              context: context,
              isScrollControlled: true,
              enableDrag: false,
              useSafeArea: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              showDragHandle: false,
              builder: (context) => PlayerQueueSheet(
                repository: repository,
                playerId: player.id,
                initialMediaUri: player.mediaUri,
                onQueueCleared: onQueueCleared,
              ),
            ),
            qualityLabel: qualityLabel,
            playerActionError: playerActionError,
            error: error,
          );
    return _PlayerPages(
      key: _pagerKey,
      isIdle: isIdle,
      playerName: player.name,
      groupMemberCount: player.groupMemberCount,
      repository: repository,
      player: player,
      pages: [
        ClockScreensaverPage(
          nowPlayingLabel: nowPlayingLabel,
          alwaysUse24HourFormat: clock24HourFormat,
        ),
        idleHome,
        playerView,
        settingsPage,
      ],
    );
  }

  Widget _playerDetails(
    PlayerSummary player, {
    required bool centered,
    required bool compact,
    required bool desktop,
  }) {
    final alignment = centered
        ? CrossAxisAlignment.center
        : CrossAxisAlignment.start;
    final textAlign = centered ? TextAlign.center : TextAlign.start;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: alignment,
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            final title = player.title ?? 'Nothing is playing';
            final fontSize = _fitTitleFontSize(
              context,
              title,
              constraints.maxWidth,
              compact: compact,
              desktop: desktop,
            );
            return Text(
              title,
              textAlign: textAlign,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: const Color(0xFFF1F4EA),
                fontSize: fontSize,
                fontWeight: FontWeight.w700,
              ),
            );
          },
        ),
        if (player.artist != null || player.album != null) ...[
          SizedBox(height: compact ? 4 : 8),
          LayoutBuilder(
            builder: (context, constraints) {
              final artist = player.artist?.trim();
              final album = player.album?.trim();
              final hasArtist = artist != null && artist.isNotEmpty;
              final hasAlbum = album != null && album.isNotEmpty;
              final metadata = [
                if (hasArtist) artist,
                if (hasAlbum) album,
              ].join(' \u2014 ');
              final fontSize = _fitMetadataFontSize(
                context,
                metadata,
                constraints.maxWidth,
                compact: compact,
                desktop: desktop,
              );

              return Text.rich(
                TextSpan(
                  style: TextStyle(
                    color: const Color(0xFFD8E0DB),
                    fontSize: fontSize,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    if (hasArtist) TextSpan(text: artist),
                    if (hasArtist && hasAlbum)
                      const TextSpan(
                        text: ' \u2014 ',
                        style: TextStyle(color: Color(0xFF98A49E)),
                      ),
                    if (hasAlbum)
                      TextSpan(
                        text: album,
                        style: const TextStyle(color: Color(0xFFB5C0B9)),
                      ),
                  ],
                ),
                textAlign: textAlign,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              );
            },
          ),
        ],
        SizedBox(height: compact ? 8 : 18),
        GlassPill(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
          tint: const Color(0x22202730),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                player.available == false
                    ? CupertinoIcons.exclamationmark_circle
                    : CupertinoIcons.waveform,
                size: GlassTokens.iconSizeXs,
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
              if (player.volumeLevel != null) ...[
                const SizedBox(width: 14),
                const Icon(
                  CupertinoIcons.speaker_2,
                  size: GlassTokens.iconSizeXs,
                  color: Colors.white,
                ),
                const SizedBox(width: 4),
                Text(
                  '${player.volumeLevel}%',
                  style: const TextStyle(color: Colors.white, fontSize: GlassTokens.fontSize12),
                ),
              ],
            ],
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

  double _fitTitleFontSize(
    BuildContext context,
    String text,
    double maxWidth, {
    required bool compact,
    required bool desktop,
  }) {
    final maximum = desktop
        ? 64.0
        : compact
        ? 28.0
        : 46.0;
    final minimum = desktop
        ? 34.0
        : compact
        ? 18.0
        : 26.0;
    if (!maxWidth.isFinite || maxWidth <= 0) return maximum;

    final direction = Directionality.of(context);
    final textScaler = MediaQuery.textScalerOf(context);
    for (var fontSize = maximum; fontSize > minimum; fontSize -= 1) {
      final painter = TextPainter(
        text: TextSpan(
          text: text,
          style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w700),
        ),
        maxLines: 2,
        ellipsis: '\u2026',
        textDirection: direction,
        textScaler: textScaler,
      )..layout(maxWidth: maxWidth);
      if (!painter.didExceedMaxLines) return fontSize;
    }
    return minimum;
  }

  double _fitMetadataFontSize(
    BuildContext context,
    String text,
    double maxWidth, {
    required bool compact,
    required bool desktop,
  }) {
    final maximum = desktop
        ? 25.0
        : compact
        ? 17.0
        : 20.0;
    final minimum = desktop
        ? 18.0
        : compact
        ? 12.0
        : 15.0;
    if (!maxWidth.isFinite || maxWidth <= 0) return maximum;

    final painterStyle = TextStyle(
      fontSize: maximum,
      fontWeight: FontWeight.w500,
    );
    final direction = Directionality.of(context);
    final textScaler = MediaQuery.textScalerOf(context);
    for (var fontSize = maximum; fontSize > minimum; fontSize -= 1) {
      final painter = TextPainter(
        text: TextSpan(
          text: text,
          style: painterStyle.copyWith(fontSize: fontSize),
        ),
        maxLines: 1,
        ellipsis: '\u2026',
        textDirection: direction,
        textScaler: textScaler,
      )..layout(maxWidth: maxWidth);
      if (!painter.didExceedMaxLines) return fontSize;
    }
    return minimum;
  }
}

class _NothingPlayingView extends StatelessWidget {
  const _NothingPlayingView();

  @override
  Widget build(BuildContext context) => Center(
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

class _PlayerPages extends StatefulWidget {
  const _PlayerPages({
    super.key,
    required this.isIdle,
    required this.playerName,
    required this.groupMemberCount,
    required this.repository,
    required this.player,
    required this.pages,
  });

  final bool isIdle;
  final String playerName;
  final int? groupMemberCount;
  final MusicAssistantRepository repository;
  final PlayerSummary? player;
  final List<Widget> pages;

  @override
  State<_PlayerPages> createState() => _PlayerPagesState();
}

class _PlayerPagesState extends State<_PlayerPages> {
  static const _screensaverDelay = Duration(minutes: 1);

  late final PageController _controller;
  late int _pageIndex;
  bool _showPager = false;
  Timer? _screensaverTimer;

  @override
  void initState() {
    super.initState();
    _pageIndex = widget.isIdle ? 0 : 2;
    _controller = PageController(initialPage: _pageIndex, viewportFraction: 1);
  }

  @override
  void didUpdateWidget(covariant _PlayerPages oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isIdle != widget.isIdle) {
      _screensaverTimer?.cancel();
      final targetPage = widget.isIdle ? 0 : 2;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted || !_controller.hasClients) return;
        _controller.animateToPage(
          targetPage,
          duration: const Duration(milliseconds: 620),
          curve: Curves.easeInOutCubic,
        );
      });
    }
  }

  @override
  void dispose() {
    _screensaverTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollStartNotification &&
        notification.dragDetails != null &&
        !_showPager) {
      setState(() => _showPager = true);
    } else if (notification is ScrollEndNotification && _showPager) {
      setState(() => _showPager = false);
    }
    return false;
  }

  void _onPageChanged(int index) {
    setState(() => _pageIndex = index);
    _screensaverTimer?.cancel();
    if (widget.isIdle && index != 0) {
      _screensaverTimer = Timer(_screensaverDelay, () {
        if (mounted && widget.isIdle && _controller.hasClients) {
          _controller.animateToPage(
            0,
            duration: const Duration(milliseconds: 550),
            curve: Curves.easeOutCubic,
          );
        }
      });
    }
  }

  void _openIdlePage() {
    if (!widget.isIdle || _pageIndex != 0 || !_controller.hasClients) {
      return;
    }
    _controller.animateToPage(
      1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
    );
  }

  void _openPlayerPage() {
    if (!_controller.hasClients) return;
    _controller.animateToPage(
      2,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
    );
  }

  Widget _pageContent(int index) {
    final page = widget.pages[index];
    if (page is ClockScreensaverPage) {
      return ClockScreensaverPage(
        nowPlayingLabel: page.nowPlayingLabel,
        onNowPlayingTap: _openPlayerPage,
        alwaysUse24HourFormat: page.alwaysUse24HourFormat,
      );
    }
    return page;
  }

  Widget _pageBottomControl(BuildContext context, int index) => Positioned(
    left: 0,
    right: 0,
    bottom: 2,
    child: Center(
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 140),
        opacity: _showPager ? 0 : 1,
        child: IgnorePointer(
          ignoring: _showPager,
          child: SizedBox(
            height: 58,
            child: Center(
              child: index == 0 || index == 1 || index == 3
                  ? const SizedBox.shrink()
                  : index == 2
                  ? PlayerNamePill(
                      playerName: widget.playerName,
                      groupMemberCount: widget.groupMemberCount,
                      onTap: widget.player == null
                          ? null
                          : () => showDialog<void>(
                              context: context,
                              builder: (_) => PlayerVolumeDialog(
                                repository: widget.repository,
                                player: widget.player!,
                              ),
                            ),
                    )
                  : const SizedBox.shrink(),
            ),
          ),
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) => Stack(
    fit: StackFit.expand,
    children: [
      NotificationListener<ScrollNotification>(
        onNotification: _handleScrollNotification,
        child: PageView.builder(
          controller: _controller,
          itemCount: widget.pages.length,
          onPageChanged: _onPageChanged,
          itemBuilder: (context, index) => AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              final page = _controller.hasClients
                  ? (_controller.page ?? _pageIndex.toDouble())
                  : _pageIndex.toDouble();
              final distance = (page - index).abs();
              final scale = (1 - distance * 0.36).clamp(0.82, 1.0).toDouble();
              final cornerRadius = (distance * 52).clamp(0.0, 28.0).toDouble();
              final borderAlpha = (distance * 180)
                  .round()
                  .clamp(0, 110)
                  .toInt();
              return Transform.scale(
                scale: scale,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(cornerRadius),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(cornerRadius),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        RepaintBoundary(child: child!),
                        IgnorePointer(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                cornerRadius,
                              ),
                              border: Border.all(
                                color: Color.fromARGB(
                                  borderAlpha,
                                  255,
                                  255,
                                  255,
                                ),
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: index == 0 && widget.isIdle ? _openIdlePage : null,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  _pageContent(index),
                  _pageBottomControl(context, index),
                ],
              ),
            ),
          ),
        ),
      ),
      if (_showPager)
        Positioned(
          left: 0,
          right: 0,
          bottom: 8,
          child: IgnorePointer(
            child: Center(
              child: GlassPill(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
                tint: const Color(0x33202730),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (
                      var index = 0;
                      index < widget.pages.length;
                      index++
                    ) ...[
                      if (index > 0) const SizedBox(width: 7),
                      PageDot(active: _pageIndex == index),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
    ],
  );
}


