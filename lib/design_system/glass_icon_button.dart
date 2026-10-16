import 'package:flutter/material.dart';

import 'glass_surface.dart';
import 'glass_tokens.dart';

enum GlassIconButtonType { primary, secondary }

class GlassIconButton extends StatelessWidget {
  const GlassIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.tooltip,
    this.disabled = false,
    this.isSelected = false,
    this.child,
    this.type = GlassIconButtonType.primary,
    this.size = GlassTokens.iconButtonPrimarySize,
    this.iconSize = GlassTokens.iconSizeM,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final String? tooltip;
  final bool disabled;
  final bool isSelected;
  final Widget? child;
  final GlassIconButtonType type;
  final double size;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    if (type == GlassIconButtonType.secondary) {
      final iconContent =
          child ??
          Icon(
            icon,
            color: disabled
                ? GlassTokens.iconButtonSecondaryIconDisabled
                : isSelected
                    ? GlassTokens.iconButtonSecondaryIconSelected
                    : GlassTokens.iconButtonSecondaryIconEnabled,
          );
      return IconButton(
        tooltip: tooltip,
        onPressed: disabled ? null : onPressed,
        isSelected: isSelected,
        selectedIcon: iconContent,
        icon: iconContent,
        color: GlassTokens.iconButtonSecondaryIconEnabled,
        disabledColor: GlassTokens.iconButtonSecondaryIconDisabled,
        style: IconButton.styleFrom(
          backgroundColor: disabled
              ? GlassTokens.iconButtonSecondaryContainerDisabled
              : isSelected
                  ? GlassTokens.iconButtonSecondaryContainerSelected
                  : GlassTokens.iconButtonSecondaryContainerEnabled,
          overlayColor: GlassTokens.iconButtonSecondaryInteractionOverlay,
          minimumSize: Size.square(GlassTokens.iconButtonSecondarySize),
        ),
      );
    }

    final iconContent = SizedBox.square(
      dimension: size,
      child: Center(
        child: child ??
            Icon(
              icon,
              size: iconSize,
              color: disabled
                  ? GlassTokens.iconButtonPrimaryIconDisabled
                  : isSelected
                      ? GlassTokens.iconButtonPrimaryIconSelected
                      : GlassTokens.iconButtonPrimaryIconEnabled,
            ),
      ),
    );
    return GlassInteractiveSurface(
      borderRadius: GlassTokens.radiusMedium,
      padding: EdgeInsets.zero,
      tint: isSelected && !disabled
          ? GlassTokens.iconButtonPrimaryContainerSelected
          : disabled
              ? GlassTokens.iconButtonPrimaryContainerDisabled
              : GlassTokens.iconButtonPrimaryContainerEnabled,
      onTap: disabled ? null : onPressed,
      disabledOpacity: disabled
          ? GlassTokens.iconButtonPrimaryOpacityDisabled
          : GlassTokens.iconButtonPrimaryOpacityInactive,
      semanticsLabel: tooltip,
      child: tooltip == null
          ? iconContent
          : Tooltip(message: tooltip!, child: iconContent),
    );
  }
}
