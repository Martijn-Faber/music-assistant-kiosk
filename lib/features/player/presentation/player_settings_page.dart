import 'package:flutter/material.dart';

import '../domain/player_summary.dart';
import 'player_glass_widgets.dart';

/// Settings as a regular pager destination, sized for the kiosk display.
class PlayerSettingsPage extends StatefulWidget {
  const PlayerSettingsPage({
    super.key,
    required this.players,
    required this.selectedPlayerId,
    required this.serverAddress,
    required this.deviceName,
    required this.onSelectPlayer,
    required this.onSignOut,
  });

  final List<PlayerSummary> players;
  final String? selectedPlayerId;
  final String serverAddress;
  final String? deviceName;
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
                  _sectionLabel('PLAYER ON SCREEN'),
                  const SizedBox(height: 8),
                  GlassSurface(
                    borderRadius: 18,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 6,
                    ),
                    tint: const Color(0x22303840),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value:
                            widget.players.any((p) => p.id == _selectedPlayerId)
                            ? _selectedPlayerId
                            : null,
                        isExpanded: true,
                        dropdownColor: const Color(0xFF263333),
                        hint: const Text(
                          'Select a player',
                          style: TextStyle(color: Color(0xFFCBD4D0)),
                        ),
                        iconEnabledColor: Colors.white,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        items: widget.players
                            .map(
                              (player) => DropdownMenuItem(
                                value: player.id,
                                child: Text(
                                  player.name,
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
                    ),
                  ),
                  if (widget.players.isEmpty) ...[
                    const SizedBox(height: 8),
                    const Text(
                      'No players found on this server.',
                      style: TextStyle(color: Color(0xFFAAB7B4)),
                    ),
                  ],
                  const SizedBox(height: 20),
                  _sectionLabel('CONNECTED TO'),
                  const SizedBox(height: 8),
                  _infoRow(Icons.dns_outlined, widget.serverAddress),
                  const SizedBox(height: 8),
                  _infoRow(
                    Icons.speaker_outlined,
                    widget.deviceName ?? 'No player selected',
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: OutlinedButton.icon(
                      onPressed: widget.onSignOut,
                      icon: const Icon(Icons.logout_rounded),
                      label: const Text('SIGN OUT'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFFFFA294),
                        side: const BorderSide(color: Color(0x66FFFFFF)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
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
    ),
  );

  Widget _sectionLabel(String text) => Text(
    text,
    style: const TextStyle(
      color: Color(0xFFCBD4D0),
      fontSize: 11,
      letterSpacing: 1.1,
    ),
  );

  Widget _infoRow(IconData icon, String value) => GlassSurface(
    borderRadius: 15,
    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
    tint: const Color(0x1A303840),
    child: Row(
      children: [
        Icon(icon, size: 19, color: const Color(0xFFD8E0DB)),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Color(0xFFE9F0EB), fontSize: 14),
          ),
        ),
      ],
    ),
  );
}
