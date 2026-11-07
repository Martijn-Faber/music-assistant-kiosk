import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:music_assistant_api/music_assistant_api.dart';

import '../../../design_system/glass_pill.dart';
import '../../../design_system/glass_surface.dart';
import '../../../design_system/glass_tokens.dart';
import '../../player/domain/media_item_palette_colors.dart';
import '../data/weather_service.dart';

/// Selects a clockface layout independently from the screensaver pager.
class ClockfaceDesign extends StatelessWidget {
  static const designCount = 3;

  const ClockfaceDesign({
    super.key,
    required this.design,
    required this.time,
    required this.date,
    required this.nowPlayingLabel,
    required this.now,
    this.weather,
    this.weatherLocation,
    this.weatherLoading = false,
    this.onNowPlayingTap,
    this.editing = false,
    this.musicPalette,
    this.locale,
  });

  final int design;
  final String time;
  final String date;
  final String nowPlayingLabel;
  final DateTime now;
  final WeatherSnapshot? weather;
  final String? weatherLocation;
  final bool weatherLoading;
  final VoidCallback? onNowPlayingTap;
  final bool editing;
  final MusicAssistantMediaItemPalette? musicPalette;
  final Locale? locale;

  @override
  Widget build(BuildContext context) => TweenAnimationBuilder<Color?>(
    tween: ColorTween(
      end: musicPalette?.accentColor ?? const Color(0xFFF4F4F4),
    ),
    duration: GlassTokens.artworkBackdropTransitionDuration,
    curve: Curves.easeInOutCubic,
    builder: (context, animatedPrimary, _) {
      final dialPaletteColor = animatedPrimary ?? const Color(0xFFF4F4F4);
      return switch (design) {
        1 => _AnalogSplitClockface(time: time, date: date, now: now, weather: weather, weatherLocation: weatherLocation, weatherLoading: weatherLoading, nowPlayingLabel: nowPlayingLabel, dialPaletteColor: dialPaletteColor, musicPalette: musicPalette, onTap: editing ? null : onNowPlayingTap),
        2 => _WideAnalogClockface(
          now: now,
          musicPalette: musicPalette,
          locale: locale ?? Localizations.localeOf(context),
          weather: weather,
        ),
        _ => _ClassicClockface(time: time, date: date, nowPlayingLabel: nowPlayingLabel, onTap: editing ? null : onNowPlayingTap),
      };
    },
  );
}

class _WideAnalogClockface extends StatelessWidget {
  const _WideAnalogClockface({
    required this.now,
    required this.musicPalette,
    required this.locale,
    required this.weather,
  });

  final DateTime now;
  final MusicAssistantMediaItemPalette? musicPalette;
  final Locale locale;
  final WeatherSnapshot? weather;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      final weekday =
          '${DateFormat('EEE', locale.toString()).format(now).toUpperCase()} ${now.day}';
      final labelColor = musicPalette?.onDarkColor ?? GlassTokens.textPrimary;
      final dialRadius = math.min(
        constraints.maxWidth * 0.47,
        constraints.maxHeight * 0.47,
      );
      final weekdayRight = constraints.maxWidth * 0.18 +
          dialRadius * 0.27 * 0.3 +
          constraints.maxWidth * 0.025 +
          GlassTokens.space3;
      final weatherLeft = constraints.maxWidth * 0.18 +
          dialRadius * 0.27 * 0.3 +
          GlassTokens.space3;
      final hasWeather = weather != null;
      return Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: 0,
            right: weekdayRight,
            top: 0,
            bottom: 0,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                weekday,
                style: TextStyle(
                  color: labelColor,
                  fontSize: GlassTokens.fontSize22,
                  fontWeight: GlassTokens.weightBold,
                  letterSpacing: GlassTokens.trackingWide,
                  shadows: const [
                    Shadow(color: Color(0x88000000), blurRadius: 4),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: weatherLeft,
            top: 0,
            bottom: 0,
            width: constraints.maxWidth * 0.24,
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    hasWeather
                        ? _weatherIcon(weather!.code)
                        : CupertinoIcons.cloud_fill,
                    color: hasWeather
                        ? _weatherIconColor(weather!.code)
                        : GlassTokens.textMuted,
                    size: GlassTokens.iconSizeM,
                  ),
                  const SizedBox(width: GlassTokens.space1),
                  Text(
                    hasWeather ? '${weather!.temperature.round()}°' : '—°',
                    style: TextStyle(
                      color: labelColor,
                      fontSize: GlassTokens.fontSize22,
                      fontWeight: GlassTokens.weightBold,
                      shadows: const [
                        Shadow(color: Color(0x88000000), blurRadius: 4),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          _AnalogClock(now: now, palette: musicPalette),
        ],
      );
    },
  );
}

class _AnalogClock extends StatelessWidget {
  const _AnalogClock({required this.now, required this.palette});

  final DateTime now;
  final MusicAssistantMediaItemPalette? palette;

  @override
  Widget build(BuildContext context) => TweenAnimationBuilder<Color?>(
    tween: ColorTween(
      end: palette?.onDarkColor ?? const Color(0xFFF4F4F4),
    ),
    duration: GlassTokens.artworkBackdropTransitionDuration,
    curve: Curves.easeInOutCubic,
    builder: (context, dialColor, _) => TweenAnimationBuilder<Color?>(
      tween: ColorTween(
        end: palette?.backgroundLightColor ?? const Color(0xFFF4F4F4),
      ),
      duration: GlassTokens.artworkBackdropTransitionDuration,
      curve: Curves.easeInOutCubic,
      builder: (context, handsColor, _) => TweenAnimationBuilder<Color?>(
        tween: ColorTween(end: palette?.accentColor ?? const Color(0xFFFF9800)),
        duration: GlassTokens.artworkBackdropTransitionDuration,
        curve: Curves.easeInOutCubic,
        builder: (context, secondsHandColor, _) => CustomPaint(
          painter: _AnalogDialPainter(
            now,
            dialColor ?? const Color(0xFFF4F4F4),
            handsColor ?? const Color(0xFFF4F4F4),
            secondsHandColor ?? const Color(0xFFFF9800),
          ),
        ),
      ),
    ),
  );
}

class _ClassicClockface extends StatelessWidget {
  const _ClassicClockface({required this.time, required this.date, required this.nowPlayingLabel, required this.onTap});
  final String time, date, nowPlayingLabel;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      _ClockTime(time, size: GlassTokens.fontSizeClock),
      const SizedBox(height: 14),
      _ClockDate(date),
      const SizedBox(height: 36),
      _NowPlayingPill(nowPlayingLabel, onTap),
    ],
  );
}

/// A left-aligned layout pairing an analog dial with weather and date details.
class _AnalogSplitClockface extends StatelessWidget {
  const _AnalogSplitClockface({required this.time, required this.date, required this.now, required this.weather, required this.weatherLocation, required this.weatherLoading, required this.nowPlayingLabel, required this.dialPaletteColor, required this.musicPalette, required this.onTap});
  final String time, date, nowPlayingLabel;
  final DateTime now;
  final WeatherSnapshot? weather;
  final String? weatherLocation;
  final bool weatherLoading;
  final Color dialPaletteColor;
  final MusicAssistantMediaItemPalette? musicPalette;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 20),
    child: LayoutBuilder(
      builder: (context, constraints) {
        final dialSize = math.min(
          constraints.maxHeight,
          math.max(0.0, constraints.maxWidth - 28),
        );
        return Row(
          children: [
            SizedBox.square(
              dimension: dialSize,
              child: _AnalogClock(now: now, palette: musicPalette),
            ),
            const SizedBox(width: 28),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (weather != null) ...[
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '${weather!.temperature.round()}°',
                        style: TextStyle(
                          color: dialPaletteColor,
                          fontSize: 84,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -3,
                          height: 1,
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          _weatherIcon(weather!.code),
                          color: _weatherIconColor(weather!.code),
                          size: 28,
                        ),
                        const SizedBox(width: 12),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(_weatherDescription(weather!.code), style: const TextStyle(color: Color(0xFFE2E2E2), fontSize: GlassTokens.fontSize18)),
                              if (weatherLocation?.isNotEmpty == true) Text(weatherLocation!, style: const TextStyle(color: Color(0xFFB9C8C4), fontSize: GlassTokens.fontSize14)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ] else if (weatherLoading || weatherLocation?.isNotEmpty == true) ...[
                    const FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Text('—°', style: TextStyle(color: Color(0xFFF5F5F5), fontSize: 84, fontWeight: FontWeight.w500, letterSpacing: -3, height: 1)),
                    ),
                    const SizedBox(height: 14),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(CupertinoIcons.cloud_fill, color: const Color(0xFFE9F0EB).withValues(alpha: 0.55), size: 28),
                        const SizedBox(width: 12),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(weatherLoading ? 'Loading weather…' : 'Weather unavailable', style: const TextStyle(color: Color(0xFFE2E2E2), fontSize: GlassTokens.fontSize18)),
                              if (weatherLocation?.isNotEmpty == true) Text(weatherLocation!, style: const TextStyle(color: Color(0xFFB9C8C4), fontSize: GlassTokens.fontSize14)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ] else
                    const _WeatherPlaceholder(),
                  const SizedBox(height: 28),
                  Text(date, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Color(0xFFE2E2E2), fontSize: GlassTokens.fontSize14, height: 1.3)),
                  const SizedBox(height: 22),
                  _NowPlayingPill(nowPlayingLabel, onTap),
                ],
              ),
            ),
          ],
        );
      },
    ),
  );
}

String _weatherDescription(int code) => switch (code) {
  0 => 'Clear sky', 1 || 2 => 'Mostly clear', 3 => 'Cloudy',
  45 || 48 => 'Foggy', 51 || 53 || 55 => 'Drizzle',
  61 || 63 || 65 => 'Rain', 71 || 73 || 75 => 'Snow',
  80 || 81 || 82 => 'Showers', 95 || 96 || 99 => 'Thunderstorm',
  _ => 'Current conditions',
};

IconData _weatherIcon(int code) => switch (code) {
  0 => CupertinoIcons.sun_max_fill,
  1 || 2 => CupertinoIcons.cloud_sun_fill,
  3 || 45 || 48 => CupertinoIcons.cloud_fill,
  51 || 53 || 55 => CupertinoIcons.cloud_drizzle_fill,
  61 || 63 || 65 || 80 || 81 || 82 => CupertinoIcons.cloud_rain_fill,
  71 || 73 || 75 || 85 || 86 => CupertinoIcons.snow,
  95 || 96 || 99 => CupertinoIcons.cloud_bolt_fill,
  _ => CupertinoIcons.cloud_fill,
};

Color _weatherIconColor(int code) => code == 0 || code == 1 || code == 2
    ? const Color(0xFFFFD43B)
    : const Color(0xFFE9F0EB);

class _WeatherPlaceholder extends StatelessWidget {
  const _WeatherPlaceholder();
  @override
  Widget build(BuildContext context) => GlassSurface(
    borderRadius: GlassTokens.cardRadius,
    padding: const EdgeInsets.all(GlassTokens.space3),
    tint: GlassTokens.surfaceTintSubtle,
    showShadow: false,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.wb_cloudy_outlined, color: Color(0xFFE9F0EB)),
        const SizedBox(width: GlassTokens.space2),
        const Flexible(
          child: Text(
            'Configure a city in clockface settings',
            style: TextStyle(color: Color(0xFFE9F0EB)),
          ),
        ),
      ],
    ),
  );
}

class _AnalogDialPainter extends CustomPainter {
  const _AnalogDialPainter(
    this.time,
    this.dialColor,
    this.handsColor,
    this.secondsHandColor,
  );
  final DateTime time;
  final Color dialColor;
  final Color handsColor;
  final Color secondsHandColor;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radiusX = size.width * 0.47;
    final radiusY = size.height * 0.47;
    final radius = math.min(radiusX, radiusY);
    final aspectRatio = math.max(
      size.width / size.height,
      size.height / size.width,
    );
    final cornerExponent =
        (6 + (aspectRatio - 1).clamp(0.0, 1.0) * 6).toDouble();
    final tickPaint = Paint()..strokeCap = StrokeCap.round;
    for (var i = 0; i < 60; i++) {
      final angle = i * math.pi / 30 - math.pi / 2;
      final major = i % 5 == 0;
      final direction = Offset(math.cos(angle), math.sin(angle));
      final edgeDistance = (1 /
          math.pow(
            math.pow(direction.dx.abs() / radiusX, cornerExponent) +
                math.pow(direction.dy.abs() / radiusY, cornerExponent),
            1 / cornerExponent,
          )).toDouble();
      final outer = center + direction * edgeDistance;
      final inner = outer - direction * (radius * (major ? 0.29 : 0.125));
      tickPaint
        ..color = major
            ? dialColor
            : GlassTokens.textMuted
        ..strokeWidth = major ? 3 : 2;
      canvas.drawLine(inner, outer, tickPaint);
    }

    final isWideDial = size.width / size.height > 1.2;
    for (final mark in const [(12, '12'), (3, '3'), (6, '6'), (9, '9')]) {
      final angle = mark.$1 * math.pi / 6 - math.pi / 2;
      final labelRadius = isWideDial && (mark.$1 == 3 || mark.$1 == 9)
          ? 0.68
          : 0.57;
      final position = center + Offset(
        math.cos(angle) * radiusX * labelRadius,
        math.sin(angle) * radiusY * labelRadius,
      );
      final text = TextPainter(
        text: TextSpan(text: mark.$2, style: TextStyle(color: dialColor, fontSize: radius * 0.27, fontWeight: FontWeight.w600)),
        textDirection: ui.TextDirection.ltr,
      )..layout();
      text.paint(canvas, position - Offset(text.width / 2, text.height / 2));
    }

    final minute = time.minute + time.second / 60;
    final hour = (time.hour % 12) + minute / 60;
    _hand(canvas, center, hour / 12 * 2 * math.pi - math.pi / 2, radius, 0.46, 11, handsColor);
    _hand(canvas, center, minute / 60 * 2 * math.pi - math.pi / 2, radius, 0.73, 9, handsColor);
    _secondsHand(
      canvas,
      center,
      time.second / 60 * 2 * math.pi - math.pi / 2,
      radius,
      secondsHandColor,
    );
  }

  void _hand(Canvas canvas, Offset center, double angle, double radius, double lengthFraction, double width, Color color) {
    final direction = Offset(math.cos(angle), math.sin(angle));
    final stemEnd = center + direction * radius * lengthFraction * 0.22;
    final tip = center + direction * radius * lengthFraction;
    canvas.save();
    canvas.translate(1.5, 2);
    final shadow = Paint()
      ..color = const Color(0x55000000)
      ..strokeCap = StrokeCap.round
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3);
    canvas.drawLine(center, stemEnd, shadow..strokeWidth = width * 0.62);
    canvas.drawLine(stemEnd, tip, shadow..strokeWidth = width + 2);
    canvas.restore();

    canvas.drawLine(
      center,
      stemEnd,
      Paint()
        ..color = color
        ..strokeWidth = width * 0.62
        ..strokeCap = StrokeCap.round,
    );
    canvas.drawLine(
      stemEnd,
      tip,
      Paint()
        ..color = color
        ..strokeWidth = width
        ..strokeCap = StrokeCap.round,
    );
  }

  void _secondsHand(Canvas canvas, Offset center, double angle, double radius, Color accentColor) {
    final direction = Offset(math.cos(angle), math.sin(angle));
    final width = radius * 0.038;
    final start = center - direction * radius * 0.22;
    final end = center + direction * radius * 0.88;

    canvas.save();
    canvas.translate(1, 1.5);
    canvas.drawLine(
      start,
      end,
      Paint()
        ..color = const Color(0x44000000)
        ..strokeWidth = width + 1
        ..strokeCap = StrokeCap.round
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2),
    );
    canvas.restore();
    canvas.drawCircle(
      center,
      radius * 0.052,
      Paint()..color = const Color(0xFFF4F4F4),
    );
    canvas.drawLine(
      start,
      end,
      Paint()
        ..color = accentColor
        ..strokeWidth = width
        ..strokeCap = StrokeCap.round,
    );
    canvas.drawCircle(center, radius * 0.035, Paint()..color = accentColor);
    canvas.drawCircle(center, radius * 0.016, Paint()..color = const Color(0xFF101010));
  }

  @override
  bool shouldRepaint(covariant _AnalogDialPainter oldDelegate) => oldDelegate.time != time || oldDelegate.dialColor != dialColor || oldDelegate.handsColor != handsColor || oldDelegate.secondsHandColor != secondsHandColor;
}

class _ClockTime extends StatelessWidget {
  const _ClockTime(this.time, {required this.size});
  final String time;
  final double size;

  @override
  Widget build(BuildContext context) => FittedBox(
    fit: BoxFit.scaleDown,
    child: Text(time, style: TextStyle(color: const Color(0xFFF1F4EA), fontSize: size, fontWeight: FontWeight.w700, letterSpacing: -3, height: 1, shadows: const [Shadow(color: Color(0x33000000), blurRadius: 24, offset: Offset(0, 6))])),
  );
}

class _ClockDate extends StatelessWidget {
  const _ClockDate(this.date);
  final String date;
  @override
  Widget build(BuildContext context) => Text(date, textAlign: TextAlign.center, style: const TextStyle(color: Color(0xFFD8E0DB), fontSize: GlassTokens.fontSize18, fontWeight: FontWeight.w500, shadows: [Shadow(color: Color(0x44000000), blurRadius: 8)]));
}

class _NowPlayingPill extends StatelessWidget {
  const _NowPlayingPill(this.label, this.onTap);
  final String label;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) => Material(
    color: Colors.transparent,
    borderRadius: BorderRadius.circular(999),
    clipBehavior: Clip.antiAlias,
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(999),
      child: GlassPill(
    constraints: const BoxConstraints(maxWidth: 360),
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 9),
    tint: const Color(0x22202730),
    child: Row(mainAxisSize: MainAxisSize.min, children: [
      const Icon(CupertinoIcons.music_note, size: GlassTokens.iconSizeS, color: Color(0xFFE9F0EB)),
      const SizedBox(width: 8),
      Flexible(child: Text(label, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Color(0xFFE9F0EB), fontSize: GlassTokens.fontSize12, fontWeight: FontWeight.w500))),
    ]),
      ),
    ),
  );
}
