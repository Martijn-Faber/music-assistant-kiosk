import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import 'artwork_image.dart';

class AlbumBackdrop extends StatelessWidget {
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

  static const _fallbackColor = Color(0xFF101819);

  Color _colorFromRgb(List<dynamic>? rgb, Color fallback) {
    if (rgb == null || rgb.length < 3) return fallback;
    return Color.fromARGB(
      255,
      (rgb[0] as num).toInt().clamp(0, 255),
      (rgb[1] as num).toInt().clamp(0, 255),
      (rgb[2] as num).toInt().clamp(0, 255),
    );
  }

  Color _withAlpha(Color color, int alpha) => Color.fromARGB(
    alpha,
    (color.r * 255).round().clamp(0, 255).toInt(),
    (color.g * 255).round().clamp(0, 255).toInt(),
    (color.b * 255).round().clamp(0, 255).toInt(),
  );

  @override
  Widget build(BuildContext context) {
    final provider = artworkImageProvider(
      imageUrl: imageUrl,
      serverUrl: serverUrl,
      token: token,
    );

    final bgDarkRgb = palette?['background_dark'];
    final accentRgb = palette?['accent'];
    final primaryRgb = palette?['primary'];
    final baseColor = _colorFromRgb(bgDarkRgb, _fallbackColor);
    final accentColor = _colorFromRgb(accentRgb, baseColor);
    final primaryColor = _colorFromRgb(primaryRgb, accentColor);

    return Stack(
      fit: StackFit.expand,
      children: [
        ColoredBox(color: baseColor),
        if (provider != null)
          Positioned.fill(
            child: Transform.scale(
              scale: 1.16,
              child: RepaintBoundary(
                child: ImageFiltered(
                  imageFilter: ui.ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                  child: Image(
                    image: ResizeImage(provider, width: 32, height: 32),
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.low,
                  ),
                ),
              ),
            ),
          ),
        Positioned.fill(
          child: DecoratedBox(
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
        const Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(color: Color(0x55090D12)),
          ),
        ),
        child,
      ],
    );
  }
}
