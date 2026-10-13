import 'package:flutter/material.dart';

import 'glass_surface.dart';
import 'glass_tokens.dart';

class GlassTextField extends StatelessWidget {
  const GlassTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
    this.focusNode,
    this.hintText,
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.onSubmitted,
    this.suffix,
    this.compact = false,
  });

  final TextEditingController controller;
  final String label;
  final IconData icon;
  final FocusNode? focusNode;
  final String? hintText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final ValueChanged<String>? onSubmitted;
  final Widget? suffix;
  final bool compact;

  @override
  Widget build(BuildContext context) => GlassSurface(
    borderRadius: GlassTokens.radiusLarge,
    padding: EdgeInsets.symmetric(horizontal: compact ? 10 : 14),
    tint: GlassTokens.surfaceTint,
    showShadow: false,
    child: TextField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      obscureText: obscureText,
      onSubmitted: onSubmitted,
      style: const TextStyle(color: GlassTokens.textPrimary, fontSize: 14),
      cursorColor: GlassTokens.textPrimary,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        hintStyle: const TextStyle(color: GlassTokens.textMuted, fontSize: 12),
        labelStyle: const TextStyle(color: GlassTokens.textSecondary, fontSize: 13),
        floatingLabelStyle: const TextStyle(color: GlassTokens.textPrimary),
        prefixIcon: Icon(icon, size: 19, color: GlassTokens.textSecondary),
        prefixIconConstraints: compact
            ? const BoxConstraints(minWidth: 38, minHeight: 38)
            : null,
        suffixIcon: suffix == null
            ? null
            : IconTheme(
                data: const IconThemeData(color: GlassTokens.textSecondary),
                child: suffix!,
              ),
        isDense: compact,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: compact ? 7 : 15,
        ),
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
      ),
    ),
  );
}
