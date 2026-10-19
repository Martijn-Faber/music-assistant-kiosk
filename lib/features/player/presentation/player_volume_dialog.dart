import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/music_assistant_repository.dart';
import '../viewmodels/player_volume_dialog_view_model.dart';
import 'package:music_assistant_api/music_assistant_api.dart';
import '../../../design_system/glass_design_system.dart'
    show GlassSlider, GlassTokens;
import 'player_glass_widgets.dart';
import '../../../l10n/generated/app_localizations.dart';

class PlayerVolumeDialog extends StatefulWidget {
  const PlayerVolumeDialog({
    super.key,
    required this.repository,
    required this.player,
  });

  final MusicAssistantRepository repository;
  final MusicAssistantPlayer player;

  @override
  State<PlayerVolumeDialog> createState() => _PlayerVolumeDialogState();
}

class _PlayerVolumeDialogState extends State<PlayerVolumeDialog> {
  late final PlayerVolumeDialogViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = PlayerVolumeDialogViewModel(
      repository: widget.repository,
      player: widget.player,
    )..addListener(_onViewModelChanged);
  }

  void _onViewModelChanged() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _viewModel
      ..removeListener(_onViewModelChanged)
      ..dispose();
    super.dispose();
  }

  Future<void> _saveVolume(String playerId, double value) async {
    try {
      await _viewModel.saveVolume(playerId, value);
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              AppLocalizations.of(context).playerVolumeChangeFailed,
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) => Dialog(
    backgroundColor: Colors.transparent,
    insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
    child: GlassSurface(
      borderRadius: 24,
      padding: const EdgeInsets.fromLTRB(20, 14, 20, 20),
      tint: const Color(0xEE141D20),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 460,
          maxHeight: MediaQuery.sizeOf(context).height * .78,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    AppLocalizations.of(context).playerVolumeDialogTitle,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: GlassTokens.fontSize20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(CupertinoIcons.xmark, color: Colors.white70),
                ),
              ],
            ),
            Flexible(
              child: FutureBuilder<List<MusicAssistantPlayer>>(
                future: _viewModel.targets,
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const SizedBox(
                      height: 140,
                      child: Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      ),
                    );
                  }
                  if (snapshot.hasError || snapshot.data?.isEmpty != false) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Text(
                        AppLocalizations.of(context).playerVolumeLoadFailed,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white70),
                      ),
                    );
                  }
                  final targets = snapshot.data!;
                  return ListView.separated(
                    shrinkWrap: true,
                    itemCount: targets.length,
                    separatorBuilder: (_, _) => const Divider(
                      color: Color(0x33FFFFFF),
                      height: 18,
                    ),
                    itemBuilder: (context, index) {
                      final target = targets[index];
                      final volume = _viewModel.volumeFor(target.playerId);
                      final canSetVolume = target.supportedFeatures?.contains(
                            MusicAssistantPlayerFeature.volumeSet,
                          ) ==
                          true;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                CupertinoIcons.hifispeaker,
                                size: GlassTokens.iconSizeM,
                                color: Colors.white70,
                              ),
                              const SizedBox(width: 9),
                              Expanded(
                                child: Text(
                                  target.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: GlassTokens.fontSize15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              if (_viewModel.isSaving(target.playerId)) ...[
                                const SizedBox.square(
                                  dimension: 14,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white70,
                                  ),
                                ),
                                const SizedBox(width: 9),
                              ],
                              Text(
                                canSetVolume
                                    ? '${volume}%'
                                    : AppLocalizations.of(context)
                                        .playerVolumeUnsupported,
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: GlassTokens.fontSize13,
                                  fontFeatures: [FontFeature.tabularFigures()],
                                ),
                              ),
                            ],
                          ),
                          GlassSlider(
                            value: volume.toDouble(),
                            min: 0,
                            max: 100,
                            onChangeStart: canSetVolume
                                ? (_) => _viewModel.setAdjusting(target.playerId, true)
                                : null,
                            onChanged: canSetVolume
                                ? (value) => _viewModel.previewVolume(target.playerId, value)
                                : null,
                            onChangeEnd: canSetVolume
                                ? (value) => _saveVolume(target.playerId, value)
                                : null,
                            activeColor: Colors.white,
                            inactiveColor: const Color(0x55FFFFFF),
                          ),
                        ],
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
  );
}
