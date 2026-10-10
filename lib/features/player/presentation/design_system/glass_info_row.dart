import 'package:flutter/material.dart';

import 'glass_surface.dart';
import 'glass_tokens.dart';

class GlassInfoRow extends StatelessWidget {
  const GlassInfoRow({super.key, required this.icon, required this.value});

  final IconData icon;
  final String value;

  @override
  Widget build(BuildContext context) => GlassSurface(
    borderRadius: GlassTokens.radiusMedium,
    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
    tint: GlassTokens.surfaceTintSubtle,
    child: Row(
      children: [
        Icon(icon, size: 19, color: GlassTokens.textSecondary),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Color(0xFFE9F0EB), fontSize: 14),
          ),
        ),
      ],
    ),
  );
}
