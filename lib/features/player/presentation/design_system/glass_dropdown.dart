import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'glass_surface.dart';
import 'glass_tokens.dart';

class GlassDropdown<T> extends StatelessWidget {
  const GlassDropdown({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    this.hint = 'Select an option',
  });

  final T? value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?> onChanged;
  final String hint;

  @override
  Widget build(BuildContext context) => GlassSurface(
    borderRadius: GlassTokens.radiusLarge,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
    tint: GlassTokens.surfaceTint,
    child: Theme(
      data: Theme.of(context).copyWith(
        canvasColor: const Color(0xFF263333),
        highlightColor: const Color(0x22FFFFFF),
        splashColor: const Color(0x22FFFFFF),
        hoverColor: const Color(0x18FFFFFF),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: value,
          items: items,
          onChanged: onChanged,
          hint: Text(
            hint,
            style: const TextStyle(color: GlassTokens.textMuted),
          ),
          isExpanded: true,
          menuMaxHeight: 320,
          borderRadius: BorderRadius.circular(16),
          dropdownColor: const Color(0xFF263333),
          icon: const Icon(CupertinoIcons.chevron_down, size: 22),
          iconEnabledColor: Colors.white,
          style: const TextStyle(color: Colors.white, fontSize: 16),
          selectedItemBuilder: (context) => items
              .map(
                (item) => Align(
                  alignment: Alignment.centerLeft,
                  child: DefaultTextStyle.merge(
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                    child: item.child,
                  ),
                ),
              )
              .toList(),
        ),
      ),
    ),
  );
}
