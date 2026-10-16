import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:music_assistant_api/music_assistant_api.dart';

import '../data/music_assistant_repository.dart';
import '../domain/recent_media_item.dart';
import 'artwork_image.dart';
import 'player_queue_controller.dart';
import 'player_playback_controller.dart';

/// Displays and animates the current and upcoming queue artwork.
class QueueArtworkStack extends StatefulWidget {
  const QueueArtworkStack({
    super.key,
    required this.player,
    required this.repository,
    required this.queueController,
    required this.playbackController,
    required this.size,
  });

  final MusicAssistantPlayer player;
  final MusicAssistantRepository repository;
  final PlayerQueueController queueController;
  final PlayerPlaybackController playbackController;
  final double size;

  @override
  State<QueueArtworkStack> createState() => _QueueArtworkStackState();
}

class _QueueArtworkStackState extends State<QueueArtworkStack>
    with TickerProviderStateMixin {
  static const _artworkSpring = SpringDescription(
    mass: 1,
    stiffness: 300,
    damping: 36,
  );
  // Reset this after every swipe. If another card is swiped before it expires,
  // that card replaces the pending target and no intermediate item is played.
  static const _skipCommandDebounce = Duration(milliseconds: 1200);

  MusicAssistantPlayer get player => widget.player;
  MusicAssistantRepository get repository => widget.repository;
  PlayerQueueController get _queueController => widget.queueController;
  PlayerPlaybackController get _playbackController =>
      widget.playbackController;

  String? _queueItemArtwork(MusicAssistantQueueItem item) =>
      RecentMediaItem.imageUrlFromQueueItem(
        item,
        album: _queueController.albumByQueueItemId[item.queueItemId],
      );

  String? _displayedArtworkUrl;
  String? _displayedArtworkTrackIdentity;
  int? _displayedQueueIndexHint;
  String? _transitionFromArtwork;
  String? _transitionToArtwork;
  List<MusicAssistantQueueItem>? _transitionQueueItems;
  int? _transitionFromQueueIndex;
  int? _transitionToQueueIndex;
  late final AnimationController _artworkTransition;
  late final AnimationController _artworkDrag;
  Timer? _nextQueueRefreshTimer;
  Timer? _skipArtworkTimeout;
  Timer? _skipCommandDebounceTimer;
  // The swipe cursor can move ahead of the server while the user auditions tracks.
  int? _pendingSkipQueueIndex;
  // Artwork and upcoming cards follow this local cursor until the server catches up.
  int? _localArtworkQueueIndex;
  Offset _artworkDragOffset = Offset.zero;
  double _rawArtworkDragY = 0;
  Offset _motionStartOffset = Offset.zero;
  Offset _motionEndOffset = Offset.zero;
  Offset _transitionStartOffset = Offset.zero;
  Offset _transitionEndOffset = Offset.zero;
  double _motionStartProgress = 0;
  double _motionEndProgress = 0;
  double _transitionStartProgress = 0;
  bool _isDraggingArtwork = false;
  bool _transitionFromSwipe = false;
  bool _isSkippingFromArtwork = false;
  bool _ignoreArtworkDrag = false;

  @override
  void initState() {
    super.initState();
    _artworkTransition = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 520),
    )..addStatusListener(_onArtworkTransitionStatus);
    _artworkDrag = AnimationController.unbounded(vsync: this)
      ..addStatusListener(_onArtworkDragStatus);
  }

  void _onArtworkDragStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed && _isSkippingFromArtwork) {
      _promotePendingArtwork();
    }
  }

  void _promotePendingArtwork() {
    final index = _pendingSkipQueueIndex;
    final items = _queueController.items;
    if (index == null || index < 0 || index >= items.length) return;
    final item = items[index];
    // The outgoing card has finished its flight. Make the selected local item
    // current so another swipe can start without waiting for the player update.
    _localArtworkQueueIndex = index;
    _displayedQueueIndexHint = index;
    _displayedArtworkTrackIdentity = item.queueItemId;
    _displayedArtworkUrl = _queueItemArtwork(item);
    _artworkDrag
      ..stop()
      ..value = 0;
    _artworkDragOffset = Offset.zero;
    _motionStartProgress = 0;
    _motionEndProgress = 0;
    _motionStartOffset = Offset.zero;
    _motionEndOffset = Offset.zero;
    _isSkippingFromArtwork = false;
    if (mounted) setState(() {});
  }

  void _resetArtworkState() {
    _nextQueueRefreshTimer?.cancel();
    _skipArtworkTimeout?.cancel();
    _skipCommandDebounceTimer?.cancel();
    _pendingSkipQueueIndex = null;
    _localArtworkQueueIndex = null;
    _playbackController.clearLocalDisplayedMedia();
    _displayedArtworkUrl = null;
    _displayedArtworkTrackIdentity = null;
    _displayedQueueIndexHint = null;
    _transitionFromArtwork = null;
    _transitionToArtwork = null;
    _transitionQueueItems = null;
    _transitionFromQueueIndex = null;
    _transitionToQueueIndex = null;
    _artworkTransition
      ..stop()
      ..value = 1;
    _artworkDrag
      ..stop()
      ..value = 0;
    _artworkDragOffset = Offset.zero;
    _isDraggingArtwork = false;
    _isSkippingFromArtwork = false;
    _motionStartProgress = 0;
    _motionEndProgress = 0;
    _motionStartOffset = Offset.zero;
    _motionEndOffset = Offset.zero;
    _transitionFromSwipe = false;
    _transitionStartProgress = 0;
    _transitionStartOffset = Offset.zero;
    _transitionEndOffset = Offset.zero;
  }

  List<MusicAssistantQueueItem> get _upcomingQueueItems {
    final localIndex = _localArtworkQueueIndex;
    final queueItems = _queueController.items;
    // The server cursor still points at the playing item during a local swipe.
    // Use the local cursor so the next visible cards advance immediately.
    if (localIndex != null && localIndex < queueItems.length) {
      return queueItems.skip(localIndex + 1).take(2).toList(growable: false);
    }
    final currentTrackIdentity = _playerTrackIdentity(player);
    return _upcomingQueueItemsAfter(currentTrackIdentity);
  }

  List<MusicAssistantQueueItem> _upcomingQueueItemsAfter(
    String? trackIdentity,
  ) {
    final queue = _queueController.queue;
    if (queue == null) return const [];
    final items = _queueController.items;
    // Prefer the displayed track's remembered slot while queue events lag.
    final indexHint = trackIdentity == _displayedArtworkTrackIdentity
        ? _displayedQueueIndexHint
        : null;
    final currentIndex =
        _queueIndexForTrack(trackIdentity, indexHint: indexHint) ??
        queue.currentIndex;
    if (currentIndex == null) return const [];
    final firstUpcoming = (currentIndex + 1)
        .clamp(0, items.length)
        .toInt();
    return items.skip(firstUpcoming).take(2).toList(growable: false);
  }

  int? _queueIndexForTrack(String? trackIdentity, {int? indexHint}) {
    final queue = _queueController.queue;
    final items = _queueController.items;
    if (queue == null || trackIdentity == null) return null;
    final serverIndex = queue.currentIndex;
    final serverIndexMatchesTrack = serverIndex != null &&
        serverIndex >= 0 &&
        serverIndex < items.length &&
        _queueItemMatchesTrackIdentity(items[serverIndex], trackIdentity);
    if (serverIndexMatchesTrack) return serverIndex;
    if (indexHint != null &&
        indexHint >= 0 &&
        indexHint < items.length &&
        _queueItemMatchesTrackIdentity(items[indexHint], trackIdentity)) {
      return indexHint;
    }
    final matchingIndex = items.indexWhere(
      (item) => _queueItemMatchesTrackIdentity(item, trackIdentity),
    );
    return matchingIndex >= 0 ? matchingIndex : null;
  }

  String? _playerTrackIdentity(MusicAssistantPlayer player) =>
      player.currentMedia?.queueItemId ??
      player.currentMedia?.uri ??
      player.currentMedia?.title;

  bool _queueItemMatchesTrackIdentity(
    MusicAssistantQueueItem item,
    String? trackIdentity,
  ) =>
      trackIdentity != null &&
      (item.queueItemId == trackIdentity ||
          item.mediaItem?.uri == trackIdentity ||
          item.mediaItem?.itemId == trackIdentity);

  void _onArtworkTransitionStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed && mounted) {
      setState(() {
        _transitionFromArtwork = null;
        _transitionToArtwork = null;
        _transitionQueueItems = null;
        _transitionFromQueueIndex = null;
        _transitionToQueueIndex = null;
        _transitionFromSwipe = false;
        _transitionStartProgress = 0;
        _transitionStartOffset = Offset.zero;
        _transitionEndOffset = Offset.zero;
        _motionStartProgress = 0;
        _motionEndProgress = 0;
        _motionStartOffset = Offset.zero;
        _motionEndOffset = Offset.zero;
      });
    }
  }

  @override
  void didUpdateWidget(covariant QueueArtworkStack oldWidget) {
    super.didUpdateWidget(oldWidget);
    final oldTrackIdentity = _playerTrackIdentity(oldWidget.player);
    final newTrackIdentity = _playerTrackIdentity(widget.player);
    if (oldWidget.player.playerId != widget.player.playerId ||
        oldWidget.repository != widget.repository ||
        oldWidget.queueController != widget.queueController ||
        oldWidget.playbackController != widget.playbackController) {
      _resetArtworkState();
    } else if (oldTrackIdentity != newTrackIdentity) {
      final localDisplayIndex =
          _localArtworkQueueIndex ?? _pendingSkipQueueIndex;
      final isServerConfirmingLocalSelection = localDisplayIndex != null &&
          localDisplayIndex < _queueController.items.length &&
          _queueItemMatchesTrackIdentity(
            _queueController.items[localDisplayIndex],
            newTrackIdentity,
          );
      final pendingSkipIndex = _pendingSkipQueueIndex;
      if (pendingSkipIndex != null &&
          pendingSkipIndex < _queueController.items.length &&
          _queueItemMatchesTrackIdentity(
            _queueController.items[pendingSkipIndex],
            newTrackIdentity,
          )) {
        _pendingSkipQueueIndex = null;
        _localArtworkQueueIndex = pendingSkipIndex;
        _skipCommandDebounceTimer?.cancel();
        _playbackController.clearLocalDisplayedMedia();
      } else if (_pendingSkipQueueIndex == null) {
        _playbackController.clearLocalDisplayedMedia();
      }
      final swipeHandoffProgress =
          _artworkDrag.value.clamp(0.0, 1.0).toDouble();
      final swipeHandoffVelocity = _artworkDrag.isAnimating
          ? _artworkDrag.velocity
          : 0.0;
      final isSwipeHandoff =
          _isSkippingFromArtwork || _isDraggingArtwork;
      final queue = _queueController.queue;
      final queueItems = _queueController.items;
      final oldQueueIndex = _queueIndexForTrack(
        oldTrackIdentity,
        indexHint: oldTrackIdentity == _displayedArtworkTrackIdentity
            ? _displayedQueueIndexHint
            : null,
      );
      final newQueueIndex = _queueIndexForTrack(newTrackIdentity);
      if (_pendingSkipQueueIndex == null) {
        _localArtworkQueueIndex = newQueueIndex;
      }
      final expectedSwipeIndex = isSwipeHandoff &&
              oldQueueIndex != null &&
              queue != null &&
              queueItems.isNotEmpty
          ? (oldQueueIndex + 1) % queueItems.length
          : null;
      // During a swipe, the next queue slot disambiguates repeated tracks. Use
      // it only if that slot still matches the player-reported track.
      final swipeTargetQueueIndex = expectedSwipeIndex != null &&
              queue != null &&
              _queueItemMatchesTrackIdentity(
                queueItems[expectedSwipeIndex],
                newTrackIdentity,
              )
          ? expectedSwipeIndex
          : newQueueIndex;
      final isQueuePageScroll = !isSwipeHandoff &&
          !isServerConfirmingLocalSelection &&
          queue != null &&
          oldQueueIndex != null &&
          newQueueIndex != null &&
          newQueueIndex != oldQueueIndex;
      _transitionFromSwipe = isSwipeHandoff;
      _transitionFromQueueIndex =
          isQueuePageScroll ? oldQueueIndex! : null;
      _transitionToQueueIndex =
          isQueuePageScroll ? newQueueIndex! : null;
      _transitionQueueItems = isQueuePageScroll
          ? List<MusicAssistantQueueItem>.unmodifiable(queueItems)
          : null;
      _transitionStartProgress = swipeHandoffProgress;
      _transitionStartOffset = _currentArtworkOffset;
      _transitionEndOffset = isSwipeHandoff
          ? (_isDraggingArtwork && !_isSkippingFromArtwork
                ? _offscreenOffset(_transitionStartOffset)
                : _motionEndOffset)
          : Offset.zero;
      _skipArtworkTimeout?.cancel();
      _isSkippingFromArtwork = false;
      _isDraggingArtwork = false;
      // A manual queue selection can jump over several tracks. Promote the
      // artwork matching the new player URI instead of assuming one-step next.
      _displayedQueueIndexHint = swipeTargetQueueIndex;
      final promotedArtwork = queue != null && swipeTargetQueueIndex != null
          ? _queueItemArtwork(queueItems[swipeTargetQueueIndex])
          : widget.player.currentMedia?.imageUrl;
      _transitionFromArtwork = oldWidget.player.currentMedia?.imageUrl;
      // Use the queue item's artwork for the selected track when available;
      // the player media can expose a different URL for the same artwork.
      _transitionToArtwork =
          promotedArtwork ?? widget.player.currentMedia?.imageUrl;
      _displayedArtworkTrackIdentity = newTrackIdentity;
      _displayedArtworkUrl = _transitionToArtwork;
      if (isServerConfirmingLocalSelection) {
        // The stack already moved to this item during the swipe. Treat its
        // player update as confirmation instead of animating the card again.
        _localArtworkQueueIndex = localDisplayIndex;
        _transitionFromArtwork = null;
        _transitionToArtwork = null;
        _transitionQueueItems = null;
        _transitionFromQueueIndex = null;
        _transitionToQueueIndex = null;
        _transitionFromSwipe = false;
        _transitionStartProgress = 0;
      }
      // Keep the old second upcoming item visible until the shared queue data
      // catches up with the new current track.
      _artworkDrag.stop();
      _artworkDrag.value = 0;
      _artworkDragOffset = Offset.zero;
      if (isServerConfirmingLocalSelection) {
        _artworkTransition
          ..stop()
          ..value = 1;
      } else if (isQueuePageScroll) {
        final skippedPages = (newQueueIndex! - oldQueueIndex!).abs();
        _artworkTransition
          ..stop()
          ..value = 0;
        _artworkTransition.animateTo(
          1,
          duration: Duration(
            milliseconds: (380 + (skippedPages - 1) * 105)
                .clamp(380, 1100)
                .toInt(),
          ),
          curve: Curves.easeInOutCubic,
        );
      } else {
        _artworkTransition.animateWith(
          SpringSimulation(
            _artworkSpring,
            swipeHandoffProgress,
            1,
            swipeHandoffVelocity,
          ),
        );
      }
      // Music Assistant can publish the player change before its queue index
      // has caught up. Fetch after a short debounce so we get the item after
      // the newly playing track, rather than briefly requesting that track.
      _nextQueueRefreshTimer?.cancel();
      _nextQueueRefreshTimer = Timer(const Duration(milliseconds: 350), () {
        unawaited(
          _queueController.refresh().then<void>(
            (_) {},
            onError: (Object _, StackTrace __) {},
          ),
        );
      });
    }
  }

  @override
  void dispose() {
    _nextQueueRefreshTimer?.cancel();
    _skipArtworkTimeout?.cancel();
    _skipCommandDebounceTimer?.cancel();
    _artworkDrag.dispose();
    _artworkTransition
      ..removeStatusListener(_onArtworkTransitionStatus)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => _stackedArtwork(widget.size);

  Widget _interactiveArtworkArea(Widget child, double size) =>
      GestureDetector(
        behavior: HitTestBehavior.opaque,
        onVerticalDragStart: (_) {
          // Latch this at gesture start. If a request begins mid-gesture, ignore
          // the whole gesture so its end event cannot accidentally skip again.
          _ignoreArtworkDrag =
              _playbackController.isPlaybackRequestInProgress;
          if (_ignoreArtworkDrag) return;
          // If another swipe starts before the artwork spring completes,
          // promote its target before dragging the next card.
          if (_isSkippingFromArtwork) {
            _skipArtworkTimeout?.cancel();
            _promotePendingArtwork();
          }
          final currentOffset = _currentArtworkOffset;
          _artworkDrag.stop();
          _artworkDragOffset = currentOffset;
          _rawArtworkDragY = currentOffset.dy;
          _artworkDrag.value =
              (currentOffset.distance / size).clamp(0.0, 1.0).toDouble();
          _motionStartProgress = _artworkDrag.value;
          _motionStartOffset = currentOffset;
          _motionEndOffset = Offset.zero;
          setState(() => _isDraggingArtwork = true);
        },
        onVerticalDragUpdate: (details) {
          if (_ignoreArtworkDrag) return;
          _rawArtworkDragY = (_rawArtworkDragY + details.delta.dy).clamp(
            -size * 1.5,
            size,
          ).toDouble();
          final rawDistance = -_rawArtworkDragY;
          if (rawDistance >= 0) {
            final resistancePoint = size * .22;
            // Short upward pulls feel weighted. Past the breakaway point the
            // card follows more freely toward dismissal.
            final resistedDistance = rawDistance <= resistancePoint
                ? rawDistance * .45
                : resistancePoint * .45 +
                      (rawDistance - resistancePoint) * 1.15;
            _artworkDragOffset = Offset(0, -resistedDistance);
          } else {
            // A downward pull is allowed as a small tactile stretch, but has
            // much stronger resistance and always springs back on release.
            _artworkDragOffset = Offset(0, -rawDistance * .14);
          }
          _artworkDrag.value =
              (_artworkDragOffset.distance / size)
                  .clamp(0.0, 1.0)
                  .toDouble();
        },
        onVerticalDragEnd: (details) {
          if (_ignoreArtworkDrag) {
            _ignoreArtworkDrag = false;
            return;
          }
          final upwardVelocity = details.velocity.pixelsPerSecond.dy;
          final shouldSkip = !_playbackController.isPlaybackRequestInProgress &&
              (_artworkDragOffset.dy < -size * .3 ||
                  upwardVelocity < -1100);
          final releaseOffset = _artworkDragOffset;
          setState(() {
            _isDraggingArtwork = false;
            _isSkippingFromArtwork = shouldSkip;
          });
          _settleArtworkDrag(
            upwardVelocity.abs(),
            size,
            startOffset: releaseOffset,
            target: shouldSkip ? 1 : 0,
            endOffset: shouldSkip
                ? _offscreenOffset(releaseOffset)
                : Offset.zero,
          );
          if (shouldSkip) _skipToNextTrack();
        },
        onVerticalDragCancel: () {
          if (_ignoreArtworkDrag) {
            _ignoreArtworkDrag = false;
            return;
          }
          final releaseOffset = _artworkDragOffset;
          setState(() => _isDraggingArtwork = false);
          _settleArtworkDrag(
            0,
            size,
            startOffset: releaseOffset,
            endOffset: Offset.zero,
          );
        },
        child: child,
      );

  void _settleArtworkDrag(
    double pixelsPerSecond,
    double size, {
    double target = 0,
    required Offset startOffset,
    required Offset endOffset,
  }) {
    _motionStartProgress = _artworkDrag.value.clamp(0.0, 1.0).toDouble();
    _motionEndProgress = target;
    _motionStartOffset = startOffset;
    _motionEndOffset = endOffset;
    final initialVelocity = (target >= _motionStartProgress ? 1 : -1) *
        (pixelsPerSecond / size).clamp(0.0, 8.0).toDouble();
    _artworkDrag.animateWith(
      SpringSimulation(
        _artworkSpring,
        _motionStartProgress,
        target,
        initialVelocity,
      ),
    );
  }

  Offset get _currentArtworkOffset {
    if (_isDraggingArtwork) return _artworkDragOffset;
    final currentProgress = _artworkDrag.value.clamp(0.0, 1.0).toDouble();
    final progressRange = _motionEndProgress - _motionStartProgress;
    final t = progressRange == 0
        ? 1.0
        : ((currentProgress - _motionStartProgress) / progressRange)
              .clamp(0.0, 1.0)
              .toDouble();
    return Offset.lerp(_motionStartOffset, _motionEndOffset, t)!;
  }

  Offset _offscreenOffset(Offset startOffset) {
    final viewport = MediaQuery.sizeOf(context);
    final distance = Offset(viewport.width, viewport.height).distance;
    return Offset(0, startOffset.dy - distance);
  }

  void _skipToNextTrack() {
    final queue = _queueController.queue;
    final queueItems = _queueController.items;
    if (queue == null || queueItems.isEmpty) {
      unawaited(_sendNextTrackCommand());
      return;
    }

    final baseIndex = _pendingSkipQueueIndex ??
        _queueIndexForTrack(
          _playerTrackIdentity(player),
          indexHint: _displayedQueueIndexHint,
        ) ??
        queue.currentIndex;
    if (baseIndex == null || baseIndex < 0 || baseIndex >= queueItems.length) {
      unawaited(_sendNextTrackCommand());
      return;
    }

    // Update the displayed player immediately, then replace the pending target
    // on each swipe. Only the last target is sent after the user pauses.
    _pendingSkipQueueIndex = (baseIndex + 1) % queueItems.length;
    final selectedItem = queueItems[_pendingSkipQueueIndex!];
    _playbackController.displayQueueItemLocally(
      selectedItem,
      artist: _queueController.queueArtist(selectedItem),
      imageUrl: _queueItemArtwork(selectedItem),
    );
    _skipCommandDebounceTimer?.cancel();
    _skipCommandDebounceTimer = Timer(_skipCommandDebounce, () {
      unawaited(_playPendingQueueItem());
    });
  }

  Future<void> _playPendingQueueItem() async {
    final queueIndex = _pendingSkipQueueIndex;
    if (queueIndex == null || queueIndex >= _queueController.items.length) {
      await _sendNextTrackCommand();
      return;
    }

    final item = _queueController.items[queueIndex];
    try {
      // Address the final queue item directly. A generic "next" command could
      // play intermediate tracks or use a stale server queue cursor.
      await _playbackController.playQueueItem(
        index: queueIndex,
        queueItemId: item.queueItemId,
      );
    } catch (_) {
      _recoverSkipArtwork();
    }
  }

  Future<void> _sendNextTrackCommand() async {
    final trackBeforeSkip = _playerTrackIdentity(player);
    try {
      await _playbackController.skipToNextTrack();
      _scheduleSkipArtworkRecovery(trackBeforeSkip);
    } catch (_) {
      // Keep the gesture self-contained; playback state remains authoritative.
      _recoverSkipArtwork();
    }
  }

  void _scheduleSkipArtworkRecovery(String? trackBeforeSkip) {
    _skipArtworkTimeout?.cancel();
    _skipArtworkTimeout = Timer(const Duration(milliseconds: 1400), () {
      if (_playerTrackIdentity(player) != trackBeforeSkip) return;
      _recoverSkipArtwork();
    });
  }

  void _recoverSkipArtwork() {
    if (!mounted) return;
    final currentOffset = _currentArtworkOffset;
    setState(() => _isSkippingFromArtwork = false);
    _settleArtworkDrag(
      0,
      widget.size,
      startOffset: currentOffset,
      endOffset: Offset.zero,
    );
  }

  Widget _stackedArtwork(double size) {
    final upcomingItems = _upcomingQueueItems;
    final nextArtworkUrl = upcomingItems.isEmpty
        ? null
        : _queueItemArtwork(upcomingItems.first);
    final followingArtworkUrl = upcomingItems.length < 2
        ? null
        : _queueItemArtwork(upcomingItems[1]);
    final stackHeight = size * 1.1;
    final hasMultipleQueueItems = _queueController.items.length > 1;
    final inTransition =
        hasMultipleQueueItems &&
        _transitionFromArtwork != null &&
        _transitionToArtwork != null;

    return AnimatedBuilder(
      animation: Listenable.merge([
        _queueController,
        _artworkDrag,
        _artworkTransition,
      ]),
      builder: (context, _) {
        final progress =
            _artworkTransition.value.clamp(0.0, 1.0).toDouble();
        final dragProgress = _artworkDrag.value.clamp(0.0, 1.0).toDouble();
        final transitionFlightProgress = _transitionStartProgress >= 1
            ? 1.0
            : ((progress - _transitionStartProgress) /
                      (1 - _transitionStartProgress))
                  .clamp(0.0, 1.0)
                  .toDouble();
        final children = <Widget>[];

        final pageScrollFrom = _transitionFromQueueIndex;
        final pageScrollTo = _transitionToQueueIndex;
        final pageScrollItems = _transitionQueueItems;
        final isPagerTransition =
            pageScrollFrom != null &&
            pageScrollTo != null &&
            pageScrollItems != null &&
            _queueController.items.length > 1 &&
            pageScrollItems.isNotEmpty &&
            pageScrollFrom >= 0 &&
            pageScrollTo >= 0 &&
            pageScrollFrom < pageScrollItems.length &&
            pageScrollTo < pageScrollItems.length;
        if (isPagerTransition) {
          final fromIndex = pageScrollFrom!;
          final toIndex = pageScrollTo!;
          final items = pageScrollItems!;
          final currentPage = fromIndex +
              (toIndex - fromIndex) * progress;
          String? artworkAt(int index) => index == fromIndex
              ? _transitionFromArtwork
              : index == toIndex
              ? _transitionToArtwork
              : _queueItemArtwork(items[index]);

          if (toIndex > fromIndex) {
            // Replay the on-screen swipe for every skipped track: the
            // current card leaves upward, the next card grows into place,
            // and a third card appears underneath during the handoff.
            final currentIndex = currentPage
                .floor()
                .clamp(fromIndex, toIndex)
                .toInt();
            final swipeProgress = (currentPage - currentIndex)
                .clamp(0.0, 1.0)
                .toDouble();
            final nextIndex = currentIndex + 1;
            final followingIndex = currentIndex + 2;

            if (followingIndex < items.length) {
              children.add(
                Positioned(
                  left: 0,
                  top: size * .42,
                  width: size,
                  height: size,
                  child: Opacity(
                    opacity: swipeProgress,
                    child: Transform.translate(
                      offset: Offset(0, -size * .21 * swipeProgress),
                      child: _nextArtworkCard(
                        artworkAt(followingIndex),
                        size,
                        scale: .74 + (.12 * swipeProgress),
                      ),
                    ),
                  ),
                ),
              );
            }
            if (nextIndex < items.length) {
              children.add(
                _nextArtworkLayer(
                  imageUrl: artworkAt(nextIndex),
                  size: size,
                  top: size * .21,
                  scale: .86 + (.14 * swipeProgress),
                  translateY: -size * .21 * swipeProgress,
                ),
              );
            }
            children.add(
              Positioned(
                left: 0,
                top: 0,
                width: size,
                height: size,
                child: Opacity(
                  opacity: 1 - swipeProgress,
                  child: Transform.translate(
                    offset: Offset(0, -size * swipeProgress),
                    child: _artworkCard(artworkAt(currentIndex), size),
                  ),
                ),
              ),
            );
          } else {
            // Moving backward behaves like paging back through cards.
            // Keep the reverse motion linear, since the upward dismissal
            // gesture is only used to advance playback.
            for (var index = currentPage.floor() - 1;
                index <= currentPage.ceil() + 1;
                index++) {
              if (index < 0 || index >= items.length) continue;
              children.add(
                Positioned(
                  left: 0,
                  top: size * (index - currentPage),
                  width: size,
                  height: size,
                  child: _artworkCard(artworkAt(index), size),
                ),
              );
            }
          }
        } else {
          if (!inTransition && followingArtworkUrl != null) {
            // The third card is extra depth: reveal it only while a swipe
            // is in progress. Once playback advances, it becomes the
            // ordinary next card and no fourth card is shown at rest.
            children.add(
              Positioned(
                left: 0,
                top: size * .42,
                width: size,
                height: size,
                child: Opacity(
                  opacity: dragProgress,
                  child: Transform.translate(
                    offset: Offset(0, -size * .21 * dragProgress),
                    child: _nextArtworkCard(
                      followingArtworkUrl,
                      size,
                      scale: .74 + (.12 * dragProgress),
                    ),
                  ),
                ),
              ),
            );
          }

          if (!inTransition && nextArtworkUrl != null) {
            children.add(
              _nextArtworkLayer(
                imageUrl: nextArtworkUrl,
                size: size,
                top: size * .21,
                scale: .86 + (.14 * dragProgress),
                translateY: -size * .21 * dragProgress,
              ),
            );
          }

          if (inTransition) {
            // Keep the third card hidden during the handoff. The ordinary
            // drag layer reveals it only while the user is swiping, and
            // after the handoff it becomes the visible next card.
            if (nextArtworkUrl != null) {
              children.add(
                _nextArtworkLayer(
                  imageUrl: nextArtworkUrl,
                  size: size,
                  top: size * .21,
                  scale: .86,
                ),
              );
            }
            children.add(
              _positionedArtwork(
                imageUrl: _transitionToArtwork!,
                size: size,
                top: size * .21 * (1 - progress),
                scale: .86 + (.14 * progress),
              ),
            );
            children.add(
              Positioned(
                left: 0,
                top: 0,
                width: size,
                height: size,
                child: Opacity(
                  opacity: 1 -
                      (_transitionFromSwipe
                          ? transitionFlightProgress
                          : progress),
                  child: Transform.translate(
                    offset: _transitionFromSwipe
                        ? Offset.lerp(
                            _transitionStartOffset,
                            _transitionEndOffset,
                            transitionFlightProgress,
                          )!
                        : Offset(0, -size * progress),
                    child: _artworkCard(_transitionFromArtwork, size),
                  ),
                ),
              ),
            );
          } else {
            children.add(
              _positionedArtwork(
                imageUrl: _currentArtworkUrl,
                size: size,
                top: 0,
                scale: 1,
                translateOffset: _currentArtworkOffset,
              ),
            );
          }
        }

        final stack = Stack(clipBehavior: Clip.none, children: children);
        return _interactiveArtworkArea(
          SizedBox(
            width: size,
            height: stackHeight,
            child: isPagerTransition
                ? ClipRect(
                    child: SizedBox(width: size, height: size, child: stack),
                  )
                : stack,
          ),
          size,
        );
      },
    );
  }

  String? get _currentArtworkUrl {
    final localIndex = _localArtworkQueueIndex;
    final items = _queueController.items;
    if (localIndex != null && localIndex >= 0 && localIndex < items.length) {
      return _displayedArtworkUrl ?? _queueItemArtwork(items[localIndex]);
    }
    final trackIdentity = _playerTrackIdentity(player);
    if (trackIdentity == _displayedArtworkTrackIdentity) {
      return _displayedArtworkUrl ?? player.currentMedia?.imageUrl;
    }
    return player.currentMedia?.imageUrl;
  }

  Widget _nextArtworkLayer({
    required String? imageUrl,
    required double size,
    required double top,
    required double scale,
    double translateY = 0,
  }) => Positioned(
    left: 0,
    top: top,
    width: size,
    height: size,
    child: Transform.translate(
      offset: Offset(0, translateY),
      child: _nextArtworkCard(imageUrl, size, scale: scale),
    ),
  );

  Widget _nextArtworkCard(
    String? imageUrl,
    double size, {
    required double scale,
  }) => Transform.scale(
    scale: scale,
    alignment: Alignment.topCenter,
    child: _artworkCard(imageUrl, size),
  );

  Widget _positionedArtwork({
    required String? imageUrl,
    required double size,
    required double top,
    required double scale,
    Offset translateOffset = Offset.zero,
  }) => Positioned(
    left: 0,
    top: top,
    width: size,
    height: size,
    child: Transform.translate(
      offset: translateOffset,
      child: Transform.scale(
        scale: scale,
        alignment: Alignment.topCenter,
        child: _artworkCard(imageUrl, size),
      ),
    ),
  );

  Widget _artworkCard(String? imageUrl, double size) => RepaintBoundary(
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .46),
            blurRadius: 24,
            offset: const Offset(0, 16),
          ),
        ],
      ),
      child: ArtworkImage(
        imageUrl: imageUrl,
        serverUrl: repository.serverUrl,
        token: repository.token,
        size: size,
        showShadow: false,
      ),
    ),
  );
}
