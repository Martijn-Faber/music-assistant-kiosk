import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../design_system/global_snackbar.dart';
import '../../../design_system/glass_icon_button.dart';
import '../../../design_system/glass_tokens.dart';
import '../data/music_assistant_repository.dart';
import 'player_queue_controller.dart';

class PlayerQueueShuffleButton extends StatefulWidget {
  const PlayerQueueShuffleButton({
    super.key,
    required this.repository,
    required this.queueController,
    required this.playerId,
    required this.disabled,
  });

  final MusicAssistantRepository repository;
  final PlayerQueueController queueController;
  final String playerId;
  final bool disabled;

  @override
  State<PlayerQueueShuffleButton> createState() =>
      _PlayerQueueShuffleButtonState();
}

class _PlayerQueueShuffleButtonState extends State<PlayerQueueShuffleButton> {
  bool? _shuffleEnabled;
  bool _isToggling = false;

  @override
  void initState() {
    super.initState();
    _shuffleEnabled = widget.queueController.queue?.shuffleEnabled;
    widget.queueController.addListener(_onQueueChanged);
  }

  @override
  void didUpdateWidget(covariant PlayerQueueShuffleButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.queueController != widget.queueController) {
      oldWidget.queueController.removeListener(_onQueueChanged);
      widget.queueController.addListener(_onQueueChanged);
      _shuffleEnabled = widget.queueController.queue?.shuffleEnabled;
    }
  }

  void _onQueueChanged() {
    if (!mounted || _isToggling) return;
    final enabled = widget.queueController.queue?.shuffleEnabled;
    if (_shuffleEnabled != enabled) {
      setState(() => _shuffleEnabled = enabled);
    }
  }

  Future<void> _toggleShuffle() async {
    final current = _shuffleEnabled;
    if (current == null || _isToggling || widget.disabled) return;
    final next = !current;
    setState(() {
      _shuffleEnabled = next;
      _isToggling = true;
    });
    try {
      await widget.repository.setQueueShuffle(widget.playerId, next);
      await widget.queueController.refresh();
    } catch (error) {
      debugPrint('Could not update queue shuffle: $error');
      if (!mounted) return;
      setState(() => _shuffleEnabled = current);
      GlobalSnackbarHost.show(
        context,
        message: 'Could not change shuffle.',
        kind: GlobalSnackbarKind.error,
      );
    } finally {
      if (mounted) setState(() => _isToggling = false);
    }
  }

  @override
  void dispose() {
    widget.queueController.removeListener(_onQueueChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final enabled = _shuffleEnabled;
    final unavailable = widget.disabled;
    return GlassIconButton(
      icon: CupertinoIcons.shuffle,
      type: GlassIconButtonType.secondary,
      tooltip: unavailable
          ? 'Shuffle is unavailable for dynamic queues'
          : enabled == true
              ? 'Disable shuffle'
              : 'Enable shuffle',
      disabled: unavailable || enabled == null || _isToggling,
      isSelected: enabled == true,
      onPressed: _toggleShuffle,
      child: _isToggling
          ? const SizedBox.square(
              dimension: GlassTokens.iconButtonProgressIndicatorSize,
              child: CircularProgressIndicator(
                strokeWidth:
                    GlassTokens.iconButtonProgressIndicatorStrokeWidth,
                color: GlassTokens.iconButtonSecondaryIconEnabled,
              ),
            )
          : null,
    );
  }
}
