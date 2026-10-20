import 'dart:ui' show Color;

import 'package:music_assistant_api/music_assistant_api.dart';

extension MusicAssistantMediaItemPaletteColors
    on MusicAssistantMediaItemPalette {
  Color? get backgroundDarkColor => _toColor(backgroundDark);
  Color? get backgroundLightColor => _toColor(backgroundLight);
  Color? get primaryColor => _toColor(primary);
  Color? get accentColor => _toColor(accent);
  Color? get onDarkColor => _toColor(onDark);
  Color? get onLightColor => _toColor(onLight);

  Color? _toColor(List<int>? value) {
    if (value == null || value.length < 3) return null;
    return Color.fromARGB(
      255,
      value[0].clamp(0, 255),
      value[1].clamp(0, 255),
      value[2].clamp(0, 255),
    );
  }
}
