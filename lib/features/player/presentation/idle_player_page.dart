import 'package:flutter/material.dart';

import '../data/music_assistant_repository.dart';
import '../domain/player_summary.dart';
import '../domain/recent_media_item.dart';
import '../domain/radio_station.dart';
import 'artwork_image.dart';
import 'player_glass_widgets.dart';

class IdlePlayerPage extends StatefulWidget {
  const IdlePlayerPage({
    super.key,
    required this.repository,
    required this.player,
    required this.onBrowseRadio,
  });

  final MusicAssistantRepository repository;
  final PlayerSummary player;
  final VoidCallback onBrowseRadio;

  @override
  State<IdlePlayerPage> createState() => _IdlePlayerPageState();
}

class _IdlePlayerPageState extends State<IdlePlayerPage> {
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
                      PageDot(active: _cardIndex == 0),
                      if (count > 1) ...[
                        const SizedBox(width: 7),
                        PageDot(active: _cardIndex == 1),
                      ],
                      if (count > 2) ...[
                        const SizedBox(width: 7),
                        PageDot(active: _cardIndex == 2),
                      ],
                      if (count > 3) ...[
                        const SizedBox(width: 7),
                        PageDot(active: _cardIndex == 3),
                      ],
                      if (count > 4) ...[
                        const SizedBox(width: 7),
                        PageDot(active: _cardIndex == 4),
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
        child: GlassSurface(
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
  Widget build(BuildContext context) => GlassSurface(
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
