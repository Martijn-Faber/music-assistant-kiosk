import 'package:flutter/material.dart';
import 'glass_tokens.dart';

/// Applies the shared, softly animated edge fade to a vertical scroll view.
/// Pass the same controller to this widget and to the scrollable child.
class GlassScrollFade extends StatefulWidget {
  const GlassScrollFade({
    super.key,
    required this.controller,
    required this.child,
    this.fadeExtent = 0.16,
    this.duration = GlassTokens.scrollFadeTransitionDuration,
  });

  final ScrollController controller;
  final Widget child;
  final double fadeExtent;
  final Duration duration;

  @override
  State<GlassScrollFade> createState() => _GlassScrollFadeState();
}

class _GlassScrollFadeState extends State<GlassScrollFade> {
  bool _fadeTop = false;
  bool _fadeBottom = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_updateFades);
    WidgetsBinding.instance.addPostFrameCallback((_) => _updateFades());
  }

  @override
  void didUpdateWidget(covariant GlassScrollFade oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      oldWidget.controller.removeListener(_updateFades);
      widget.controller.addListener(_updateFades);
      WidgetsBinding.instance.addPostFrameCallback((_) => _updateFades());
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_updateFades);
    super.dispose();
  }

  void _updateFades() {
    if (!widget.controller.hasClients) return;
    final position = widget.controller.position;
    if (!position.hasContentDimensions) return;
    final top = position.pixels > 1;
    final bottom = position.extentAfter > 1;
    if (top != _fadeTop || bottom != _fadeBottom) {
      setState(() {
        _fadeTop = top;
        _fadeBottom = bottom;
      });
    }
  }

  @override
  Widget build(BuildContext context) => NotificationListener<ScrollMetricsNotification>(
    onNotification: (_) {
      _updateFades();
      return false;
    },
    child: TweenAnimationBuilder<double>(
      tween: Tween(begin: _fadeTop ? 1 : 0, end: _fadeTop ? 1 : 0),
      duration: widget.duration,
      builder: (context, top, child) => TweenAnimationBuilder<double>(
        tween: Tween(begin: _fadeBottom ? 1 : 0, end: _fadeBottom ? 1 : 0),
        duration: widget.duration,
        builder: (context, bottom, child) => ShaderMask(
          blendMode: BlendMode.dstIn,
          shaderCallback: (bounds) => LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.lerp(Colors.white, Colors.transparent, top)!,
              Colors.white,
              Colors.white,
              Color.lerp(Colors.white, Colors.transparent, bottom)!,
            ],
            stops: [0, widget.fadeExtent, 1 - widget.fadeExtent, 1],
          ).createShader(bounds),
          child: child,
        ),
        child: child,
      ),
      child: widget.child,
    ),
  );
}
