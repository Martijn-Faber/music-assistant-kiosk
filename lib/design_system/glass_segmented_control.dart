import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

import 'glass_surface.dart';
import 'glass_tokens.dart';

class GlassSegmentedControl extends StatefulWidget {
  const GlassSegmentedControl({
    super.key,
    required this.options,
    required this.selectedIndex,
    required this.onSelected,
    this.embedded = false,
  });

  final List<String> options;
  final int selectedIndex;
  final ValueChanged<int> onSelected;
  final bool embedded;

  @override
  State<GlassSegmentedControl> createState() =>
      _GlassSegmentedControlState();
}

class _GlassSegmentedControlState extends State<GlassSegmentedControl>
    with SingleTickerProviderStateMixin {
  late final AnimationController _positionController =
      AnimationController.unbounded(
        vsync: this,
        value: widget.selectedIndex.toDouble(),
      );

  @override
  void didUpdateWidget(covariant GlassSegmentedControl oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedIndex != widget.selectedIndex) {
      _positionController.animateWith(
        SpringSimulation(
          const SpringDescription(mass: 1, stiffness: 180, damping: 22),
          _positionController.value,
          widget.selectedIndex.toDouble(),
          0,
        ),
      );
    }
  }

  @override
  void dispose() {
    _positionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.options.isEmpty) return const SizedBox.shrink();

    final control = LayoutBuilder(
      builder: (context, constraints) {
        final segmentWidth = constraints.maxWidth / widget.options.length;
        return SizedBox(
          height: 36,
          child: AnimatedBuilder(
            animation: _positionController,
            builder: (context, _) => Stack(
              children: [
                Positioned(
                  left: segmentWidth * _positionController.value,
                  top: 0,
                  bottom: 0,
                  width: segmentWidth,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: GlassTokens.selected,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                Row(
                  children: [
                    for (var index = 0;
                        index < widget.options.length;
                        index++)
                      Expanded(
                        child: Semantics(
                          button: true,
                          selected: index == widget.selectedIndex,
                          child: Material(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                            clipBehavior: Clip.antiAlias,
                            child: InkWell(
                              onTap: () => widget.onSelected(index),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 4,
                                  ),
                                  child: Text(
                                    widget.options[index],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: index == widget.selectedIndex
                                          ? Colors.white
                                          : GlassTokens.textMuted,
                                      fontSize: GlassTokens.fontSize12,
                                      fontWeight: index == widget.selectedIndex
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
              ],
            ),
          ),
        );
      },
    );

    if (widget.embedded) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: control,
      );
    }
    return GlassSurface(
      borderRadius: GlassTokens.radiusMedium,
      padding: const EdgeInsets.all(4),
      tint: GlassTokens.surfaceTint,
      child: control,
    );
  }
}
