import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:app/design_system/glass_tokens.dart';
import 'package:flutter/material.dart';
import '../../../l10n/generated/app_localizations.dart';

import '../data/music_assistant_repository.dart';
import '../../screensaver/presentation/clock_screensaver_page.dart';
import '../../idle/presentation/idle_player_page.dart';
import '../../settings/presentation/player_settings_page.dart';
import 'album_backdrop.dart';
import 'player_glass_widgets.dart';
import 'player_now_playing_page.dart';
import 'player_queue_sheet.dart';
import '../viewmodels/player_volume_view_model.dart';
import 'player_volume_feedback_popup.dart';
import 'player_volume_dialog.dart';
import 'package:music_assistant_api/music_assistant_api.dart';

class PlayerScreen extends StatefulWidget {
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
    required this.volumeController,
    required this.clock24HourFormat,
    required this.onClock24HourFormatChanged,
    required this.onLocaleChanged,
    required this.onSelectPlayer,
    required this.onQueueCleared,
    required this.onDisconnect,
  });

  final MusicAssistantRepository repository;
  final MusicAssistantServerInfoMessage? serverInfo;
  final List<MusicAssistantPlayer> players;
  final String? selectedPlayerId;
  final String? qualityLabel;
  final String? playerActionError;
  final String? error;
  final PlayerVolumeViewModel volumeController;
  final bool? clock24HourFormat;
  final ValueChanged<bool?> onClock24HourFormatChanged;
  final ValueChanged<Locale> onLocaleChanged;
  final ValueChanged<String> onSelectPlayer;
  final ValueChanged<String> onQueueCleared;
  final VoidCallback onDisconnect;

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  MusicAssistantRepository get repository => widget.repository;
  MusicAssistantServerInfoMessage? get serverInfo => widget.serverInfo;
  List<MusicAssistantPlayer> get players => widget.players;
  String? get selectedPlayerId => widget.selectedPlayerId;
  String? get qualityLabel => widget.qualityLabel;
  String? get playerActionError => widget.playerActionError;
  String? get error => widget.error;
  PlayerVolumeViewModel get volumeController => widget.volumeController;
  bool? get clock24HourFormat => widget.clock24HourFormat;
  ValueChanged<bool?> get onClock24HourFormatChanged =>
      widget.onClock24HourFormatChanged;
  ValueChanged<Locale> get onLocaleChanged => widget.onLocaleChanged;
  ValueChanged<String> get onSelectPlayer => widget.onSelectPlayer;
  ValueChanged<String> get onQueueCleared => widget.onQueueCleared;
  VoidCallback get onDisconnect => widget.onDisconnect;
  GlobalKey<_PlayerPagesState> get _pagerKey => PlayerScreen._pagerKey;

  MusicAssistantPlayerMedia? _backdropMediaOverride;

  @override
  void didUpdateWidget(covariant PlayerScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedPlayerId != widget.selectedPlayerId ||
        oldWidget.repository != widget.repository) {
      _backdropMediaOverride = null;
    } else if (_backdropMediaOverride != null) {
      final serverMedia = _selectedPlayer?.currentMedia;
      // Keep the local artwork and palette until the server reports the same
      // item, so the backdrop follows a swipe immediately.
      if (serverMedia == null ||
          serverMedia.queueItemId == _backdropMediaOverride!.queueItemId ||
          serverMedia.uri == _backdropMediaOverride!.uri) {
        _backdropMediaOverride = null;
      }
    }
  }

  MusicAssistantPlayer? get _selectedPlayer => players
      .where((player) => player.playerId == selectedPlayerId)
      .firstOrNull;

  @override
  Widget build(BuildContext context) {
    final player = _selectedPlayer;
    final displayedMedia = _backdropMediaOverride ?? player?.currentMedia;
    final isIdle =
        player != null &&
        (player.currentMedia?.title?.trim().isNotEmpty != true) &&
        player.playbackState != MusicAssistantPlaybackState.playing;

    return Scaffold(
      backgroundColor: const Color(0xFF101819),
      body: AlbumBackdrop(
        imageUrl: isIdle ? null : displayedMedia?.imageUrl,
        palette: displayedMedia?.palette,
        serverUrl: repository.serverUrl,
        token: repository.token,
        child: Stack(
          fit: StackFit.expand,
          children: [
            SafeArea(child: Center(child: _playerContent(context, player))),
            if (player != null)
              PlayerVolumeFeedbackPopup(
                player: player,
                controller: volumeController,
              ),
          ],
        ),
      ),
    );
  }

  Widget _playerContent(BuildContext context, MusicAssistantPlayer? player) {
    final l10n = AppLocalizations.of(context);
    final settingsPage = PlayerSettingsPage(
      user: repository.user,
      serverInfo: serverInfo,
      players: players,
      selectedPlayerId: selectedPlayerId,
      serverAddress:
          Uri.tryParse(repository.serverUrl)?.authority ?? repository.serverUrl,
      deviceName: player?.name,
      clock24HourFormat: clock24HourFormat,
      onClock24HourFormatChanged: onClock24HourFormatChanged,
      onLocaleChanged: onLocaleChanged,
      onSelectPlayer: onSelectPlayer,
      onSignOut: onDisconnect,
    );
    if (player == null) {
      return _PlayerPages(
        isIdle: true,
        playerName: l10n.settingsNoPlayerSelectedValue,
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

    final currentMedia = player.currentMedia;
    final hasCurrentTrack = currentMedia?.title?.trim().isNotEmpty ?? false;
    final isPlaying =
        player.playbackState == MusicAssistantPlaybackState.playing;
    final idleHome = IdlePlayerPage(
      key: ValueKey('${repository.serverUrl}:$selectedPlayerId'),
      repository: repository,
      player: player,
      onPlaybackStarted: () => _pagerKey.currentState?._openPlayerPage(),
    );
    final isIdle = !hasCurrentTrack && !isPlaying;
    final nowPlayingLabel = hasCurrentTrack
        ? [
            currentMedia!.title!.trim(),
            if (currentMedia.artist?.trim().isNotEmpty == true)
              currentMedia.artist!.trim(),
          ].join(' · ')
        : isPlaying
        ? l10n.playerMusicIsPlaying
        : null;
    final playerView = isIdle
        ? const NothingPlayingPage()
        : NowPlayingPage(
            player: player,
            onDisplayedMediaChanged: (media) =>
                setState(() => _backdropMediaOverride = media),
            repository: repository,
            onShowQueue: (queueController, playbackController) =>
                showModalBottomSheet<void>(
              context: context,
              isScrollControlled: true,
              sheetAnimationStyle: const AnimationStyle(
                duration: Duration(milliseconds: 240),
                reverseDuration: Duration(milliseconds: 200),
                curve: Curves.easeOutCubic,
                reverseCurve: Curves.easeInOutCubic,
              ),
              enableDrag: false,
              useSafeArea: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              showDragHandle: false,
              builder: (context) => PlayerQueueSheet(
                repository: repository,
                queueController: queueController,
                playbackController: playbackController,
                playerId: player.playerId,
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
      groupMemberCount: (player.groupMembers?.length ?? 0) > 1
          ? player.groupMembers!.length
          : null,
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
    MusicAssistantPlayer player, {
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
            final title = player.currentMedia?.title ??
                AppLocalizations.of(context).playerNothingPlaying;
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
        if (player.currentMedia?.artist != null ||
            player.currentMedia?.album != null) ...[
          SizedBox(height: compact ? 4 : 8),
          LayoutBuilder(
            builder: (context, constraints) {
              final artist = player.currentMedia?.artist?.trim();
              final album = player.currentMedia?.album?.trim();
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
                    ? AppLocalizations.of(context).playerUnavailable
                    : qualityLabel ??
                        AppLocalizations.of(context).playerQualityUnknown,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: GlassTokens.fontSize12,
                ),
              ),
              if (player.effectiveVolumeLevel != null) ...[
                const SizedBox(width: 14),
                const Icon(
                  CupertinoIcons.speaker_2,
                  size: GlassTokens.iconSizeXs,
                  color: Colors.white,
                ),
                const SizedBox(width: 4),
                Text(
                  '${player.effectiveVolumeLevel}%',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: GlassTokens.fontSize12,
                  ),
                ),
              ],
            ],
          ),
        ),
        if (playerActionError != null) ...[
          const SizedBox(height: 8),
          Text(
            playerActionError!,
            style: const TextStyle(
              color: Color(0xFFFF8E7C),
              fontSize: GlassTokens.fontSize11,
            ),
          ),
        ],
        if (error != null) ...[
          const SizedBox(height: 6),
          Text(
            error!,
            style: const TextStyle(
              color: Color(0xFFFF8E7C),
              fontSize: GlassTokens.fontSize11,
            ),
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

    return _fitFontSize(
      context,
      text,
      maxWidth,
      minimum: minimum,
      maximum: maximum,
      maxLines: 2,
      fontWeight: FontWeight.w700,
    );
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

    return _fitFontSize(
      context,
      text,
      maxWidth,
      minimum: minimum,
      maximum: maximum,
      maxLines: 1,
      fontWeight: FontWeight.w500,
    );
  }

  double _fitFontSize(
    BuildContext context,
    String text,
    double maxWidth, {
    required double minimum,
    required double maximum,
    required int maxLines,
    required FontWeight fontWeight,
  }) {
    final direction = Directionality.of(context);
    final textScaler = MediaQuery.textScalerOf(context);
    var low = minimum.toInt();
    var high = maximum.toInt();
    var bestFit = low;

    // Text fit is monotonic by size, so binary search avoids laying out every
    // intermediate font size when player updates rebuild this page.
    while (low <= high) {
      final fontSize = (low + high) ~/ 2;
      final painter = TextPainter(
        text: TextSpan(
          text: text,
          style: TextStyle(
            fontSize: fontSize.toDouble(),
            fontWeight: fontWeight,
          ),
        ),
        maxLines: maxLines,
        ellipsis: '\u2026',
        textDirection: direction,
        textScaler: textScaler,
      )..layout(maxWidth: maxWidth);
      if (painter.didExceedMaxLines) {
        high = fontSize - 1;
      } else {
        bestFit = fontSize;
        low = fontSize + 1;
      }
    }
    return bestFit.toDouble();
  }
}

class _NothingPlayingView extends StatelessWidget {
  const _NothingPlayingView();

  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          CupertinoIcons.waveform,
          size: GlassTokens.iconSizeXl,
          color: Color(0xDDE9F0EB),
        ),
        SizedBox(height: 12),
        Text(
          AppLocalizations.of(context).playerNothingPlaying,
          style: TextStyle(
            color: Color(0xFFF1F4EA),
            fontSize: GlassTokens.fontSize20,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 6),
        Text(
          AppLocalizations.of(context).playerSwipeToChoose,
          style: TextStyle(
            color: Color(0xFFD8E0DB),
            fontSize: GlassTokens.fontSize12,
          ),
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
  final MusicAssistantPlayer? player;
  final List<Widget> pages;

  @override
  State<_PlayerPages> createState() => _PlayerPagesState();
}

class _PlayerPagesState extends State<_PlayerPages> {
  static const _screensaverDelay = Duration(minutes: 1);

  late final PageController _controller;
  late int _pageIndex;
  bool _showPager = false;
  double? _dragStartPage;
  Timer? _pagerHideTimer;
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
    _pagerHideTimer?.cancel();
    _screensaverTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollStartNotification &&
        notification.dragDetails != null) {
      _pagerHideTimer?.cancel();
      _dragStartPage = _controller.hasClients
          ? (_controller.page ?? _pageIndex.toDouble())
          : _pageIndex.toDouble();
    } else if (notification is ScrollUpdateNotification &&
        _dragStartPage != null) {
      final currentPage = _controller.hasClients
          ? (_controller.page ?? _pageIndex.toDouble())
          : _pageIndex.toDouble();
      final shouldShowPager = (currentPage - _dragStartPage!).abs() >= 0.15;
      if (shouldShowPager != _showPager) {
        setState(() => _showPager = shouldShowPager);
      }
    } else if (notification is ScrollEndNotification && _dragStartPage != null) {
      _dragStartPage = null;
      if (_showPager) {
        _pagerHideTimer?.cancel();
        _pagerHideTimer = Timer(const Duration(milliseconds: 900), () {
          if (mounted) setState(() => _showPager = false);
        });
      }
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

  Widget _playerSelector(BuildContext context) => PlayerNamePill(
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
  );

  @override
  Widget build(BuildContext context) {
    final showBottomControl = _showPager || _pageIndex == 2;
    return Stack(
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
                              borderRadius: BorderRadius.circular(cornerRadius),
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
                ],
              ),
            ),
          ),
        ),
      ),
      Positioned(
        left: 0,
        right: 0,
        bottom: 2,
        child: IgnorePointer(
          ignoring: !showBottomControl || _pageIndex != 2,
          child: SizedBox(
            height: 58,
            child: Center(
              child: AnimatedSlide(
                duration: const Duration(milliseconds: 140),
                curve: Curves.easeInOut,
                offset: showBottomControl
                    ? Offset.zero
                    : const Offset(0, 0.18),
                child: AnimatedScale(
                  duration: const Duration(milliseconds: 140),
                  curve: Curves.easeInOut,
                  scale: _showPager && _pageIndex != 2 ? 1.08 : 1,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 140),
                    curve: Curves.easeInOut,
                    opacity: showBottomControl ? 1 : 0,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 220),
                      switchInCurve: Curves.easeOutCubic,
                      switchOutCurve: Curves.easeInCubic,
                      transitionBuilder: (child, animation) => FadeTransition(
                        opacity: animation,
                        child: ScaleTransition(
                          scale: animation,
                          child: child,
                        ),
                      ),
                      child: _pageIndex == 2
                          ? KeyedSubtree(
                              key: const ValueKey('player-selector'),
                              child: _playerSelector(context),
                            )
                          : PageIndicator(
                              key: const ValueKey('page-indicator'),
                              count: widget.pages.length,
                              currentPage: _pageIndex,
                              glassPill: true,
                            ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      ],
    );
  }
}
