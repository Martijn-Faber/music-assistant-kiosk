import 'package:flutter/cupertino.dart';
import 'package:app/design_system/glass_tokens.dart';
import 'package:flutter/material.dart';

import 'package:app/features/player/data/music_assistant_repository.dart';
import 'package:music_assistant_api/music_assistant_api.dart';
import '../../../design_system/glass_card.dart';
import '../../../design_system/glass_scroll_fade.dart';
import '../../../design_system/glass_surface.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../player/presentation/artwork_image.dart';
import '../../player/presentation/provider_identity.dart';
import '../../player/presentation/player_glass_widgets.dart';

import 'package:app/models/media_item_palette.dart';

String _radioUri(MusicAssistantRadio radio) => radio.uri ?? radio.itemId;

String? _radioImageUrl(MusicAssistantRadio radio) =>
    radio.metadata?.images?.firstOrNull?.path;

String? _radioImageProxyId(MusicAssistantRadio radio) => radio.metadata?.images
    ?.map((image) => image.proxyId)
    .whereType<String>()
    .firstOrNull;

String? _radioProvider(MusicAssistantRadio radio) {
  for (final mapping in radio.providerMappings) {
    final provider = mapping.providerDomain.isNotEmpty
        ? mapping.providerDomain
        : mapping.providerInstance;
    if (provider.isNotEmpty) return provider.split('--').first;
  }
  return null;
}

String? _playlistImageUrl(MusicAssistantPlaylist playlist) =>
    playlist.metadata?.images?.firstOrNull?.path;

class IdlePlayerPage extends StatefulWidget {
  const IdlePlayerPage({
    super.key,
    required this.repository,
    required this.player,
    required this.onPlaybackStarted,
  });

  final MusicAssistantRepository repository;
  final MusicAssistantPlayer player;
  final VoidCallback onPlaybackStarted;

  @override
  State<IdlePlayerPage> createState() => _IdlePlayerPageState();
}

class _IdlePlayerPageState extends State<IdlePlayerPage> {
  late Future<_IdleContent> _content;
  String? _startingStationId;
  String? _startingPlaylistUri;
  final ScrollController _playlistScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _content = _loadContent();
  }

  @override
  void dispose() {
    _playlistScrollController.dispose();
    super.dispose();
  }

  Future<_IdleContent> _loadContent() async {
    final results = await Future.wait<Object>([
      widget.repository.fetchRadioStations().catchError(
        (_) => <MusicAssistantRadio>[],
      ),
      widget.repository.fetchPlaylists().catchError(
        (_) => <MusicAssistantPlaylist>[],
      ),
    ]);
    return _IdleContent(
      stations: (results[0] as List<MusicAssistantRadio>)
          .where((station) => station.favorite)
          .toList(),
      playlists: results[1] as List<MusicAssistantPlaylist>,
    );
  }

  Future<void> _playStation(MusicAssistantRadio station) async {
    if (_startingStationId != null || _startingPlaylistUri != null) return;
    setState(() => _startingStationId = _radioUri(station));
    try {
      await widget.repository.playRadio(widget.player.playerId, station);
      widget.onPlaybackStarted();
    } catch (error, stackTrace) {
      debugPrint('Could not start radio "${station.name}": $error');
      debugPrintStack(stackTrace: stackTrace);
      _showPlayError();
    } finally {
      if (mounted) setState(() => _startingStationId = null);
    }
  }

  Future<void> _playPlaylist(MusicAssistantPlaylist playlist) async {
    if (_startingStationId != null || _startingPlaylistUri != null) return;
    setState(() => _startingPlaylistUri = playlist.uri ?? playlist.itemId);
    try {
      await widget.repository.playPlaylist(widget.player.playerId, playlist);
      widget.onPlaybackStarted();
    } catch (_) {
      _showPlayError();
    } finally {
      if (mounted) setState(() => _startingPlaylistUri = null);
    }
  }

  void _showPlayError() {
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context).idlePlayStartFailed),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final playerAvailable = widget.player.available != false;
    final isBusy = _startingStationId != null || _startingPlaylistUri != null;

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 30, 24, 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: FutureBuilder<_IdleContent>(
            future: _content,
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const _LoadingCards();
              }

              final content =
                  snapshot.data ??
                  const _IdleContent(stations: [], playlists: []);
              final stations = content.stations;
              final playlists = content.playlists;

              return Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSectionHeader(
                          title: l10n.idleStartRadioSection,
                          icon: CupertinoIcons.antenna_radiowaves_left_right,
                        ),
                        const SizedBox(height: 8),
                        Expanded(
                          child: stations.isNotEmpty
                              ? _RadioStationPager(
                                  stations: stations,
                                  repository: widget.repository,
                                  loadingStationId: _startingStationId,
                                  onSelect: playerAvailable && !isBusy
                                      ? _playStation
                                      : null,
                                )
                              : _EmptyPlaceholder(
                                  message: l10n.idleRadioFavoritesEmpty,
                                ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 16),

                  Expanded(
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSectionHeader(
                          title: l10n.idlePlaylistsSection,
                          icon: CupertinoIcons.music_note_list,
                        ),
                        const SizedBox(height: 8),
                        Expanded(
                          child: playlists.isNotEmpty
                              ? GlassScrollFade(
                                  controller: _playlistScrollController,
                                  child: ListView.separated(
                                    controller: _playlistScrollController,
                                    padding: EdgeInsets.zero,
                                    itemCount: playlists.length,
                                    separatorBuilder: (_, __) =>
                                        const SizedBox(height: 8),
                                    itemBuilder: (context, index) {
                                      final playlist = playlists[index];
                                      return _PlaylistRow(
                                        playlist: playlist,
                                        repository: widget.repository,
                                        isLoading:
                                            _startingPlaylistUri ==
                                            (playlist.uri ?? playlist.itemId),
                                        onTap: playerAvailable && !isBusy
                                            ? () => _playPlaylist(playlist)
                                            : null,
                                      );
                                    },
                                  ),
                                )
                              : _EmptyPlaceholder(
                                  message: l10n.idlePlaylistsEmpty,
                                ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader({
    required String title,
    required IconData icon,
    Widget? trailing,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          size: GlassTokens.iconSizeXs,
          color: const Color(0xFFCFD7D3),
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            title.toUpperCase(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Color(0xFFCFD7D3),
              fontSize: GlassTokens.fontSize10,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.8,
            ),
          ),
        ),
        if (trailing != null) ...[const SizedBox(width: 6), trailing],
      ],
    );
  }
}

class _IdleContent {
  const _IdleContent({required this.stations, required this.playlists});

  final List<MusicAssistantRadio> stations;
  final List<MusicAssistantPlaylist> playlists;
}

class _RadioStationPager extends StatefulWidget {
  const _RadioStationPager({
    required this.stations,
    required this.repository,
    required this.loadingStationId,
    required this.onSelect,
  });

  final List<MusicAssistantRadio> stations;
  final MusicAssistantRepository repository;
  final String? loadingStationId;
  final ValueChanged<MusicAssistantRadio>? onSelect;

  @override
  State<_RadioStationPager> createState() => _RadioStationPagerState();
}

class _RadioStationPagerState extends State<_RadioStationPager> {
  int _page = 0;
  final Map<String, MediaItemPalette> _palettes = {};
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _loadPalettes();
  }

  Future<void> _loadPalettes() async {
    final entries = await Future.wait<MapEntry<String, MediaItemPalette>?>(
      widget.stations.map((station) async {
        final imageId = _radioImageProxyId(station);
        if (imageId == null) return null;
        try {
          final palette = await widget.repository.fetchImagePalette(imageId);
          return palette == null ? null : MapEntry(_radioUri(station), palette);
        } catch (_) {
          return null;
        }
      }),
    );
    if (!mounted) return;
    setState(() {
      for (final entry in entries) {
        if (entry != null) _palettes[entry.key] = entry.value;
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Color _paletteColor(MediaItemPalette? palette) =>
      palette?.backgroundDarkColor ??
      palette?.primaryColor ??
      palette?.accentColor ??
      const Color(0xFF27312F);

  @override
  Widget build(BuildContext context) {
    final station = widget.stations[_page.clamp(0, widget.stations.length - 1)];
    final palette = _palettes[_radioUri(station)];
    final background = _paletteColor(palette);
    final surfaceColor = Color.lerp(const Color(0xFF101819), background, 0.7)!;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.lerp(surfaceColor, Colors.white, 0.14)!,
            surfaceColor,
            Color.lerp(surfaceColor, Colors.black, 0.18)!,
          ],
          stops: const [0, 0.48, 1],
        ),
        borderRadius: BorderRadius.circular(GlassTokens.cardRadius),
        border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x22000000),
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
          BoxShadow(color: Color(0x18FFFFFF), blurRadius: 1, spreadRadius: 0.5),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            itemCount: widget.stations.length,
            onPageChanged: (index) => setState(() => _page = index),
            itemBuilder: (context, index) {
              final item = widget.stations[index];
              final provider = artworkImageProvider(
                imageUrl: _radioImageUrl(item),
                serverUrl: widget.repository.serverUrl,
                token: widget.repository.token,
              );
              final isLoading = widget.loadingStationId == _radioUri(item);
              return Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: widget.onSelect == null
                      ? null
                      : () => widget.onSelect!(item),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22,
                      vertical: 16,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: SizedBox(
                            width: 88,
                            height: 88,
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                if (provider == null)
                                  const _PlaceholderTile(
                                    icon: CupertinoIcons
                                        .antenna_radiowaves_left_right,
                                  )
                                else
                                  Image(
                                    image: provider,
                                    fit: BoxFit.cover,
                                    errorBuilder: (_, _, _) =>
                                        const _PlaceholderTile(
                                          icon: CupertinoIcons
                                              .antenna_radiowaves_left_right,
                                        ),
                                  ),
                                if (isLoading)
                                  const ColoredBox(
                                    color: Color(0x77000000),
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 14),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            item.name,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: GlassTokens.fontSize16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          if (widget.stations.length > 1)
            Positioned(
              left: 18,
              top: 0,
              bottom: 0,
              width: 6,
              child: IgnorePointer(
                child: PageIndicator(
                  count: widget.stations.length,
                  currentPage: _page,
                  vertical: true,
                  maxHeightFactor: 0.8,
                ),
              ),
            ),
          if (_radioProvider(station) != null)
            Positioned(
              top: 2,
              right: 2,
              child: IconButton(
                tooltip: AppLocalizations.of(context).idleRadioDetailsTooltip,
                constraints: const BoxConstraints.tightFor(
                  width: 48,
                  height: 48,
                ),
                padding: const EdgeInsets.all(14),
                onPressed: () => showDialog<void>(
                  context: context,
                  builder: (_) => _RadioProviderDetailsDialog(
                    station: station,
                    repository: widget.repository,
                  ),
                ),
                icon: const Icon(
                  CupertinoIcons.info,
                  size: GlassTokens.iconSizeS,
                  color: Colors.white70,
                ),
              ),
            ),
        ],
      ),
    );
  }

}

class _RadioProviderDetailsDialog extends StatelessWidget {
  const _RadioProviderDetailsDialog({
    required this.station,
    required this.repository,
  });

  final MusicAssistantRadio station;
  final MusicAssistantRepository repository;

  @override
  Widget build(BuildContext context) => Dialog(
    backgroundColor: Colors.transparent,
    insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
    child: GlassSurface(
      borderRadius: GlassTokens.radiusLarge,
      padding: const EdgeInsets.fromLTRB(20, 12, 12, 18),
      tint: const Color(0xEE141D20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  AppLocalizations.of(context).idleRadioStationTitle,
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
          const SizedBox(height: 8),
          ProviderIdentity(
            repository: repository,
            providerId: _radioProvider(station),
            iconSize: GlassTokens.iconSizeXl,
            textSize: GlassTokens.fontSize18,
            spacing: 12,
          ),
          const SizedBox(height: 14),
          Text(
            station.name,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: GlassTokens.fontSize14,
            ),
          ),
        ],
      ),
    ),
  );
}

/// Overzichtelijke rij voor favoriete afspeellijsten
class _PlaylistRow extends StatelessWidget {
  const _PlaylistRow({
    required this.playlist,
    required this.repository,
    required this.onTap,
    required this.isLoading,
  });

  final MusicAssistantPlaylist playlist;
  final MusicAssistantRepository repository;
  final VoidCallback? onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      onTap: onTap,
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(width: 52, height: 52, child: _artwork()),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  playlist.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFFF1F4EA),
                    fontSize: GlassTokens.fontSize14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                if (playlist.owner.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(
                    playlist.owner,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xFFAAB7B4),
                      fontSize: GlassTokens.fontSize11,
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (isLoading)
            const Padding(
              padding: EdgeInsets.only(right: 8),
              child: SizedBox.square(
                dimension: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Color(0xFFE9F0EB),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _artwork() {
    final provider = artworkImageProvider(
      imageUrl: _playlistImageUrl(playlist),
      serverUrl: repository.serverUrl,
      token: repository.token,
    );
    if (provider == null) return const _PlaceholderTile();
    return Image(
      image: provider,
      fit: BoxFit.cover,
      errorBuilder: (_, _, _) => const _PlaceholderTile(),
    );
  }
}

class _PlaceholderTile extends StatelessWidget {
  const _PlaceholderTile({this.icon = CupertinoIcons.music_note_list});

  final IconData icon;

  @override
  Widget build(BuildContext context) => ColoredBox(
    color: const Color(0xFF263333),
    child: Center(
      child: Icon(
        icon,
        color: const Color(0xFFCFD7D3),
        size: GlassTokens.iconSizeM,
      ),
    ),
  );
}

class _EmptyPlaceholder extends StatelessWidget {
  const _EmptyPlaceholder({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) => GlassSurface(
    borderRadius: 10,
    child: Center(
      child: Text(
        message,
        style: const TextStyle(
          color: Color(0xFFAAB7B4),
          fontSize: GlassTokens.fontSize11,
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
      dimension: 22,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        color: Color(0xFFE9F0EB),
      ),
    ),
  );
}
