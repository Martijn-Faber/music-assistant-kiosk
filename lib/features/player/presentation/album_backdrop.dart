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

class _AlbumBackdropState extends State<AlbumBackdrop> {
  static const _fallbackColor = Color(0xFF263333);

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

    // Haal de kleuren direct uit het serverpalet indien aanwezig
    final backgroundDarkRgb = widget.palette?['background_dark'];
    final accentRgb = widget.palette?['accent'] ?? widget.palette?['primary'];

    print(accentRgb);

    final dominantColor = _colorFromRgb(backgroundDarkRgb, _fallbackColor);
    final vibrantColor = _colorFromRgb(accentRgb, dominantColor);

    final vibrantHsl = HSLColor.fromColor(vibrantColor);
    final dominantHsl = HSLColor.fromColor(dominantColor);

    final colorWash = vibrantHsl
        .withSaturation(vibrantHsl.saturation.clamp(0.72, 0.96).toDouble())
        .withLightness(vibrantHsl.lightness.clamp(0.3, 0.62).toDouble())
        .toColor();
    final deepWash = dominantHsl
        .withSaturation(dominantHsl.saturation.clamp(0.48, 0.88).toDouble())
        .withLightness(dominantHsl.lightness.clamp(0.2, 0.42).toDouble())
        .toColor();

    return Stack(
      fit: StackFit.expand,
      children: [
        const ColoredBox(color: Color(0xFF101819)),
        if (provider != null)
          Positioned.fill(
            child: RepaintBoundary(
              child: ImageFiltered(
                imageFilter: ui.ImageFilter.blur(sigmaX: 14, sigmaY: 14),
                child: Image(
                  image: ResizeImage(provider, width: 320, height: 320),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        Positioned.fill(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 700),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  _withAlpha(colorWash, 214),
                  _withAlpha(deepWash, 174),
                  const Color(0x80101819),
                ],
              ),
            ),
          ),
        ),
        widget.child,
      ],
    );
  }

  Color _withAlpha(Color color, int alpha) => Color.fromARGB(
        alpha,
        (color.r * 255).round().clamp(0, 255).toInt(),
        (color.g * 255).round().clamp(0, 255).toInt(),
        (color.b * 255).round().clamp(0, 255).toInt(),
      );
}