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
    this.squareBottomCorners = false,
  });

  final Widget child;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final BoxConstraints? constraints;
  final Color tint;
  final Border? border;
  final double blurSigma;
  final bool showShadow;
  final bool squareBottomCorners;

  @override
  Widget build(BuildContext context) {
    final radius = squareBottomCorners
        ? BorderRadius.only(
            topLeft: Radius.circular(borderRadius),
            topRight: Radius.circular(borderRadius),
          )
        : BorderRadius.circular(borderRadius);
    final glass = Container(
      padding: padding,
      decoration: BoxDecoration(
        color: tint,
        borderRadius: radius,
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
        borderRadius: radius,
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
        borderRadius: radius,
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

/// A glass surface with a consistent clipped tap target and ripple.
/// Use this as the base for cards and controls with custom content.
class GlassInteractiveSurface extends StatelessWidget {
  const GlassInteractiveSurface({
    super.key,
    required this.child,
    required this.borderRadius,
    required this.onTap,
    this.padding = const EdgeInsets.all(8),
    this.constraints,
    this.tint = const Color(0x33232A30),
    this.border,
    this.blurSigma = 16,
    this.showShadow = false,
    this.disabledOpacity = 0.56,
    this.semanticsLabel,
  });

  final Widget child;
  final double borderRadius;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  final BoxConstraints? constraints;
  final Color tint;
  final Border? border;
  final double blurSigma;
  final bool showShadow;
  final double disabledOpacity;
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) => Opacity(
    opacity: onTap == null ? disabledOpacity : 1,
    child: Semantics(
      button: true,
      label: semanticsLabel,
      enabled: onTap != null,
      child: GlassSurface(
        borderRadius: borderRadius,
        padding: EdgeInsets.zero,
        constraints: constraints,
        tint: tint,
        border: border,
        blurSigma: blurSigma,
        showShadow: showShadow,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(borderRadius),
            child: Padding(padding: padding, child: child),
          ),
        ),
      ),
    ),
  );
}
