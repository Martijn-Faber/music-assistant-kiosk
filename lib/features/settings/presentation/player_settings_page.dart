import 'package:flutter/cupertino.dart';
import 'package:music_assistant_api/music_assistant_api.dart';
import 'package:flutter/material.dart';

import '../../../design_system/glass_design_system.dart';
import '../../../l10n/generated/app_localizations.dart';

/// Settings as a regular pager destination, sized for the kiosk display.
class PlayerSettingsPage extends StatefulWidget {
  const PlayerSettingsPage({
    super.key,
    required this.user,
    required this.players,
    required this.selectedPlayerId,
    required this.serverAddress,
    required this.serverInfo,
    required this.deviceName,
    required this.clock24HourFormat,
    required this.onClock24HourFormatChanged,
    required this.onLocaleChanged,
    required this.onSelectPlayer,
    required this.onSignOut,
  });

  final List<MusicAssistantPlayer> players;
  final MusicAssistantUser user;
  final String? selectedPlayerId;
  final String serverAddress;
  final MusicAssistantServerInfoMessage? serverInfo;
  final String? deviceName;
  final bool? clock24HourFormat;
  final ValueChanged<bool?> onClock24HourFormatChanged;
  final ValueChanged<Locale> onLocaleChanged;
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
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final locale = Localizations.localeOf(context);
    return SafeArea(
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
                  Text(
                    l10n.settingsTitle,
                    style: TextStyle(
                      color: Color(0xFFF1F4EA),
                      fontSize: GlassTokens.fontSize28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  GlassSectionLabel(l10n.settingsSignedInAsLabel),
                  const SizedBox(height: 8),
                  GlassInfoRow(
                    icon: CupertinoIcons.person,
                    leading: CircleAvatar(
                      radius: 18,
                      backgroundColor: const Color(0xFF52625E),
                      foregroundImage:
                          widget.user.avatarUrl?.trim().isNotEmpty == true
                          ? NetworkImage(widget.user.avatarUrl!.trim())
                          : null,
                      child: const Icon(
                        CupertinoIcons.person,
                        size: 18,
                        color: Color(0xFFE9F0EB),
                      ),
                    ),
                    value: widget.user.displayName?.trim().isNotEmpty == true
                        ? '${widget.user.displayName} (${widget.user.username})'
                        : widget.user.username,
                  ),
                  const SizedBox(height: 18),
                  GlassSectionLabel(l10n.settingsPlayerOnScreenLabel),
                  const SizedBox(height: 8),
                  GlassDropdown<String>(
                    value: widget.players.any(
                      (p) => p.playerId == _selectedPlayerId,
                    )
                        ? _selectedPlayerId
                        : null,
                    hint: l10n.settingsPlayerSelectHint,
                    items: widget.players
                        .map(
                          (player) => DropdownMenuItem<String>(
                            value: player.playerId,
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
                    Text(
                      l10n.settingsPlayersNoneFoundMessage,
                      style: TextStyle(color: Color(0xFFAAB7B4)),
                    ),
                  ],
                  const SizedBox(height: 20),
                  GlassSectionLabel(l10n.settingsLanguageLabel),
                  const SizedBox(height: 8),
                  GlassDropdown<String>(
                    value: locale.languageCode,
                    hint: l10n.settingsLanguageLabel,
                    items: [
                      DropdownMenuItem(
                        value: 'en',
                        child: Text(l10n.settingsLanguageEnglishOption),
                      ),
                      DropdownMenuItem(
                        value: 'nl',
                        child: Text(l10n.settingsLanguageDutchOption),
                      ),
                    ],
                    onChanged: (code) {
                      if (code != null) widget.onLocaleChanged(Locale(code));
                    },
                  ),
                  const SizedBox(height: 20),
                  GlassSectionLabel(l10n.settingsClockFormatLabel),
                  const SizedBox(height: 8),
                  _clockFormatSelector(l10n),
                  const SizedBox(height: 20),
                  GlassSectionLabel(l10n.settingsConnectedToLabel),
                  const SizedBox(height: 8),
                  GlassInfoRow(
                    icon: CupertinoIcons.desktopcomputer,
                    value: widget.serverAddress,
                  ),
                  const SizedBox(height: 8),
                  GlassInfoRow(
                    icon: CupertinoIcons.hifispeaker,
                    value:
                        widget.deviceName ?? l10n.settingsNoPlayerSelectedValue,
                  ),
                  if (widget.serverInfo case final info?) ...[
                    const SizedBox(height: 20),
                    GlassSectionLabel(l10n.settingsServerSectionLabel),
                    const SizedBox(height: 8),
                    for (final entry in [
                      (l10n.settingsServerNameLabel, info.name),
                      (l10n.settingsServerVersionLabel, info.serverVersion),
                      (l10n.settingsServerStatusLabel, info.status),
                    ])
                      if (entry.$2 is String && (entry.$2 as String).isNotEmpty) ...[
                        GlassInfoRow(
                          icon: CupertinoIcons.info,
                          value: '${entry.$1}: ${entry.$2}',
                        ),
                        const SizedBox(height: 6),
                      ],
                  ],
                  const SizedBox(height: 24),
                  GlassOutlineButton(
                    icon: CupertinoIcons.power,
                    label: l10n.settingsSignOutAction,
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
  }

  Widget _clockFormatSelector(AppLocalizations l10n) {
    final selected = switch (widget.clock24HourFormat) {
      true => 2,
      false => 1,
      null => 0,
    };
    return GlassSegmentedControl(
      options: [
        l10n.settingsClockFormatSystemOption,
        l10n.settingsClockFormat12HourOption,
        l10n.settingsClockFormat24HourOption,
      ],
      selectedIndex: selected,
      onSelected: (index) => widget.onClock24HourFormatChanged(switch (index) {
        1 => false,
        2 => true,
        _ => null,
      }),
    );
  }
}
