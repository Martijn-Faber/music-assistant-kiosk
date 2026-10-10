import 'package:flutter/material.dart';

import 'glass_tokens.dart';

class GlassSectionLabel extends StatelessWidget {
  const GlassSectionLabel(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) => Text(
    label,
    style: const TextStyle(
      color: GlassTokens.textMuted,
      fontSize: 11,
      letterSpacing: 1.1,
    ),
  );
}
