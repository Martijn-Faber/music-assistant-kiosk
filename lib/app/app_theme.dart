import 'package:flutter/material.dart';

abstract final class AppTheme {
  static ThemeData get dark => ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFE9F0EB),
      brightness: Brightness.dark,
      surface: const Color(0xFF172122),
    ),
    scaffoldBackgroundColor: const Color(0xFF101819),
    splashFactory: InkRipple.splashFactory,
    splashColor: Colors.white12,
    highlightColor: Colors.white10,
    hoverColor: Colors.white10,
    useMaterial3: true,
  );
}
