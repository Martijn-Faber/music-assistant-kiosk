import 'package:flutter/material.dart';

import 'glass_surface.dart';

/// Shared capsule-shaped glass treatment for compact labels and controls.
class GlassPill extends StatelessWidget {
  const GlassPill({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(8),
    this.constraints,
    this.tint = const Color(0x33232A30),
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final BoxConstraints? constraints;
  final Color tint;

  @override
  Widget build(BuildContext context) => GlassSurface(
    borderRadius: 999,
    padding: padding,
    constraints: constraints,
    tint: tint,
    child: child,
  );
}
