import 'dart:async';

import 'package:flutter/material.dart';

/// A low-motion clock shown while the selected player is idle.
class ClockScreensaverPage extends StatefulWidget {
  const ClockScreensaverPage({super.key});

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
      alwaysUse24HourFormat: MediaQuery.alwaysUse24HourFormatOf(context),
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
                  fontWeight: FontWeight.w300,
                  letterSpacing: -3,
                  height: 1,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              date,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFFD8E0DB),
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 44),
            const Text(
              'Tap to choose something to play',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFAAB7B4),
                fontSize: 13,
                letterSpacing: 0.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
