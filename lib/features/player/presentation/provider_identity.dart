import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../design_system/glass_tokens.dart';
import '../data/music_assistant_repository.dart';

/// Shows a Music Assistant provider's icon and friendly name consistently.
class ProviderIdentity extends StatelessWidget {
  const ProviderIdentity({
    super.key,
    required this.repository,
    required this.providerId,
    this.iconSize = GlassTokens.iconSizeM,
    this.textColor = Colors.white,
    this.textSize = GlassTokens.fontSize16,
    this.iconColor = Colors.white70,
    this.spacing = 10,
    this.showName = true,
  });

  final MusicAssistantRepository repository;
  final String? providerId;
  final double iconSize;
  final Color textColor;
  final double textSize;
  final Color iconColor;
  final double spacing;
  final bool showName;

  @override
  Widget build(BuildContext context) {
    final id = providerId?.trim();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (id != null && id.isNotEmpty)
          FutureBuilder<String?>(
            future: repository.fetchProviderIcon(id),
            builder: (context, snapshot) => _icon(id, snapshot.data),
          )
        else
          _fallbackIcon(id),
        if (showName) ...[
          SizedBox(width: spacing),
          Flexible(
            child: Text(
              _friendlyName(id),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: textColor,
                fontSize: textSize,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _icon(String id, String? dataUri) {
    if (dataUri == null) return _fallbackIcon(id);
    try {
      final separator = dataUri.indexOf(',');
      if (separator < 0) return _fallbackIcon(id);
      final mime = dataUri.substring(5, separator).split(';').first;
      final bytes = base64Decode(dataUri.substring(separator + 1));
      if (mime == 'image/svg+xml') {
        final svg = _inlineSvgClassFills(utf8.decode(bytes));
        return SizedBox.square(
          dimension: iconSize,
          child: SvgPicture.memory(
            utf8.encode(svg),
            width: iconSize,
            height: iconSize,
            fit: BoxFit.contain,
          ),
        );
      }
      return Image.memory(
        bytes,
        width: iconSize,
        height: iconSize,
        fit: BoxFit.contain,
        errorBuilder: (_, _, _) => _fallbackIcon(id),
      );
    } on FormatException {
      return _fallbackIcon(id);
    }
  }

  Widget _fallbackIcon(String? id) => Icon(
    _iconFor(id),
    size: iconSize,
    color: iconColor,
  );

  String _friendlyName(String? id) {
    if (id == null || id.isEmpty) return 'Unknown provider';
    final domain = id
        .replaceFirst(RegExp(r'--[A-Za-z0-9_-]+$'), '')
        .replaceFirst(RegExp(r'\s+[A-Za-z]*\d[A-Za-z0-9_-]*$'), '')
        .trim();
    final known = <String, String>{
      'apple_music': 'Apple Music',
      'jellyfin': 'Jellyfin',
      'tunein': 'TuneIn',
      'youtube_music': 'YouTube Music',
      'spotify': 'Spotify',
      'tidal': 'Tidal',
      'qobuz': 'Qobuz',
      'deezer': 'Deezer',
      'builtin': 'Music Assistant',
    };
    return known[domain.toLowerCase()] ?? domain
        .split(RegExp(r'[_\-\s]+'))
        .where((part) => part.isNotEmpty)
        .map((part) => '${part[0].toUpperCase()}${part.substring(1)}')
        .join(' ');
  }

  IconData _iconFor(String? id) {
    final value = id?.toLowerCase() ?? '';
    if (value.contains('radio') || value.contains('tunein')) {
      return CupertinoIcons.antenna_radiowaves_left_right;
    }
    if (value.contains('youtube')) return CupertinoIcons.play_arrow;
    if (value.contains('music') || value.contains('spotify')) {
      return CupertinoIcons.music_note;
    }
    return CupertinoIcons.globe;
  }
}

String _inlineSvgClassFills(String svg) {
  final fills = <String, String>{};
  final styleBlocks = RegExp(
    r'<style\b[^>]*>([\s\S]*?)</style\s*>',
    caseSensitive: false,
  );
  for (final block in styleBlocks.allMatches(svg)) {
    for (final rule in RegExp(r'\.([\w-]+)\s*\{([^}]*)\}')
        .allMatches(block.group(1) ?? '')) {
      final fill = RegExp(r'(?:^|;)\s*fill\s*:\s*([^;!]+)', caseSensitive: false)
          .firstMatch(rule.group(2) ?? '');
      if (fill != null) fills[rule.group(1)!] = fill.group(1)!.trim();
    }
  }
  var result = svg.replaceAll(styleBlocks, '');
  result = result.replaceAll(
    RegExp(r'<style\b[^>]*/\s*>', caseSensitive: false),
    '',
  );
  return result.replaceAllMapped(RegExp(r'class="([^"]+)"'), (match) {
    for (final name in match.group(1)!.split(RegExp(r'\s+'))) {
      final fill = fills[name];
      if (fill != null) return 'fill="$fill"';
    }
    return '';
  });
}
