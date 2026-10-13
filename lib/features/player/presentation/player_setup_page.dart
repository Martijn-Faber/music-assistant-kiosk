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
    backgroundColor: const Color(0xFF101819),
    body: SafeArea(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(22, 24, 22, 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Choose your player',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFF1F4EA),
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 7),
                const Text(
                  'Select the speaker or group this device should control.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xFFD8E0DB), fontSize: 13),
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
                          borderRadius: 18,
                          padding: EdgeInsets.zero,
                          tint: selected
                              ? const Color(0x334C5B5B)
                              : const Color(0x22232A30),
                          border: Border.all(
                            color: selected
                                ? const Color(0xCCFFFFFF)
                                : const Color(0x55FFFFFF),
                            width: selected ? 1.2 : 0.8,
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(18),
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
                                      color: Colors.white,
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
                                              color: Colors.white,
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
                                                  color: Colors.white70,
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
                                        color: Colors.white,
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
                      color: Color(0xFFFFA39B),
                      fontSize: 12,
                    ),
                  ),
                ],
                const SizedBox(height: 14),
                SizedBox(
                  height: 54,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(18),
                      onTap: _selectedPlayerId == null || _isSaving
                          ? null
                          : _continue,
                      child: GlassSurface(
                        borderRadius: 18,
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        tint: _selectedPlayerId == null
                            ? const Color(0x1AFFFFFF)
                            : const Color(0x333B4748),
                        showShadow: false,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (_isSaving)
                              const SizedBox.square(
                                dimension: 18,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            else
                              const Icon(
                                CupertinoIcons.arrow_right,
                                color: Colors.white,
                                size: 19,
                              ),
                            const SizedBox(width: 10),
                            Text(
                              _isSaving ? 'SAVING' : 'CONTINUE',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.6,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
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
          color: Colors.white70,
          size: 28,
        ),
        const SizedBox(height: 12),
        const Text(
          'No players found on this server.',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        const SizedBox(height: 14),
        TextButton.icon(
          onPressed: widget.isRefreshing ? null : widget.onRefresh,
          icon: widget.isRefreshing
              ? const SizedBox.square(
                  dimension: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
              : const Icon(CupertinoIcons.refresh, size: 17),
          label: const Text('Refresh players'),
          style: TextButton.styleFrom(foregroundColor: Colors.white),
        ),
      ],
    ),
  );
}
