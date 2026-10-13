import 'package:flutter/material.dart';

import 'glass_surface.dart';
import 'glass_tokens.dart';

class GlassInlineButton extends StatelessWidget {
  const GlassInlineButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.isLoading = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool isLoading;

  @override
  Widget build(BuildContext context) => Opacity(
    opacity: onPressed == null && !isLoading ? 0.56 : 1,
    child: GlassSurface(
      borderRadius: 999,
      padding: EdgeInsets.zero,
      tint: GlassTokens.surfaceTintSubtle,
      showShadow: false,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(999),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isLoading)
                  const SizedBox.square(
                    dimension: 15,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: GlassTokens.textSecondary,
                    ),
                  )
                else if (icon != null)
                  Icon(icon, size: 16, color: GlassTokens.textSecondary),
                if (icon != null || isLoading) const SizedBox(width: 8),
                Text(
                  label,
                  style: const TextStyle(
                    color: GlassTokens.textSecondary,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
