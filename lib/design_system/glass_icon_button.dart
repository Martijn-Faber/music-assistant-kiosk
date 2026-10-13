import 'package:flutter/material.dart';

import 'glass_surface.dart';
import 'glass_tokens.dart';

class GlassIconButton extends StatelessWidget {
  const GlassIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.tooltip,
    this.size = 46,
    this.iconSize = GlassTokens.iconSizeM,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final String? tooltip;
  final double size;
  final double iconSize;

  @override
  Widget build(BuildContext context) => GlassInteractiveSurface(
    borderRadius: GlassTokens.radiusMedium,
    padding: EdgeInsets.zero,
    tint: GlassTokens.surfaceTint,
    onTap: onPressed,
    semanticsLabel: tooltip,
    child: SizedBox.square(
      dimension: size,
      child: Icon(icon, size: iconSize, color: GlassTokens.textPrimary),
    ),
  );
}
