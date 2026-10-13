import 'package:flutter/cupertino.dart';
import 'package:app/design_system/glass_tokens.dart';
import 'package:flutter/material.dart';
import 'package:app/design_system/glass_tokens.dart';

import 'package:app/features/player/data/music_assistant_repository.dart';
import 'package:app/features/player/domain/player_summary.dart';
import 'package:app/features/player/domain/playlist.dart';
import 'package:app/features/player/domain/radio_station.dart';
import '../../../design_system/glass_card.dart';
import '../../../design_system/glass_surface.dart';
import '../../player/presentation/artwork_image.dart';

class IdlePlayerPage extends StatefulWidget {
  const IdlePlayerPage({
    super.key,
    required this.repository,
    required this.player,
    required this.onBrowseRadio,
    required this.onPlaybackStarted,
  });

  final MusicAssistantRepository repository;
  final PlayerSummary player;
  final VoidCallback onBrowseRadio;
  final VoidCallback onPlaybackStarted;

  @override
  State<IdlePlayerPage> createState() => _IdlePlayerPageState();
}

class _IdlePlayerPageState extends State<IdlePlayerPage> {
  late Future<_IdleContent> _content;
  String? _startingStationId;
  String? _startingPlaylistUri;
  final ScrollController _playlistScrollController = ScrollController();
  bool _fadePlaylistTop = false;
  bool _fadePlaylistBottom = false;

  @override
  void initState() {
    super.initState();
    _playlistScrollController.addListener(_updatePlaylistFades);
    _content = _loadContent();
  }

  void _updatePlaylistFades() {
    if (!_playlistScrollController.hasClients) return;
    final position = _playlistScrollController.position;
    if (!position.hasContentDimensions) return;
    final fadeTop = position.pixels > 1;
    final fadeBottom = position.extentAfter > 1;
    if (fadeTop != _fadePlaylistTop || fadeBottom != _fadePlaylistBottom) {
      setState(() {
        _fadePlaylistTop = fadeTop;
        _fadePlaylistBottom = fadeBottom;
      });
    }
  }

  @override
  void dispose() {
    _playlistScrollController
      ..removeListener(_updatePlaylistFades)
      ..dispose();
    super.dispose();
  }

  Future<_IdleContent> _loadContent() async {
    final results = await Future.wait<Object>([
      widget.repository.fetchRadioStations().catchError(
            (_) => <RadioStation>[],
          ),
      widget.repository.fetchPlaylists().catchError(
            (_) => <Playlist>[],
          ),
    ]);
    return _IdleContent(
      stations: (results[0] as List<RadioStation>).take(3).toList(),
      playlists: results[1] as List<Playlist>,
    );
  }

  Future<void> _playStation(RadioStation station) async {
    if (_startingStationId != null || _startingPlaylistUri != null) return;
    setState(() => _startingStationId = station.id);
    try {
      await widget.repository.playRadio(widget.player.id, station);
      widget.onPlaybackStarted();
    } catch (error, stackTrace) {
      debugPrint('Could not start radio "${station.name}": $error');
      debugPrintStack(stackTrace: stackTrace);
      _showPlayError();
    } finally {
      if (mounted) setState(() => _startingStationId = null);
    }
  }

  Future<void> _playPlaylist(Playlist playlist) async {
    if (_startingStationId != null || _startingPlaylistUri != null) return;
    setState(() => _startingPlaylistUri = playlist.uri);
    try {
      await widget.repository.playPlaylist(widget.player.id, playlist);
      widget.onPlaybackStarted();
    } catch (_) {
      _showPlayError();
    } finally {
      if (mounted) setState(() => _startingPlaylistUri = null);
    }
  }

  void _showPlayError() {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Kon afspelen niet starten.')),
    );
  }

  @override
  Widget build(BuildContext context) {
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

              final content = snapshot.data ??
                  const _IdleContent(stations: [], playlists: []);
              final stations = content.stations;
              final playlists = content.playlists;

              return Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSectionHeader(
                          title: 'START MET RADIO',
                          icon: CupertinoIcons.antenna_radiowaves_left_right,
                          trailing: InkWell(
                            onTap: widget.onBrowseRadio,
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 2),
                              child: Text(
                                'ALLE ZENDERS',
                                style: TextStyle(
                                  color: Color(0xFFE9F0EB),
                                  fontSize: GlassTokens.fontSize10,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Expanded(
                          child: stations.isNotEmpty
                              ? Column(
                                  children: [
                                    for (var i = 0; i < stations.length; i++) ...[
                                      if (i > 0) const SizedBox(height: 8),
                                      Expanded(
                                        child: _HeroRadioCard(
                                          station: stations[i],
                                          repository: widget.repository,
                                          isLoading: _startingStationId ==
                                              stations[i].id,
                                          onTap: playerAvailable && !isBusy
                                              ? () => _playStation(stations[i])
                                              : null,
                                        ),
                                      ),
                                    ],
                                  ],
                                )
                              : const _EmptyPlaceholder(
                                  message: 'Geen favoriete radio ingesteld',
                                ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 16),

                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSectionHeader(
                          title: 'JOUW PLAYLISTS',
                          icon: CupertinoIcons.music_note_list,
                        ),
                        const SizedBox(height: 8),
                        Expanded(
                          child: playlists.isNotEmpty
                              ? Stack(
                                  children: [
                                    NotificationListener<ScrollMetricsNotification>(
                                      onNotification: (_) {
                                        _updatePlaylistFades();
                                        return false;
                                      },
                                      child: TweenAnimationBuilder<double>(
                                        tween: Tween(
                                          begin: _fadePlaylistTop ? 1 : 0,
                                          end: _fadePlaylistTop ? 1 : 0,
                                        ),
                                        duration: const Duration(
                                          milliseconds: 180,
                                        ),
                                        builder: (context, topFade, child) =>
                                            TweenAnimationBuilder<double>(
                                          tween: Tween(
                                            begin: _fadePlaylistBottom ? 1 : 0,
                                            end: _fadePlaylistBottom ? 1 : 0,
                                          ),
                                          duration: const Duration(
                                            milliseconds: 180,
                                          ),
                                          builder: (context, bottomFade, child) =>
                                              ShaderMask(
                                            blendMode: BlendMode.dstIn,
                                            shaderCallback: (bounds) =>
                                                LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                    Color.lerp(
                                                      Colors.white,
                                                      Colors.transparent,
                                                      topFade,
                                                    )!,
                                                    Colors.white,
                                                    Colors.white,
                                                    Color.lerp(
                                                      Colors.white,
                                                      Colors.transparent,
                                                      bottomFade,
                                                    )!,
                                                  ],
                                                  stops: const [0, 0.16, 0.84, 1],
                                                ).createShader(bounds),
                                            child: child,
                                          ),
                                          child: child,
                                        ),
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
                                                      playlist.uri,
                                              onTap: playerAvailable && !isBusy
                                                  ? () =>
                                                        _playPlaylist(playlist)
                                                  : null,
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : const _EmptyPlaceholder(
                                  message: 'Geen afspeellijsten gevonden',
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
        Icon(icon, size: GlassTokens.iconSizeXs, color: const Color(0xFFCFD7D3)),
        const SizedBox(width: 6),
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFFCFD7D3),
            fontSize: GlassTokens.fontSize10,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.8,
          ),
        ),
        if (trailing != null) ...[
          const Spacer(),
          trailing,
        ],
      ],
    );
  }
}

class _IdleContent {
  const _IdleContent({required this.stations, required this.playlists});

  final List<RadioStation> stations;
  final List<Playlist> playlists;
}

/// Primary quick-start action for the favorite radio station.
class _HeroRadioCard extends StatelessWidget {
  const _HeroRadioCard({
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
  Widget build(BuildContext context) {
    final metadata = station.media['metadata'];
    final palette = station.media['palette'] ??
        (metadata is Map ? metadata['palette'] : null);
    final accent = _accentFromPalette(palette);
    return GlassCard(
      onTap: onTap,
      padding: const EdgeInsets.all(8),
      tint: Color.lerp(const Color(0xFF18201F), accent, 0.48)!,
      blurSigma: 0,
      child: Row(
        children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(width: 72, height: 72, child: _artwork()),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  station.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFFF1F4EA),
                    fontSize: GlassTokens.fontSize16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              if (isLoading)
                const SizedBox.square(
                  dimension: 22,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
              else
                Icon(
                  CupertinoIcons.play_fill,
                  size: GlassTokens.iconSizeS,
                  color: onTap == null
                      ? const Color(0x667F8985)
                      : GlassTokens.textPrimary,
                ),
              const SizedBox(width: 8),
            ],
      ),
    );
  }

  Color _accentFromPalette(dynamic rawPalette) {
    if (rawPalette is! Map) return const Color(0xFF35413E);
    final rgb = rawPalette['accent'] ?? rawPalette['primary'];
    if (rgb is! List || rgb.length < 3 || rgb.take(3).any((v) => v is! num)) {
      return const Color(0xFF35413E);
    }
    return Color.fromARGB(
      255,
      (rgb[0] as num).toInt().clamp(0, 255),
      (rgb[1] as num).toInt().clamp(0, 255),
      (rgb[2] as num).toInt().clamp(0, 255),
    );
  }

  Widget _artwork() {
    final provider = artworkImageProvider(
      imageUrl: station.imageUrl,
      serverUrl: repository.serverUrl,
      token: repository.token,
    );
    if (provider == null) {
      return const _PlaceholderTile(icon: CupertinoIcons.antenna_radiowaves_left_right);
    }
    return Image(
      image: provider,
      fit: BoxFit.cover,
      errorBuilder: (_, _, _) =>
          const _PlaceholderTile(icon: CupertinoIcons.antenna_radiowaves_left_right),
    );
  }
}

/// Overzichtelijke rij voor favoriete afspeellijsten
class _PlaylistRow extends StatelessWidget {
  const _PlaylistRow({
    required this.playlist,
    required this.repository,
    required this.onTap,
    required this.isLoading,
  });

  final Playlist playlist;
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
                      if (playlist.owner != null) ...[
                        const SizedBox(height: 2),
                        Text(
                          playlist.owner!,
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
                  )
              ],
            ),
    );
  }

  Widget _artwork() {
    final provider = artworkImageProvider(
      imageUrl: playlist.imageUrl,
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
        child:
            Center(
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
            style: const TextStyle(color: Color(0xFFAAB7B4), fontSize: GlassTokens.fontSize11),
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
