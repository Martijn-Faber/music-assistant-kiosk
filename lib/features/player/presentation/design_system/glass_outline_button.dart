import 'package:flutter/material.dart';

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
    height: 54,
    child: OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        foregroundColor: color,
        side: const BorderSide(color: GlassTokens.border),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(GlassTokens.radiusMedium),
        ),
      ),
    ),
  );
}
