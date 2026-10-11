import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import 'glass_tokens.dart';

class GlassSurface extends StatelessWidget {
  const GlassSurface({
    super.key,
    required this.child,
    required this.borderRadius,
    this.padding = const EdgeInsets.all(8),
    this.constraints,
    this.tint = const Color(0x33232A30),
    this.border,
    this.blurSigma = 16,
    this.showShadow = true,
  });

  final Widget child;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final BoxConstraints? constraints;
  final Color tint;
  final Border? border;
  final double blurSigma;
  final bool showShadow;

  @override
  Widget build(BuildContext context) {
    final glass = Container(
      padding: padding,
      decoration: BoxDecoration(
        color: tint,
        borderRadius: BorderRadius.circular(borderRadius),
        border: border ?? Border.all(color: GlassTokens.border, width: 0.8),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0x22FFFFFF), Color(0x05FFFFFF)],
        ),
      ),
      child: child,
    );
    return Container(
      constraints: constraints,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: showShadow
            ? const [
                BoxShadow(
                  color: Color(0x33000000),
                  blurRadius: 18,
                  offset: Offset(0, 6),
                ),
              ]
            : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: blurSigma > 0
            ? BackdropFilter(
                filter: ui.ImageFilter.blur(
                  sigmaX: blurSigma,
                  sigmaY: blurSigma,
                ),
                child: glass,
              )
            : glass,
      ),
    );
  }
}
