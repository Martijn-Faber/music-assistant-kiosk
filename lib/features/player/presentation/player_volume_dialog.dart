import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/music_assistant_repository.dart';
import '../viewmodels/player_volume_dialog_view_model.dart';
import 'package:music_assistant_api/music_assistant_api.dart';
import '../../../design_system/glass_design_system.dart'
    show GlassSlider, GlassTokens;
import '../../../design_system/glass_scroll_fade.dart';
import 'player_glass_widgets.dart';
import '../../../l10n/generated/app_localizations.dart';

class PlayerVolumeDialog extends StatefulWidget {
  const PlayerVolumeDialog({
    super.key,
    required this.repository,
    required this.player,
  });

  final MusicAssistantRepository repository;
  final MusicAssistantPlayer player;

  @override
  State<PlayerVolumeDialog> createState() => _PlayerVolumeDialogState();
}

class _PlayerVolumeDialogState extends State<PlayerVolumeDialog> {
  late final PlayerVolumeDialogViewModel _viewModel;
  final Set<String> _addingPlayerIds = {};
  final Set<String> _recentlyAddedPlayerIds = {};
  final Set<String> _dismissingAddedPlayerIds = {};
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _viewModel = PlayerVolumeDialogViewModel(
      repository: widget.repository,
      player: widget.player,
    )..addListener(_onViewModelChanged);
  }

  void _onViewModelChanged() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _viewModel
      ..removeListener(_onViewModelChanged)
      ..dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _saveVolume(String playerId, double value) async {
    try {
      await _viewModel.saveVolume(playerId, value);
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              AppLocalizations.of(context).playerVolumeChangeFailed,
            ),
          ),
        );
      }
    }
  }

  Future<void> _addToGroup(MusicAssistantPlayer player) async {
    setState(() => _addingPlayerIds.add(player.playerId));
    try {
      await _viewModel.addToGroup(player.playerId);
      if (!mounted) return;
      setState(() => _recentlyAddedPlayerIds.add(player.playerId));
      await Future<void>.delayed(const Duration(milliseconds: 380));
      if (mounted) {
        setState(() => _dismissingAddedPlayerIds.add(player.playerId));
        await Future<void>.delayed(const Duration(milliseconds: 220));
      }
      if (mounted) {
        setState(() {
          _recentlyAddedPlayerIds.remove(player.playerId);
          _dismissingAddedPlayerIds.remove(player.playerId);
        });
      }
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '${AppLocalizations.of(context).playerGroupAddFailed}\n$error',
            ),
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _addingPlayerIds.remove(player.playerId));
    }
  }

  @override
  Widget build(BuildContext context) => Dialog(
    backgroundColor: Colors.transparent,
    insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
    child: GlassSurface(
      borderRadius: 24,
      padding: const EdgeInsets.fromLTRB(0, 14, 0, 20),
      tint: const Color(0xEE141D20),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 460,
          maxHeight: MediaQuery.sizeOf(context).height * .78,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      AppLocalizations.of(context).playerVolumeDialogTitle,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: GlassTokens.fontSize20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(
                      CupertinoIcons.xmark,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: FutureBuilder<List<MusicAssistantPlayer>>(
                future: _viewModel.targets,
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
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 24,
                      ),
                      child: Text(
                        AppLocalizations.of(context).playerVolumeLoadFailed,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white70),
                      ),
                    );
                  }
                  final targets = snapshot.data!;
                  return GlassScrollFade(
                    controller: _scrollController,
                    child: ListView(
                      controller: _scrollController,
                      shrinkWrap: true,
                      children: [
                        for (
                          var index = 0;
                          index < targets.length;
                          index++
                        ) ...[
                          if (index > 0)
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Divider(
                                color: Color(0x33FFFFFF),
                                height: 18,
                              ),
                            ),
                          Builder(
                            builder: (context) {
                              final target = targets[index];
                              final volume = _viewModel.volumeFor(
                                target.playerId,
                              );
                              final canSetVolume =
                                  target.supportedFeatures?.contains(
                                    MusicAssistantPlayerFeature.volumeSet,
                                  ) ==
                                  true;
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Column(
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
                                        if (_viewModel.isSaving(
                                          target.playerId,
                                        )) ...[
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
                                          canSetVolume
                                              ? '${volume}%'
                                              : AppLocalizations.of(
                                                  context,
                                                ).playerVolumeUnsupported,
                                          style: const TextStyle(
                                            color: Colors.white70,
                                            fontSize: GlassTokens.fontSize13,
                                            fontFeatures: [
                                              FontFeature.tabularFigures(),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    GlassSlider(
                                      value: volume.toDouble(),
                                      min: 0,
                                      max: 100,
                                      onChangeStart: canSetVolume
                                          ? (_) => _viewModel.setAdjusting(
                                              target.playerId,
                                              true,
                                            )
                                          : null,
                                      onChanged: canSetVolume
                                          ? (value) => _viewModel.previewVolume(
                                              target.playerId,
                                              value,
                                            )
                                          : null,
                                      onChangeEnd: canSetVolume
                                          ? (value) => _saveVolume(
                                              target.playerId,
                                              value,
                                            )
                                          : null,
                                      activeColor: Colors.white,
                                      inactiveColor: const Color(0x55FFFFFF),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Divider(color: Color(0x33FFFFFF), height: 24),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
                          child: Text(
                            AppLocalizations.of(context).playerGroupAddSpeaker,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: GlassTokens.fontSize15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        FutureBuilder<List<MusicAssistantPlayer>>(
                          future: _viewModel.allPlayers,
                          builder: (context, allPlayersSnapshot) {
                            final candidates =
                                (allPlayersSnapshot.data ??
                                        const <MusicAssistantPlayer>[])
                                    .where(
                                      (candidate) =>
                                          candidate.available &&
                                          !candidate.hideInUi &&
                                          (_viewModel.canAddToGroup(candidate) ||
                                              _addingPlayerIds.contains(
                                                candidate.playerId,
                                              ) ||
                                              _recentlyAddedPlayerIds.contains(
                                                candidate.playerId,
                                              )),
                                    )
                                    .toList();
                            if (allPlayersSnapshot.connectionState !=
                                ConnectionState.done) {
                              return const Padding(
                                padding: EdgeInsets.all(12),
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white70,
                                  ),
                                ),
                              );
                            }
                            if (candidates.isEmpty) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 8,
                                ),
                                child: Text(
                                  AppLocalizations.of(
                                    context,
                                  ).playerGroupNoSpeakersAvailable,
                                  style: const TextStyle(color: Colors.white70),
                                ),
                              );
                            }
                            return Column(
                              children: [
                                for (final candidate in candidates)
                                  Builder(
                                    builder: (context) {
                                      final isAdding = _addingPlayerIds
                                          .contains(candidate.playerId);
                                      final wasAdded = _recentlyAddedPlayerIds
                                          .contains(candidate.playerId);
                                      final isDismissing =
                                          _dismissingAddedPlayerIds.contains(
                                            candidate.playerId,
                                          );
                                      return AnimatedSwitcher(
                                        duration:
                                            GlassTokens.playerVolumeContentTransitionDuration,
                                        switchInCurve: Curves.easeOutCubic,
                                        switchOutCurve: Curves.easeInCubic,
                                        transitionBuilder: (child, animation) =>
                                            SizeTransition(
                                              sizeFactor: animation,
                                              axisAlignment: -1,
                                              child: FadeTransition(
                                                opacity: animation,
                                                child: ScaleTransition(
                                                  scale: Tween<double>(
                                                    begin: .985,
                                                    end: 1,
                                                  ).animate(animation),
                                                  child: child,
                                                ),
                                              ),
                                            ),
                                        child: isDismissing
                                            ? const SizedBox(
                                                key: ValueKey('dismissed'),
                                              )
                                            : PlayerInteractiveRow(
                                                key: const ValueKey(
                                                  'speaker-row',
                                                ),
                                                onTap: isAdding || wasAdded
                                                    ? null
                                                    : () => _addToGroup(
                                                        candidate,
                                                      ),
                                                child: ListTile(
                                                  contentPadding:
                                                      const EdgeInsets.symmetric(
                                                        horizontal: 20,
                                                      ),
                                                  leading: const Icon(
                                                    CupertinoIcons.hifispeaker,
                                                    color: Colors.white70,
                                                  ),
                                                  title: Text(
                                                    candidate.name,
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  subtitle: Text(
                                                    candidate.deviceInfo.model,
                                                    style: const TextStyle(
                                                      color: GlassTokens.textSecondary,
                                                      fontSize: GlassTokens.fontSize13,
                                                    ),
                                                  ),
                                                  trailing: IconButton(
                                                    tooltip:
                                                        AppLocalizations.of(
                                                          context,
                                                        ).playerGroupAddAction,
                                                    onPressed:
                                                        isAdding || wasAdded
                                                        ? null
                                                        : () => _addToGroup(
                                                            candidate,
                                                          ),
                                                    icon: AnimatedSwitcher(
                                                      duration:
                                                          GlassTokens
                                                              .playerVolumeContentTransitionDuration,
                                                      switchInCurve:
                                                          Curves.easeOutCubic,
                                                      switchOutCurve:
                                                          Curves.easeInCubic,
                                                      transitionBuilder:
                                                          (
                                                            child,
                                                            animation,
                                                          ) => FadeTransition(
                                                            opacity: animation,
                                                            child: ScaleTransition(
                                                              scale:
                                                                  Tween<double>(
                                                                    begin: .88,
                                                                    end: 1,
                                                                  ).animate(
                                                                    animation,
                                                                  ),
                                                              child: child,
                                                            ),
                                                          ),
                                                      child: wasAdded
                                                          ? const Icon(
                                                              CupertinoIcons
                                                                  .checkmark_circle_fill,
                                                              key: ValueKey(
                                                                'added',
                                                              ),
                                                              color:
                                                                  Colors.white,
                                                            )
                                                          : isAdding
                                                          ? const SizedBox.square(
                                                              key: ValueKey(
                                                                'adding',
                                                              ),
                                                              dimension: 18,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                    strokeWidth:
                                                                        2,
                                                                    color: Colors
                                                                        .white70,
                                                                  ),
                                                            )
                                                          : const Icon(
                                                              CupertinoIcons
                                                                  .add_circled,
                                                              key: ValueKey(
                                                                'available',
                                                              ),
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                      );
                                    },
                                  ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
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
