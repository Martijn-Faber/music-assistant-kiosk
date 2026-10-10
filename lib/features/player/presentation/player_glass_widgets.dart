import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class PageDot extends StatelessWidget {
  const PageDot({required this.active});

  final bool active;

  @override
  Widget build(BuildContext context) => AnimatedContainer(
    duration: const Duration(milliseconds: 180),
    width: active ? 16 : 6,
    height: 6,
    decoration: BoxDecoration(
      color: active ? const Color(0xFFE9F0EB) : const Color(0xFF65716E),
      borderRadius: BorderRadius.circular(999),
    ),
  );
}

class PlayerNamePill extends StatelessWidget {
  const PlayerNamePill({required this.playerName});

  final String playerName;

  @override
  Widget build(BuildContext context) => GlassSurface(
    borderRadius: 999,
    constraints: const BoxConstraints(maxWidth: 280),
    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.speaker_outlined, size: 16, color: Color(0xFFE9F0EB)),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            playerName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Color(0xFFE9F0EB),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    ),
  );
}

class GlassSurface extends StatelessWidget {
  const GlassSurface({
    super.key,
    required this.child,
    required this.borderRadius,
    this.padding = const EdgeInsets.all(8),
    this.constraints,
    this.tint = const Color(0x33232A30),
  });

  final Widget child;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final BoxConstraints? constraints;
  final Color tint;

  @override
  Widget build(BuildContext context) => Container(
    constraints: constraints,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(borderRadius),
      boxShadow: const [
        BoxShadow(
          color: Color(0x33000000),
          blurRadius: 18,
          offset: Offset(0, 6),
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: tint,
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(color: const Color(0x66FFFFFF), width: 0.8),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0x22FFFFFF), Color(0x05FFFFFF)],
            ),
          ),
          child: child,
        ),
      ),
    ),
  );
}
