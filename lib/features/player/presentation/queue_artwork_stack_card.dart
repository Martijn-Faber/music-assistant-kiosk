import 'package:flutter/material.dart';

import '../../../design_system/glass_tokens.dart';
import 'artwork_image.dart';

/// A single artwork surface used by every card in the queue stack.
///
/// Motion and queue selection live in the parent stack widget. This widget
/// keeps repeated image, border, and shadow presentation in one place.
class QueueArtworkStackCard extends StatelessWidget {
  const QueueArtworkStackCard({
    super.key,
    required this.imageUrl,
    required this.serverUrl,
    required this.token,
    required this.size,
    this.glassBorderOpacity = 0,
  });

  final String? imageUrl;
  final String serverUrl;
  final String token;
  final double size;
  final double glassBorderOpacity;

  @override
  Widget build(BuildContext context) => RepaintBoundary(
    child: DecoratedBox(
      position: DecorationPosition.foreground,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Color.lerp(
            Colors.transparent,
            GlassTokens.border,
            glassBorderOpacity,
          )!,
          width: 0.8,
        ),
      ),
      // Keep this shadow-free: a shadow on every transformed card created the
      // visible rectangular halo during queue transitions.
      child: ArtworkImage(
        imageUrl: imageUrl,
        serverUrl: serverUrl,
        token: token,
        size: size,
        showShadow: false,
        gaplessPlayback: false,
        imageSize: 512,
        useLowResolutionPlaceholder: true,
      ),
    ),
  );
}
