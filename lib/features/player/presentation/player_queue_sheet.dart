import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/services.dart';
import 'package:music_assistant_api/music_assistant_api.dart';

import '../data/music_assistant_repository.dart';
import '../domain/recent_media_item.dart';
import 'artwork_image.dart';
import 'player_playback_controller.dart';
import 'player_queue_controller.dart';
import 'player_queue_header_buttons.dart';
import '../../../design_system/glass_tokens.dart';
import '../../../design_system/glass_scroll_fade.dart';
import '../../../design_system/glass_surface.dart';
import '../../../design_system/global_snackbar.dart';
import 'player_glass_widgets.dart';

class PlayerQueueSheet extends StatefulWidget {
  const PlayerQueueSheet({
    super.key,
    required this.repository,
    required this.queueController,
    required this.playbackController,
    required this.playerId,
    required this.initialMediaUri,
    required this.onQueueCleared,
  });

  final MusicAssistantRepository repository;
  final PlayerQueueController queueController;
  final PlayerPlaybackController playbackController;
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

  late Future<void> _queue;
  List<MusicAssistantQueueItem>? _lastQueueItems;
  Set<String> _movedQueueItemKeys = {};
  // Revision keys retrigger move animations without remounting rows on refresh.
  final Map<String, int> _queueItemMoveVersions = {};
  final DraggableScrollableController _sheetController =
      DraggableScrollableController();
  final ValueNotifier<double> _dismissProgress = ValueNotifier(0);
  double _handleDragDistance = 0;
  bool _isClearingQueue = false;
  bool _isRemovingQueueItem = false;
  String? _removingQueueItemKey;
  List<MusicAssistantQueueItem>? _queueItemsOverride;
  int? _startingQueueRowIndex;
  int? _currentQueueRowIndexOverride;
  bool _didPositionQueueAtCurrentItem = false;
  bool _queuePositioned = false;
  int? _lastAutoScrolledQueueRowIndex;
  late String? _currentPlayingUri;
  late final void Function() _unsubscribeFromPlayerEvents;
  Timer? _queueRefreshTimer;
  bool _queueRefreshInFlight = false;
  bool _queueRefreshPending = false;

  String? get _queueSourceSubtitle {
    final sources = widget.queueController.queue?.sources;
    if (sources == null || sources.isEmpty) return null;
    final names = sources
        .map((source) => source.name.trim())
        .where((name) => name.isNotEmpty)
        .toList();
    return names.isEmpty ? null : names.join(', ');
  }

  @override
  void initState() {
    super.initState();
    _queue = _loadQueue();
    _currentPlayingUri = widget.initialMediaUri;
    widget.queueController.addListener(_onSharedQueueChanged);
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
          // an older currentIndex from the initially loaded queue.
          if (player.currentMedia?.uri != null) {
            _currentPlayingUri = player.currentMedia!.uri;
            _currentQueueRowIndexOverride = null;
          }
        });
      },
      onRemoved: (_) {},
    );
  }

  void _onSharedQueueChanged() {
    if (!mounted) return;
    if (_isRemovingQueueItem) {
      // Keep the shared update: the optimistic delete is still settling.
      _queueRefreshPending = true;
      return;
    }
    if (_queueRefreshInFlight) {
      _queueRefreshPending = true;
      return;
    }
    final queueItems = widget.queueController.items;
    final previousItems = _lastQueueItems;
    _movedQueueItemKeys = _queueItemsOverride == null && previousItems != null
        ? _findMovedQueueItems(previousItems, queueItems)
        : {};
    for (final itemKey in _movedQueueItemKeys) {
      _queueItemMoveVersions.update(
        itemKey,
        (version) => version + 1,
        ifAbsent: () => 1,
      );
    }
    _lastQueueItems = queueItems;
    _queue = Future<void>.value();
    setState(() {});
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
    final refresh = _loadQueue(forceRefresh: true);
    setState(() {
      _queue = refresh;
    });
    refresh.then((_) {
      if (mounted &&
          identical(_queue, refresh) &&
          _queueItemsOverride != null &&
          _queueItemsMatch(_queueItemsOverride!, widget.queueController.items)) {
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

  Future<void> _loadQueue({bool forceRefresh = false}) async {
    final previousItems = _lastQueueItems;
    if (forceRefresh) {
      await widget.queueController.refresh();
    } else {
      await widget.queueController.load();
    }
    final queue = widget.queueController.queue;
    if (queue == null) return;
    final queueItems = widget.queueController.items;
    _movedQueueItemKeys = _queueItemsOverride == null && previousItems != null
        ? _findMovedQueueItems(previousItems, queueItems)
        : {};
    for (final itemKey in _movedQueueItemKeys) {
      _queueItemMoveVersions.update(
        itemKey,
        (version) => version + 1,
        ifAbsent: () => 1,
      );
    }
    _lastQueueItems = queueItems;
  }

  Set<String> _findMovedQueueItems(
    List<MusicAssistantQueueItem> previousItems,
    List<MusicAssistantQueueItem> currentItems,
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
    List<MusicAssistantQueueItem> optimisticItems,
    List<MusicAssistantQueueItem> serverItems,
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

  String _queueItemFingerprint(MusicAssistantQueueItem item) {
    final id = _stableQueueItemId(item);
    if (id != null) return 'id:$id';
    return 'media:${_queueItemUri(item) ?? ''}|${item.name}|'
        '${widget.queueController.queueArtist(item) ?? ''}';
  }

  String? _stableQueueItemId(MusicAssistantQueueItem item) =>
      item.queueItemId.isNotEmpty ? item.queueItemId : null;

  void _showBufferedInfoMessage() {
    GlobalSnackbarHost.show(
      context,
      message: 'This track is already buffered by the player to play next.',
      kind: GlobalSnackbarKind.info,
    );
  }

  void _showBufferedDeleteWarning() {
    GlobalSnackbarHost.show(
      context,
      message:
          'You can’t delete this track because it’s already buffered to play next.',
      kind: GlobalSnackbarKind.warning,
    );
  }

  @override
  void dispose() {
    _unsubscribeFromPlayerEvents();
    widget.queueController.removeListener(_onSharedQueueChanged);
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
      await widget.playbackController.playQueueItem(
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
    required List<MusicAssistantQueueItem> previousItems,
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
          squareBottomCorners: true,
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
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Queue',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: GlassTokens.fontSize22,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          if (_queueSourceSubtitle case final subtitle?)
                            Text(
                              subtitle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                        ],
                      ),
                    ),
                    PlayerQueueShuffleButton(
                      repository: widget.repository,
                      queueController: widget.queueController,
                      playerId: widget.playerId,
                      disabled: widget.queueController
                          .isDynamic,
                    ),
                    PlayerQueueAutoplayButton(
                      repository: widget.repository,
                      queueController: widget.queueController,
                      playerId: widget.playerId,
                    ),
                    PlayerQueueClearButton(
                      isClearing: _isClearingQueue,
                      isRemovingQueueItem: _isRemovingQueueItem,
                      onPressed: _confirmClearQueue,
                    ),
                    PlayerQueueCloseButton(
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: FutureBuilder<void>(
                    future: _queue,
                    builder: (context, snapshot) {
                      final loadedQueue = widget.queueController.queue;
                      if ((loadedQueue == null &&
                              snapshot.connectionState !=
                                  ConnectionState.done)) {
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
                      if (snapshot.hasError && loadedQueue == null) {
                        return SingleChildScrollView(
                          controller: scrollController,
                          child: SizedBox(
                            height: 240,
                            child: Center(
                              child: Text(
                                kDebugMode
                                    ? 'Could not load the queue.\n${snapshot.error}'
                                    : 'Could not load the queue.',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                      final queue = loadedQueue!;
                      final queueItems =
                          _queueItemsOverride ?? widget.queueController.items;
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
                              final itemIndex = item.index;
                              return itemIndex == currentQueueIndex;
                            });
                      final currentQueueRowIndex =
                          _currentQueueRowIndexOverride ??
                          (serverIndexMatch >= 0 ? serverIndexMatch : uriMatch);
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
                              widget.queueController.queueArtist(
                                    queueItems[currentQueueRowIndex],
                                  ) ==
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
                              final queueIndex = item.index;
                              final queueItemId = item.queueItemId;
                              final itemKey = _queueItemKey(item, index);
                              final shouldAnimateRemoteMove =
                                  _movedQueueItemKeys.contains(itemKey);
                              final moveVersion =
                                  _queueItemMoveVersions[itemKey] ?? 0;
                              // Match the frontend: lock every item through the
                              // player's buffered position, including the current
                              // item if the buffer index is temporarily absent.
                              final bufferedThrough = math.max(
                                queue.indexInBuffer ?? 0,
                                queue.currentIndex ?? 0,
                              );
                              // The list row is the absolute queue position;
                              // QueueItem.index can be unset/defaulted by the API.
                              final isBuffered = index <= bufferedThrough;
                              final isCurrent = index == currentQueueRowIndex;
                              final isPreviouslyPlayed =
                                  currentQueueRowIndex >= 0 &&
                                  index < currentQueueRowIndex;
                              final isBufferedUpcoming =
                                  isBuffered &&
                                  currentQueueRowIndex >= 0 &&
                                  index > currentQueueRowIndex;
                              final artist = widget.queueController
                                  .queueArtist(item);
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
                                      imageUrl: RecentMediaItem
                                          .imageUrlFromQueueItem(
                                            item,
                                            album: widget.queueController
                                                .albumByQueueItemId[item
                                                    .queueItemId],
                                          ),
                                      serverUrl: widget.repository.serverUrl,
                                      token: widget.repository.token,
                                      size: 48,
                                      safeInVirtualizedList: true,
                                    ),
                                  ],
                                ),
                                title: Text(
                                  widget.queueController.queueTrackTitle(item),
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
                                    : isBufferedUpcoming
                                    ? IconButton(
                                        onPressed: () {
                                          _showBufferedInfoMessage();
                                        },
                                        padding: const EdgeInsets.all(12),
                                        constraints: const BoxConstraints.tightFor(
                                          width: 44,
                                          height: 44,
                                        ),
                                        icon: const Icon(
                                          Icons.hourglass_top_rounded,
                                          color: Colors.white38,
                                          size: 16,
                                        ),
                                      )
                                    : null,
                              );
                              return _BufferedSwipeRow(
                                key: ValueKey(itemKey),
                                enabled: isBufferedUpcoming,
                                onBlockedSwipe: _showBufferedDeleteWarning,
                                child: Dismissible(
                                key: ValueKey(itemKey),
                                movementDuration: const Duration(
                                  milliseconds: 220,
                                ),
                                resizeDuration: const Duration(
                                  milliseconds: 100,
                                ),
                                direction:
                                    _isClearingQueue ||
                                        (_isRemovingQueueItem &&
                                            _removingQueueItemKey != itemKey) ||
                                        isCurrent ||
                                        isPreviouslyPlayed ||
                                        isBufferedUpcoming ||
                                        _startingQueueRowIndex != null
                                    ? DismissDirection.none
                                    : DismissDirection.endToStart,
                                onUpdate: (details) {
                                  _dismissProgress.value = details.progress
                                      .clamp(0.0, 1.0)
                                      .toDouble();
                                },
                                onResize: () {
                                  setState(() => _removingQueueItemKey = itemKey);
                                },
                                onDismissed: (_) {
                                  unawaited(
                                    SystemSound.play(SystemSoundType.click),
                                  );
                                  final previousItems =
                                      List<MusicAssistantQueueItem>.of(
                                        queueItems,
                                      );
                                  final updatedItems =
                                      List<MusicAssistantQueueItem>.of(
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
                                          builder: (context, progress, _) {
                                            final revealWidth =
                                                (constraints.maxWidth *
                                                            progress -
                                                        8)
                                                    .clamp(
                                                      0.0,
                                                      constraints.maxWidth,
                                                    )
                                                    .toDouble();
                                            return _QueueActionPill(
                                              width: revealWidth,
                                              disabled: false,
                                              loading:
                                                  _removingQueueItemKey ==
                                                  itemKey,
                                            );
                                          },
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
                                  child: AnimatedOpacity(
                                    opacity: _removingQueueItemKey == itemKey
                                        ? 0
                                        : 1,
                                    duration: const Duration(milliseconds: 100),
                                    curve: Curves.easeOut,
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

  double _estimatedQueueOffset(
    List<MusicAssistantQueueItem> items,
    int rowIndex,
  ) {
    var offset = 0.0;
    for (var index = 0; index < rowIndex; index++) {
      // A subtitle makes ListTile taller; include the outer vertical padding
      // and the separator between rows in the estimate.
      offset += widget.queueController.queueArtist(items[index]) == null
          ? 63
          : 79;
    }
    return offset;
  }

  String? _queueItemUri(MusicAssistantQueueItem item) =>
      item.mediaItem?.uri ?? item.mediaItem?.itemId;

  String _queueItemKey(MusicAssistantQueueItem item, int rowIndex) {
    if (item.queueItemId.isNotEmpty) return item.queueItemId;
    if (item.index != 0) return 'queue-index-${item.index}';
    if (item.sortIndex != 0) return 'queue-index-${item.sortIndex}';
    return 'queue-row-$rowIndex-${_queueItemUri(item) ?? 'unknown'}';
  }
}

class _QueueActionPill extends StatelessWidget {
  const _QueueActionPill({
    required this.width,
    required this.disabled,
    this.loading = false,
  });

  final double width;
  final bool disabled;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    final child = SizedBox(
      width: width,
      height: 48,
      child: Center(
        child: width < 8
            ? const SizedBox.shrink()
            : loading
            ? const SizedBox.square(
                dimension: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : Icon(
                CupertinoIcons.minus_circle,
                color: disabled ? Colors.white70 : Colors.white,
                size: disabled
                    ? 22
                    : (width * 0.65).clamp(0.0, 24.0).toDouble(),
              ),
      ),
    );

    if (disabled) {
      return GlassSurface(
        borderRadius: 999,
        padding: EdgeInsets.zero,
        tint: const Color(0x55303840),
        blurSigma: 14,
        showShadow: false,
        child: child,
      );
    }

    return Container(
      width: width,
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0xFFD94A4A),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: const Color(0x66FFFFFF), width: 0.8),
      ),
      child: child,
    );
  }
}

class _BufferedSwipeRow extends StatefulWidget {
  const _BufferedSwipeRow({
    super.key,
    required this.enabled,
    required this.onBlockedSwipe,
    required this.child,
  });

  final bool enabled;
  final VoidCallback onBlockedSwipe;
  final Widget child;

  @override
  State<_BufferedSwipeRow> createState() => _BufferedSwipeRowState();
}

class _BufferedSwipeRowState extends State<_BufferedSwipeRow>
    with SingleTickerProviderStateMixin {
  late final AnimationController _drag;

  @override
  void initState() {
    super.initState();
    _drag = AnimationController.unbounded(vsync: this);
  }

  void _returnToRest() {
    if (_drag.value >= 0) return;
    _drag.animateWith(
      SpringSimulation(
        const SpringDescription(mass: 1, stiffness: 700, damping: 32),
        _drag.value,
        0,
        0,
      ),
    );
  }

  @override
  void dispose() {
    _drag.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.enabled) return widget.child;

    return LayoutBuilder(
      builder: (context, constraints) {
        final rowWidth = constraints.maxWidth;
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onHorizontalDragUpdate: (details) {
            _drag.stop();
            _drag.value = (_drag.value + details.delta.dx)
                .clamp(-rowWidth, 0)
                .toDouble();
          },
          onHorizontalDragEnd: (details) {
            final attemptedDelete =
                _drag.value <= -rowWidth * 0.15 ||
                details.velocity.pixelsPerSecond.dx <= -700;
            _returnToRest();
            if (attemptedDelete) widget.onBlockedSwipe();
          },
          onHorizontalDragCancel: _returnToRest,
          child: AnimatedBuilder(
            animation: _drag,
            child: widget.child,
            builder: (context, child) {
              final offset = _drag.value.clamp(-rowWidth, 0).toDouble();
              final revealWidth = -offset;
              return Stack(
                clipBehavior: Clip.none,
                children: [
                  if (revealWidth > 2)
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: _QueueActionPill(
                          width: revealWidth,
                          disabled: true,
                        ),
                      ),
                    ),
                  Transform.translate(
                    offset: Offset(offset, 0),
                    child: child,
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
