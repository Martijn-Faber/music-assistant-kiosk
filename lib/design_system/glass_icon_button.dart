import 'package:flutter/material.dart';

import 'glass_surface.dart';
import 'glass_tokens.dart';

enum GlassIconButtonType { primary, secondary }

class GlassIconButton extends StatelessWidget {
  const GlassIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.selectedIcon,
    this.tooltip,
    this.disabled = false,
    this.isLoading = false,
    this.isSelected = false,
    this.child,
    this.type = GlassIconButtonType.primary,
    this.size = GlassTokens.iconButtonPrimarySize,
    this.iconSize = GlassTokens.iconSizeM,
  });

  final IconData icon;
  final IconData? selectedIcon;
  final VoidCallback? onPressed;
  final String? tooltip;
  final bool disabled;
  final bool isLoading;
  final bool isSelected;
  final Widget? child;
  final GlassIconButtonType type;
  final double size;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final isDisabled = disabled || onPressed == null;
    final isPrimary = type == GlassIconButtonType.primary;
    final iconColor = isPrimary
        ? isDisabled
              ? GlassTokens.iconButtonPrimaryIconDisabled
              : isSelected
                  ? GlassTokens.iconButtonPrimaryIconSelected
                  : GlassTokens.iconButtonPrimaryIconEnabled
        : isDisabled
            ? GlassTokens.iconButtonSecondaryIconDisabled
            : isSelected
                ? GlassTokens.iconButtonSecondaryIconSelected
                : GlassTokens.iconButtonSecondaryIconEnabled;
    final backgroundColor = isPrimary
        ? isDisabled
              ? GlassTokens.iconButtonPrimaryContainerDisabled
              : isSelected
                  ? GlassTokens.iconButtonPrimaryContainerSelected
                  : GlassTokens.iconButtonPrimaryContainerEnabled
        : isDisabled
            ? GlassTokens.iconButtonSecondaryContainerDisabled
            : isSelected
                ? GlassTokens.iconButtonSecondaryContainerSelected
                : GlassTokens.iconButtonSecondaryContainerEnabled;
    final effectiveBackgroundColor = isLoading || (!isPrimary && isDisabled)
        ? Colors.transparent
        : backgroundColor;
    final buttonSize = isPrimary ? size : GlassTokens.iconButtonSecondarySize;
    final activeIcon = isSelected ? selectedIcon ?? icon : icon;
    final iconContent = child ??
        Icon(activeIcon, size: iconSize, color: iconColor);

    final button = IconButton(
      tooltip: tooltip,
      onPressed: isDisabled ? null : onPressed,
      isSelected: isSelected,
      selectedIcon: iconContent,
      icon: iconContent,
      style: IconButton.styleFrom(
        foregroundColor: iconColor,
        disabledForegroundColor: iconColor,
        backgroundColor: isPrimary
            ? Colors.transparent
            : effectiveBackgroundColor,
        disabledBackgroundColor:
            isPrimary ? Colors.transparent : effectiveBackgroundColor,
        overlayColor: isPrimary
            ? GlassTokens.iconButtonPrimaryInteractionOverlay
            : GlassTokens.iconButtonSecondaryInteractionOverlay,
        minimumSize: Size.square(buttonSize),
        fixedSize: Size.square(buttonSize),
        padding: EdgeInsets.zero,
        shape: const CircleBorder(),
      ),
    );

    if (!isPrimary) return button;

    return Opacity(
      opacity: isDisabled ? GlassTokens.disabledOpacity : 1,
      child: GlassSurface(
        borderRadius: buttonSize / 2,
        padding: EdgeInsets.zero,
        constraints: BoxConstraints.tightFor(
          width: buttonSize,
          height: buttonSize,
        ),
        tint: effectiveBackgroundColor,
        child: button,
      ),
    );
  }
}
