import 'package:flutter/material.dart';
import 'package:music_assistant_api/music_assistant_api.dart';
import '../../../design_system/glass_tokens.dart';

import '../data/music_assistant_repository.dart';
import 'player_now_playing_page.dart';
import 'player_queue_sheet.dart';

/// The active playback destination shown by the app-level pager.
class PlayerScreen extends StatefulWidget {
  const PlayerScreen({
    super.key,
    required this.repository,
    required this.player,
    required this.qualityLabel,
    required this.playerActionError,
    required this.error,
    required this.onQueueCleared,
    required this.onDisplayedMediaChanged,
  });

  final MusicAssistantRepository repository;
  final MusicAssistantPlayer player;
  final String? qualityLabel;
  final String? playerActionError;
  final String? error;
  final ValueChanged<String> onQueueCleared;
  final ValueChanged<MusicAssistantPlayerMedia?> onDisplayedMediaChanged;

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: NowPlayingPage(
          player: widget.player,
          onDisplayedMediaChanged: widget.onDisplayedMediaChanged,
          repository: widget.repository,
          onShowQueue: (queueController, playbackController) =>
              showModalBottomSheet<void>(
                context: context,
                isScrollControlled: true,
                sheetAnimationStyle: const AnimationStyle(
                  duration:
                      GlassTokens.playerVolumeSheetTransitionDuration,
                  reverseDuration:
                      GlassTokens.playerVolumeSheetTransitionDuration,
                  curve: Curves.easeOutCubic,
                  reverseCurve: Curves.easeInOutCubic,
                ),
                enableDrag: false,
                useSafeArea: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
                showDragHandle: false,
                builder: (context) => PlayerQueueSheet(
                  repository: widget.repository,
                  queueController: queueController,
                  playbackController: playbackController,
                  playerId: widget.player.playerId,
                  onQueueCleared: widget.onQueueCleared,
                ),
              ),
          qualityLabel: widget.qualityLabel,
          playerActionError: widget.playerActionError,
          error: widget.error,
        ),
      ),
    );
  }
}
