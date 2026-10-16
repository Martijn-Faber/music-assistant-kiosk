import 'package:flutter/material.dart';

import 'glass_icon_button.dart';
import 'glass_tokens.dart';

/// A selected-state icon button with a shared loading treatment.
///
/// The caller owns the toggle state and action; this widget handles only its
/// presentation and disables interaction while loading.
class GlassIconToggleButton extends StatelessWidget {
  const GlassIconToggleButton({
    super.key,
    required this.icon,
    required this.isSelected,
    required this.onPressed,
    this.selectedIcon,
    this.tooltip,
    this.disabled = false,
    this.isLoading = false,
    this.type = GlassIconButtonType.primary,
    this.size = GlassTokens.iconButtonPrimarySize,
    this.iconSize = GlassTokens.iconSizeM,
  });

  final IconData icon;
  final IconData? selectedIcon;
  final bool isSelected;
  final VoidCallback? onPressed;
  final String? tooltip;
  final bool disabled;
  final bool isLoading;
  final GlassIconButtonType type;
  final double size;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final progressColor = type == GlassIconButtonType.primary
        ? isSelected
              ? GlassTokens.iconButtonPrimaryIconSelected
              : GlassTokens.iconButtonPrimaryIconEnabled
        : isSelected
            ? GlassTokens.iconButtonSecondaryIconSelected
            : GlassTokens.iconButtonSecondaryIconEnabled;

    return GlassIconButton(
      icon: icon,
      type: type,
      size: size,
      iconSize: iconSize,
      tooltip: tooltip,
      disabled: disabled || isLoading,
      isLoading: isLoading,
      isSelected: isSelected,
      onPressed: onPressed,
      selectedIcon: selectedIcon,
      child: isLoading
          ? SizedBox.square(
              dimension: GlassTokens.iconButtonProgressIndicatorSize,
              child: CircularProgressIndicator(
                strokeWidth: GlassTokens.iconButtonProgressIndicatorStrokeWidth,
                color: progressColor,
              ),
            )
          : null,
    );
  }
}
