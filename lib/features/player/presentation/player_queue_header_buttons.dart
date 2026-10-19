import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../design_system/glass_icon_button.dart';
import '../../../design_system/glass_icon_toggle_button.dart';
import '../../../design_system/glass_tokens.dart';
import '../../../design_system/global_snackbar.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../viewmodels/player_queue_view_model.dart';

class PlayerQueueShuffleButton extends StatefulWidget {
  const PlayerQueueShuffleButton({
    super.key,
    required this.queueController,
    required this.disabled,
  });

  final PlayerQueueViewModel queueController;
  final bool disabled;

  @override
  State<PlayerQueueShuffleButton> createState() =>
      _PlayerQueueShuffleButtonState();
}

class _PlayerQueueShuffleButtonState extends State<PlayerQueueShuffleButton> {
  @override
  void initState() {
    super.initState();
    widget.queueController.addListener(_onQueueChanged);
  }

  @override
  void didUpdateWidget(covariant PlayerQueueShuffleButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.queueController != widget.queueController) {
      oldWidget.queueController.removeListener(_onQueueChanged);
      widget.queueController.addListener(_onQueueChanged);
    }
  }

  void _onQueueChanged() {
    if (mounted) setState(() {});
  }

  Future<void> _toggleShuffle() async {
    final current = widget.queueController.queue?.shuffleEnabled;
    if (current == null ||
        widget.queueController.isUpdatingShuffle ||
        widget.disabled) {
      return;
    }
    final next = !current;
    try {
      await widget.queueController.setShuffleEnabled(next);
    } catch (error) {
      debugPrint('Could not update queue shuffle: $error');
      if (!mounted) return;
      GlobalSnackbarHost.show(
        context,
        message: AppLocalizations.of(context).queueShuffleChangeFailed,
        kind: GlobalSnackbarKind.error,
      );
    }
  }

  @override
  void dispose() {
    widget.queueController.removeListener(_onQueueChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final enabled = widget.queueController.queue?.shuffleEnabled;
    final unavailable = widget.disabled;
    final isUpdating = widget.queueController.isUpdatingShuffle;
    return GlassIconToggleButton(
      icon: CupertinoIcons.shuffle,
      type: GlassIconButtonType.secondary,
      tooltip: unavailable
          ? AppLocalizations.of(context).queueShuffleUnavailable
          : enabled == true
              ? AppLocalizations.of(context).queueDisableShuffleTooltip
              : AppLocalizations.of(context).queueEnableShuffleTooltip,
      disabled: unavailable || enabled == null || isUpdating,
      isSelected: enabled == true,
      isLoading: isUpdating,
      onPressed: _toggleShuffle,
    );
  }
}

class PlayerQueueAutoplayButton extends StatefulWidget {
  const PlayerQueueAutoplayButton({
    super.key,
    required this.queueController,
  });

  final PlayerQueueViewModel queueController;

  @override
  State<PlayerQueueAutoplayButton> createState() =>
      _PlayerQueueAutoplayButtonState();
}

class _PlayerQueueAutoplayButtonState extends State<PlayerQueueAutoplayButton> {
  @override
  void initState() {
    super.initState();
    widget.queueController.addListener(_onQueueChanged);
  }

  @override
  void didUpdateWidget(covariant PlayerQueueAutoplayButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.queueController != widget.queueController) {
      oldWidget.queueController.removeListener(_onQueueChanged);
      widget.queueController.addListener(_onQueueChanged);
    }
  }

  void _onQueueChanged() {
    if (mounted) setState(() {});
  }

  Future<void> _toggle() async {
    final current = widget.queueController.queue?.autoplayEnabled;
    if (current == null || widget.queueController.isUpdatingAutoplay) return;
    final next = !current;
    try {
      await widget.queueController.setAutoplayEnabled(next);
    } catch (error) {
      debugPrint('Could not update queue autoplay: $error');
      if (!mounted) return;
      GlobalSnackbarHost.show(
        context,
        message: AppLocalizations.of(context).queueAutoplayChangeFailed,
        kind: GlobalSnackbarKind.error,
      );
    }
  }

  @override
  void dispose() {
    widget.queueController.removeListener(_onQueueChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final enabled = widget.queueController.queue?.autoplayEnabled;
    final isUpdating = widget.queueController.isUpdatingAutoplay;
    return GlassIconToggleButton(
      icon: CupertinoIcons.repeat,
      type: GlassIconButtonType.secondary,
      tooltip: enabled == true
          ? AppLocalizations.of(context).queueDisableAutoplayTooltip
          : AppLocalizations.of(context).queueEnableAutoplayTooltip,
      disabled: enabled == null || isUpdating,
      isSelected: enabled == true,
      isLoading: isUpdating,
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
