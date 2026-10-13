import 'package:flutter/material.dart';

import 'glass_surface.dart';
import 'glass_tokens.dart';

class GlassSegmentedControl extends StatelessWidget {
  const GlassSegmentedControl({
    super.key,
    required this.options,
    required this.selectedIndex,
    required this.onSelected,
  });

  final List<String> options;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) => GlassSurface(
    borderRadius: GlassTokens.radiusMedium,
    padding: const EdgeInsets.all(4),
    tint: GlassTokens.surfaceTint,
    child: Row(
      children: [
        for (var index = 0; index < options.length; index++)
          Expanded(
            child: Semantics(
              button: true,
              selected: index == selectedIndex,
              child: Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(12),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                onTap: () => onSelected(index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 160),
                  padding: const EdgeInsets.symmetric(vertical: 11),
                  decoration: BoxDecoration(
                    color: index == selectedIndex
                        ? GlassTokens.selected
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      options[index],
                      style: TextStyle(
                        color: index == selectedIndex
                            ? Colors.white
                            : GlassTokens.textMuted,
                        fontSize: GlassTokens.fontSize12,
                        fontWeight: index == selectedIndex
                            ? FontWeight.w600
                            : FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                ),
              ),
            ),
          ),
      ],
    ),
  );
}
