import 'package:flutter/material.dart';

import 'glass_surface.dart';
import 'glass_tokens.dart';

class GlassOutlineButton extends StatelessWidget {
  const GlassOutlineButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
    this.color = const Color(0xFFFFA294),
  });

  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: double.infinity,
    child: GlassInteractiveSurface(
      borderRadius: GlassTokens.radiusMedium,
      padding: EdgeInsets.zero,
      tint: GlassTokens.surfaceTint,
      border: Border.all(color: GlassTokens.border),
      onTap: onPressed,
      child: SizedBox(
        height: 54,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color),
            const SizedBox(width: 8),
            Text(label, style: TextStyle(color: color)),
          ],
        ),
      ),
    ),
  );
}
