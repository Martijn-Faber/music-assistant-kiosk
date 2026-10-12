import 'package:flutter/material.dart';

import '../data/music_assistant_repository.dart';
import '../domain/player_summary.dart';
import '../domain/playlist.dart';
import '../domain/radio_station.dart';
import 'artwork_image.dart';
import 'artwork_playback_card.dart';
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
  String? _startingStationId;
  String? _startingPlaylistUri;

  @override
  void initState() {
    super.initState();
    _content = _loadContent();
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
      station: (results[0] as List<RadioStation>).firstOrNull,
      playlists: results[1] as List<Playlist>,
    );
  }

  Future<void> _playStation(RadioStation station) async {
    if (_startingStationId != null || _startingPlaylistUri != null) return;
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

  Future<void> _playPlaylist(Playlist playlist) async {
    if (_startingStationId != null || _startingPlaylistUri != null) return;
    setState(() => _startingPlaylistUri = playlist.uri);
    try {
      await widget.repository.playPlaylist(widget.player.id, playlist);
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
                  const _IdleContent(station: null, playlists: []);
              final mainStation = content.station;
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
                          icon: Icons.radio_rounded,
                          trailing: InkWell(
                            onTap: widget.onBrowseRadio,
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 2),
                              child: Text(
                                'ALLE ZENDERS',
                                style: TextStyle(
                                  color: Color(0xFFE9F0EB),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Expanded(
                          child: mainStation != null
                              ? _HeroRadioCard(
                                  station: mainStation,
                                  repository: widget.repository,
                                  isLoading:
                                      _startingStationId == mainStation.id,
                                  onTap: playerAvailable && !isBusy
                                      ? () => _playStation(mainStation)
                                      : null,
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
                          icon: Icons.playlist_play_rounded,
                        ),
                        const SizedBox(height: 8),
                        Expanded(
                          child: playlists.isNotEmpty
                              ? ListView.separated(
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
                                          _startingPlaylistUri == playlist.uri,
                                      onTap: playerAvailable && !isBusy
                                          ? () => _playPlaylist(playlist)
                                          : null,
                                    );
                                  },
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
        Icon(icon, size: 14, color: const Color(0xFFCFD7D3)),
        const SizedBox(width: 6),
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFFCFD7D3),
            fontSize: 10,
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
  const _IdleContent({required this.station, required this.playlists});

  final RadioStation? station;
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
    return ArtworkPlaybackCard(
      artwork: _artwork(),
      isLoading: isLoading,
      onTap: onTap,
      content: Positioned(
        left: 14,
        right: 14,
        bottom: 14,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    station.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xFFF1F4EA),
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      shadows: [Shadow(color: Colors.black87, blurRadius: 6)],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _artwork() {
    final provider = artworkImageProvider(
      imageUrl: station.imageUrl,
      serverUrl: repository.serverUrl,
      token: repository.token,
    );
    if (provider == null) {
      return const _PlaceholderTile(icon: Icons.radio_rounded);
    }
    return Image(
      image: provider,
      fit: BoxFit.cover,
      errorBuilder: (_, _, _) =>
          const _PlaceholderTile(icon: Icons.radio_rounded),
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
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(10),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.white.withValues(alpha: 0.12),
        highlightColor: Colors.white.withValues(alpha: 0.06),
        child: GlassSurface(
          borderRadius: 10,
          padding: EdgeInsets.zero,
          child: Padding(
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
                          fontSize: 14,
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
                            fontSize: 11,
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
                else
                  const Icon(
                    Icons.play_circle_fill_rounded,
                    color: Color(0xFFE9F0EB),
                    size: 26,
                  ),
              ],
            ),
          ),
        ),
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
  const _PlaceholderTile({this.icon = Icons.queue_music_rounded});

  final IconData icon;

  @override
  Widget build(BuildContext context) => ColoredBox(
        color: const Color(0xFF263333),
        child:
            Center(child: Icon(icon, color: const Color(0xFFCFD7D3), size: 20)),
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
            style: const TextStyle(color: Color(0xFFAAB7B4), fontSize: 11),
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
