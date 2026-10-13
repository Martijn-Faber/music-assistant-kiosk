import 'package:flutter/material.dart';

import 'glass_tokens.dart';

class GlassPageHeading extends StatelessWidget {
  const GlassPageHeading({
    super.key,
    required this.title,
    required this.subtitle,
    this.compact = false,
  });

  final String title;
  final String subtitle;
  final bool compact;

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: GlassTokens.textPrimary,
          fontSize: compact ? GlassTokens.fontSize23 : GlassTokens.fontSize26,
          height: 1.12,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.5,
        ),
      ),
      if (!compact) ...[
        const SizedBox(height: 7),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: GlassTokens.textSecondary,
            fontSize: GlassTokens.fontSize13,
            height: 1.4,
          ),
        ),
      ],
    ],
  );
}
