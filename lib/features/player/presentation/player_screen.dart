import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../data/music_assistant_repository.dart';
import '../domain/player_summary.dart';
import '../domain/recent_media_item.dart';
import '../domain/radio_station.dart';
import 'album_backdrop.dart';
import 'artwork_image.dart';
import 'radio_station_picker_dialog.dart';
import 'player_settings_dialog.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({
    super.key,
    required this.repository,
    required this.players,
    required this.selectedPlayerId,
    required this.qualityLabel,
    required this.playerActionError,
    required this.error,
    required this.showVolumeFeedback,
    required this.onSelectPlayer,
    required this.onDisconnect,
  });

  final MusicAssistantRepository repository;
  final List<PlayerSummary> players;
  final String? selectedPlayerId;
  final String? qualityLabel;
  final String? playerActionError;
  final String? error;
  final bool showVolumeFeedback;
  final ValueChanged<String> onSelectPlayer;
  final VoidCallback onDisconnect;

  Future<void> _openSettings(BuildContext context) async {
    final server = Uri.tryParse(repository.serverUrl);
    final player = _selectedPlayer;
    final playerId = await showDialog<String>(
      context: context,
      builder: (context) => PlayerSettingsDialog(
        players: players,
        selectedPlayerId: selectedPlayerId,
        serverAddress: server?.authority ?? repository.serverUrl,
        deviceName: player?.name,
        onSignOut: onDisconnect,
      ),
    );
    if (playerId != null) onSelectPlayer(playerId);
  }

  PlayerSummary? get _selectedPlayer =>
      players.where((player) => player.id == selectedPlayerId).firstOrNull;

  void _handleSwipe(
    BuildContext context,
    DragEndDetails details,
    PlayerSummary player,
  ) {
    if (player.available == false) return;
    final velocity = details.primaryVelocity ?? 0;
    if (velocity.abs() < 180) return;

    final command = velocity < 0
        ? repository.nextTrack(player.id)
        : repository.previousTrack(player.id);
    unawaited(_runPlayerCommand(context, command));
  }

  Future<void> _runPlayerCommand(
    BuildContext context,
    Future<void> command,
  ) async {
    try {
      await command;
    } catch (_) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not control this player.')),
      );
    }
  }

  Future<void> _startRadio(BuildContext context, PlayerSummary player) async {
    try {
      final station = await showDialog<RadioStation>(
        context: context,
        builder: (context) => RadioStationPickerDialog(
          loadStations: repository.fetchRadioStations,
        ),
      );
      if (station == null) return;
      await repository.playRadio(player.id, station);
    } catch (_) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not start that radio station.')),
      );
    }
  }

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
        serverUrl: repository.serverUrl,
        token: repository.token,
        child: Stack(
          fit: StackFit.expand,
          children: [
            SafeArea(child: Center(child: _playerContent(context, player))),
            Positioned(
              top: 12,
              right: 12,
              child: SafeArea(
                child: _GlassSurface(
                  borderRadius: 12,
                  padding: EdgeInsets.zero,
                  child: SizedBox.square(
                    dimension: 36,
                    child: IconButton(
                      tooltip: 'Settings',
                      onPressed: () => _openSettings(context),
                      padding: EdgeInsets.zero,
                      visualDensity: VisualDensity.compact,
                      constraints: const BoxConstraints.tightFor(
                        width: 36,
                        height: 36,
                      ),
                      style: IconButton.styleFrom(
                        foregroundColor: const Color(0xFFE9F0EB),
                        backgroundColor: Colors.transparent,
                      ),
                      icon: const Icon(Icons.settings_outlined, size: 19),
                    ),
                  ),
                ),
              ),
            ),
            if (player != null)
              Positioned(
                left: 0,
                right: 0,
                bottom: 14,
                child: SafeArea(
                  top: false,
                  child: Center(
                    child: _GlassSurface(
                      borderRadius: 999,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 6,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.speaker_outlined,
                            size: 16,
                            color: Color(0xFFE9F0EB),
                          ),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              player.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Color(0xFFE9F0EB),
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
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
    return _GlassSurface(
      key: const ValueKey('volume-feedback-visible'),
      constraints: const BoxConstraints(maxWidth: 300),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
      borderRadius: 999,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            volume == 0 ? Icons.volume_off_rounded : Icons.volume_up_rounded,
            color: Colors.white,
            size: 18,
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
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _playerContent(BuildContext context, PlayerSummary? player) {
    if (player == null) {
      return const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.speaker_group_outlined,
            size: 36,
            color: Color(0xFF83918E),
          ),
          SizedBox(height: 8),
          Text(
            'Choose a player in Settings',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFF1F4EA),
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      );
    }

    final hasCurrentTrack = player.title?.trim().isNotEmpty ?? false;
    final isPlaying = player.playbackState.toLowerCase() == 'playing';
    if (!hasCurrentTrack && !isPlaying) {
      return _IdlePlayerHome(
        key: ValueKey('${repository.serverUrl}:$selectedPlayerId'),
        repository: repository,
        player: player,
        onBrowseRadio: () => _startRadio(context, player),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final wide = constraints.maxWidth > constraints.maxHeight;
        final compact = constraints.maxWidth < 560;
        final desktop = constraints.maxWidth >= 900;
        final artworkSize = desktop
            ? (constraints.maxHeight * 0.64).clamp(200.0, 560.0).toDouble()
            : (constraints.maxHeight - 16)
                  .clamp(compact ? 116.0 : 150.0, compact ? 176.0 : 220.0)
                  .toDouble();
        final artwork = ArtworkImage(
          imageUrl: player.imageUrl,
          serverUrl: repository.serverUrl,
          token: repository.token,
          size: artworkSize,
        );
        final details = _playerDetails(
          player,
          centered: !wide,
          compact: compact,
          desktop: desktop,
        );
        if (wide) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onHorizontalDragEnd: (details) =>
                _handleSwipe(context, details, player),
            child: Padding(
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
            ),
          );
        }

        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onHorizontalDragEnd: (details) =>
              _handleSwipe(context, details, player),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(28),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [artwork, const SizedBox(height: 18), details],
            ),
          ),
        );
      },
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
        _GlassSurface(
          borderRadius: 999,
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
              if (player.volumeLevel != null) ...[
                const SizedBox(width: 14),
                const Icon(
                  Icons.volume_up_outlined,
                  size: 15,
                  color: Colors.white,
                ),
                const SizedBox(width: 4),
                Text(
                  '${player.volumeLevel}%',
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ],
          ),
        ),
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

class _IdlePlayerHome extends StatefulWidget {
  const _IdlePlayerHome({
    super.key,
    required this.repository,
    required this.player,
    required this.onBrowseRadio,
  });

  final MusicAssistantRepository repository;
  final PlayerSummary player;
  final VoidCallback onBrowseRadio;

  @override
  State<_IdlePlayerHome> createState() => _IdlePlayerHomeState();
}

class _IdlePlayerHomeState extends State<_IdlePlayerHome> {
  late Future<_IdleContent> _content;
  late final PageController _pageController;
  int _sectionIndex = 0;
  int _cardIndex = 0;
  String? _startingStationId;

  @override
  void initState() {
    super.initState();
    _content = _loadContent();
    _pageController = PageController();
  }

  Future<_IdleContent> _loadContent() async {
    final results = await Future.wait<Object>([
      widget.repository.fetchRadioStations().catchError(
        (_) => <RadioStation>[],
      ),
      widget.repository.fetchRecentlyPlayed().catchError(
        (_) => <RecentMediaItem>[],
      ),
    ]);
    return _IdleContent(
      stations: (results[0] as List<RadioStation>).take(5).toList(),
      recentItems: (results[1] as List<RecentMediaItem>).take(5).toList(),
    );
  }

  Future<void> _playStation(RadioStation station) async {
    if (_startingStationId != null) return;
    setState(() => _startingStationId = station.id);
    try {
      await widget.repository.playRadio(widget.player.id, station);
    } catch (error, stackTrace) {
      debugPrint('Could not start radio "${station.name}": $error');
      debugPrintStack(stackTrace: stackTrace);
      _showPlayError();
    } finally {
      if (mounted) setState(() => _startingStationId = null);
    }
  }

  Future<void> _playRecent(RecentMediaItem item) async {
    try {
      await widget.repository.playRecentItem(widget.player.id, item);
    } catch (_) {
      _showPlayError();
    }
  }

  void _showPlayError() {
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Could not start playback.')));
  }

  void _selectSection(int index) {
    if (_sectionIndex == index) return;
    if (_pageController.hasClients) _pageController.jumpToPage(0);
    setState(() {
      _sectionIndex = index;
      _cardIndex = 0;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 56, 24, 62),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 620),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: _IdleSectionButton(
                      label: 'RADIO',
                      icon: Icons.radio_outlined,
                      selected: _sectionIndex == 0,
                      onTap: () => _selectSection(0),
                    ),
                  ),
                  const SizedBox(width: 9),
                  Expanded(
                    child: _IdleSectionButton(
                      label: 'RECENTLY PLAYED',
                      icon: Icons.history_rounded,
                      selected: _sectionIndex == 1,
                      onTap: () => _selectSection(1),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: FutureBuilder<_IdleContent>(
                  future: _content,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done) {
                      return const _LoadingCards();
                    }
                    final content =
                        snapshot.data ??
                        const _IdleContent(stations: [], recentItems: []);
                    if (_sectionIndex == 0) {
                      return _FavoriteRadioTab(
                        stations: content.stations.take(3).toList(),
                        repository: widget.repository,
                        playerAvailable: widget.player.available != false,
                        startingStationId: _startingStationId,
                        isStarting: _startingStationId != null,
                        onPlayStation: _playStation,
                        onBrowseRadio: widget.onBrowseRadio,
                      );
                    }
                    final items = content.recentItems;
                    if (items.isEmpty) {
                      return Center(
                        child: _EmptyRow(
                          message: 'Recently played music will show up here.',
                        ),
                      );
                    }
                    return PageView.builder(
                      key: ValueKey(_sectionIndex),
                      controller: _pageController,
                      itemCount: items.length,
                      onPageChanged: (index) =>
                          setState(() => _cardIndex = index),
                      itemBuilder: (context, index) {
                        final item = items[index];
                        final available = widget.player.available != false;
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4,
                            vertical: 4,
                          ),
                          child: _RecentCard(
                            item: item,
                            repository: widget.repository,
                            onTap: available ? () => _playRecent(item) : null,
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              if (_sectionIndex != 0) const SizedBox(height: 8),
              FutureBuilder<_IdleContent>(
                future: _content,
                builder: (context, snapshot) {
                  if (_sectionIndex == 0) return const SizedBox.shrink();
                  final items = snapshot.data?.recentItems;
                  final count = items?.length ?? 0;
                  if (count < 2) return const SizedBox(height: 14);
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _PageDot(active: _cardIndex == 0),
                      if (count > 1) ...[
                        const SizedBox(width: 7),
                        _PageDot(active: _cardIndex == 1),
                      ],
                      if (count > 2) ...[
                        const SizedBox(width: 7),
                        _PageDot(active: _cardIndex == 2),
                      ],
                      if (count > 3) ...[
                        const SizedBox(width: 7),
                        _PageDot(active: _cardIndex == 3),
                      ],
                      if (count > 4) ...[
                        const SizedBox(width: 7),
                        _PageDot(active: _cardIndex == 4),
                      ],
                      const SizedBox(width: 9),
                      Text(
                        '${_cardIndex + 1} / $count',
                        style: const TextStyle(
                          color: Color(0xFFAAB7B4),
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _IdleContent {
  const _IdleContent({required this.stations, required this.recentItems});

  final List<RadioStation> stations;
  final List<RecentMediaItem> recentItems;
}

class _FavoriteRadioTab extends StatelessWidget {
  const _FavoriteRadioTab({
    required this.stations,
    required this.repository,
    required this.playerAvailable,
    required this.startingStationId,
    required this.isStarting,
    required this.onPlayStation,
    required this.onBrowseRadio,
  });

  final List<RadioStation> stations;
  final MusicAssistantRepository repository;
  final bool playerAvailable;
  final String? startingStationId;
  final bool isStarting;
  final Future<void> Function(RadioStation) onPlayStation;
  final VoidCallback onBrowseRadio;

  @override
  Widget build(BuildContext context) => Stack(
    fit: StackFit.expand,
    children: [
      if (stations.isEmpty)
        Center(
          child: _EmptyRow(
            message: 'No radio stations in your Music Assistant library yet.',
          ),
        )
      else
        Row(
          children: [
            for (var index = 0; index < stations.length; index++) ...[
              if (index > 0) const SizedBox(width: 8),
              Expanded(
                child: _RadioCard(
                  station: stations[index],
                  repository: repository,
                  isLoading: startingStationId == stations[index].id,
                  onTap: playerAvailable && !isStarting
                      ? () => onPlayStation(stations[index])
                      : null,
                ),
              ),
            ],
          ],
        ),
      Positioned(
        right: 8,
        top: 8,
        child: _GlassSurface(
          borderRadius: 999,
          padding: EdgeInsets.zero,
          child: TextButton.icon(
            onPressed: onBrowseRadio,
            icon: const Icon(Icons.arrow_forward_rounded, size: 14),
            label: const Text('ALL RADIO'),
            style: TextButton.styleFrom(
              foregroundColor: const Color(0xFFE9F0EB),
              backgroundColor: Colors.transparent,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              textStyle: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

class _IdleSectionButton extends StatelessWidget {
  const _IdleSectionButton({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => _GlassSurface(
    borderRadius: 12,
    padding: EdgeInsets.zero,
    tint: selected ? const Color(0x44FFFFFF) : const Color(0x22202725),
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 16, color: const Color(0xFFE9F0EB)),
            const SizedBox(width: 7),
            Text(
              label,
              style: TextStyle(
                color: const Color(0xFFE9F0EB),
                fontSize: 10,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.6,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class _PageDot extends StatelessWidget {
  const _PageDot({required this.active});

  final bool active;

  @override
  Widget build(BuildContext context) => AnimatedContainer(
    duration: const Duration(milliseconds: 180),
    width: active ? 16 : 6,
    height: 6,
    decoration: BoxDecoration(
      color: active ? const Color(0xFFE9F0EB) : const Color(0xFF65716E),
      borderRadius: BorderRadius.circular(999),
    ),
  );
}

class _RadioCard extends StatelessWidget {
  const _RadioCard({
    required this.station,
    required this.repository,
    required this.onTap,
    required this.isLoading,
  });

  final RadioStation station;
  final MusicAssistantRepository repository;
  final VoidCallback? onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: double.infinity,
    child: Material(
      color: const Color(0xFF1B2727),
      borderRadius: BorderRadius.circular(13),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Stack(
          fit: StackFit.expand,
          children: [
            _artwork(),
            if (isLoading) const ColoredBox(color: Color(0x77000000)),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0x00000000), Color(0xE6000000)],
                  stops: [0.2, 1],
                ),
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: isLoading
                  ? const SizedBox(
                      width: 30,
                      height: 30,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.5,
                        color: Color(0xFFF1F4EA),
                      ),
                    )
                  : _PlayBadge(enabled: onTap != null),
            ),
            Positioned(
              left: 11,
              right: 42,
              bottom: 10,
              child: Text(
                station.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Color(0xFFF1F4EA),
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  shadows: [Shadow(color: Colors.black54, blurRadius: 5)],
                ),
              ),
            ),
            Positioned.fill(
              child: IgnorePointer(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    border: Border.all(color: const Color(0x44FFFFFF)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );

  Widget _artwork() {
    final provider = artworkImageProvider(
      imageUrl: station.imageUrl,
      serverUrl: repository.serverUrl,
      token: repository.token,
    );
    if (provider == null) {
      return const _ArtworkPlaceholder(icon: Icons.radio_rounded);
    }
    return Image(
      image: provider,
      fit: BoxFit.cover,
      errorBuilder: (_, _, _) =>
          const _ArtworkPlaceholder(icon: Icons.radio_rounded),
    );
  }
}

class _RecentCard extends StatelessWidget {
  const _RecentCard({
    required this.item,
    required this.repository,
    required this.onTap,
  });

  final RecentMediaItem item;
  final MusicAssistantRepository repository;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: double.infinity,
    child: Material(
      color: const Color(0xFF1B2727),
      borderRadius: BorderRadius.circular(13),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Stack(
          fit: StackFit.expand,
          children: [
            _artwork(),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0x00000000), Color(0xE6000000)],
                  stops: [0.2, 1],
                ),
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: _PlayBadge(enabled: onTap != null),
            ),
            Positioned(
              left: 11,
              right: 10,
              bottom: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    item.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xFFF1F4EA),
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      shadows: [Shadow(color: Colors.black54, blurRadius: 5)],
                    ),
                  ),
                  if (item.artist != null) ...[
                    const SizedBox(height: 3),
                    Text(
                      item.artist!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color(0xFFD8E0DB),
                        fontSize: 10,
                        shadows: [Shadow(color: Colors.black54, blurRadius: 5)],
                      ),
                    ),
                  ],
                ],
              ),
            ),
            Positioned.fill(
              child: IgnorePointer(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    border: Border.all(color: const Color(0x44FFFFFF)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );

  Widget _artwork() {
    final provider = artworkImageProvider(
      imageUrl: item.imageUrl,
      serverUrl: repository.serverUrl,
      token: repository.token,
    );
    if (provider == null) return const _ArtworkPlaceholder();
    return Image(
      image: provider,
      fit: BoxFit.cover,
      errorBuilder: (_, _, _) => const _ArtworkPlaceholder(),
    );
  }
}

class _ArtworkPlaceholder extends StatelessWidget {
  const _ArtworkPlaceholder({this.icon = Icons.music_note_rounded});

  final IconData icon;

  @override
  Widget build(BuildContext context) => ColoredBox(
    color: Color(0xFF263333),
    child: Center(child: Icon(icon, color: const Color(0xFFCFD7D3), size: 30)),
  );
}

class _PlayBadge extends StatelessWidget {
  const _PlayBadge({required this.enabled});

  final bool enabled;

  @override
  Widget build(BuildContext context) => Container(
    width: 28,
    height: 28,
    decoration: BoxDecoration(
      color: const Color(0x55303840),
      shape: BoxShape.circle,
      border: Border.all(color: const Color(0xAAFFFFFF)),
      boxShadow: const [
        BoxShadow(
          color: Color(0x44000000),
          blurRadius: 8,
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: Icon(
      Icons.play_arrow_rounded,
      size: 18,
      color: enabled ? Colors.white : const Color(0xFF7C8581),
    ),
  );
}

class _GlassSurface extends StatelessWidget {
  const _GlassSurface({
    super.key,
    required this.child,
    required this.borderRadius,
    this.padding = const EdgeInsets.all(8),
    this.constraints,
    this.tint = const Color(0x33232A30),
  });

  final Widget child;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final BoxConstraints? constraints;
  final Color tint;

  @override
  Widget build(BuildContext context) => Container(
    constraints: constraints,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(borderRadius),
      boxShadow: const [
        BoxShadow(
          color: Color(0x33000000),
          blurRadius: 18,
          offset: Offset(0, 6),
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: tint,
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(color: const Color(0x66FFFFFF), width: 0.8),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0x22FFFFFF), Color(0x05FFFFFF)],
            ),
          ),
          child: child,
        ),
      ),
    ),
  );
}

class _LoadingCards extends StatelessWidget {
  const _LoadingCards();

  @override
  Widget build(BuildContext context) => const Center(
    child: SizedBox.square(
      dimension: 20,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        color: Color(0xFFE9F0EB),
      ),
    ),
  );
}

class _EmptyRow extends StatelessWidget {
  const _EmptyRow({required this.message, this.action, this.onPressed});

  final String message;
  final String? action;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
    decoration: BoxDecoration(
      color: const Color(0x661B2727),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      children: [
        Expanded(
          child: Text(
            message,
            style: const TextStyle(color: Color(0xFFAAB7B4), fontSize: 11),
          ),
        ),
        if (action != null)
          TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              foregroundColor: const Color(0xFFE9F0EB),
            ),
            child: Text(action!, style: const TextStyle(fontSize: 10)),
          ),
      ],
    ),
  );
}
