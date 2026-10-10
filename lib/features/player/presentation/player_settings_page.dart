import 'package:flutter/material.dart';

import '../domain/player_summary.dart';
import 'design_system/glass_design_system.dart';

/// Settings as a regular pager destination, sized for the kiosk display.
class PlayerSettingsPage extends StatefulWidget {
  const PlayerSettingsPage({
    super.key,
    required this.players,
    required this.selectedPlayerId,
    required this.serverAddress,
    required this.deviceName,
    required this.clock24HourFormat,
    required this.onClock24HourFormatChanged,
    required this.onSelectPlayer,
    required this.onSignOut,
  });

  final List<PlayerSummary> players;
  final String? selectedPlayerId;
  final String serverAddress;
  final String? deviceName;
  final bool? clock24HourFormat;
  final ValueChanged<bool?> onClock24HourFormatChanged;
  final ValueChanged<String> onSelectPlayer;
  final VoidCallback onSignOut;

  @override
  State<PlayerSettingsPage> createState() => _PlayerSettingsPageState();
}

class _PlayerSettingsPageState extends State<PlayerSettingsPage> {
  late String? _selectedPlayerId = widget.selectedPlayerId;

  @override
  void didUpdateWidget(covariant PlayerSettingsPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedPlayerId != widget.selectedPlayerId) {
      _selectedPlayerId = widget.selectedPlayerId;
    }
  }

  @override
  Widget build(BuildContext context) => SafeArea(
    child: LayoutBuilder(
      builder: (context, constraints) => Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: SizedBox(
            height: constraints.maxHeight,
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(24, 28, 24, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Settings',
                    style: TextStyle(
                      color: Color(0xFFF1F4EA),
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 18),
                  const GlassSectionLabel('PLAYER ON SCREEN'),
                  const SizedBox(height: 8),
                  GlassDropdown<String>(
                    value: widget.players.any((p) => p.id == _selectedPlayerId)
                        ? _selectedPlayerId
                        : null,
                    hint: 'Select a player',
                    items: widget.players
                        .map(
                          (player) => DropdownMenuItem<String>(
                            value: player.id,
                            child: Text(
                              player.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (id) {
                      if (id == null) return;
                      setState(() => _selectedPlayerId = id);
                      widget.onSelectPlayer(id);
                    },
                  ),
                  if (widget.players.isEmpty) ...[
                    const SizedBox(height: 8),
                    const Text(
                      'No players found on this server.',
                      style: TextStyle(color: Color(0xFFAAB7B4)),
                    ),
                  ],
                  const SizedBox(height: 20),
                  const GlassSectionLabel('CLOCK FORMAT'),
                  const SizedBox(height: 8),
                  _clockFormatSelector(),
                  const SizedBox(height: 20),
                  const GlassSectionLabel('CONNECTED TO'),
                  const SizedBox(height: 8),
                  GlassInfoRow(
                    icon: Icons.dns_outlined,
                    value: widget.serverAddress,
                  ),
                  const SizedBox(height: 8),
                  GlassInfoRow(
                    icon: Icons.speaker_outlined,
                    value: widget.deviceName ?? 'No player selected',
                  ),
                  const SizedBox(height: 24),
                  GlassOutlineButton(
                    icon: Icons.logout_rounded,
                    label: 'SIGN OUT',
                    onPressed: widget.onSignOut,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );

  Widget _clockFormatSelector() {
    final selected = switch (widget.clock24HourFormat) {
      true => 2,
      false => 1,
      null => 0,
    };
    return GlassSegmentedControl(
      options: const ['System', '12 hour', '24 hour'],
      selectedIndex: selected,
      onSelected: (index) => widget.onClock24HourFormatChanged(switch (index) {
        1 => false,
        2 => true,
        _ => null,
      }),
    );
  }
}
