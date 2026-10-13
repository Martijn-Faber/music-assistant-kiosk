import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../domain/player_summary.dart';
import 'design_system/glass_design_system.dart';

class PlayerSetupPage extends StatefulWidget {
  const PlayerSetupPage({
    super.key,
    required this.players,
    required this.isRefreshing,
    required this.error,
    required this.onRefresh,
    required this.onComplete,
  });

  final List<PlayerSummary> players;
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
    if (!widget.players.any((player) => player.id == _selectedPlayerId)) {
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
                        final selected = player.id == _selectedPlayerId;
                        return GlassSurface(
                          borderRadius: GlassTokens.radiusLarge,
                          padding: EdgeInsets.zero,
                          tint: selected
                              ? GlassTokens.selected
                              : GlassTokens.surfaceTint,
                          border: Border.all(
                            color: selected
                                ? GlassTokens.textPrimary
                                : GlassTokens.border,
                            width: selected ? 1.2 : 0.8,
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(
                                GlassTokens.radiusLarge,
                              ),
                              onTap: _isSaving
                                  ? null
                                  : () => setState(
                                      () => _selectedPlayerId = player.id,
                                    ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 15,
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      CupertinoIcons.hifispeaker,
                                      size: 22,
                                      color: GlassTokens.textPrimary,
                                    ),
                                    const SizedBox(width: 14),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            player.name,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              color: GlassTokens.textPrimary,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          if (player.groupMembers?.isNotEmpty ==
                                              true)
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                top: 3,
                                              ),
                                              child: Text(
                                                '${player.groupMembers!.length} speakers',
                                                style: const TextStyle(
                                                  color: GlassTokens.textSecondary,
                                                  fontSize: 12,
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
                                        size: 22,
                                      ),
                                  ],
                                ),
                              ),
                            ),
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
                      fontSize: 12,
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
        const Icon(CupertinoIcons.speaker_slash, color: GlassTokens.textSecondary, size: 28),
        const SizedBox(height: 12),
        const Text(
          'No players found on this server.',
          textAlign: TextAlign.center,
          style: TextStyle(color: GlassTokens.textPrimary, fontSize: 14),
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
