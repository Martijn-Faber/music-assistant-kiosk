import 'package:flutter/material.dart';

import 'glass_surface.dart';
import 'glass_tokens.dart';

class GlassInfoRow extends StatelessWidget {
  const GlassInfoRow({
    super.key,
    required this.icon,
    required this.value,
    this.leading,
    this.embedded = false,
  });

  final IconData icon;
  final String value;
  final Widget? leading;
  final bool embedded;

  @override
  Widget build(BuildContext context) {
    final row = Row(
      children: [
        leading ??
            Icon(icon, size: GlassTokens.iconSizeM, color: GlassTokens.textSecondary),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Color(0xFFE9F0EB), fontSize: GlassTokens.fontSize14),
          ),
        ),
      ],
    );
    if (embedded) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        child: row,
      );
    }
    return GlassSurface(
      borderRadius: GlassTokens.radiusMedium,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      tint: GlassTokens.surfaceTintSubtle,
      child: row,
    );
  }
}
