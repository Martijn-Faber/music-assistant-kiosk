import 'package:flutter/material.dart';

import '../data/music_assistant_repository.dart';
import '../domain/player_queue_snapshot.dart';
import '../domain/recent_media_item.dart';
import 'artwork_image.dart';
import 'player_glass_widgets.dart';

class PlayerQueueSheet extends StatefulWidget {
  const PlayerQueueSheet({
    super.key,
    required this.repository,
    required this.playerId,
    required this.onQueueCleared,
  });

  final MusicAssistantRepository repository;
  final String playerId;
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
  double _handleDragDistance = 0;
  bool _isClearingQueue = false;

  @override
  void initState() {
    super.initState();
    _queue = widget.repository.fetchQueue(widget.playerId);
  }

  @override
  void dispose() {
    _sheetController.dispose();
    super.dispose();
  }

  void _onHandleDragUpdate(DragUpdateDetails details) {
    setState(() {
      _handleDragDistance = (_handleDragDistance + details.delta.dy).clamp(
        0.0,
        180.0,
      ).toDouble();
    });
    if (_sheetController.isAttached) {
      final height = MediaQuery.sizeOf(context).height;
      _sheetController.jumpTo(
        (_sheetController.size - details.delta.dy / height).clamp(
          _minExtent,
          _maxExtent,
        ).toDouble(),
      );
    }
  }

  void _onHandleDragEnd(DragEndDetails details) {
    final dragDistance = _handleDragDistance;
    setState(() => _handleDragDistance = 0);
    if (!_sheetController.isAttached) return;
    final shouldClose = _sheetController.size <= _minExtent + .015 ||
        dragDistance >= 72 ||
        details.velocity.pixelsPerSecond.dy > 850;
    _sheetController.animateTo(
      shouldClose ? _minExtent : _initialExtent,
      duration: const Duration(milliseconds: 160),
      curve: Curves.easeOutCubic,
    );
  }

  Future<void> _confirmClearQueue() async {
    if (_isClearingQueue) return;
    final shouldClear = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: const Color(0xFF202A2D),
        title: const Text(
          'Clear queue?',
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          'This will remove all items from the queue.',
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('CANCEL'),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: const Text(
              'CLEAR QUEUE',
              style: TextStyle(color: Color(0xFFFF8E7C)),
            ),
          ),
        ],
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
                  const Icon(Icons.queue_music_rounded, color: Colors.white),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      'Queue',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  IconButton(
                    tooltip: 'Clear queue',
                    onPressed: _isClearingQueue ? null : _confirmClearQueue,
                    icon: _isClearingQueue
                        ? const SizedBox.square(
                            dimension: 18,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white70,
                            ),
                          )
                        : const Icon(
                            Icons.delete_sweep_outlined,
                            color: Colors.white70,
                          ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(
                      Icons.close_rounded,
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
                    if (queue.items.isEmpty) {
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
                    return ListView.separated(
                      controller: scrollController,
                      itemCount: queue.items.length,
                      separatorBuilder: (_, _) =>
                          const Divider(color: Color(0x33FFFFFF), height: 1),
                      itemBuilder: (context, index) {
                        final item = queue.items[index];
                        final itemIndex = item['index'] is num
                            ? (item['index'] as num).toInt()
                            : index;
                        final isCurrent = itemIndex == queue.currentIndex;
                        final media = item['media_item'] is Map
                            ? Map<String, dynamic>.from(
                                item['media_item'] as Map,
                              )
                            : const <String, dynamic>{};
                        final artist =
                            _artistLabel(media['artists']) ??
                            (media['artist'] is String
                                ? media['artist'] as String
                                : null);
                        final tile = ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 8,
                          ),
                          leading: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 30,
                                child: Center(
                                  child: isCurrent
                                      ? const Icon(
                                          Icons.equalizer_rounded,
                                          color: Colors.white,
                                        )
                                      : Text(
                                          '${index + 1}',
                                          style: const TextStyle(
                                            color: Colors.white54,
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
                                  style: const TextStyle(color: Colors.white54),
                                ),
                        );
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3),
                          child: isCurrent
                              ? GlassSurface(
                                  borderRadius: 14,
                                  padding: EdgeInsets.zero,
                                  tint: const Color(0x33202730),
                                  child: tile,
                                )
                              : tile,
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
}
