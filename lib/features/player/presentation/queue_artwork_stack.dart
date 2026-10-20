import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:music_assistant_api/music_assistant_api.dart';

import '../../../design_system/glass_tokens.dart';
import '../data/music_assistant_repository.dart';
import '../domain/recent_media_item.dart';
import 'artwork_image.dart';
import 'queue_artwork_stack_view.dart';
import '../viewmodels/player_queue_view_model.dart';
import '../viewmodels/player_playback_view_model.dart';

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
  final PlayerQueueViewModel queueController;
  final PlayerPlaybackViewModel playbackController;
  final double size;

  @override
  State<QueueArtworkStack> createState() => _QueueArtworkStackState();
}

class _QueueArtworkStackState extends State<QueueArtworkStack>
    with TickerProviderStateMixin {
  static const _stackHeightFraction = 1.1;
  static const _maxUpwardDragFraction = 1.5;
  static const _blockedDragResistance = .14;
  static const _upwardResistancePointFraction = .22;
  static const _upwardInitialResistance = .45;
  static const _upwardReleaseMultiplier = 1.15;
  static const _skipDistanceFraction = .3;
  static const _skipVelocityThreshold = -1100.0;
  static const _maxSpringVelocityPerSize = 8.0;
  static const _queueRefreshDelay = Duration(milliseconds: 350);
  static const _skipArtworkRecoveryDelay = Duration(milliseconds: 1400);
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
  PlayerQueueViewModel get _queueController => widget.queueController;
  PlayerPlaybackViewModel get _playbackController =>
      widget.playbackController;

  final Set<String> _loggedArtworkProxyIds = <String>{};

  String? _queueItemArtwork(MusicAssistantQueueItem item) {
    final imageUrl = RecentMediaItem.imageUrlFromQueueItem(
      item,
      album: _queueController.albumByQueueItemId[item.queueItemId],
    );
    final proxyId = _proxyIdFromArtworkUrl(imageUrl);
    if (proxyId != null && _loggedArtworkProxyIds.add(proxyId)) {
      debugPrint('[QueueArtworkStack] artwork proxyId: $proxyId');
    }
    return imageUrl;
  }

  String? _proxyIdFromArtworkUrl(String? imageUrl) {
    if (imageUrl == null) return null;
    final pathSegments = Uri.tryParse(imageUrl)?.pathSegments;
    if (pathSegments == null) return null;
    final proxySegment = pathSegments.indexOf('imageproxy');
    if (proxySegment < 0 || proxySegment + 1 >= pathSegments.length) {
      return null;
    }
    return pathSegments[proxySegment + 1];
  }

  final Set<String> _prewarmedArtwork = <String>{};

  void _prewarmArtwork(String? imageUrl) {
    if (imageUrl == null || !_prewarmedArtwork.add(imageUrl)) return;
    final provider = artworkLowResolutionImageProvider(
      imageUrl: imageUrl,
      serverUrl: repository.serverUrl,
      token: repository.token,
    );
    if (provider == null) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      unawaited(precacheImage(provider, context).catchError((Object _) {}));
    });
  }

  void _prewarmUpcomingArtworkAfter(int queueIndex) {
    final items = _queueController.items;
    for (final item in items.skip(queueIndex + 1).take(2)) {
      _prewarmArtwork(_queueItemArtwork(item));
    }
  }

  // Artwork identity shown by the stack and its best-known queue position.
  String? _displayedArtworkUrl;
  String? _displayedArtworkTrackIdentity;
  int? _displayedQueueIndexHint;

  // Snapshot used to render a transition while queue/player state is changing.
  String? _transitionFromArtwork;
  String? _transitionToArtwork;
  List<MusicAssistantQueueItem>? _transitionQueueItems;
  int? _transitionFromQueueIndex;
  int? _transitionToQueueIndex;

  // Animation controllers and delayed reconciliation tasks.
  late final AnimationController _artworkTransition;
  late final AnimationController _artworkDrag;
  Timer? _nextQueueRefreshTimer;
  Timer? _skipArtworkTimeout;
  Timer? _skipCommandDebounceTimer;

  // The swipe cursor can move ahead of the server while the user auditions tracks.
  int? _pendingSkipQueueIndex;
  // Artwork and upcoming cards follow this local cursor until the server catches up.
  int? _localArtworkQueueIndex;

  // Drag motion is split into raw input and interpolated animation endpoints so
  // a release can continue smoothly from the gesture's current position.
  Offset _artworkDragOffset = Offset.zero;
  double _rawArtworkDragY = 0;
  Offset _motionStartOffset = Offset.zero;
  Offset _motionEndOffset = Offset.zero;
  Offset _transitionStartOffset = Offset.zero;
  Offset _transitionEndOffset = Offset.zero;
  double _motionStartProgress = 0;
  double _motionEndProgress = 0;
  double _transitionStartProgress = 0;

  // Gesture and transition mode flags.
  bool _isDraggingArtwork = false;
  bool _transitionFromSwipe = false;
  bool _isSkippingFromArtwork = false;
  bool _preventArtworkSkip = false;

  @override
  void initState() {
    super.initState();
    _artworkTransition = AnimationController(
      vsync: this,
      duration: GlassTokens.queueArtworkTransitionDuration,
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
    _preventArtworkSkip = false;
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

  int? get _activeArtworkQueueIndex {
    final queue = _queueController.queue;
    return _pendingSkipQueueIndex ??
        _localArtworkQueueIndex ??
        _queueIndexForTrack(
          _playerTrackIdentity(player),
          indexHint: _displayedQueueIndexHint,
        ) ??
        queue?.currentIndex;
  }

  bool get _canSwipeToNextQueueItem {
    final queue = _queueController.queue;
    final items = _queueController.items;
    if (queue == null || items.isEmpty) return true;

    final currentIndex = _activeArtworkQueueIndex;
    // If the current slot is unknown, allow the gesture and let the server
    // handle it. A known final item has nowhere to advance in this queue.
    return currentIndex == null ||
        currentIndex < 0 ||
        currentIndex < items.length - 1;
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

  void _clearLocalDisplayedMediaAfterBuild() {
    final expectedMedia = _playbackController.localDisplayedMedia;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted ||
          !identical(_playbackController.localDisplayedMedia, expectedMedia)) {
        return;
      }
      _playbackController.clearLocalDisplayedMedia();
    });
  }

  @override
  void didUpdateWidget(covariant QueueArtworkStack oldWidget) {
    super.didUpdateWidget(oldWidget);
    final oldTrackIdentity = _playerTrackIdentity(oldWidget.player);
    final newTrackIdentity = _playerTrackIdentity(widget.player);
    if (_hasPlaybackContextChanged(oldWidget)) {
      _resetArtworkState();
      return;
    }
    if (oldTrackIdentity == newTrackIdentity) return;

    _handlePlayerTrackChanged(
      oldPlayer: oldWidget.player,
      oldTrackIdentity: oldTrackIdentity,
      newTrackIdentity: newTrackIdentity,
    );
  }

  bool _hasPlaybackContextChanged(QueueArtworkStack oldWidget) =>
      oldWidget.player.playerId != widget.player.playerId ||
      oldWidget.repository != widget.repository ||
      oldWidget.queueController != widget.queueController ||
      oldWidget.playbackController != widget.playbackController;

  void _handlePlayerTrackChanged({
    required MusicAssistantPlayer oldPlayer,
    required String? oldTrackIdentity,
    required String? newTrackIdentity,
  }) {
    final localSelection = _reconcileLocalSelection(newTrackIdentity);
    final swipeHandoffProgress = _artworkDrag.value
        .clamp(0.0, 1.0)
        .toDouble();
    final swipeHandoffVelocity = _artworkDrag.isAnimating
        ? _artworkDrag.velocity
        : 0.0;
    final isSwipeHandoff = _isSkippingFromArtwork || _isDraggingArtwork;
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
    final swipeTargetQueueIndex = _swipeTargetQueueIndex(
      isSwipeHandoff: isSwipeHandoff,
      oldQueueIndex: oldQueueIndex,
      queueItems: queueItems,
      newTrackIdentity: newTrackIdentity,
      fallbackIndex: newQueueIndex,
    );
    final isQueuePageScroll = !isSwipeHandoff &&
        !localSelection.isServerConfirmation &&
        queue != null &&
        oldQueueIndex != null &&
        newQueueIndex != null &&
        newQueueIndex != oldQueueIndex;

    _configureArtworkTransition(
      oldPlayer: oldPlayer,
      newTrackIdentity: newTrackIdentity,
      queueItems: queueItems,
      swipeTargetQueueIndex: swipeTargetQueueIndex,
      oldQueueIndex: oldQueueIndex,
      newQueueIndex: newQueueIndex,
      isSwipeHandoff: isSwipeHandoff,
      isQueuePageScroll: isQueuePageScroll,
      localSelection: localSelection,
      swipeHandoffProgress: swipeHandoffProgress,
      swipeHandoffVelocity: swipeHandoffVelocity,
    );
    _scheduleQueueRefresh();
  }

  ({bool isServerConfirmation, int? localDisplayIndex})
  _reconcileLocalSelection(String? newTrackIdentity) {
    final localDisplayIndex =
        _localArtworkQueueIndex ?? _pendingSkipQueueIndex;
    final items = _queueController.items;
    final isServerConfirmation = localDisplayIndex != null &&
        localDisplayIndex < items.length &&
        _queueItemMatchesTrackIdentity(
          items[localDisplayIndex],
          newTrackIdentity,
        );
    final pendingSkipIndex = _pendingSkipQueueIndex;
    if (pendingSkipIndex != null &&
        pendingSkipIndex < items.length &&
        _queueItemMatchesTrackIdentity(
          items[pendingSkipIndex],
          newTrackIdentity,
        )) {
      _pendingSkipQueueIndex = null;
      _localArtworkQueueIndex = pendingSkipIndex;
      _skipCommandDebounceTimer?.cancel();
      _clearLocalDisplayedMediaAfterBuild();
    } else if (_pendingSkipQueueIndex == null) {
      _clearLocalDisplayedMediaAfterBuild();
    }
    return (
      isServerConfirmation: isServerConfirmation,
      localDisplayIndex: localDisplayIndex,
    );
  }

  int? _swipeTargetQueueIndex({
    required bool isSwipeHandoff,
    required int? oldQueueIndex,
    required List<MusicAssistantQueueItem> queueItems,
    required String? newTrackIdentity,
    required int? fallbackIndex,
  }) {
    if (!isSwipeHandoff || oldQueueIndex == null || queueItems.isEmpty) {
      return fallbackIndex;
    }

    // A repeated track can occupy several queue slots. Prefer the next slot
    // after the outgoing card if it matches the player-reported destination.
    final expectedIndex = (oldQueueIndex + 1) % queueItems.length;
    return _queueItemMatchesTrackIdentity(
      queueItems[expectedIndex],
      newTrackIdentity,
    )
        ? expectedIndex
        : fallbackIndex;
  }

  void _configureArtworkTransition({
    required MusicAssistantPlayer oldPlayer,
    required String? newTrackIdentity,
    required List<MusicAssistantQueueItem> queueItems,
    required int? swipeTargetQueueIndex,
    required int? oldQueueIndex,
    required int? newQueueIndex,
    required bool isSwipeHandoff,
    required bool isQueuePageScroll,
    required ({bool isServerConfirmation, int? localDisplayIndex})
    localSelection,
    required double swipeHandoffProgress,
    required double swipeHandoffVelocity,
  }) {
    final queue = _queueController.queue;
    _transitionFromSwipe = isSwipeHandoff;
    _transitionFromQueueIndex = isQueuePageScroll ? oldQueueIndex : null;
    _transitionToQueueIndex = isQueuePageScroll ? newQueueIndex : null;
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

    // Prefer queue artwork for a selected track; the player can report a
    // different image URL for the same media item.
    _displayedQueueIndexHint = swipeTargetQueueIndex;
    final playerImageUrl = widget.player.currentMedia?.imageUrl;
    final promotedArtwork = widget.player.currentMedia?.mediaType ==
            MusicAssistantMediaType.radio
        ? playerImageUrl
        : queue != null && swipeTargetQueueIndex != null
        ? _queueItemArtwork(queueItems[swipeTargetQueueIndex])
        : playerImageUrl;
    _transitionFromArtwork = oldPlayer.currentMedia?.imageUrl;
    _transitionToArtwork = promotedArtwork ?? playerImageUrl;
    _displayedArtworkTrackIdentity = newTrackIdentity;
    _displayedArtworkUrl = _transitionToArtwork;

    if (localSelection.isServerConfirmation) {
      // The local swipe already displayed this item; the server update only
      // confirms it and should not replay the artwork transition.
      _localArtworkQueueIndex = localSelection.localDisplayIndex;
      _transitionFromArtwork = null;
      _transitionToArtwork = null;
      _transitionQueueItems = null;
      _transitionFromQueueIndex = null;
      _transitionToQueueIndex = null;
      _transitionFromSwipe = false;
      _transitionStartProgress = 0;
    }

    // Keep the old upcoming cards until the queue snapshot catches up.
    _artworkDrag.stop();
    _artworkDrag.value = 0;
    _artworkDragOffset = Offset.zero;
    _startArtworkTransition(
      isServerConfirmation: localSelection.isServerConfirmation,
      isQueuePageScroll: isQueuePageScroll,
      swipeHandoffProgress: swipeHandoffProgress,
      swipeHandoffVelocity: swipeHandoffVelocity,
    );
  }

  void _startArtworkTransition({
    required bool isServerConfirmation,
    required bool isQueuePageScroll,
    required double swipeHandoffProgress,
    required double swipeHandoffVelocity,
  }) {
    if (isServerConfirmation) {
      _artworkTransition
        ..stop()
        ..value = 1;
      return;
    }
    if (isQueuePageScroll) {
      _artworkTransition
        ..stop()
        ..value = 0;
      _artworkTransition.animateTo(
        1,
        duration: GlassTokens.queueArtworkTransitionDuration,
        curve: Curves.easeInOutCubic,
      );
      return;
    }
    _artworkTransition.animateWith(
      SpringSimulation(
        _artworkSpring,
        swipeHandoffProgress,
        1,
        swipeHandoffVelocity,
      ),
    );
  }

  void _scheduleQueueRefresh() {
    // Player state can arrive before its queue index. Refresh after a short
    // debounce so upcoming artwork resolves against the updated queue.
    _nextQueueRefreshTimer?.cancel();
    _nextQueueRefreshTimer = Timer(_queueRefreshDelay, () {
      unawaited(
        _queueController.refresh().then<void>(
          (_) {},
          onError: (Object _, StackTrace __) {},
        ),
      );
    });
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
        onVerticalDragStart: (_) => _onArtworkDragStart(size),
        onVerticalDragUpdate: (details) =>
            _onArtworkDragUpdate(details, size),
        onVerticalDragEnd: (details) => _onArtworkDragEnd(details, size),
        onVerticalDragCancel: () => _onArtworkDragCancel(size),
        child: child,
      );

  void _onArtworkDragStart(double size) {
    // A blocked gesture may still spring back, but cannot trigger playback.
    _preventArtworkSkip =
        _playbackController.isPlaybackRequestInProgress ||
        !_canSwipeToNextQueueItem;
    // If another swipe starts before the previous one settles, promote its
    // target first so the new gesture starts from the correct artwork.
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
  }

  void _onArtworkDragUpdate(DragUpdateDetails details, double size) {
    _rawArtworkDragY = (_rawArtworkDragY + details.delta.dy)
        .clamp(-size * _maxUpwardDragFraction, size)
        .toDouble();
    final rawDistance = -_rawArtworkDragY;

    if (_preventArtworkSkip) {
      // In either direction, a blocked card only stretches slightly.
      _artworkDragOffset = Offset(0, _rawArtworkDragY * _blockedDragResistance);
    } else if (rawDistance >= 0) {
      // Resist short upward pulls, then let the card travel freely enough to
      // reach the dismissal threshold without requiring a long swipe.
      final resistancePoint = size * _upwardResistancePointFraction;
      final resistedDistance = rawDistance <= resistancePoint
          ? rawDistance * _upwardInitialResistance
          : resistancePoint * _upwardInitialResistance +
                (rawDistance - resistancePoint) * _upwardReleaseMultiplier;
      _artworkDragOffset = Offset(0, -resistedDistance);
    } else {
      // Downward movement is a small tactile stretch and always springs back.
      _artworkDragOffset = Offset(0, -rawDistance * _blockedDragResistance);
    }

    _artworkDrag.value = (_artworkDragOffset.distance / size)
        .clamp(0.0, 1.0)
        .toDouble();
  }

  void _onArtworkDragEnd(DragEndDetails details, double size) {
    final upwardVelocity = details.velocity.pixelsPerSecond.dy;
    final wasBlocked = _preventArtworkSkip;
    final shouldSkip = !wasBlocked &&
        !_playbackController.isPlaybackRequestInProgress &&
        _canSwipeToNextQueueItem &&
        (_artworkDragOffset.dy < -size * _skipDistanceFraction ||
            upwardVelocity < _skipVelocityThreshold);
    _preventArtworkSkip = false;
    final releaseOffset = _artworkDragOffset;
    setState(() {
      _isDraggingArtwork = false;
      _isSkippingFromArtwork = shouldSkip;
    });
    _settleArtworkDrag(
      wasBlocked ? 0 : upwardVelocity.abs(),
      size,
      startOffset: releaseOffset,
      target: shouldSkip ? 1 : 0,
      endOffset: shouldSkip ? _offscreenOffset(releaseOffset) : Offset.zero,
    );
    if (shouldSkip) _skipToNextTrack();
  }

  void _onArtworkDragCancel(double size) {
    _preventArtworkSkip = false;
    final releaseOffset = _artworkDragOffset;
    setState(() => _isDraggingArtwork = false);
    _settleArtworkDrag(
      0,
      size,
      startOffset: releaseOffset,
      endOffset: Offset.zero,
    );
  }

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
        (pixelsPerSecond / size)
            .clamp(0.0, _maxSpringVelocityPerSize)
            .toDouble();
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

    final baseIndex = _activeArtworkQueueIndex;
    if (baseIndex == null || baseIndex < 0 || baseIndex >= queueItems.length) {
      unawaited(_sendNextTrackCommand());
      return;
    }
    if (baseIndex == queueItems.length - 1) return;

    // Update the displayed player immediately, then replace the pending target
    // on each swipe. Only the last target is sent after the user pauses.
    _pendingSkipQueueIndex = baseIndex + 1;
    final selectedItem = queueItems[_pendingSkipQueueIndex!];
    final artworkUrl = _queueItemArtwork(selectedItem);
    _prewarmArtwork(artworkUrl);
    _prewarmUpcomingArtworkAfter(_pendingSkipQueueIndex!);
    _playbackController.displayQueueItemLocally(
      selectedItem,
      artist: _queueController.queueArtist(selectedItem),
      imageUrl: artworkUrl,
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
    _skipArtworkTimeout = Timer(_skipArtworkRecoveryDelay, () {
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
    return AnimatedBuilder(
      animation: Listenable.merge([
        _queueController,
        _artworkDrag,
        _artworkTransition,
      ]),
      builder: (context, _) {
        final upcomingItems = _upcomingQueueItems;
        final nextArtworkUrl = upcomingItems.isEmpty
            ? null
            : _queueItemArtwork(upcomingItems.first);
        final followingArtworkUrl = upcomingItems.length < 2
            ? null
            : _queueItemArtwork(upcomingItems[1]);
        // Warm upcoming images while the queue state is current, before a
        // swipe needs to promote either card.
        _prewarmArtwork(nextArtworkUrl);
        _prewarmArtwork(followingArtworkUrl);
        final stackHeight = size * _stackHeightFraction;
        final progress =
            _artworkTransition.value.clamp(0.0, 1.0).toDouble();
        final dragProgress = _artworkDrag.value.clamp(0.0, 1.0).toDouble();
        final transitionFlightProgress = _transitionStartProgress >= 1
            ? 1.0
            : ((progress - _transitionStartProgress) /
                      (1 - _transitionStartProgress))
                  .clamp(0.0, 1.0)
                  .toDouble();
        final stackView = QueueArtworkStackView(
          size: size,
          frame: QueueArtworkStackFrame(
            progress: progress,
            dragProgress: dragProgress,
            transitionFlightProgress: transitionFlightProgress,
            currentArtworkUrl: _currentArtworkUrl,
            currentArtworkOffset: _currentArtworkOffset,
            transitionFromSwipe: _transitionFromSwipe,
            transitionStartOffset: _transitionStartOffset,
            transitionEndOffset: _transitionEndOffset,
            transitionFromArtwork: _transitionFromArtwork,
            transitionToArtwork: _transitionToArtwork,
            transitionQueueItems: _transitionQueueItems,
            transitionFromQueueIndex: _transitionFromQueueIndex,
            transitionToQueueIndex: _transitionToQueueIndex,
            hasMultipleQueueItems: _queueController.items.length > 1,
            artworkAtQueueIndex: (index) =>
                _queueItemArtwork(_transitionQueueItems![index]),
          ),
          nextArtworkUrl: nextArtworkUrl,
          followingArtworkUrl: followingArtworkUrl,
          serverUrl: repository.serverUrl,
          token: repository.token,
        );
        return _interactiveArtworkArea(
          SizedBox(
            width: size,
            height: stackHeight,
            child: stackView,
          ),
          size,
        );
      },
    );
  }

  String? get _currentArtworkUrl {
    final media = player.currentMedia;

    // Live radio: the stream identity never changes, but the metadata (and
    // artwork) does. Follow the player unless a local swipe is still pending.
    if (media?.mediaType == MusicAssistantMediaType.radio &&
        _pendingSkipQueueIndex == null &&
        media?.imageUrl != null) {
      return media!.imageUrl;
    }

    final localIndex = _localArtworkQueueIndex;
    final items = _queueController.items;
    if (localIndex != null && localIndex >= 0 && localIndex < items.length) {
      return _displayedArtworkUrl ?? _queueItemArtwork(items[localIndex]);
    }
    if (media?.mediaType == MusicAssistantMediaType.radio) {
      return media?.imageUrl;
    }
    final trackIdentity = _playerTrackIdentity(player);
    if (trackIdentity == _displayedArtworkTrackIdentity) {
      return _displayedArtworkUrl ?? media?.imageUrl;
    }
    return media?.imageUrl;
  }
}
