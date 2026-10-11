import 'package:flutter/material.dart';

import 'design_system/glass_pill.dart';

export 'design_system/glass_surface.dart';
export 'design_system/glass_pill.dart';

class PageDot extends StatelessWidget {
  const PageDot({required this.active});

  final bool active;

  @override
  Widget build(BuildContext context) => AnimatedContainer(
    duration: const Duration(milliseconds: 180),
    width: active ? 16 : 6,
    height: 6,
    decoration: BoxDecoration(
      color: active ? const Color(0xFFE9F0EB) : const Color(0xFF65716E),
      borderRadius: BorderRadius.circular(999),
    ),
  );
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
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.speaker_outlined,
              size: 16,
              color: Color(0xFFE9F0EB),
            ),
            const SizedBox(width: 8),
            Flexible(
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(
                    color: Color(0xFFE9F0EB),
                    fontSize: 12,
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
                            fontSize: 9,
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
