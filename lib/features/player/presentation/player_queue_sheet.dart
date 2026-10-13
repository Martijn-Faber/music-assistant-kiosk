import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/music_assistant_repository.dart';
import '../domain/player_queue_snapshot.dart';
import '../domain/recent_media_item.dart';
import 'artwork_image.dart';
import '../../../design_system/glass_tokens.dart';
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
  int? _lastAutoScrolledQueueRowIndex;
  late String? _currentPlayingUri;
  late final void Function() _unsubscribeFromPlayerEvents;

  @override
  void initState() {
    super.initState();
    _queue = _loadQueue();
    _currentPlayingUri = widget.initialMediaUri;
    _unsubscribeFromPlayerEvents = widget.repository.listenToPlayerEvents(
      onChanged: (player) {
        if (player.id != widget.playerId ||
            (player.mediaUri == null && player.title == null)) {
          return;
        }
        if (!mounted) return;
        setState(() {
          // Some player updates include a title but omit the URI. Keep the last
          // known URI in that case so the queue highlight does not fall back to
          // an older currentIndex from the initial queue snapshot.
          if (player.mediaUri != null) {
            _currentPlayingUri = player.mediaUri;
            _currentQueueRowIndexOverride = null;
          }
        });
      },
      onRemoved: (_) {},
    );
  }

  Future<PlayerQueueSnapshot> _loadQueue() async {
    final queue = await widget.repository.fetchQueue(widget.playerId);
    if (mounted) setState(() => _autoplayEnabled = queue.autoplayEnabled);
    return queue;
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
    _unsubscribeFromPlayerEvents();
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
                            onPressed: () => Navigator.of(dialogContext).pop(false),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.white70,
                              side: const BorderSide(color: GlassTokens.border),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(GlassTokens.radiusMedium),
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
                            onPressed: () => Navigator.of(dialogContext).pop(true),
                            style: FilledButton.styleFrom(
                              backgroundColor: const Color(0xFFFF8E7C),
                              foregroundColor: const Color(0xFF11161C),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(GlassTokens.radiusMedium),
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

  Future<bool> _removeQueueItem({
    required String itemKey,
    required int queueIndex,
    required String? queueItemId,
  }) async {
    if (_isClearingQueue ||
        _isRemovingQueueItem ||
        _startingQueueRowIndex != null) {
      return false;
    }
    setState(() {
      _isRemovingQueueItem = true;
      _removingQueueItemKey = itemKey;
    });
    try {
      await widget.repository.removeQueueItem(
        widget.playerId,
        index: queueIndex,
        queueItemId: queueItemId,
      );
      return true;
    } catch (error, stackTrace) {
      debugPrint('Could not remove queue item $itemKey: $error');
      debugPrintStack(stackTrace: stackTrace);
      if (mounted) {
        setState(() {
          _isRemovingQueueItem = false;
          _removingQueueItemKey = null;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not remove this queue item.')),
        );
      }
      return false;
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
                    const Icon(CupertinoIcons.music_note_list, color: Colors.white),
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
                    builder: (context, snapshot) {
                      if (snapshot.connectionState != ConnectionState.done) {
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
                      if (snapshot.hasError) {
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
                        final shouldExpandSheet =
                            !_didPositionQueueAtCurrentItem;
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
                          final sheetAnimation = expandSheet
                              ? _sheetController.animateTo(
                                  _maxExtent,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeOutCubic,
                                )
                              : Future<void>.value();
                          final scrollAnimation = scrollController.animateTo(
                            targetOffset
                                .clamp(0.0, targetMaxScrollExtent)
                                .toDouble(),
                            duration: const Duration(milliseconds: 420),
                            curve: Curves.easeInOutCubic,
                          );
                          await Future.wait<void>([
                            sheetAnimation,
                            scrollAnimation,
                          ]);
                        });
                      }
                      return ListView.separated(
                        controller: scrollController,
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
                          final queueItemId = item['queue_item_id'] is String
                              ? item['queue_item_id'] as String
                              : null;
                          final itemKey = _queueItemKey(item, index);
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
                              item['name'] is String
                                  ? item['name'] as String
                                  : 'Unknown item',
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
                                : null,
                          );
                          return Dismissible(
                            key: ValueKey(itemKey),
                            direction:
                                _isClearingQueue ||
                                    (_isRemovingQueueItem &&
                                        _removingQueueItemKey != itemKey) ||
                                    _startingQueueRowIndex != null
                                ? DismissDirection.none
                                : DismissDirection.endToStart,
                            confirmDismiss: (_) => _removeQueueItem(
                              itemKey: itemKey,
                              queueIndex: queueIndex,
                              queueItemId: queueItemId,
                            ),
                            onUpdate: (details) {
                              _dismissProgress.value = details.progress
                                  .clamp(0.0, 1.0)
                                  .toDouble();
                            },
                            onDismissed: (_) {
                              final updatedItems =
                                  List<Map<String, dynamic>>.of(queueItems)
                                    ..removeAt(index);
                              setState(() {
                                _queueItemsOverride = updatedItems;
                                _isRemovingQueueItem = false;
                                _removingQueueItemKey = null;
                              });
                              _dismissProgress.value = 0;
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
                                            (constraints.maxWidth * progress -
                                                    8)
                                                .clamp(
                                                  0.0,
                                                  constraints.maxWidth,
                                                )
                                                .toDouble(),
                                        height: 48,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFD94A4A),
                                          borderRadius: BorderRadius.circular(
                                            999,
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                        child: _removingQueueItemKey == itemKey
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
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 3),
                              child: Opacity(
                                opacity: isPreviouslyPlayed ? .42 : 1,
                                child: isCurrent
                                    ? GlassSurface(
                                        borderRadius: 14,
                                        padding: EdgeInsets.zero,
                                        tint: const Color(0x33202730),
                                        blurSigma: 0,
                                        showShadow: false,
                                        child: Material(
                                          type: MaterialType.transparency,
                                          child: tile,
                                        ),
                                      )
                                    : Material(
                                        type: MaterialType.transparency,
                                        child: tile,
                                      ),
                              ),
                            ),
                          );
                        },
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
