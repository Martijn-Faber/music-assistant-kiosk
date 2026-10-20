import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/design_system/glass_tokens.dart';

import '../../../design_system/glass_pill.dart';
import '../../../design_system/glass_surface.dart';

export '../../../design_system/glass_surface.dart';
export '../../../design_system/glass_pill.dart';

class PlayerInteractiveRow extends StatelessWidget {
  const PlayerInteractiveRow({
    super.key,
    required this.child,
    required this.onTap,
    this.horizontalInset = 0,
    this.highlighted = false,
    this.borderRadius = 14,
    this.highlightTint = const Color(0x33232A30),
  });

  final Widget child;
  final VoidCallback? onTap;
  final double horizontalInset;
  final bool highlighted;
  final double borderRadius;
  final Color highlightTint;

  @override
  Widget build(BuildContext context) {
    if (highlighted) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalInset),
        child: GlassInteractiveSurface(
          borderRadius: borderRadius,
          padding: EdgeInsets.zero,
          tint: highlightTint,
          blurSigma: 0,
          showShadow: false,
          onTap: onTap,
          child: child,
        ),
      );
    }
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalInset),
          child: child,
        ),
      ),
    );
  }
}

class PlayerNamePill extends StatelessWidget {
  const PlayerNamePill({
    required this.playerName,
    this.groupMemberCount,
    this.onTap,
  });

  final String playerName;
  final int? groupMemberCount;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(999),
      child: GlassPill(
        constraints: const BoxConstraints(maxWidth: 280),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              CupertinoIcons.hifispeaker,
              size: GlassTokens.iconSizeM,
              color: Color(0xFFE9F0EB),
            ),
            const SizedBox(width: 8),
            Flexible(
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(
                    color: Color(0xFFE9F0EB),
                    fontSize: GlassTokens.fontSize12,
                    fontWeight: FontWeight.w600,
                  ),
                  children: [
                    TextSpan(text: playerName),
                    if (groupMemberCount != null)
                      WidgetSpan(
                        alignment: PlaceholderAlignment.aboveBaseline,
                        baseline: TextBaseline.alphabetic,
                        child: Text(
                          ' +$groupMemberCount',
                          style: const TextStyle(
                            color: Color(0xFFE9F0EB),
                            fontSize: GlassTokens.fontSize9,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                  ],
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
