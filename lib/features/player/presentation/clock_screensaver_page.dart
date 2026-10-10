import 'dart:async';

import 'package:flutter/material.dart';

import 'player_glass_widgets.dart';

/// A low-motion clock shown while the selected player is idle.
class ClockScreensaverPage extends StatefulWidget {
  const ClockScreensaverPage({
    super.key,
    this.nowPlayingLabel,
    this.onNowPlayingTap,
    this.alwaysUse24HourFormat,
  });

  final String? nowPlayingLabel;
  final VoidCallback? onNowPlayingTap;
  final bool? alwaysUse24HourFormat;

  @override
  State<ClockScreensaverPage> createState() => _ClockScreensaverPageState();
}

class _ClockScreensaverPageState extends State<ClockScreensaverPage> {
  late DateTime _now;
  Timer? _clockTimer;

  @override
  void initState() {
    super.initState();
    _now = DateTime.now();
    _clockTimer = Timer.periodic(const Duration(seconds: 15), (_) {
      if (mounted) setState(() => _now = DateTime.now());
    });
  }

  @override
  void dispose() {
    _clockTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final time = MaterialLocalizations.of(context).formatTimeOfDay(
      TimeOfDay.fromDateTime(_now),
      alwaysUse24HourFormat:
          widget.alwaysUse24HourFormat ??
          MediaQuery.alwaysUse24HourFormatOf(context),
    );
    final date = MaterialLocalizations.of(context).formatFullDate(_now);

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                time,
                style: const TextStyle(
                  color: Color(0xFFF1F4EA),
                  fontSize: 88,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -3,
                  height: 1,
                  shadows: [
                    Shadow(
                      color: Color(0x33000000),
                      blurRadius: 24,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 14),
            Text(
              date,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFFD8E0DB),
                fontSize: 18,
                fontWeight: FontWeight.w500,
                shadows: [Shadow(color: Color(0x44000000), blurRadius: 8)],
              ),
            ),
            const SizedBox(height: 36),
            GestureDetector(
              onTap: widget.nowPlayingLabel == null
                  ? null
                  : widget.onNowPlayingTap,
              child: GlassSurface(
                borderRadius: 999,
                constraints: const BoxConstraints(maxWidth: 360),
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 9,
                ),
                tint: const Color(0x22202730),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      widget.nowPlayingLabel == null
                          ? Icons.radio_rounded
                          : Icons.music_note_rounded,
                      size: 16,
                      color: Color(0xFFE9F0EB),
                    ),
                    SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        widget.nowPlayingLabel ?? 'Tap to choose a station',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Color(0xFFE9F0EB),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
