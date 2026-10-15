import 'dart:async';

import 'package:flutter/material.dart';

import 'glass_surface.dart';
import 'glass_tokens.dart';

enum GlobalSnackbarKind { info, success, warning, error }

class GlobalSnackbarHost extends StatefulWidget {
  const GlobalSnackbarHost({super.key, required this.child});

  final Widget child;

  @override
  State<GlobalSnackbarHost> createState() => _GlobalSnackbarHostState();

  static void show(
    BuildContext context, {
    required String message,
    GlobalSnackbarKind kind = GlobalSnackbarKind.info,
    Duration duration = const Duration(seconds: 3),
  }) {
    context.findAncestorStateOfType<_GlobalSnackbarHostState>()?._show(
      message,
      kind,
      duration,
    );
  }
}

class _GlobalSnackbarHostState extends State<GlobalSnackbarHost> {
  final List<_SnackbarMessage> _messages = [];
  int _nextId = 0;

  void _show(String text, GlobalSnackbarKind kind, Duration duration) {
    final message = _SnackbarMessage(id: _nextId++, text: text, kind: kind);
    setState(() => _messages.add(message));
    message.timer = Timer(duration, () => _dismiss(message.id));
  }

  void _dismiss(int id) {
    _SnackbarMessage? message;
    for (final item in _messages) {
      if (item.id == id) {
        message = item;
        break;
      }
    }
    if (message == null) return;
    message.timer?.cancel();
    if (mounted) setState(() => _messages.remove(message));
  }

  @override
  void dispose() {
    for (final message in _messages) {
      message.timer?.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Stack(
    fit: StackFit.expand,
    children: [
      widget.child,
      if (_messages.isNotEmpty)
        Positioned(
          left: 16,
          right: 16,
          bottom: MediaQuery.paddingOf(context).bottom + 8,
          child: SafeArea(
            top: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: _SnackbarCardStack(
                messages: _messages,
                width: MediaQuery.sizeOf(context).width - 32,
                onDismiss: _dismiss,
              ),
            ),
          ),
        ),
    ],
  );
}

class _SnackbarMessage {
  _SnackbarMessage({required this.id, required this.text, required this.kind});

  final int id;
  final String text;
  final GlobalSnackbarKind kind;
  Timer? timer;
}

class _SnackbarCardStack extends StatelessWidget {
  const _SnackbarCardStack({
    required this.messages,
    required this.width,
    required this.onDismiss,
  });

  final List<_SnackbarMessage> messages;
  final double width;
  final ValueChanged<int> onDismiss;

  @override
  Widget build(BuildContext context) {
    final visibleMessages = messages.length <= 3
        ? messages
        : messages.sublist(messages.length - 3);
    final newest = visibleMessages.last;

    Widget card(_SnackbarMessage message) => SizedBox(
      width: width,
      child: _GlobalSnackbarCard(
        message: message,
        onDismiss: () => onDismiss(message.id),
      ),
    );

    return Padding(
      // Reserve room for older cards below, so adding messages never moves
      // the newest card from its anchored position.
      padding: const EdgeInsets.only(bottom: 24),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          for (var index = 0; index < visibleMessages.length - 1; index++)
            AnimatedPositioned(
              duration: const Duration(milliseconds: 280),
              curve: Curves.easeOutCubic,
              left: 0,
              right: 0,
              top: (visibleMessages.length - index - 1) * 12,
              child: AnimatedScale(
                duration: const Duration(milliseconds: 280),
                curve: Curves.easeOutCubic,
                alignment: Alignment.topCenter,
                scale: index == visibleMessages.length - 2 ? .96 : .92,
                child: IgnorePointer(
                  child: Opacity(
                    opacity: .68,
                    child: card(visibleMessages[index]),
                  ),
                ),
              ),
            ),
          TweenAnimationBuilder<double>(
            key: ValueKey('incoming-${newest.id}'),
            tween: Tween(begin: 0, end: 1),
            duration: const Duration(milliseconds: 420),
            curve: Curves.easeOutBack,
            builder: (context, progress, child) => Opacity(
              opacity: progress.clamp(0, 1),
              child: Transform.translate(
                offset: Offset(0, 22 * (1 - progress)),
                child: child,
              ),
            ),
            child: card(newest),
          ),
        ],
      ),
    );
  }
}

class _GlobalSnackbarCard extends StatelessWidget {
  const _GlobalSnackbarCard({required this.message, required this.onDismiss});

  final _SnackbarMessage message;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    final (icon, accentColor) = switch (message.kind) {
      GlobalSnackbarKind.info => (
        Icons.info_outline_rounded,
        Colors.white,
      ),
      GlobalSnackbarKind.success => (
        Icons.check_circle_outline_rounded,
        const Color(0xFF9FE0B1),
      ),
      GlobalSnackbarKind.warning => (
        Icons.warning_amber_rounded,
        const Color(0xFFFFC66D),
      ),
      GlobalSnackbarKind.error => (
        Icons.error_outline_rounded,
        GlassTokens.error,
      ),
    };

    return Semantics(
      liveRegion: true,
      child: GlassSurface(
        borderRadius: GlassTokens.radiusMedium,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
        tint: const Color(0xCC1B2528),
        border: Border.all(color: GlassTokens.border, width: 0.8),
        blurSigma: 20,
        child: Row(
          children: [
            Icon(icon, color: accentColor, size: 20),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message.text,
                softWrap: true,
                overflow: TextOverflow.clip,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: GlassTokens.textPrimary,
                  fontSize: GlassTokens.fontSize13,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              onPressed: onDismiss,
              icon: const Icon(Icons.close_rounded, size: 18),
              color: GlassTokens.textSecondary,
              visualDensity: VisualDensity.compact,
            ),
          ],
        ),
      ),
    );
  }
}
