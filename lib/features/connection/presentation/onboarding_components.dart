import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../design_system/glass_design_system.dart';
import '../data/music_assistant_server_discovery.dart';

class OnboardingWaitingPill extends StatelessWidget {
  const OnboardingWaitingPill({super.key, required this.opened});

  final bool opened;

  @override
  Widget build(BuildContext context) => GlassPill(
    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
    tint: GlassTokens.surfaceTintSubtle,
    showShadow: false,
    child: AnimatedSize(
      duration: const Duration(milliseconds: 260),
      curve: Curves.easeInOutCubic,
      alignment: Alignment.centerLeft,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 220),
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        layoutBuilder: (currentChild, previousChildren) => Stack(
          alignment: Alignment.centerLeft,
          children: [...previousChildren, if (currentChild != null) currentChild],
        ),
        child: Row(
          key: ValueKey(opened),
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!opened)
              const SizedBox(
                width: 14,
                height: 14,
                child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
              )
            else
              const Icon(CupertinoIcons.checkmark_circle_fill, size: GlassTokens.iconSizeXs, color: Colors.white),
            const SizedBox(width: 9),
            Text(
              opened ? 'Complete sign-in on your phone' : 'Waiting for your phone',
              style: const TextStyle(color: GlassTokens.textSecondary, fontSize: GlassTokens.fontSize12),
            ),
          ],
        ),
      ),
    ),
  );
}

class OnboardingStepIndicator extends StatelessWidget {
  const OnboardingStepIndicator({
    super.key,
    required this.activeStep,
    required this.count,
  });

  final int activeStep;
  final int count;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      for (var index = 0; index < count; index++) ...[
        AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          width: index == activeStep ? 22 : 6,
          height: 6,
          decoration: BoxDecoration(
            color: index == activeStep ? GlassTokens.textPrimary : GlassTokens.border,
            borderRadius: BorderRadius.circular(99),
          ),
        ),
        if (index != count - 1) const SizedBox(width: 7),
      ],
    ],
  );
}

class DiscoveredServerCard extends StatelessWidget {
  const DiscoveredServerCard({super.key, required this.server, required this.onTap});

  final DiscoveredMusicAssistantServer server;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => GlassCard(
    constraints: const BoxConstraints(minHeight: 72),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    tint: GlassTokens.surfaceTint,
    onTap: onTap,
    child: Row(
      children: [
        const Icon(
          CupertinoIcons.desktopcomputer,
          size: GlassTokens.iconSizeM,
          color: GlassTokens.textSecondary,
        ),
        const SizedBox(width: 13),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                server.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: GlassTokens.textPrimary,
                  fontSize: GlassTokens.fontSize15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                server.serverVersion.isEmpty
                    ? '${server.host}:${server.port}'
                    : '${server.host}:${server.port} · v${server.serverVersion}',
                style: const TextStyle(color: GlassTokens.textMuted, fontSize: GlassTokens.fontSize12),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        const Icon(
          CupertinoIcons.chevron_right,
          color: GlassTokens.textSecondary,
          size: GlassTokens.iconSizeM,
        ),
      ],
    ),
  );
}

class OnboardingStatusMessage extends StatelessWidget {
  const OnboardingStatusMessage({super.key, required this.icon, required this.message});

  final IconData icon;
  final String message;

  @override
  Widget build(BuildContext context) => GlassSurface(
    borderRadius: GlassTokens.radiusMedium,
    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
    tint: GlassTokens.surfaceTintSubtle,
    showShadow: false,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: GlassTokens.iconSizeS, color: GlassTokens.textMuted),
        const SizedBox(width: 9),
        Flexible(
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(color: GlassTokens.textSecondary, fontSize: GlassTokens.fontSize12),
          ),
        ),
      ],
    ),
  );
}

class OnboardingErrorMessage extends StatelessWidget {
  const OnboardingErrorMessage({super.key, required this.message, required this.compact});

  final String message;
  final bool compact;

  @override
  Widget build(BuildContext context) => GlassSurface(
    borderRadius: GlassTokens.radiusMedium,
    padding: EdgeInsets.symmetric(
      horizontal: compact ? 9 : 13,
      vertical: compact ? 5 : 11,
    ),
    tint: GlassTokens.errorSurface,
    border: Border.all(color: GlassTokens.errorBorder),
    showShadow: false,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          CupertinoIcons.exclamationmark_circle,
          color: GlassTokens.error,
          size: compact ? 15 : 18,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            message,
            maxLines: compact ? 1 : null,
            overflow: compact ? TextOverflow.ellipsis : null,
            style: const TextStyle(color: GlassTokens.errorText, fontSize: GlassTokens.fontSize13, height: 1.35),
          ),
        ),
      ],
    ),
  );
}

class ConnectionBackdrop extends StatelessWidget {
  const ConnectionBackdrop({super.key});

  @override
  Widget build(BuildContext context) => Stack(
    fit: StackFit.expand,
    children: [
      const DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF17212C), GlassTokens.background, Color(0xFF080B10)],
            stops: [0, 0.48, 1],
          ),
        ),
      ),
      Positioned(
        top: -180,
        left: -150,
        child: Container(
          width: 470,
          height: 390,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(colors: [Color(0x332D7182), Color(0x002D7182)]),
          ),
        ),
      ),
      Positioned(
        right: -210,
        bottom: -260,
        child: Container(
          width: 560,
          height: 560,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(colors: [Color(0x222D536B), Color(0x002D536B)]),
          ),
        ),
      ),
    ],
  );
}
