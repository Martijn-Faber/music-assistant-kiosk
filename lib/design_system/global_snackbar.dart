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
    if (_messages.isNotEmpty) {
      // Only the front item counts down. Pause it while it sits behind a new
      // notice so each queued item gets its own time in front.
      _messages.last.timer?.cancel();
    }
    final message = _SnackbarMessage(
      id: _nextId++,
      text: text,
      kind: kind,
      duration: duration,
    );
    setState(() {
      _messages.add(message);
      if (_messages.length > 3) {
        final dropped = _messages.removeAt(0);
        dropped.timer?.cancel();
      }
    });
    _startTimer(message);
  }

  void _startTimer(_SnackbarMessage message) {
    message.timer?.cancel();
    message.timer = Timer(message.duration, () => _dismiss(message.id));
  }

  void _dismissAll() {
    if (_messages.isEmpty) return;
    for (final message in _messages) {
      message.timer?.cancel();
    }
    setState(_messages.clear);
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
    final wasFront = identical(_messages.last, message);
    message.timer?.cancel();
    if (mounted) {
      setState(() => _messages.remove(message));
      if (wasFront && _messages.isNotEmpty) _startTimer(_messages.last);
    }
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
            child: LayoutBuilder(
              builder: (context, constraints) => Align(
                alignment: Alignment.bottomCenter,
                child: _SnackbarCardStack(
                  messages: _messages,
                  width: constraints.maxWidth,
                  onDismiss: _dismiss,
                  onDismissStack: _dismissAll,
                ),
              ),
            ),
          ),
        ),
    ],
  );
}

class _SnackbarMessage {
  _SnackbarMessage({
    required this.id,
    required this.text,
    required this.kind,
    required this.duration,
  });

  final int id;
  final String text;
  final GlobalSnackbarKind kind;
  final Duration duration;
  Timer? timer;
}

class _SnackbarCardStack extends StatelessWidget {
  const _SnackbarCardStack({
    required this.messages,
    required this.width,
    required this.onDismiss,
    required this.onDismissStack,
  });

  final List<_SnackbarMessage> messages;
  final double width;
  final ValueChanged<int> onDismiss;
  final VoidCallback onDismissStack;

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
    Widget backingCard() => SizedBox(
      width: width,
      child: const GlassSurface(
        borderRadius: GlassTokens.radiusMedium,
        padding: EdgeInsets.zero,
        tint: Color(0xCC1B2528),
        border: Border.fromBorderSide(BorderSide(color: GlassTokens.border)),
        blurSigma: 20,
        child: SizedBox(height: 46),
      ),
    );

    return Padding(
      // Reserve room for older cards below, so adding messages never moves
      // the newest card from its anchored position.
      padding: const EdgeInsets.only(bottom: 24),
      child: Dismissible(
        key: const ValueKey('snackbar-stack'),
        direction: DismissDirection.down,
        resizeDuration: const Duration(milliseconds: 160),
        onDismissed: (_) => onDismissStack(),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            for (var index = 0; index < visibleMessages.length - 1; index++)
              AnimatedPositioned(
                duration: const Duration(milliseconds: 280),
                curve: Curves.easeOutCubic,
                left: 0,
                right: 0,
                key: ValueKey('backing-${visibleMessages[index].id}'),
                top: (visibleMessages.length - index - 1) * 5 + 9,
                child: AnimatedScale(
                  duration: const Duration(milliseconds: 280),
                  curve: Curves.easeOutCubic,
                  alignment: Alignment.topCenter,
                  scale: 1 - (visibleMessages.length - index - 1) * .04,
                  child: IgnorePointer(
                    child: Opacity(
                      opacity: .68,
                      child: backingCard(),
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
        child: LayoutBuilder(
          builder: (context, constraints) {
            final showDismissButton = constraints.maxWidth >= 176;
            return Row(
              children: [
                Icon(icon, color: accentColor, size: 20),
                const SizedBox(width: 10),
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
                if (showDismissButton) ...[
                  const SizedBox(width: 6),
                  IconButton(
                    onPressed: onDismiss,
                    icon: const Icon(Icons.close_rounded, size: 18),
                    color: GlassTokens.textSecondary,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints.tightFor(
                      width: 32,
                      height: 32,
                    ),
                    visualDensity: VisualDensity.compact,
                  ),
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}
