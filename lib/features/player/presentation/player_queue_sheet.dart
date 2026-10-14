import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_assistant_api/music_assistant_api.dart';

import '../data/music_assistant_repository.dart';
import '../domain/player_queue_snapshot.dart';
import '../domain/recent_media_item.dart';
import 'artwork_image.dart';
import '../../../design_system/glass_tokens.dart';
import '../../../design_system/glass_scroll_fade.dart';
import 'player_glass_widgets.dart';

class PlayerQueueSheet extends StatefulWidget {
  const PlayerQueueSheet({
    super.key,
    required this.repository,
    required this.playerId,
    required this.initialMediaUri,
    required this.onQueueCleared,
  });

  final MusicAssistantRepository repository;
  final String playerId;
  final String? initialMediaUri;
  final ValueChanged<String> onQueueCleared;

  @override
  State<PlayerQueueSheet> createState() => _PlayerQueueSheetState();
}

class _PlayerQueueSheetState extends State<PlayerQueueSheet> {
  static const double _minExtent = .50;
  static const double _initialExtent = .72;
  static const double _maxExtent = .94;

  late Future<PlayerQueueSnapshot> _queue;
  PlayerQueueSnapshot? _lastQueueSnapshot;
  Set<String> _movedQueueItemKeys = {};
  // Revision keys retrigger move animations without remounting rows on refresh.
  final Map<String, int> _queueItemMoveVersions = {};
  final DraggableScrollableController _sheetController =
      DraggableScrollableController();
  final ValueNotifier<double> _dismissProgress = ValueNotifier(0);
  double _handleDragDistance = 0;
  bool _isClearingQueue = false;
  bool? _autoplayEnabled;
  bool _isTogglingAutoplay = false;
  bool _isRemovingQueueItem = false;
  String? _removingQueueItemKey;
  List<Map<String, dynamic>>? _queueItemsOverride;
  int? _startingQueueRowIndex;
  int? _currentQueueRowIndexOverride;
  bool _didPositionQueueAtCurrentItem = false;
  bool _queuePositioned = false;
  bool _routeEntered = false;
  Animation<double>? _routeAnimation;
  int? _lastAutoScrolledQueueRowIndex;
  late String? _currentPlayingUri;
  late final void Function() _unsubscribeFromPlayerEvents;
  late final void Function() _unsubscribeFromQueueEvents;
  Timer? _queueRefreshTimer;
  bool _queueRefreshInFlight = false;
  bool _queueRefreshPending = false;

  @override
  void initState() {
    super.initState();
    _queue = _loadQueue();
    _currentPlayingUri = widget.initialMediaUri;
    _unsubscribeFromQueueEvents = widget.repository.listenToQueueEvents(
      playerId: widget.playerId,
      onEvent: _onQueueEvent,
    );
    _unsubscribeFromPlayerEvents = widget.repository.listenToPlayerEvents(
      onChanged: (player) {
        if (player.playerId != widget.playerId ||
            (player.currentMedia?.uri == null &&
                player.currentMedia?.title == null)) {
          return;
        }
        if (!mounted) return;
        setState(() {
          // Some player updates include a title but omit the URI. Keep the last
          // known URI in that case so the queue highlight does not fall back to
          // an older currentIndex from the initial queue snapshot.
          if (player.currentMedia?.uri != null) {
            _currentPlayingUri = player.currentMedia!.uri;
            _currentQueueRowIndexOverride = null;
          }
        });
      },
      onRemoved: (_) {},
    );
  }

  void _onQueueEvent(Map<String, dynamic> event) {
    if (!mounted) return;
    final eventType = event['event'];
    // Only queue creation and item changes affect this list. Player events
    // update the current-item highlight; time events need no list refresh.
    if (eventType != 'queue_items_updated' &&
        eventType != 'queue_added' &&
        eventType != 'queue_updated') {
      return;
    }
    if (_isRemovingQueueItem) {
      // Keep the event: the server may publish the delete while the optimistic
      // request is still completing. Refresh again after the first fetch.
      _queueRefreshPending = true;
      return;
    }
    if (_queueRefreshInFlight) {
      _queueRefreshPending = true;
      return;
    }
    // The server may emit several queue events for one operation. Coalesce
    // them into one fetch so the popup always renders the final queue state.
    _scheduleQueueRefresh();
  }

  void _scheduleQueueRefresh({
    Duration delay = const Duration(milliseconds: 320),
  }) {
    _queueRefreshTimer?.cancel();
    _queueRefreshTimer = Timer(delay, () {
      if (!mounted) return;
      if (_isRemovingQueueItem) return;
      if (_queueRefreshInFlight) {
        _queueRefreshPending = true;
        return;
      }
      _startQueueRefresh();
    });
  }

  void _startQueueRefresh() {
    _queueRefreshInFlight = true;
    final refresh = _loadQueue();
    setState(() {
      _queue = refresh;
    });
    refresh.then((snapshot) {
      if (mounted &&
          identical(_queue, refresh) &&
          _queueItemsOverride != null &&
          _queueItemsMatch(_queueItemsOverride!, snapshot.items)) {
        // Retain the optimistic list until the server confirms the deletion.
        setState(() => _queueItemsOverride = null);
      }
      _finishQueueRefresh();
    }, onError: (Object _, StackTrace __) => _finishQueueRefresh());
  }

  void _finishQueueRefresh() {
    _queueRefreshInFlight = false;
    if (!mounted || !_queueRefreshPending) return;
    _queueRefreshPending = false;
    _scheduleQueueRefresh(delay: const Duration(milliseconds: 320));
  }

  Future<PlayerQueueSnapshot> _loadQueue() async {
    final previousQueue = _lastQueueSnapshot;
    final queue = await widget.repository.fetchQueue(widget.playerId);
    _movedQueueItemKeys = _queueItemsOverride == null && previousQueue != null
        ? _findMovedQueueItems(previousQueue.items, queue.items)
        : {};
    for (final itemKey in _movedQueueItemKeys) {
      _queueItemMoveVersions.update(
        itemKey,
        (version) => version + 1,
        ifAbsent: () => 1,
      );
    }
    _lastQueueSnapshot = queue;
    if (mounted && _autoplayEnabled != queue.autoplayEnabled) {
      setState(() => _autoplayEnabled = queue.autoplayEnabled);
    }
    return queue;
  }

  Set<String> _findMovedQueueItems(
    List<Map<String, dynamic>> previousItems,
    List<Map<String, dynamic>> currentItems,
  ) {
    // Only animate a reorder when the same uniquely identified items remain.
    if (previousItems.length != currentItems.length) return {};

    final previousIds = previousItems.map(_stableQueueItemId).toList();
    final currentIds = currentItems.map(_stableQueueItemId).toList();
    if (previousIds.any((id) => id == null) ||
        currentIds.any((id) => id == null)) {
      return {};
    }

    final oldIds = previousIds.cast<String>();
    final newIds = currentIds.cast<String>();
    final oldIdSet = oldIds.toSet();
    final newIdSet = newIds.toSet();
    if (oldIdSet.length != oldIds.length ||
        newIdSet.length != newIds.length ||
        !oldIdSet.containsAll(newIdSet)) {
      return {};
    }

    final oldPositions = {
      for (var index = 0; index < oldIds.length; index++) oldIds[index]: index,
    };
    return {
      for (var index = 0; index < currentItems.length; index++)
        if (oldPositions[newIds[index]] != index)
          _queueItemKey(currentItems[index], index),
    };
  }

  bool _queueItemsMatch(
    List<Map<String, dynamic>> optimisticItems,
    List<Map<String, dynamic>> serverItems,
  ) {
    if (optimisticItems.length != serverItems.length) return false;
    for (var index = 0; index < optimisticItems.length; index++) {
      if (_queueItemFingerprint(optimisticItems[index]) !=
          _queueItemFingerprint(serverItems[index])) {
        return false;
      }
    }
    return true;
  }

  String _queueItemFingerprint(Map<String, dynamic> item) {
    final id = _stableQueueItemId(item);
    if (id != null) return 'id:$id';
    final uri = _queueItemUri(item);
    final name = item['name'];
    final artist = _queueArtist(item);
    return 'media:${uri ?? ''}|${name is String ? name : ''}|${artist ?? ''}';
  }

  String? _stableQueueItemId(Map<String, dynamic> item) {
    final id = item['queue_item_id'];
    return id is String && id.isNotEmpty ? id : null;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final animation = ModalRoute.of(context)?.animation;
    if (identical(animation, _routeAnimation)) return;
    _routeAnimation?.removeStatusListener(_onRouteStatusChanged);
    _routeAnimation = animation;
    _routeEntered =
        animation == null || animation.status == AnimationStatus.completed;
    animation?.addStatusListener(_onRouteStatusChanged);
  }

  void _onRouteStatusChanged(AnimationStatus status) {
    if (status == AnimationStatus.completed && mounted && !_routeEntered) {
      setState(() => _routeEntered = true);
    }
  }

  Future<void> _toggleAutoplay() async {
    final current = _autoplayEnabled;
    if (current == null || _isTogglingAutoplay) return;
    final next = !current;
    setState(() {
      _autoplayEnabled = next;
      _isTogglingAutoplay = true;
    });
    try {
      await widget.repository.setQueueAutoplay(widget.playerId, next);
    } catch (error) {
      debugPrint('Could not update queue autoplay: $error');
      if (!mounted) return;
      setState(() => _autoplayEnabled = current);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not change autoplay.')),
      );
    } finally {
      if (mounted) setState(() => _isTogglingAutoplay = false);
    }
  }

  @override
  void dispose() {
    _routeAnimation?.removeStatusListener(_onRouteStatusChanged);
    _unsubscribeFromPlayerEvents();
    _unsubscribeFromQueueEvents();
    _queueRefreshTimer?.cancel();
    _dismissProgress.dispose();
    _sheetController.dispose();
    super.dispose();
  }

  void _onHandleDragUpdate(DragUpdateDetails details) {
    setState(() {
      _handleDragDistance = (_handleDragDistance + details.delta.dy)
          .clamp(0.0, 180.0)
          .toDouble();
    });
    if (_sheetController.isAttached) {
      final height = MediaQuery.sizeOf(context).height;
      _sheetController.jumpTo(
        (_sheetController.size - details.delta.dy / height)
            .clamp(_minExtent, _maxExtent)
            .toDouble(),
      );
    }
  }

  void _onHandleDragEnd(DragEndDetails details) {
    final dragDistance = _handleDragDistance;
    setState(() => _handleDragDistance = 0);
    if (!_sheetController.isAttached) return;
    final shouldClose =
        _sheetController.size <= _minExtent + .015 ||
        dragDistance >= 72 ||
        details.velocity.pixelsPerSecond.dy > 850;
    _sheetController.animateTo(
      shouldClose ? _minExtent : _initialExtent,
      duration: const Duration(milliseconds: 160),
      curve: Curves.easeOutCubic,
    );
  }

  Future<void> _confirmClearQueue() async {
    if (_isClearingQueue || _isRemovingQueueItem) return;

    final media = MediaQuery.of(context);
    final shouldClear = await showDialog<bool>(
      context: context,
      barrierColor: Colors.black54,
      builder: (dialogContext) => Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        insetPadding: const EdgeInsets.all(12),
        child: SizedBox(
          width: media.size.width * 0.94,
          child: GlassSurface(
            borderRadius: GlassTokens.radiusLarge,
            padding: const EdgeInsets.all(20),
            tint: const Color(0x33232A30),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Center(
                    child: Icon(
                      CupertinoIcons.exclamationmark_triangle,
                      color: Color(0xFFFF8E7C),
                      size: GlassTokens.iconSizeXl,
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'Clear queue?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: GlassTokens.fontSize22,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'This will remove all items from the queue.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: GlassTokens.textSecondary,
                      fontSize: GlassTokens.fontSize14,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 46,
                          child: OutlinedButton(
                            onPressed: () =>
                                Navigator.of(dialogContext).pop(false),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.white70,
                              side: const BorderSide(color: GlassTokens.border),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  GlassTokens.radiusMedium,
                                ),
                              ),
                            ),
                            child: const Text('CANCEL'),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: SizedBox(
                          height: 46,
                          child: FilledButton(
                            onPressed: () =>
                                Navigator.of(dialogContext).pop(true),
                            style: FilledButton.styleFrom(
                              backgroundColor: const Color(0xFFFF8E7C),
                              foregroundColor: const Color(0xFF11161C),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  GlassTokens.radiusMedium,
                                ),
                              ),
                            ),
                            child: const Text('CLEAR QUEUE'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    if (shouldClear != true || !mounted) return;

    setState(() => _isClearingQueue = true);
    try {
      await widget.repository.clearQueue(widget.playerId);
      if (mounted) {
        widget.onQueueCleared(widget.playerId);
        if (mounted) Navigator.of(context).pop();
      }
    } catch (error, stackTrace) {
      debugPrint('Could not clear the queue: $error');
      debugPrintStack(stackTrace: stackTrace);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not clear the queue.')),
        );
      }
    } finally {
      if (mounted) setState(() => _isClearingQueue = false);
    }
  }

  Future<void> _playQueueItem({
    required int rowIndex,
    required int queueIndex,
    String? queueItemId,
  }) async {
    if (_startingQueueRowIndex != null ||
        _isClearingQueue ||
        _isRemovingQueueItem) {
      return;
    }
    setState(() => _startingQueueRowIndex = rowIndex);
    try {
      await widget.repository.playQueueItem(
        widget.playerId,
        index: queueIndex,
        queueItemId: queueItemId,
      );
      if (mounted) {
        setState(() => _currentQueueRowIndexOverride = rowIndex);
        Navigator.of(context).pop();
      }
    } catch (error, stackTrace) {
      debugPrint('Could not play queue item $queueItemId: $error');
      debugPrintStack(stackTrace: stackTrace);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not start this queue item.')),
        );
      }
    } finally {
      if (mounted) setState(() => _startingQueueRowIndex = null);
    }
  }

  Future<void> _removeQueueItemOnServer({
    required List<Map<String, dynamic>> previousItems,
    required String itemKey,
    required int queueIndex,
    required String? queueItemId,
  }) async {
    try {
      await widget.repository.removeQueueItem(
        widget.playerId,
        index: queueIndex,
        queueItemId: queueItemId,
      );
    } catch (error, stackTrace) {
      debugPrint('Could not remove queue item $itemKey: $error');
      debugPrintStack(stackTrace: stackTrace);
      if (mounted) {
        setState(() {
          _queueItemsOverride = previousItems;
          _isRemovingQueueItem = false;
          _removingQueueItemKey = null;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              error is StateError &&
                      error.message ==
                          'This queue item is already buffered for playback.'
                  ? 'This item is already buffered for playback.'
                  : 'Could not remove this queue item.',
            ),
          ),
        );
        _scheduleQueueRefresh();
      }
      return;
    }
    if (mounted) {
      setState(() {
        _isRemovingQueueItem = false;
        _removingQueueItemKey = null;
      });
      _scheduleQueueRefresh();
    }
  }

  @override
  Widget build(BuildContext context) {
    final routeAnimation = ModalRoute.of(context)?.animation;
    final content = DraggableScrollableSheet(
      controller: _sheetController,
      expand: false,
      minChildSize: _minExtent,
      initialChildSize: _initialExtent,
      maxChildSize: _maxExtent,
      shouldCloseOnMinExtent: true,
      builder: (context, scrollController) => SizedBox.expand(
        child: GlassSurface(
          borderRadius: 28,
          padding: EdgeInsets.zero,
          tint: const Color(0xBB141D20),
          showShadow: false,
          border: const Border(
            top: BorderSide(color: Color(0x66FFFFFF), width: 0.8),
            left: BorderSide(color: Color(0x66FFFFFF), width: 0.8),
            right: BorderSide(color: Color(0x66FFFFFF), width: 0.8),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    height: 30,
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onVerticalDragUpdate: _onHandleDragUpdate,
                      onVerticalDragEnd: _onHandleDragEnd,
                      onVerticalDragCancel: () {
                        if (mounted) setState(() => _handleDragDistance = 0);
                      },
                      child: Center(
                        child: Container(
                          width: 36,
                          height: 4,
                          decoration: BoxDecoration(
                            color: const Color(0x99FFFFFF),
                            borderRadius: BorderRadius.circular(999),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Icon(
                      CupertinoIcons.music_note_list,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Text(
                        'Queue',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: GlassTokens.fontSize22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    IconButton(
                      tooltip: _autoplayEnabled == true
                          ? 'Disable autoplay'
                          : 'Enable autoplay',
                      onPressed: _autoplayEnabled == null || _isTogglingAutoplay
                          ? null
                          : _toggleAutoplay,
                      isSelected: _autoplayEnabled == true,
                      selectedIcon: _isTogglingAutoplay
                          ? const SizedBox.square(
                              dimension: 18,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white70,
                              ),
                            )
                          : const Icon(
                              CupertinoIcons.repeat,
                              color: Colors.white,
                            ),
                      icon: _isTogglingAutoplay
                          ? const SizedBox.square(
                              dimension: 18,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white70,
                              ),
                            )
                          : const Icon(
                              CupertinoIcons.repeat,
                              color: Colors.white70,
                            ),
                      style: IconButton.styleFrom(
                        backgroundColor: _autoplayEnabled == true
                            ? const Color(0x33FFFFFF)
                            : Colors.transparent,
                      ),
                    ),
                    IconButton(
                      tooltip: 'Clear queue',
                      onPressed: _isClearingQueue || _isRemovingQueueItem
                          ? null
                          : _confirmClearQueue,
                      icon: _isClearingQueue
                          ? const SizedBox.square(
                              dimension: 18,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white70,
                              ),
                            )
                          : const Icon(
                              CupertinoIcons.trash,
                              color: Colors.white70,
                            ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(
                        CupertinoIcons.xmark,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: FutureBuilder<PlayerQueueSnapshot>(
                    future: _queue,
                    initialData: _lastQueueSnapshot,
                    builder: (context, snapshot) {
                      if ((snapshot.data == null &&
                              snapshot.connectionState !=
                                  ConnectionState.done) ||
                          !_routeEntered) {
                        return SingleChildScrollView(
                          controller: scrollController,
                          child: SizedBox(
                            height: 240,
                            child: const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      }
                      if (snapshot.hasError && snapshot.data == null) {
                        return SingleChildScrollView(
                          controller: scrollController,
                          child: const SizedBox(
                            height: 240,
                            child: Center(
                              child: Text(
                                'Could not load the queue.',
                                style: TextStyle(color: Colors.white70),
                              ),
                            ),
                          ),
                        );
                      }
                      final queue = snapshot.data!;
                      final queueItems = _queueItemsOverride ?? queue.items;
                      if (queueItems.isEmpty) {
                        return SingleChildScrollView(
                          controller: scrollController,
                          child: const SizedBox(
                            height: 240,
                            child: Center(
                              child: Text(
                                'The queue is empty.',
                                style: TextStyle(color: Colors.white70),
                              ),
                            ),
                          ),
                        );
                      }
                      final currentQueueIndex = queue.currentIndex;
                      final uriMatch = _currentPlayingUri == null
                          ? -1
                          : queueItems.indexWhere(
                              (item) =>
                                  _queueItemUri(item) == _currentPlayingUri,
                            );
                      final serverIndexMatch = currentQueueIndex == null
                          ? -1
                          : queueItems.indexWhere((item) {
                              final itemIndex = item['index'] is num
                                  ? (item['index'] as num).toInt()
                                  : item['sort_index'] is num
                                  ? (item['sort_index'] as num).toInt()
                                  : -1;
                              return itemIndex == currentQueueIndex;
                            });
                      final currentQueueRowIndex =
                          _currentQueueRowIndexOverride ??
                          (uriMatch >= 0 ? uriMatch : serverIndexMatch);
                      if (currentQueueRowIndex >= 0 &&
                          currentQueueRowIndex !=
                              _lastAutoScrolledQueueRowIndex) {
                        final isInitialPosition =
                            !_didPositionQueueAtCurrentItem;
                        final shouldExpandSheet = isInitialPosition;
                        _didPositionQueueAtCurrentItem = true;
                        _lastAutoScrolledQueueRowIndex = currentQueueRowIndex;
                        WidgetsBinding.instance.addPostFrameCallback((_) async {
                          if (!mounted || !scrollController.hasClients) return;
                          final position = scrollController.position;
                          final expandSheet =
                              shouldExpandSheet && _sheetController.isAttached;
                          final expansionPixels = expandSheet
                              ? MediaQuery.sizeOf(context).height *
                                    (_maxExtent - _sheetController.size)
                              : 0.0;
                          final targetViewport =
                              position.viewportDimension + expansionPixels;
                          final currentRowHeight =
                              _queueArtist(queueItems[currentQueueRowIndex]) ==
                                  null
                              ? 63.0
                              : 79.0;
                          final targetOffset =
                              _estimatedQueueOffset(
                                queueItems,
                                currentQueueRowIndex,
                              ) -
                              (targetViewport - currentRowHeight) / 2;
                          final targetMaxScrollExtent =
                              (position.maxScrollExtent - expansionPixels)
                                  .clamp(0.0, position.maxScrollExtent)
                                  .toDouble();
                          if (expandSheet) {
                            unawaited(
                              _sheetController.animateTo(
                                _maxExtent,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeOutCubic,
                              ),
                            );
                          }
                          final offset = targetOffset
                              .clamp(0.0, targetMaxScrollExtent)
                              .toDouble();
                          if (isInitialPosition) {
                            scrollController.jumpTo(offset);
                          } else {
                            unawaited(
                              scrollController.animateTo(
                                offset,
                                duration: const Duration(milliseconds: 900),
                                curve: Curves.easeInOutQuart,
                              ),
                            );
                          }
                          _lastAutoScrolledQueueRowIndex = currentQueueRowIndex;
                          if (mounted) setState(() => _queuePositioned = true);
                        });
                      } else if (!_queuePositioned) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          if (mounted) setState(() => _queuePositioned = true);
                        });
                      }
                      return GlassScrollFade(
                        controller: scrollController,
                        child: Opacity(
                          opacity: _queuePositioned ? 1 : 0,
                          child: ListView.separated(
                            controller: scrollController,
                            findItemIndexCallback: (key) {
                              if (key is! ValueKey<String>) return null;
                              for (
                                var index = 0;
                                index < queueItems.length;
                                index++
                              ) {
                                if (_queueItemKey(queueItems[index], index) ==
                                    key.value) {
                                  return index;
                                }
                              }
                              return null;
                            },
                            itemCount: queueItems.length,
                            separatorBuilder: (_, index) {
                              final touchesCurrentItem =
                                  index == currentQueueRowIndex ||
                                  index + 1 == currentQueueRowIndex;
                              return touchesCurrentItem
                                  ? const SizedBox(height: 1)
                                  : const Divider(
                                      color: Color(0x33FFFFFF),
                                      height: 1,
                                    );
                            },
                            itemBuilder: (context, index) {
                              final item = queueItems[index];
                              final queueIndex = item['index'] is num
                                  ? (item['index'] as num).toInt()
                                  : item['sort_index'] is num
                                  ? (item['sort_index'] as num).toInt()
                                  : index;
                              final queueItemId =
                                  item['queue_item_id'] is String
                                  ? item['queue_item_id'] as String
                                  : null;
                              final itemKey = _queueItemKey(item, index);
                              final shouldAnimateRemoteMove =
                                  _movedQueueItemKeys.contains(itemKey);
                              final moveVersion =
                                  _queueItemMoveVersions[itemKey] ?? 0;
                              // The web app compares the rendered queue position
                              // directly with index_in_buffer.
                              final isBuffered =
                                  index <= (queue.indexInBuffer ?? 0);
                              final isCurrent = index == currentQueueRowIndex;
                              final isPreviouslyPlayed =
                                  currentQueueRowIndex >= 0 &&
                                  index < currentQueueRowIndex;
                              final artist = _queueArtist(item);
                              final isLoading = _startingQueueRowIndex == index;
                              final tile = ListTile(
                                onTap:
                                    _startingQueueRowIndex == null &&
                                        !_isClearingQueue
                                    ? () => _playQueueItem(
                                        rowIndex: index,
                                        queueIndex: queueIndex,
                                        queueItemId: queueItemId,
                                      )
                                    : null,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                ),
                                leading: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      width: 30,
                                      child: Center(
                                        child: Text(
                                          '${index + 1}',
                                          style: TextStyle(
                                            color: isCurrent
                                                ? Colors.white
                                                : Colors.white54,
                                            fontWeight: isCurrent
                                                ? FontWeight.w600
                                                : FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    ArtworkImage(
                                      imageUrl: RecentMediaItem.imageUrlFromMap(
                                        Map<String, dynamic>.from(item),
                                      ),
                                      serverUrl: widget.repository.serverUrl,
                                      token: widget.repository.token,
                                      size: 48,
                                    ),
                                  ],
                                ),
                                title: Text(
                                  _queueTrackTitle(item),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: isCurrent
                                        ? Colors.white
                                        : const Color(0xFFD8E0DB),
                                    fontWeight: isCurrent
                                        ? FontWeight.w600
                                        : FontWeight.w400,
                                  ),
                                ),
                                subtitle: artist == null
                                    ? null
                                    : Text(
                                        artist,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: Colors.white54,
                                        ),
                                      ),
                                trailing: isLoading
                                    ? const SizedBox.square(
                                        dimension: 20,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          color: Colors.white,
                                        ),
                                      )
                                    : isBuffered
                                    ? const Tooltip(
                                        message: 'Already queued for playback',
                                        child: Icon(
                                          CupertinoIcons.lock_fill,
                                          color: Colors.white38,
                                          size: 16,
                                        ),
                                      )
                                    : null,
                              );
                              return Dismissible(
                                key: ValueKey(itemKey),
                                movementDuration: const Duration(
                                  milliseconds: 220,
                                ),
                                resizeDuration: const Duration(
                                  milliseconds: 260,
                                ),
                                direction:
                                    _isClearingQueue ||
                                        (_isRemovingQueueItem &&
                                            _removingQueueItemKey != itemKey) ||
                                        isBuffered ||
                                        _startingQueueRowIndex != null
                                    ? DismissDirection.none
                                    : DismissDirection.endToStart,
                                onUpdate: (details) {
                                  _dismissProgress.value = details.progress
                                      .clamp(0.0, 1.0)
                                      .toDouble();
                                },
                                onDismissed: (_) {
                                  final previousItems =
                                      List<Map<String, dynamic>>.of(queueItems);
                                  final updatedItems =
                                      List<Map<String, dynamic>>.of(
                                        previousItems,
                                      )..removeAt(index);
                                  setState(() {
                                    _queueItemsOverride = updatedItems;
                                    _isRemovingQueueItem = true;
                                    _removingQueueItemKey = itemKey;
                                  });
                                  _dismissProgress.value = 0;
                                  unawaited(
                                    _removeQueueItemOnServer(
                                      previousItems: previousItems,
                                      itemKey: itemKey,
                                      queueIndex: index,
                                      queueItemId: queueItemId,
                                    ),
                                  );
                                },
                                background: const SizedBox.expand(),
                                secondaryBackground: Container(
                                  alignment: Alignment.centerRight,
                                  child: LayoutBuilder(
                                    builder: (context, constraints) =>
                                        ValueListenableBuilder<double>(
                                          valueListenable: _dismissProgress,
                                          builder: (context, progress, _) => Container(
                                            width:
                                                (constraints.maxWidth *
                                                            progress -
                                                        8)
                                                    .clamp(
                                                      0.0,
                                                      constraints.maxWidth,
                                                    )
                                                    .toDouble(),
                                            height: 48,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFD94A4A),
                                              borderRadius:
                                                  BorderRadius.circular(999),
                                            ),
                                            alignment: Alignment.center,
                                            child:
                                                _removingQueueItemKey == itemKey
                                                ? const SizedBox.square(
                                                    dimension: 22,
                                                    child:
                                                        CircularProgressIndicator(
                                                          strokeWidth: 2,
                                                          color: Colors.white,
                                                        ),
                                                  )
                                                : Icon(
                                                    CupertinoIcons.minus_circle,
                                                    color: Colors.white,
                                                    size:
                                                        ((constraints.maxWidth *
                                                                            progress -
                                                                        8)
                                                                    .clamp(
                                                                      0.0,
                                                                      constraints
                                                                          .maxWidth,
                                                                    ) *
                                                                0.65)
                                                            .clamp(0.0, 24.0)
                                                            .toDouble(),
                                                  ),
                                          ),
                                        ),
                                  ),
                                ),
                                child: TweenAnimationBuilder<double>(
                                  key: ValueKey('$itemKey@$moveVersion'),
                                  tween: Tween(
                                    begin: shouldAnimateRemoteMove ? 0.0 : 1.0,
                                    end: 1.0,
                                  ),
                                  duration: shouldAnimateRemoteMove
                                      ? const Duration(milliseconds: 260)
                                      : Duration.zero,
                                  curve: Curves.easeOutCubic,
                                  builder: (context, progress, child) =>
                                      Opacity(
                                        opacity: progress,
                                        child: Transform.translate(
                                          offset: Offset(
                                            0,
                                            (1 - progress) * 12,
                                          ),
                                          child: child,
                                        ),
                                      ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 3,
                                    ),
                                    child: Opacity(
                                      opacity: isPreviouslyPlayed ? .42 : 1,
                                      child: AnimatedSwitcher(
                                        duration: const Duration(
                                          milliseconds: 220,
                                        ),
                                        switchInCurve: Curves.easeOutCubic,
                                        switchOutCurve: Curves.easeInCubic,
                                        transitionBuilder: (child, animation) =>
                                            FadeTransition(
                                              opacity: animation,
                                              child: ScaleTransition(
                                                scale: Tween<double>(
                                                  begin: .985,
                                                  end: 1,
                                                ).animate(animation),
                                                child: child,
                                              ),
                                            ),
                                        child: isCurrent
                                            ? GlassSurface(
                                                key: const ValueKey(
                                                  'current-track',
                                                ),
                                                borderRadius: 14,
                                                padding: EdgeInsets.zero,
                                                tint: const Color(0x33202730),
                                                blurSigma: 0,
                                                showShadow: false,
                                                child: Material(
                                                  type:
                                                      MaterialType.transparency,
                                                  child: tile,
                                                ),
                                              )
                                            : Material(
                                                key: const ValueKey(
                                                  'queue-track',
                                                ),
                                                type: MaterialType.transparency,
                                                child: tile,
                                              ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    return AnimatedBuilder(
      animation: routeAnimation ?? const AlwaysStoppedAnimation<double>(1),
      child: content,
      builder: (context, child) => Transform.scale(
        alignment: Alignment.bottomCenter,
        scale:
            ((.92 + (routeAnimation?.value.clamp(0.0, 1.0) ?? 1.0) * .08) *
                    (1 - (_handleDragDistance / 180 * .08).clamp(0.0, .08)))
                .toDouble(),
        child: child,
      ),
    );
  }

  String? _artistLabel(dynamic rawArtists) {
    if (rawArtists is! List) return null;
    final names = rawArtists
        .whereType<Map>()
        .map((artist) => artist['name'])
        .whereType<String>()
        .where((name) => name.isNotEmpty)
        .toList();
    return names.isEmpty ? null : names.join(', ');
  }

  String? _queueArtist(Map<String, dynamic> item) {
    final media = item['media_item'] is Map
        ? Map<String, dynamic>.from(item['media_item'] as Map)
        : const <String, dynamic>{};
    return _artistLabel(media['artists']) ??
        (media['artist'] is String ? media['artist'] as String : null);
  }

  String _queueTrackTitle(Map<String, dynamic> item) {
    final media = item['media_item'] is Map
        ? Map<String, dynamic>.from(item['media_item'] as Map)
        : const <String, dynamic>{};
    final trackTitle = media['name'];
    if (trackTitle is String && trackTitle.isNotEmpty) return trackTitle;
    final queueTitle = item['name'];
    return queueTitle is String && queueTitle.isNotEmpty
        ? queueTitle
        : 'Unknown item';
  }

  double _estimatedQueueOffset(List<Map<String, dynamic>> items, int rowIndex) {
    var offset = 0.0;
    for (var index = 0; index < rowIndex; index++) {
      // A subtitle makes ListTile taller; include the outer vertical padding
      // and the separator between rows in the estimate.
      offset += _queueArtist(items[index]) == null ? 63 : 79;
    }
    return offset;
  }

  String? _queueItemUri(Map<String, dynamic> item) {
    final mediaItem = item['media_item'];
    if (mediaItem is Map && mediaItem['uri'] is String) {
      return mediaItem['uri'] as String;
    }
    return item['uri'] is String ? item['uri'] as String : null;
  }

  String _queueItemKey(Map<String, dynamic> item, int rowIndex) {
    final queueItemId = item['queue_item_id'];
    if (queueItemId is String && queueItemId.isNotEmpty) return queueItemId;
    final index = item['index'] ?? item['sort_index'];
    if (index is num) return 'queue-index-${index.toInt()}';
    return 'queue-row-$rowIndex-${_queueItemUri(item) ?? 'unknown'}';
  }
}
