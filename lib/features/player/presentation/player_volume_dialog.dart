import 'package:flutter/material.dart';

import '../data/music_assistant_repository.dart';
import '../domain/player_summary.dart';
import 'player_glass_widgets.dart';

class PlayerVolumeDialog extends StatefulWidget {
  const PlayerVolumeDialog({
    super.key,
    required this.repository,
    required this.player,
  });

  final MusicAssistantRepository repository;
  final PlayerSummary player;

  @override
  State<PlayerVolumeDialog> createState() => _PlayerVolumeDialogState();
}

class _PlayerVolumeDialogState extends State<PlayerVolumeDialog> {
  late Future<List<PlayerSummary>> _targets;
  final Map<String, int> _volumeLevels = {};
  String? _savingPlayerId;

  @override
  void initState() {
    super.initState();
    _targets = _loadTargets();
  }

  Future<List<PlayerSummary>> _loadTargets() async {
    final players = await widget.repository.fetchPlayers();
    final memberIds = widget.player.groupMembers ?? const <String>[];
    final targets = memberIds.isEmpty
        ? players.where((player) => player.id == widget.player.id).toList()
        : players
              .where(
                (player) =>
                    memberIds.contains(player.id) ||
                    memberIds.contains(player.name),
              )
              .toList();
    final resolvedTargets = targets.isEmpty ? [widget.player] : targets;
    for (final target in resolvedTargets) {
      _volumeLevels[target.id] =
          target.volumeLevel?.clamp(0, 100).toInt() ?? 0;
    }
    return resolvedTargets;
  }

  Future<void> _saveVolume(String playerId, double value) async {
    final volume = value.round().clamp(0, 100).toInt();
    setState(() => _savingPlayerId = playerId);
    try {
      await widget.repository.setPlayerVolume(playerId, volume);
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Could not change this speaker volume: $error'),
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _savingPlayerId = null);
    }
  }

  @override
  Widget build(BuildContext context) => Dialog(
    backgroundColor: Colors.transparent,
    insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
    child: GlassSurface(
      borderRadius: 24,
      padding: const EdgeInsets.fromLTRB(20, 14, 20, 20),
      tint: const Color(0xEE141D20),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 460,
          maxHeight: MediaQuery.sizeOf(context).height * .78,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Speakers & volume',
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
            Flexible(
              child: FutureBuilder<List<PlayerSummary>>(
                future: _targets,
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const SizedBox(
                      height: 140,
                      child: Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      ),
                    );
                  }
                  if (snapshot.hasError || snapshot.data?.isEmpty != false) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Text(
                        'Could not load the speakers for this player.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white70),
                      ),
                    );
                  }
                  final targets = snapshot.data!;
                  return ListView.separated(
                    shrinkWrap: true,
                    itemCount: targets.length,
                    separatorBuilder: (_, _) => const Divider(
                      color: Color(0x33FFFFFF),
                      height: 18,
                    ),
                    itemBuilder: (context, index) {
                      final target = targets[index];
                      final volume = _volumeLevels[target.id] ?? 0;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.speaker_outlined,
                                size: 19,
                                color: Colors.white70,
                              ),
                              const SizedBox(width: 9),
                              Expanded(
                                child: Text(
                                  target.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              if (_savingPlayerId == target.id) ...[
                                const SizedBox.square(
                                  dimension: 14,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white70,
                                  ),
                                ),
                                const SizedBox(width: 9),
                              ],
                              Text(
                                '${volume}%',
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 13,
                                  fontFeatures: [FontFeature.tabularFigures()],
                                ),
                              ),
                            ],
                          ),
                          Slider(
                            value: volume.toDouble(),
                            min: 0,
                            max: 100,
                            onChanged: (value) => setState(
                              () => _volumeLevels[target.id] = value.round(),
                            ),
                            onChangeEnd: (value) =>
                                _saveVolume(target.id, value),
                            activeColor: Colors.white,
                            inactiveColor: const Color(0x55FFFFFF),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
