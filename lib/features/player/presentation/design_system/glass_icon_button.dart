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
    this.iconSize = 20,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final String? tooltip;
  final double size;
  final double iconSize;

  @override
  Widget build(BuildContext context) => Semantics(
    button: true,
    label: tooltip,
    child: Opacity(
      opacity: onPressed == null ? 0.5 : 1,
      child: GlassSurface(
        borderRadius: GlassTokens.radiusMedium,
        padding: EdgeInsets.zero,
        tint: GlassTokens.surfaceTint,
        showShadow: false,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(GlassTokens.radiusMedium),
            child: SizedBox.square(
              dimension: size,
              child: Icon(
                icon,
                size: iconSize,
                color: GlassTokens.textPrimary,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
