import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../design_system/glass_card.dart';
import '../../../design_system/glass_tokens.dart';

/// Artwork-backed card used for actions that start playback.
///
/// Owns the shared tap target, artwork treatment, loading feedback, play badge,
/// and border. Callers supply the artwork and the card-specific text overlay.
class ArtworkPlaybackCard extends StatelessWidget {
  const ArtworkPlaybackCard({
    super.key,
    required this.artwork,
    required this.content,
    required this.isLoading,
    required this.onTap,
  });

  final Widget artwork;
  final Widget content;
  final bool isLoading;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: double.infinity,
    child: GlassCard(
      onTap: onTap,
      tint: const Color(0xFF1B2727),
      padding: EdgeInsets.zero,
      blurSigma: 0,
      child: Stack(
          fit: StackFit.expand,
          children: [
            artwork,
            if (isLoading) const ColoredBox(color: Color(0x77000000)),
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
            content,
            Positioned.fill(
              child: IgnorePointer(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(GlassTokens.cardRadius),
                    border: Border.all(color: const Color(0x44FFFFFF)),
                  ),
                ),
              ),
            ),
          ],
        ),
    ),
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
      CupertinoIcons.play,
      size: GlassTokens.iconSizeS,
      color: enabled ? Colors.white : const Color(0xFF7C8581),
    ),
  );
}
