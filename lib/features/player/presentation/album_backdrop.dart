import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import 'artwork_image.dart';

class AlbumBackdrop extends StatefulWidget {
  const AlbumBackdrop({
    super.key,
    required this.imageUrl,
    required this.serverUrl,
    required this.token,
    this.palette,
    required this.child,
  });

  final String? imageUrl;
  final String serverUrl;
  final String token;
  final Map<String, dynamic>? palette;
  final Widget child;

  @override
  State<AlbumBackdrop> createState() => _AlbumBackdropState();
}

class _AlbumBackdropState extends State<AlbumBackdrop>
    with SingleTickerProviderStateMixin {
  static const _fallbackColor = Color(0xFF101819);

  late AnimationController _animController;

  @override
  void initState() {
    super.initState();
    // Een rustige, trage cyclus van 45 seconden
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 45),
    )..repeat();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  Color _colorFromRgb(List<dynamic>? rgb, Color fallback) {
    if (rgb == null || rgb.length < 3) return fallback;
    return Color.fromARGB(
      255,
      (rgb[0] as num).toInt().clamp(0, 255),
      (rgb[1] as num).toInt().clamp(0, 255),
      (rgb[2] as num).toInt().clamp(0, 255),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = artworkImageProvider(
      imageUrl: widget.imageUrl,
      serverUrl: widget.serverUrl,
      token: widget.token,
    );

    final bgDarkRgb = widget.palette?['background_dark'];
    final accentRgb = widget.palette?['accent'];
    final primaryRgb = widget.palette?['primary'];

    final baseColor = _colorFromRgb(bgDarkRgb, _fallbackColor);
    final accentColor = _colorFromRgb(accentRgb, baseColor);
    final primaryColor = _colorFromRgb(primaryRgb, accentColor);

    return AnimatedBuilder(
      animation: _animController,
      builder: (context, child) {
        final angle = _animController.value * 2 * math.pi;

        // GEHELE GETALLEN als vermenigvuldigers (1 en 2) garanderen 
        // dat het begin en het einde wiskundig exact op elkaar aansluiten zonder hikken.
        final scaleX = 1.08 + (0.10 * math.sin(angle));
        final scaleY = 1.08 + (0.10 * math.cos(angle * 2));

        // Vloeiende panning met gehele frequenties
        final offsetX = math.cos(angle) * 16.0;
        final offsetY = math.sin(angle * 2) * 12.0;

        return Stack(
          fit: StackFit.expand,
          children: [
            // 1. Basis kleur uit het serverpalet
            AnimatedContainer(
              duration: const Duration(milliseconds: 800),
              color: baseColor,
            ),

            // 2. Naadloos morphing en bewegend achtergrondbeeld
            if (provider != null)
              Positioned.fill(
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..translate(offsetX, offsetY)
                    ..scale(scaleX, scaleY),
                  child: RepaintBoundary(
                    child: ImageFiltered(
                      imageFilter: ui.ImageFilter.blur(sigmaX: 28, sigmaY: 28),
                      child: Image(
                        image: ResizeImage(provider, width: 320, height: 320),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),

            // 3. Sfeervolle kleurovergang gebaseerd op het palet
            Positioned.fill(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 800),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      _withAlpha(accentColor, 140),
                      _withAlpha(primaryColor, 90),
                      _withAlpha(baseColor, 230),
                    ],
                  ),
                ),
              ),
            ),

            // 4. Donkere deklaag voor leesbaarheid
            const Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Color(0x55090D12),
                ),
              ),
            ),

            // 5. De rest van de UI
            widget.child,
          ],
        );
      },
    );
  }

  Color _withAlpha(Color color, int alpha) => Color.fromARGB(
        alpha,
        (color.r * 255).round().clamp(0, 255).toInt(),
        (color.g * 255).round().clamp(0, 255).toInt(),
        (color.b * 255).round().clamp(0, 255).toInt(),
      );
}