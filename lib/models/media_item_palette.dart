import 'dart:ui' show Color;

class MediaItemPalette {
  const MediaItemPalette({
    this.backgroundDark,
    this.backgroundLight,
    this.primary,
    this.accent,
    this.onDark,
    this.onLight,
  });

  final List<int>? backgroundDark;
  final List<int>? backgroundLight;
  final List<int>? primary;
  final List<int>? accent;
  final List<int>? onDark;
  final List<int>? onLight;

  factory MediaItemPalette.fromJson(Map<String, dynamic> json) {
    List<int>? rgb(dynamic value) {
      if (value is! List) return null;
      final ints = value.whereType<num>().map((v) => v.toInt()).toList();
      return ints.length == value.length ? ints : null;
    }

    return MediaItemPalette(
      backgroundDark: rgb(json['background_dark']),
      backgroundLight: rgb(json['background_light']),
      primary: rgb(json['primary']),
      accent: rgb(json['accent']),
      onDark: rgb(json['on_dark']),
      onLight: rgb(json['on_light']),
    );
  }
  
  /// Converts an RGB list to a [Color]. Returns null if it has fewer than
  /// 3 values.
  static Color? toColor(List<int>? value) {
    if (value == null || value.length < 3) return null;
    return Color.fromARGB(
      255,
      value[0].clamp(0, 255),
      value[1].clamp(0, 255),
      value[2].clamp(0, 255),
    );
  }

  Color? get backgroundDarkColor => toColor(backgroundDark);
  Color? get backgroundLightColor => toColor(backgroundLight);
  Color? get primaryColor => toColor(primary);
  Color? get accentColor => toColor(accent);
  Color? get onDarkColor => toColor(onDark);
  Color? get onLightColor => toColor(onLight);
}