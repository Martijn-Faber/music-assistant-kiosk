import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/design_system/glass_tokens.dart';

import '../../../design_system/glass_pill.dart';

export '../../../design_system/glass_surface.dart';
export '../../../design_system/glass_pill.dart';

class PageDot extends StatelessWidget {
  const PageDot({required this.active, this.vertical = false});

  final bool active;
  final bool vertical;

  @override
  Widget build(BuildContext context) => AnimatedContainer(
    duration: const Duration(milliseconds: 240),
    curve: Curves.easeInOutCubic,
    width: vertical ? 6 : (active ? 16 : 6),
    height: vertical ? (active ? 16 : 6) : 6,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: active
            ? const [Color(0xFFE9F0EB), Color(0xFFD7E2DD)]
            : const [Color(0x66FFFFFF), Color(0x337F9290)],
      ),
      border: Border.all(
        color: Colors.white.withValues(alpha: active ? 0.72 : 0.22),
      ),
      boxShadow: [
        BoxShadow(
          color: const Color(0xFF000000).withValues(
            alpha: active ? 0 : 0.13,
          ),
          blurRadius: active ? 0 : 2,
          offset: Offset(0, active ? 0 : 1),
        ),
      ],
      borderRadius: BorderRadius.circular(999),
    ),
  );
}

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.count,
    required this.currentPage,
    this.vertical = false,
    this.maxHeightFactor,
    this.glassPill = false,
  });

  final int count;
  final int currentPage;
  final bool vertical;
  final double? maxHeightFactor;
  final bool glassPill;

  @override
  Widget build(BuildContext context) {
    final dots = Flex(
      direction: vertical ? Axis.vertical : Axis.horizontal,
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var index = 0; index < count; index++) ...[
          if (index > 0)
            SizedBox(
              width: vertical ? 0 : 7,
              height: vertical ? 6 : 0,
            ),
          PageDot(active: currentPage == index, vertical: vertical),
        ],
      ],
    );

    Widget indicator = dots;
    if (vertical && maxHeightFactor != null) {
      indicator = LayoutBuilder(
        builder: (context, constraints) => Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: constraints.maxHeight * maxHeightFactor!,
            ),
            child: FittedBox(fit: BoxFit.scaleDown, child: dots),
          ),
        ),
      );
    }

    if (glassPill) {
      indicator = GlassPill(
        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
        tint: const Color(0x33202730),
        child: indicator,
      );
    }
    return indicator;
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
