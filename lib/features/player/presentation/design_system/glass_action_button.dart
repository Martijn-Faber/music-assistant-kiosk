import 'package:flutter/material.dart';

import 'glass_surface.dart';
import 'glass_tokens.dart';

class GlassActionButton extends StatelessWidget {
  const GlassActionButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.isLoading = false,
    this.compact = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool isLoading;
  final bool compact;

  @override
  Widget build(BuildContext context) => Opacity(
    opacity: onPressed == null && !isLoading ? 0.56 : 1,
    child: GlassSurface(
      borderRadius: GlassTokens.radiusLarge,
      padding: EdgeInsets.zero,
      tint: GlassTokens.surfaceTint,
      showShadow: false,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(GlassTokens.radiusLarge),
          child: SizedBox(
            height: compact ? 46 : 54,
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (isLoading)
                    const SizedBox.square(
                      dimension: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: GlassTokens.textPrimary,
                      ),
                    )
                  else if (icon != null)
                    Icon(icon, size: 19, color: GlassTokens.textPrimary),
                  if (icon != null || isLoading) const SizedBox(width: 10),
                  Text(
                    label,
                    style: const TextStyle(
                      color: GlassTokens.textPrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
