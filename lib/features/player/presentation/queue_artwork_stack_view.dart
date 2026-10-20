import 'package:flutter/material.dart';
import 'package:music_assistant_api/music_assistant_api.dart';

import 'queue_artwork_stack_card.dart';

/// Values captured together for one rendered animation frame.
@immutable
class QueueArtworkStackFrame {
  const QueueArtworkStackFrame({
    required this.progress,
    required this.dragProgress,
    required this.transitionFlightProgress,
    required this.currentArtworkUrl,
    required this.currentArtworkOffset,
    required this.transitionFromSwipe,
    required this.transitionStartOffset,
    required this.transitionEndOffset,
    required this.transitionFromArtwork,
    required this.transitionToArtwork,
    required this.transitionQueueItems,
    required this.transitionFromQueueIndex,
    required this.transitionToQueueIndex,
    required this.hasMultipleQueueItems,
    required this.artworkAtQueueIndex,
  });

  final double progress;
  final double dragProgress;
  final double transitionFlightProgress;
  final String? currentArtworkUrl;
  final Offset currentArtworkOffset;
  final bool transitionFromSwipe;
  final Offset transitionStartOffset;
  final Offset transitionEndOffset;
  final String? transitionFromArtwork;
  final String? transitionToArtwork;
  final List<MusicAssistantQueueItem>? transitionQueueItems;
  final int? transitionFromQueueIndex;
  final int? transitionToQueueIndex;
  final bool hasMultipleQueueItems;
  final String? Function(int index) artworkAtQueueIndex;

  bool get inTransition =>
      hasMultipleQueueItems &&
      transitionFromArtwork != null &&
      transitionToArtwork != null;
}

/// Renders the artwork layers from a snapshot prepared by the stack coordinator.
///
/// Queue lookup, gestures, and transition lifecycle stay in the coordinator;
/// this view owns only card placement and progress-to-layout calculations.
class QueueArtworkStackView extends StatelessWidget {
  const QueueArtworkStackView({
    super.key,
    required this.size,
    required this.frame,
    required this.nextArtworkUrl,
    required this.followingArtworkUrl,
    required this.serverUrl,
    required this.token,
  });

  static const _previewCardMaxOpacity = .75;
  static const _nextCardTopFraction = .21;
  static const _nextCardRestScale = .86;
  static const _nextCardScaleRange = .14;
  static const _followingCardTopFraction = .42;
  static const _followingCardRestScale = .74;
  static const _followingCardScaleRange = .12;

  final double size;
  final QueueArtworkStackFrame frame;
  final String? nextArtworkUrl;
  final String? followingArtworkUrl;
  final String serverUrl;
  final String token;

  double get progress => frame.progress;
  double get dragProgress => frame.dragProgress;
  double get transitionFlightProgress => frame.transitionFlightProgress;
  String? get currentArtworkUrl => frame.currentArtworkUrl;
  Offset get currentArtworkOffset => frame.currentArtworkOffset;
  bool get transitionFromSwipe => frame.transitionFromSwipe;
  Offset get transitionStartOffset => frame.transitionStartOffset;
  Offset get transitionEndOffset => frame.transitionEndOffset;
  String? get transitionFromArtwork => frame.transitionFromArtwork;
  String? get transitionToArtwork => frame.transitionToArtwork;
  List<MusicAssistantQueueItem>? get transitionQueueItems =>
      frame.transitionQueueItems;
  int? get transitionFromQueueIndex => frame.transitionFromQueueIndex;
  int? get transitionToQueueIndex => frame.transitionToQueueIndex;
  bool get hasMultipleQueueItems => frame.hasMultipleQueueItems;
  String? Function(int index) get artworkAtQueueIndex =>
      frame.artworkAtQueueIndex;

  bool get _hasValidPagerTransition {
    final fromIndex = transitionFromQueueIndex;
    final toIndex = transitionToQueueIndex;
    final items = transitionQueueItems;
    return fromIndex != null &&
        toIndex != null &&
        items != null &&
        hasMultipleQueueItems &&
        items.isNotEmpty &&
        fromIndex >= 0 &&
        toIndex >= 0 &&
        fromIndex < items.length &&
        toIndex < items.length;
  }

  @override
  Widget build(BuildContext context) {
    final isPagerTransition = _hasValidPagerTransition;
    final layers = isPagerTransition
        ? _buildPagerTransitionLayers()
        : _buildCurrentArtworkLayers();
    final stack = Stack(clipBehavior: Clip.none, children: layers);

    // A pager jump is drawn in a square viewport so intermediate cards do not
    // spill into the taller gesture target below the stack.
    return isPagerTransition
        ? ClipRect(child: SizedBox(width: size, height: size, child: stack))
        : stack;
  }

  List<Widget> _buildPagerTransitionLayers() {
    final fromIndex = transitionFromQueueIndex!;
    final toIndex = transitionToQueueIndex!;
    final items = transitionQueueItems!;
    final currentPage = fromIndex + (toIndex - fromIndex) * progress;
    String? artworkAt(int index) => index == fromIndex
        ? transitionFromArtwork
        : index == toIndex
        ? transitionToArtwork
        : artworkAtQueueIndex(index);

    // Multi-track jumps replay each intervening swipe in sequence.
    return toIndex > fromIndex
        ? _buildForwardQueueTransitionLayers(
            items: items,
            currentPage: currentPage,
            fromIndex: fromIndex,
            toIndex: toIndex,
            artworkAt: artworkAt,
          )
        : _buildBackwardQueueTransitionLayers(
            items: items,
            currentPage: currentPage,
            fromIndex: fromIndex,
            toIndex: toIndex,
            artworkAt: artworkAt,
          );
  }

  List<Widget> _buildCurrentArtworkLayers() {
    final layers = <Widget>[];
    if (!frame.inTransition && followingArtworkUrl != null) {
      // Reveal the third card only during a swipe; at rest it becomes the
      // ordinary next card, so a fourth visible card would be misleading.
      layers.add(_followingArtworkLayer(followingArtworkUrl!, dragProgress));
    }

    if (!frame.inTransition && nextArtworkUrl != null) {
      layers.add(
        _nextArtworkLayer(
          imageUrl: nextArtworkUrl,
          top: size * _nextCardTopFraction,
          scale: _nextCardRestScale + (_nextCardScaleRange * dragProgress),
          translateY: -size * _nextCardTopFraction * dragProgress,
          glassBorderOpacity: 1 - dragProgress,
          opacity: _previewCardMaxOpacity +
              ((1 - _previewCardMaxOpacity) * dragProgress),
        ),
      );
    }

    if (frame.inTransition) {
      if (nextArtworkUrl != null) {
        layers.add(
          _nextArtworkLayer(
            imageUrl: nextArtworkUrl,
            top: size * _nextCardTopFraction,
            scale: _nextCardRestScale,
          ),
        );
      }
      layers.add(
        _positionedArtwork(
          imageUrl: transitionToArtwork!,
          top: size * _nextCardTopFraction * (1 - progress),
          scale: _nextCardRestScale + (_nextCardScaleRange * progress),
          glassBorderOpacity: 1 - progress,
        ),
      );
      layers.add(
        Positioned(
          left: 0,
          top: 0,
          width: size,
          height: size,
          child: Opacity(
            opacity: 1 -
                (transitionFromSwipe ? transitionFlightProgress : progress),
            child: Transform.translate(
              offset: transitionFromSwipe
                  ? Offset.lerp(
                      transitionStartOffset,
                      transitionEndOffset,
                      transitionFlightProgress,
                    )!
                  : Offset(0, -size * progress),
              child: _artworkCard(transitionFromArtwork),
            ),
          ),
        ),
      );
    } else {
      layers.add(
        _positionedArtwork(
          imageUrl: currentArtworkUrl,
          top: 0,
          scale: 1,
          translateOffset: currentArtworkOffset,
        ),
      );
    }
    return layers;
  }

  List<Widget> _buildForwardQueueTransitionLayers({
    required List<MusicAssistantQueueItem> items,
    required double currentPage,
    required int fromIndex,
    required int toIndex,
    required String? Function(int index) artworkAt,
  }) {
    // floor() identifies the card leaving the stack; the fractional part is
    // the progress of the current one-card swipe.
    final currentIndex = currentPage.floor().clamp(fromIndex, toIndex).toInt();
    final swipeProgress = (currentPage - currentIndex)
        .clamp(0.0, 1.0)
        .toDouble();
    final nextIndex = currentIndex + 1;
    final followingIndex = currentIndex + 2;
    final layers = <Widget>[];

    if (followingIndex < items.length) {
      layers.add(
        _followingArtworkLayer(artworkAt(followingIndex), swipeProgress),
      );
    }
    if (nextIndex < items.length) {
      layers.add(
        _nextArtworkLayer(
          imageUrl: artworkAt(nextIndex),
          top: size * _nextCardTopFraction,
          scale: _nextCardRestScale + (_nextCardScaleRange * swipeProgress),
          translateY: -size * _nextCardTopFraction * swipeProgress,
          glassBorderOpacity: 1 - swipeProgress,
        ),
      );
    }
    layers.add(
      Positioned(
        left: 0,
        top: 0,
        width: size,
        height: size,
        child: Opacity(
          opacity: 1 - swipeProgress,
          child: Transform.translate(
            offset: Offset(0, -size * swipeProgress),
            child: _artworkCard(artworkAt(currentIndex)),
          ),
        ),
      ),
    );
    return layers;
  }

  List<Widget> _buildBackwardQueueTransitionLayers({
    required List<MusicAssistantQueueItem> items,
    required double currentPage,
    required int fromIndex,
    required int toIndex,
    required String? Function(int index) artworkAt,
  }) {
    // ceil() identifies the card currently on top as we move toward lower
    // indices. Reverse progress runs from that card to the previous one.
    final currentIndex = currentPage
        .ceil()
        .clamp(toIndex + 1, fromIndex)
        .toInt();
    final previousIndex = currentIndex - 1;
    final reverseProgress = (currentIndex - currentPage)
        .clamp(0.0, 1.0)
        .toDouble();
    final forwardProgress = 1 - reverseProgress;
    final followingIndex = currentIndex + 1;
    final layers = <Widget>[];

    if (followingIndex < items.length) {
      layers.add(
        _followingArtworkLayer(artworkAt(followingIndex), forwardProgress),
      );
    }
    layers.add(
      _nextArtworkLayer(
        imageUrl: artworkAt(currentIndex),
        top: size * _nextCardTopFraction,
        scale: _nextCardRestScale + (_nextCardScaleRange * forwardProgress),
        translateY: -size * _nextCardTopFraction * forwardProgress,
        glassBorderOpacity: reverseProgress,
      ),
    );
    layers.add(
      Positioned(
        left: 0,
        top: 0,
        width: size,
        height: size,
        child: Opacity(
          opacity: reverseProgress,
          child: Transform.translate(
            offset: Offset(0, -size * forwardProgress),
            child: _artworkCard(artworkAt(previousIndex)),
          ),
        ),
      ),
    );
    return layers;
  }

  Widget _followingArtworkLayer(String? imageUrl, double progress) =>
      Positioned(
        left: 0,
        top: size * _followingCardTopFraction,
        width: size,
        height: size,
        child: Opacity(
          opacity: _previewCardMaxOpacity * progress,
          child: Transform.translate(
            offset: Offset(0, -size * _nextCardTopFraction * progress),
            child: _nextArtworkCard(
              imageUrl,
              scale: _followingCardRestScale +
                  (_followingCardScaleRange * progress),
            ),
          ),
        ),
      );

  Widget _nextArtworkLayer({
    required String? imageUrl,
    required double top,
    required double scale,
    double translateY = 0,
    double glassBorderOpacity = 1,
    double opacity = 1,
  }) =>
      Positioned(
        left: 0,
        top: top,
        width: size,
        height: size,
        child: Opacity(
          opacity: opacity,
          child: Transform.translate(
            offset: Offset(0, translateY),
            child: _nextArtworkCard(
              imageUrl,
              scale: scale,
              glassBorderOpacity: glassBorderOpacity,
            ),
          ),
        ),
      );

  Widget _nextArtworkCard(
    String? imageUrl, {
    required double scale,
    double glassBorderOpacity = 1,
  }) =>
      Transform.scale(
        scale: scale,
        alignment: Alignment.topCenter,
        child: _artworkCard(imageUrl, glassBorderOpacity: glassBorderOpacity),
      );

  Widget _positionedArtwork({
    required String? imageUrl,
    required double top,
    required double scale,
    Offset translateOffset = Offset.zero,
    double glassBorderOpacity = 0,
  }) =>
      Positioned(
        left: 0,
        top: top,
        width: size,
        height: size,
        child: Transform.translate(
          offset: translateOffset,
          child: Transform.scale(
            scale: scale,
            alignment: Alignment.topCenter,
            child: _artworkCard(
              imageUrl,
              glassBorderOpacity: glassBorderOpacity,
            ),
          ),
        ),
      );

  Widget _artworkCard(String? imageUrl, {double glassBorderOpacity = 0}) =>
      QueueArtworkStackCard(
        imageUrl: imageUrl,
        serverUrl: serverUrl,
        token: token,
        size: size,
        glassBorderOpacity: glassBorderOpacity,
      );
}
