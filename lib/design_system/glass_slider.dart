import 'package:flutter/material.dart';

import 'glass_tokens.dart';

/// Slider with the app's shared glass-theme colors.
class GlassSlider extends StatelessWidget {
  const GlassSlider({
    super.key,
    required this.value,
    required this.onChanged,
    this.min = 0,
    this.max = 1,
    this.divisions,
    this.onChangeStart,
    this.onChangeEnd,
    this.activeColor = GlassTokens.textPrimary,
    this.inactiveColor = const Color(0x55FFFFFF),
  });

  final double value;
  final ValueChanged<double>? onChanged;
  final double min;
  final double max;
  final int? divisions;
  final ValueChanged<double>? onChangeStart;
  final ValueChanged<double>? onChangeEnd;
  final Color activeColor;
  final Color inactiveColor;

  @override
  Widget build(BuildContext context) => SliderTheme(
    data: SliderTheme.of(context).copyWith(
      activeTrackColor: activeColor,
      inactiveTrackColor: inactiveColor,
      thumbColor: activeColor,
      overlayColor: activeColor.withValues(alpha: 0.14),
    ),
    child: Slider(
      value: value.clamp(min, max).toDouble(),
      min: min,
      max: max,
      divisions: divisions,
      onChangeStart: onChangeStart,
      onChanged: onChanged,
      onChangeEnd: onChangeEnd,
    ),
  );
}
