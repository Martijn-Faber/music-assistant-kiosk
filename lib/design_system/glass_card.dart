import 'package:flutter/material.dart';

import 'glass_surface.dart';
import 'glass_tokens.dart';

/// Standard interactive card. Its shape and glass treatment stay consistent
/// across features; card content and selected/disabled states remain flexible.
class GlassCard extends StatelessWidget {
  const GlassCard({
    super.key,
    required this.child,
    required this.onTap,
    this.padding = EdgeInsets.zero,
    this.constraints,
    this.tint = GlassTokens.surfaceTint,
    this.border,
    this.showShadow = false,
    this.blurSigma = 16,
    this.disabledOpacity = 1,
    this.semanticsLabel,
  });

  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  final BoxConstraints? constraints;
  final Color tint;
  final Border? border;
  final bool showShadow;
  final double blurSigma;
  final double disabledOpacity;
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) => GlassInteractiveSurface(
    borderRadius: GlassTokens.cardRadius,
    padding: padding,
    constraints: constraints,
    tint: tint,
    border: border,
    showShadow: showShadow,
    blurSigma: blurSigma,
    disabledOpacity: disabledOpacity,
    semanticsLabel: semanticsLabel,
    onTap: onTap,
    child: child,
  );
}
