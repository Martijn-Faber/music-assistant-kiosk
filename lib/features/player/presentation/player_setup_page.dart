import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:music_assistant_api/music_assistant_api.dart';
import '../../../design_system/glass_design_system.dart';

class PlayerSetupPage extends StatefulWidget {
  const PlayerSetupPage({
    super.key,
    required this.players,
    required this.isRefreshing,
    required this.error,
    required this.onRefresh,
    required this.onComplete,
  });

  final List<MusicAssistantPlayer> players;
  final bool isRefreshing;
  final String? error;
  final Future<void> Function() onRefresh;
  final Future<void> Function(String playerId) onComplete;

  @override
  State<PlayerSetupPage> createState() => _PlayerSetupPageState();
}

class _PlayerSetupPageState extends State<PlayerSetupPage> {
  String? _selectedPlayerId;
  bool _isSaving = false;

  @override
  void didUpdateWidget(covariant PlayerSetupPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!widget.players.any((player) => player.playerId == _selectedPlayerId)) {
      _selectedPlayerId = null;
    }
  }

  Future<void> _continue() async {
    final playerId = _selectedPlayerId;
    if (playerId == null || _isSaving) return;
    setState(() => _isSaving = true);
    await widget.onComplete(playerId);
    if (mounted) setState(() => _isSaving = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: GlassTokens.background,
    body: SafeArea(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(22, 24, 22, 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const GlassPageHeading(
                  title: 'Choose your player',
                  subtitle:
                      'Select the speaker or group this device should control.',
                ),
                const SizedBox(height: 20),
                if (widget.players.isEmpty)
                  Expanded(child: _emptyState())
                else
                  Expanded(
                    child: ListView.separated(
                      physics: const ClampingScrollPhysics(),
                      itemCount: widget.players.length,
                      separatorBuilder: (_, _) => const SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        final player = widget.players[index];
                        final selected = player.playerId == _selectedPlayerId;
                        return GlassCard(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 15,
                          ),
                          tint: selected
                              ? GlassTokens.selected
                              : GlassTokens.surfaceTint,
                          border: Border.all(
                            color: selected
                                ? GlassTokens.textPrimary
                                : GlassTokens.border,
                            width: selected ? 1.2 : 0.8,
                          ),
                          onTap: _isSaving
                              ? null
                              : () => setState(
                                  () => _selectedPlayerId = player.playerId,
                                ),
                          child: Row(
                            children: [
                              const Icon(
                                CupertinoIcons.hifispeaker,
                                size: GlassTokens.iconSizeM,
                                color: GlassTokens.textPrimary,
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      player.name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: GlassTokens.textPrimary,
                                        fontSize: GlassTokens.fontSize16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    if (player.groupMembers?.isNotEmpty == true)
                                      Padding(
                                        padding: const EdgeInsets.only(top: 3),
                                        child: Text(
                                          '${player.groupMembers!.length} speakers',
                                          style: const TextStyle(
                                            color: GlassTokens.textSecondary,
                                            fontSize: GlassTokens.fontSize12,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              if (selected)
                                const Icon(
                                  CupertinoIcons.checkmark_circle_fill,
                                  color: GlassTokens.textPrimary,
                                  size: GlassTokens.iconSizeM,
                                ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                if (widget.error != null) ...[
                  const SizedBox(height: 10),
                  Text(
                    widget.error!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: GlassTokens.error,
                      fontSize: GlassTokens.fontSize12,
                    ),
                  ),
                ],
                const SizedBox(height: 14),
                GlassActionButton(
                  label: _isSaving ? 'Saving' : 'Continue',
                  icon: CupertinoIcons.arrow_right,
                  isLoading: _isSaving,
                  onPressed: _selectedPlayerId == null || _isSaving
                      ? null
                      : _continue,
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );

  Widget _emptyState() => Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          CupertinoIcons.speaker_slash,
          color: GlassTokens.textSecondary,
          size: GlassTokens.iconSizeL,
        ),
        const SizedBox(height: 12),
        const Text(
          'No players found on this server.',
          textAlign: TextAlign.center,
          style: TextStyle(color: GlassTokens.textPrimary, fontSize: GlassTokens.fontSize14),
        ),
        const SizedBox(height: 14),
        GlassInlineButton(
          onPressed: widget.isRefreshing ? null : widget.onRefresh,
          icon: CupertinoIcons.refresh,
          label: 'Refresh players',
          isLoading: widget.isRefreshing,
        ),
      ],
    ),
  );
}
