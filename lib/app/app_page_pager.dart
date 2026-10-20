import 'dart:async';

import 'package:flutter/material.dart';

import '../core/platform/screen_brightness_bridge.dart';
import '../design_system/page_indicator.dart';
import '../design_system/glass_tokens.dart';

/// App-level pager for the screensaver, idle, player, and settings pages.
class AppPagePager extends StatefulWidget {
  const AppPagePager({
    super.key,
    required this.isIdle,
    required this.pages,
    this.activePageControl,
  });

  final bool isIdle;
  final List<Widget> pages;
  final Widget? activePageControl;

  @override
  State<AppPagePager> createState() => AppPagePagerState();
}

class AppPagePagerState extends State<AppPagePager> {
  static const _screensaverDelay = Duration(minutes: 1);
  late final PageController _controller;
  late int _pageIndex;
  bool _showPager = false;
  double? _dragStartPage;
  Timer? _pagerHideTimer;
  Timer? _screensaverTimer;
  Timer? _inactivityTimer;
  bool _isInactive = false;
  bool _hasUserActivity = false;
  bool? _lastDimmed;

  @override
  void initState() {
    super.initState();
    _pageIndex = widget.isIdle ? 0 : 2;
    _controller = PageController(initialPage: _pageIndex);
    _restartInactivityTimer(userActivity: false);
  }

  @override
  void didUpdateWidget(covariant AppPagePager oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isIdle != widget.isIdle) {
      _screensaverTimer?.cancel();
      if (widget.isIdle) _hasUserActivity = false;
      _applyBrightness();
      final targetPage = widget.isIdle ? 0 : 2;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted ||
            !_controller.hasClients ||
            targetPage >= widget.pages.length) {
          return;
        }
        _controller.animateToPage(
          targetPage,
          duration: GlassTokens.pagerPageTransitionDuration,
          curve: Curves.easeInOutCubic,
        );
      });
    }
  }

  @override
  void dispose() {
    _pagerHideTimer?.cancel();
    _screensaverTimer?.cancel();
    _inactivityTimer?.cancel();
    ScreenBrightnessBridge.setDimmed(false);
    _controller.dispose();
    super.dispose();
  }

  void _restartInactivityTimer({bool userActivity = true}) {
    _inactivityTimer?.cancel();
    _isInactive = false;
    _hasUserActivity = userActivity;
    _applyBrightness();
    _inactivityTimer = Timer(_screensaverDelay, () {
      if (!mounted) return;
      _isInactive = true;
      _hasUserActivity = false;
      _applyBrightness();
    });
  }

  void _applyBrightness() {
    final dimmed = !(_hasUserActivity) && (widget.isIdle || _isInactive);
    if (_lastDimmed == dimmed) return;
    _lastDimmed = dimmed;
    ScreenBrightnessBridge.setDimmed(dimmed);
  }

  void _onPointerDown(PointerDownEvent event) {
    _restartInactivityTimer();
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollStartNotification &&
        notification.dragDetails != null) {
      _pagerHideTimer?.cancel();
      _dragStartPage = _controller.hasClients
          ? (_controller.page ?? _pageIndex.toDouble())
          : _pageIndex.toDouble();
    } else if (notification is ScrollUpdateNotification &&
        _dragStartPage != null) {
      final currentPage = _controller.hasClients
          ? (_controller.page ?? _pageIndex.toDouble())
          : _pageIndex.toDouble();
      final shouldShowPager = (currentPage - _dragStartPage!).abs() >= 0.15;
      if (shouldShowPager != _showPager) {
        setState(() => _showPager = shouldShowPager);
      }
    } else if (notification is ScrollEndNotification &&
        _dragStartPage != null) {
      _dragStartPage = null;
      if (_showPager) {
        _pagerHideTimer?.cancel();
        _pagerHideTimer = Timer(const Duration(milliseconds: 900), () {
          if (mounted) setState(() => _showPager = false);
        });
      }
    }
    return false;
  }

  void _onPageChanged(int index) {
    setState(() => _pageIndex = index);
    _screensaverTimer?.cancel();
    if (widget.isIdle && index != 0) {
      _screensaverTimer = Timer(_screensaverDelay, () {
        if (mounted && widget.isIdle && _controller.hasClients) {
          _controller.animateToPage(
            0,
            duration: GlassTokens.pagerPageTransitionDuration,
            curve: Curves.easeOutCubic,
          );
        }
      });
    }
  }

  void openIdlePage() {
    if (!widget.isIdle || _pageIndex != 0 || !_controller.hasClients) return;
    _controller.animateToPage(
      1,
      duration: GlassTokens.pagerPageTransitionDuration,
      curve: Curves.easeInOutCubic,
    );
  }

  void openPlayerPage() {
    if (!_controller.hasClients || widget.pages.length <= 2) return;
    _controller.animateToPage(
      2,
      duration: GlassTokens.pagerPageTransitionDuration,
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final showBottomControl = _showPager || _pageIndex == 2;
    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: _onPointerDown,
      child: Stack(
        fit: StackFit.expand,
        children: [
        NotificationListener<ScrollNotification>(
          onNotification: _handleScrollNotification,
          child: PageView.builder(
            controller: _controller,
            itemCount: widget.pages.length,
            onPageChanged: _onPageChanged,
            itemBuilder: (context, index) => AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                final page = _controller.hasClients
                    ? (_controller.page ?? _pageIndex.toDouble())
                    : _pageIndex.toDouble();
                final distance = (page - index).abs();
                final scale = (1 - distance * 0.36)
                    .clamp(0.82, 1.0)
                    .toDouble();
                final cornerRadius = (distance * 52)
                    .clamp(0.0, 28.0)
                    .toDouble();
                final borderAlpha = (distance * 180)
                    .round()
                    .clamp(0, 110)
                    .toInt();
                return Transform.scale(
                  scale: scale,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(cornerRadius),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        RepaintBoundary(child: child!),
                        IgnorePointer(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(cornerRadius),
                              border: Border.all(
                                color: Color.fromARGB(
                                  borderAlpha,
                                  255,
                                  255,
                                  255,
                                ),
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: index == 0 && widget.isIdle ? openIdlePage : null,
                child: widget.pages[index],
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 2,
          child: IgnorePointer(
            ignoring: !showBottomControl || _pageIndex != 2,
            child: SizedBox(
              height: 58,
              child: Center(
                child: AnimatedSlide(
                  duration: GlassTokens.pagerControlTransitionDuration,
                  curve: Curves.easeInOut,
                  offset: showBottomControl
                      ? Offset.zero
                      : const Offset(0, 0.18),
                  child: AnimatedScale(
                    duration: GlassTokens.pagerControlTransitionDuration,
                    curve: Curves.easeInOut,
                    scale: _showPager && _pageIndex != 2 ? 1.08 : 1,
                    child: AnimatedOpacity(
                      duration: GlassTokens.pagerControlTransitionDuration,
                      curve: Curves.easeInOut,
                      opacity: showBottomControl ? 1 : 0,
                      child: AnimatedSwitcher(
                        duration: GlassTokens.pagerControlTransitionDuration,
                        switchInCurve: Curves.easeOutCubic,
                        switchOutCurve: Curves.easeInCubic,
                        transitionBuilder: (child, animation) =>
                            FadeTransition(
                          opacity: animation,
                          child: ScaleTransition(
                            scale: animation,
                            child: child,
                          ),
                        ),
                        child:
                            _pageIndex == 2 && widget.activePageControl != null
                            ? KeyedSubtree(
                                key: const ValueKey('active-page-control'),
                                child: widget.activePageControl!,
                              )
                            : PageIndicator(
                                key: const ValueKey('page-indicator'),
                                count: widget.pages.length,
                                currentPage: _pageIndex,
                                glassPill: true,
                              ),
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
}
