import 'dart:ui' as ui;

import 'package:app/models/media_item_palette.dart';
import 'package:flutter/material.dart';
import 'package:music_assistant_api/music_assistant_api.dart';

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
  final MusicAssistantMediaItemPalette? palette;
  final Widget child;

  static const _fallbackColor = Color(0xFF101819);

  Color _withAlpha(Color color, int alpha) => color.withAlpha(alpha);

  @override
  Widget build(BuildContext context) {
    final provider = artworkImageProvider(
      imageUrl: imageUrl,
      serverUrl: serverUrl,
      token: token,
    );

    final baseColor =
        MediaItemPalette.toColor(palette?.backgroundDark) ?? _fallbackColor;
    final accentColor =
        MediaItemPalette.toColor(palette?.accent) ?? baseColor;
    final primaryColor =
        MediaItemPalette.toColor(palette?.primary) ?? accentColor;

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
                    // Keep the previous blurred frame visible while refreshed
                    // artwork is loading so metadata updates don't flash the
                    // backdrop to its base color.
                    gaplessPlayback: true,
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
