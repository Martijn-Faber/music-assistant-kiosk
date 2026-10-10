import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:palette_generator_plus/palette_generator_plus.dart';

import 'artwork_image.dart';

class AlbumBackdrop extends StatefulWidget {
  const AlbumBackdrop({
    super.key,
    required this.imageUrl,
    required this.serverUrl,
    required this.token,
    required this.child,
  });

  final String? imageUrl;
  final String serverUrl;
  final String token;
  final Widget child;

  @override
  State<AlbumBackdrop> createState() => _AlbumBackdropState();
}

class _AlbumBackdropState extends State<AlbumBackdrop>
    with SingleTickerProviderStateMixin {
  static const _fallbackColor = Color(0xFF263333);

  late final AnimationController _backgroundMotion;
  Color _dominantColor = _fallbackColor;
  Color _vibrantColor = _fallbackColor;
  int _paletteRequest = 0;

  @override
  void initState() {
    super.initState();
    _backgroundMotion = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    );
    _syncBackgroundMotion();
    _extractPalette();
  }

  @override
  void didUpdateWidget(covariant AlbumBackdrop oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.imageUrl != widget.imageUrl ||
        oldWidget.serverUrl != widget.serverUrl ||
        oldWidget.token != widget.token) {
      _paletteRequest++;
      _dominantColor = _fallbackColor;
      _vibrantColor = _fallbackColor;
      _syncBackgroundMotion();
      _extractPalette();
    }
  }

  @override
  void dispose() {
    _backgroundMotion.dispose();
    super.dispose();
  }

  void _syncBackgroundMotion() {
    if (widget.imageUrl?.trim().isNotEmpty == true) {
      if (!_backgroundMotion.isAnimating) {
        _backgroundMotion.repeat(reverse: true);
      }
    } else {
      _backgroundMotion.stop();
      _backgroundMotion.value = 0;
    }
  }

  Future<void> _extractPalette() async {
    final request = ++_paletteRequest;
    final provider = artworkImageProvider(
      imageUrl: widget.imageUrl,
      serverUrl: widget.serverUrl,
      token: widget.token,
    );
    if (provider == null) {
      if (mounted) {
        setState(() {
          _dominantColor = _fallbackColor;
          _vibrantColor = _fallbackColor;
        });
      }
      return;
    }

    try {
      final palette = await PaletteGenerator.fromImageProvider(
        ResizeImage(provider, width: 24, height: 24),
        size: const Size(24, 24),
        maximumColorCount: 5,
        timeout: const Duration(seconds: 4),
        runInIsolate: false,
      );
      if (!mounted || request != _paletteRequest) return;
      setState(() {
        _dominantColor =
            palette.dominantColor?.color ??
            palette.mutedColor?.color ??
            _fallbackColor;
        _vibrantColor =
            palette.vibrantColor?.color ??
            palette.lightVibrantColor?.color ??
            _dominantColor;
      });
    } catch (_) {
      if (mounted && request == _paletteRequest) {
        setState(() {
          _dominantColor = _fallbackColor;
          _vibrantColor = _fallbackColor;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = artworkImageProvider(
      imageUrl: widget.imageUrl,
      serverUrl: widget.serverUrl,
      token: widget.token,
    );
    final vibrantHsl = HSLColor.fromColor(_vibrantColor);
    final dominantHsl = HSLColor.fromColor(_dominantColor);
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
          AnimatedBuilder(
            animation: _backgroundMotion,
            child: ImageFiltered(
              imageFilter: ui.ImageFilter.blur(sigmaX: 38, sigmaY: 38),
              child: Image(image: provider, fit: BoxFit.cover),
            ),
            builder: (context, child) {
              final drift = Curves.easeInOutSine.transform(
                _backgroundMotion.value,
              );
              return Positioned.fill(
                child: ClipRect(
                  child: Transform.translate(
                    offset: Offset((drift - 0.5) * 120, (0.5 - drift) * 84),
                    child: Transform.scale(
                      scale: 1.2 + drift * 0.28,
                      child: child,
                    ),
                  ),
                ),
              );
            },
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
