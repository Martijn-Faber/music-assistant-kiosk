import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/music_assistant_repository.dart';
import '../domain/player_summary.dart';
import '../../../design_system/glass_design_system.dart'
    show GlassSlider, GlassTokens;
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
  final Map<String, DateTime> _ignoreVolumeEventsUntil = {};
  final Set<String> _adjustingPlayerIds = {};
  String? _savingPlayerId;
  late final void Function() _unsubscribe;

  @override
  void initState() {
    super.initState();
    _targets = _loadTargets();
    final targetIds = {widget.player.id, ...?widget.player.groupMembers};
    _unsubscribe = widget.repository.listenToPlayerEvents(
      onChanged: (player) {
        if (!targetIds.contains(player.id) ||
            player.volumeLevel == null ||
            !mounted ||
            _adjustingPlayerIds.contains(player.id) ||
            (_ignoreVolumeEventsUntil[player.id]?.isAfter(DateTime.now()) ??
                false)) {
          return;
        }
        setState(() {
          _volumeLevels[player.id] = player.volumeLevel!.clamp(0, 100);
        });
      },
      onRemoved: (_) {},
    );
  }

  @override
  void dispose() {
    _unsubscribe();
    super.dispose();
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
      _volumeLevels.putIfAbsent(
        target.id,
        () => target.volumeLevel?.clamp(0, 100).toInt() ?? 0,
      );
    }
    return resolvedTargets;
  }

  Future<void> _saveVolume(String playerId, double value) async {
    final volume = value.round().clamp(0, 100).toInt();
    setState(() {
      _savingPlayerId = playerId;
      _adjustingPlayerIds.add(playerId);
      _volumeLevels[playerId] = volume;
    });
    try {
      await widget.repository.setPlayerVolume(playerId, volume);
      _ignoreVolumeEventsUntil[playerId] = DateTime.now().add(
        const Duration(seconds: 2),
      );
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Could not change this speaker volume: $error'),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _savingPlayerId = null;
          _adjustingPlayerIds.remove(playerId);
        });
      }
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
                                CupertinoIcons.hifispeaker,
                                size: GlassTokens.iconSizeM,
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
                                    fontSize: GlassTokens.fontSize15,
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
                                  fontSize: GlassTokens.fontSize13,
                                  fontFeatures: [FontFeature.tabularFigures()],
                                ),
                              ),
                            ],
                          ),
                          GlassSlider(
                            value: volume.toDouble(),
                            min: 0,
                            max: 100,
                            onChangeStart: (_) => setState(
                              () => _adjustingPlayerIds.add(target.id),
                            ),
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
