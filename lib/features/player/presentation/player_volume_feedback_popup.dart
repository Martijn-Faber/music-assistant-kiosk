import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_assistant_api/music_assistant_api.dart';

import '../../../design_system/glass_tokens.dart';
import '../viewmodels/player_volume_view_model.dart';
import 'player_glass_widgets.dart';

class PlayerVolumeFeedbackPopup extends StatelessWidget {
  const PlayerVolumeFeedbackPopup({
    super.key,
    required this.player,
    required this.controller,
  });

  final MusicAssistantPlayer player;
  final PlayerVolumeViewModel controller;

  @override
  Widget build(BuildContext context) => Positioned(
    left: 0,
    right: 0,
    top: 12,
    child: AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        final visible = controller.visible;
        return SafeArea(
          bottom: false,
          child: IgnorePointer(
            ignoring: !visible,
            child: Center(
              child: TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: visible ? 1 : 0),
                duration: const Duration(milliseconds: 180),
                curve: Curves.easeInOut,
                child: _VolumeFeedbackBar(player: player),
                builder: (context, progress, child) {
                  return Opacity(
                    opacity: progress,
                    child: FractionalTranslation(
                      translation: Offset(0, -0.18 * (1 - progress)),
                      child: Transform.scale(
                        scale: 0.96 + (0.04 * progress),
                        child: child,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    ),
  );
}

class _VolumeFeedbackBar extends StatelessWidget {
  const _VolumeFeedbackBar({required this.player});

  final MusicAssistantPlayer player;

  @override
  Widget build(BuildContext context) {
    final volume = player.effectiveVolumeLevel?.clamp(0, 100);
    return GlassPill(
      constraints: const BoxConstraints(maxWidth: 300),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            volume == 0
                ? CupertinoIcons.speaker_slash
                : CupertinoIcons.speaker_2,
            color: Colors.white,
            size: GlassTokens.iconSizeS,
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
                tween: Tween<double>(
                  begin: volume / 100,
                  end: volume / 100,
                ),
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
              fontSize: GlassTokens.fontSize12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
