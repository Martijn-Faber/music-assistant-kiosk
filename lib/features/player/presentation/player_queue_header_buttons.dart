import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../design_system/glass_icon_button.dart';
import '../../../design_system/glass_icon_toggle_button.dart';
import '../../../design_system/glass_tokens.dart';
import '../../../design_system/global_snackbar.dart';
import '../../../l10n/generated/app_localizations.dart';
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
    if (_shuffleEnabled != enabled) setState(() => _shuffleEnabled = enabled);
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
        message: AppLocalizations.of(context).queueShuffleChangeFailed,
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
    return GlassIconToggleButton(
      icon: CupertinoIcons.shuffle,
      type: GlassIconButtonType.secondary,
      tooltip: unavailable
          ? AppLocalizations.of(context).queueShuffleUnavailable
          : enabled == true
              ? AppLocalizations.of(context).queueDisableShuffleTooltip
              : AppLocalizations.of(context).queueEnableShuffleTooltip,
      disabled: unavailable || enabled == null,
      isSelected: enabled == true,
      isLoading: _isToggling,
      onPressed: _toggleShuffle,
    );
  }
}

class PlayerQueueAutoplayButton extends StatefulWidget {
  const PlayerQueueAutoplayButton({
    super.key,
    required this.repository,
    required this.queueController,
    required this.playerId,
  });

  final MusicAssistantRepository repository;
  final PlayerQueueController queueController;
  final String playerId;

  @override
  State<PlayerQueueAutoplayButton> createState() =>
      _PlayerQueueAutoplayButtonState();
}

class _PlayerQueueAutoplayButtonState extends State<PlayerQueueAutoplayButton> {
  bool? _enabled;
  bool _isToggling = false;

  @override
  void initState() {
    super.initState();
    _enabled = widget.queueController.queue?.autoplayEnabled;
    widget.queueController.addListener(_onQueueChanged);
  }

  @override
  void didUpdateWidget(covariant PlayerQueueAutoplayButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.queueController != widget.queueController) {
      oldWidget.queueController.removeListener(_onQueueChanged);
      widget.queueController.addListener(_onQueueChanged);
      _enabled = widget.queueController.queue?.autoplayEnabled;
    }
  }

  void _onQueueChanged() {
    if (!mounted || _isToggling) return;
    final enabled = widget.queueController.queue?.autoplayEnabled;
    if (_enabled != enabled) setState(() => _enabled = enabled);
  }

  Future<void> _toggle() async {
    final current = _enabled;
    if (current == null || _isToggling) return;
    final next = !current;
    setState(() {
      _enabled = next;
      _isToggling = true;
    });
    try {
      await widget.repository.setQueueAutoplay(widget.playerId, next);
    } catch (error) {
      debugPrint('Could not update queue autoplay: $error');
      if (!mounted) return;
      setState(() => _enabled = current);
      GlobalSnackbarHost.show(
        context,
        message: AppLocalizations.of(context).queueAutoplayChangeFailed,
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
    final enabled = _enabled;
    return GlassIconToggleButton(
      icon: CupertinoIcons.repeat,
      type: GlassIconButtonType.secondary,
      tooltip: enabled == true
          ? AppLocalizations.of(context).queueDisableAutoplayTooltip
          : AppLocalizations.of(context).queueEnableAutoplayTooltip,
      disabled: enabled == null,
      isSelected: enabled == true,
      isLoading: _isToggling,
      onPressed: _toggle,
    );
  }
}

class PlayerQueueClearButton extends StatelessWidget {
  const PlayerQueueClearButton({
    super.key,
    required this.isClearing,
    required this.isRemovingQueueItem,
    required this.onPressed,
  });

  final bool isClearing;
  final bool isRemovingQueueItem;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => GlassIconButton(
        icon: CupertinoIcons.trash,
        type: GlassIconButtonType.secondary,
        tooltip: AppLocalizations.of(context).queueClearTooltip,
        disabled: isClearing || isRemovingQueueItem,
        onPressed: onPressed,
        child: isClearing
            ? const SizedBox.square(
                dimension: GlassTokens.iconButtonProgressIndicatorSize,
                child: CircularProgressIndicator(
                  strokeWidth: GlassTokens.iconButtonProgressIndicatorStrokeWidth,
                  color: GlassTokens.iconButtonSecondaryIconEnabled,
                ),
              )
            : null,
      );
}

class PlayerQueueCloseButton extends StatelessWidget {
  const PlayerQueueCloseButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => GlassIconButton(
        icon: CupertinoIcons.xmark,
        type: GlassIconButtonType.secondary,
        tooltip: AppLocalizations.of(context).queueCloseTooltip,
        onPressed: onPressed,
      );
}
