import 'package:flutter/material.dart';

import '../domain/player_summary.dart';
import 'design_system/glass_dropdown.dart';

class PlayerSettingsDialog extends StatefulWidget {
  const PlayerSettingsDialog({
    super.key,
    required this.players,
    required this.selectedPlayerId,
    required this.serverAddress,
    required this.deviceName,
    required this.onSignOut,
  });

  final List<PlayerSummary> players;
  final String? selectedPlayerId;
  final String serverAddress;
  final String? deviceName;
  final VoidCallback onSignOut;

  @override
  State<PlayerSettingsDialog> createState() => _PlayerSettingsDialogState();
}

class _PlayerSettingsDialogState extends State<PlayerSettingsDialog> {
  late String? _selectedPlayerId = widget.selectedPlayerId;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Settings'),
      content: SizedBox(
        width: 340,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('SERVER'),
            const SizedBox(height: 4),
            Text(
              widget.serverAddress,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Color(0xFFAAB7B4)),
            ),
            const SizedBox(height: 16),
            const Text('DEVICE'),
            const SizedBox(height: 4),
            Text(
              widget.deviceName ?? 'No player selected',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Color(0xFFAAB7B4)),
            ),
            const SizedBox(height: 16),
            const Text('PLAYER ON SCREEN'),
            const SizedBox(height: 10),
            if (widget.players.isEmpty)
              const Text('No players found on this server.')
            else
              GlassDropdown<String>(
                value:
                    widget.players.any(
                      (player) => player.id == _selectedPlayerId,
                    )
                    ? _selectedPlayerId
                    : null,
                hint: 'Select a player',
                items: widget.players
                    .map(
                      (player) => DropdownMenuItem<String>(
                        value: player.id,
                        child: Text(player.name),
                      ),
                    )
                    .toList(),
                onChanged: (playerId) => setState(() {
                  _selectedPlayerId = playerId;
                }),
              ),
          ],
        ),
      ),
      actions: [
        TextButton.icon(
          onPressed: () {
            Navigator.of(context).pop();
            widget.onSignOut();
          },
          icon: const Icon(Icons.logout, size: 18),
          label: const Text('SIGN OUT'),
          style: TextButton.styleFrom(foregroundColor: const Color(0xFFFF8E7C)),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('CANCEL'),
        ),
        FilledButton(
          onPressed: _selectedPlayerId == null
              ? null
              : () => Navigator.of(context).pop(_selectedPlayerId),
          child: const Text('SAVE'),
        ),
      ],
    );
  }
}
