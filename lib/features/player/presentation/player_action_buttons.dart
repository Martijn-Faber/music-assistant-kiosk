import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../design_system/glass_icon_button.dart';
import '../../../design_system/glass_icon_toggle_button.dart';
import '../../../design_system/global_snackbar.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../data/music_assistant_repository.dart';
import '../viewmodels/player_favorite_view_model.dart';

class PlayerFavoriteButton extends StatefulWidget {
  const PlayerFavoriteButton({
    super.key,
    required this.repository,
    required this.uri,
  });

  final MusicAssistantRepository repository;
  final String? uri;

  @override
  State<PlayerFavoriteButton> createState() => _PlayerFavoriteButtonState();
}

class _PlayerFavoriteButtonState extends State<PlayerFavoriteButton> {
  late PlayerFavoriteViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _createViewModel();
  }

  void _createViewModel() {
    _viewModel = PlayerFavoriteViewModel(
      repository: widget.repository,
      uri: widget.uri,
    )..addListener(_onViewModelChanged);
  }

  void _onViewModelChanged() {
    if (mounted) setState(() {});
  }

  @override
  void didUpdateWidget(covariant PlayerFavoriteButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.uri != widget.uri ||
        oldWidget.repository != widget.repository) {
      _viewModel
        ..removeListener(_onViewModelChanged)
        ..dispose();
      _createViewModel();
    }
  }

  @override
  void dispose() {
    _viewModel
      ..removeListener(_onViewModelChanged)
      ..dispose();
    super.dispose();
  }

  Future<void> _toggle() async {
    try {
      await _viewModel.toggle();
    } catch (_) {
      if (mounted) {
        GlobalSnackbarHost.show(
          context,
          message: AppLocalizations.of(context).playerFavoriteChangeFailed,
          kind: GlobalSnackbarKind.error,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) => GlassIconToggleButton(
        icon: CupertinoIcons.heart,
        selectedIcon: CupertinoIcons.heart_fill,
        type: GlassIconButtonType.primary,
        tooltip: _viewModel.favorite == true
            ? AppLocalizations.of(context).playerRemoveFavoriteTooltip
            : AppLocalizations.of(context).playerAddFavoriteTooltip,
        disabled: _viewModel.favorite == null,
        isSelected: _viewModel.favorite == true,
        isLoading: _viewModel.isBusy,
        onPressed: _toggle,
      );
}

class PlayerQueueButton extends StatelessWidget {
  const PlayerQueueButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => GlassIconButton(
        icon: CupertinoIcons.music_note_list,
        type: GlassIconButtonType.primary,
        tooltip: AppLocalizations.of(context).playerShowQueueTooltip,
        onPressed: onPressed,
      );
}
