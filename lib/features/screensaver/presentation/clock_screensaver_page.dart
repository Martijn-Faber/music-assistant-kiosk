import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:music_assistant_api/music_assistant_api.dart';
import '../../../l10n/generated/app_localizations.dart';

import '../../../design_system/glass_tokens.dart';
import '../../../design_system/page_indicator.dart';
import '../../../design_system/glass_icon_button.dart';
import 'clockface_designs.dart';
import '../data/weather_service.dart';

/// A low-motion clock shown while the selected player is idle.
class ClockScreensaverPage extends StatefulWidget {
  const ClockScreensaverPage({
    super.key,
    this.nowPlayingLabel,
    this.onNowPlayingTap,
    this.alwaysUse24HourFormat,
    this.design = 0,
    this.editing = false,
    this.exitProgress = 0,
    this.onDesignSelected,
    this.onDesignPreviewChanged,
    this.onEnterEditMode,
    this.onOpenSettings,
    this.weatherLocation,
    this.onWeatherLocationChanged,
    this.musicPalette,
    this.dynamicColorsEnabled = true,
    this.onDynamicColorsChanged,
  });

  final String? nowPlayingLabel;
  final VoidCallback? onNowPlayingTap;
  final bool? alwaysUse24HourFormat;
  final int design;
  final bool editing;
  final double exitProgress;
  final ValueChanged<int>? onDesignSelected;
  final ValueChanged<int>? onDesignPreviewChanged;
  final VoidCallback? onEnterEditMode;
  final VoidCallback? onOpenSettings;
  final String? weatherLocation;
  final ValueChanged<String>? onWeatherLocationChanged;
  final MusicAssistantMediaItemPalette? musicPalette;
  final bool dynamicColorsEnabled;
  final ValueChanged<bool>? onDynamicColorsChanged;

  @override
  State<ClockScreensaverPage> createState() => _ClockScreensaverPageState();
}

class _ClockScreensaverPageState extends State<ClockScreensaverPage>
    with SingleTickerProviderStateMixin {
  late DateTime _now;
  late final PageController _designController;
  late final AnimationController _editModeController;
  Timer? _clockTimer;
  late int _previewDesign;
  final _weatherService = WeatherService();
  WeatherSnapshot? _weather;
  bool _weatherLoading = false;
  Timer? _weatherTimer;

  @override
  void initState() {
    super.initState();
    _now = DateTime.now();
    _designController = PageController(initialPage: widget.design);
    _editModeController = AnimationController(
      vsync: this,
      duration: GlassTokens.motionEmphasized,
      value: widget.editing ? 1 : 0,
    );
    _previewDesign = widget.design;
    _clockTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) setState(() => _now = DateTime.now());
    });
    _loadWeather();
    _weatherTimer = Timer.periodic(const Duration(minutes: 30), (_) => _loadWeather());
  }

  @override
  void didUpdateWidget(covariant ClockScreensaverPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.weatherLocation != widget.weatherLocation) _loadWeather();
    if (oldWidget.editing != widget.editing) {
      if (widget.editing) {
        _editModeController.forward();
      } else {
        _editModeController.reverse();
      }
    }
  }

  Future<void> _loadWeather() async {
    final location = widget.weatherLocation?.trim();
    if (location == null || location.isEmpty) {
      if (mounted) setState(() { _weather = null; _weatherLoading = false; });
      return;
    }
    setState(() => _weatherLoading = true);
    final snapshot = await _weatherService.fetch(location);
    if (mounted) setState(() { _weather = snapshot; _weatherLoading = false; });
  }

  Future<void> _openWeatherSettings() async {
    final location = await showDialog<String>(
      context: context,
      builder: (_) => _WeatherLocationDialog(
        initialLocation: widget.weatherLocation ?? '',
      ),
    );
    if (location != null && location.isNotEmpty) widget.onWeatherLocationChanged?.call(location);
  }

  @override
  void dispose() {
    _clockTimer?.cancel();
    _weatherTimer?.cancel();
    _editModeController.dispose();
    _designController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceLocale = WidgetsBinding.instance.platformDispatcher.locale;
    final appLocale = Localizations.localeOf(context);
    final use24HourFormat =
        widget.alwaysUse24HourFormat ??
        MediaQuery.alwaysUse24HourFormatOf(context);
    final startListeningLabel =
        AppLocalizations.of(context).playerStartListening;

    // The app language is user selectable, but the ambient clock should use
    // the device's regional date conventions (for example, Hungarian dates).
    return Localizations.override(
      context: context,
      locale: deviceLocale,
      delegates: GlobalMaterialLocalizations.delegates,
      child: Builder(
        builder: (context) {
          final materialLocalizations = MaterialLocalizations.of(context);
          final time = materialLocalizations.formatTimeOfDay(
            TimeOfDay.fromDateTime(_now),
            alwaysUse24HourFormat: use24HourFormat,
          );
          final date = materialLocalizations.formatFullDate(_now);
          return Stack(
            fit: StackFit.expand,
            children: [
              PageView.builder(
                key: const PageStorageKey('clockface-designs'),
                controller: _designController,
                scrollDirection: Axis.vertical,
                physics: widget.editing
                    ? const PageScrollPhysics()
                    : const NeverScrollableScrollPhysics(),
                itemCount: ClockfaceDesign.designCount,
                onPageChanged: (index) {
                  setState(() => _previewDesign = index);
                  widget.onDesignPreviewChanged?.call(index);
                },
                itemBuilder: (context, design) => AnimatedBuilder(
                  animation: Listenable.merge([
                    _designController,
                    _editModeController,
                  ]),
                  builder: (context, child) {
                    final page = _designController.hasClients
                        ? (_designController.page ?? widget.design.toDouble())
                        : widget.design.toDouble();
                    final distance = (page - design).abs().clamp(0.0, 1.0);
                    // Keep the whole design stack inset, with the active card
                    // at the existing preview size and neighboring cards
                    // receding in the same direction as the app pager.
                    final editProgress = Curves.easeInOutCubic.transform(
                      _editModeController.value,
                    );
                    final previewScale =
                        1 - (0.18 + distance * 0.10) * editProgress;
                    final scale = previewScale +
                        (1 - previewScale) * widget.exitProgress;
                    return Transform.translate(
                      offset: Offset(32 * (1 - distance) * editProgress, 0),
                      child: Transform.scale(
                        scale: scale,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            border: Border.all(
                              color: Colors.white.withValues(
                                alpha: 0.42 *
                                    editProgress *
                                    (1 - widget.exitProgress),
                              ),
                            ),
                            color: Color.lerp(
                              const Color(0x00000000),
                              const Color(0x14202730),
                              editProgress * (1 - widget.exitProgress),
                            ),
                          ),
                          child: child,
                        ),
                      ),
                    );
                  },
                  child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: widget.editing
                      ? () => widget.onDesignSelected?.call(design)
                      : null,
                  onLongPress: widget.editing
                      ? null
                      : widget.onEnterEditMode,
                  child: IgnorePointer(
                    ignoring: widget.editing,
                    child: Center(
                    child: ClockfaceDesign(
                      design: design,
                      time: time,
                      date: date,
                      now: _now,
                      weather: _weather,
                      weatherLocation: widget.weatherLocation,
                      weatherLoading: _weatherLoading,
                      nowPlayingLabel:
                          widget.nowPlayingLabel ?? startListeningLabel,
                      editing: widget.editing,
                      musicPalette: widget.musicPalette,
                      locale: appLocale,
                      onNowPlayingTap: widget.nowPlayingLabel == null
                          ? null
                          : widget.onNowPlayingTap,
                    ),
                  ),
                  ),
                  ),
                ),
              ),
              Positioned.fill(
                child: LayoutBuilder(
                  builder: (context, constraints) => AnimatedBuilder(
                    animation: _editModeController,
                    builder: (context, _) {
                      final progress = Curves.easeInOutCubic.transform(
                        _editModeController.value,
                      );
                      return IgnorePointer(
                        ignoring: !widget.editing,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: constraints.maxHeight * 0.09,
                              width: constraints.maxWidth * 0.15,
                              child: Opacity(
                                opacity: progress,
                                child: Transform.translate(
                                  offset: Offset(-18 * (1 - progress), 0),
                                  child: Transform.scale(
                                    scale: 0.88 + 0.12 * progress,
                                    child: Center(
                                      child: GlassIconButton(
                                        icon: Icons.tune_rounded,
                                        tooltip: 'Clockface settings',
                                        onPressed: widget.editing
                                            ? widget.onOpenSettings ??
                                                  _openWeatherSettings
                                            : null,
                                        size: 44,
                                        iconSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: constraints.maxHeight * 0.09 + 52,
                              width: constraints.maxWidth * 0.15,
                              child: Opacity(
                                opacity: progress,
                                child: Transform.translate(
                                  offset: Offset(-18 * (1 - progress), 0),
                                  child: Transform.scale(
                                    scale: 0.88 + 0.12 * progress,
                                    child: Center(
                                      child: GlassIconButton(
                                        icon: Icons.palette_outlined,
                                        selectedIcon: Icons.palette,
                                        tooltip: widget.dynamicColorsEnabled
                                            ? 'Turn off artwork colors'
                                            : 'Use artwork colors',
                                        isSelected: widget.dynamicColorsEnabled,
                                        onPressed: widget.editing
                                            ? () => widget.onDynamicColorsChanged?.call(
                                                  !widget.dynamicColorsEnabled,
                                                )
                                            : null,
                                        size: 44,
                                        iconSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: 0,
                              bottom: 0,
                              width: constraints.maxWidth * 0.15,
                              child: IgnorePointer(
                                child: Center(
                                  child: Opacity(
                                    opacity: progress,
                                    child: Transform.translate(
                                      offset: Offset(-12 * (1 - progress), 0),
                                      child: Transform.scale(
                                        scale: 0.9 + 0.1 * progress,
                                        child: PageIndicator(
                                          count: ClockfaceDesign.designCount,
                                          currentPage: _previewDesign,
                                          vertical: true,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _WeatherLocationDialog extends StatefulWidget {
  const _WeatherLocationDialog({required this.initialLocation});
  final String initialLocation;

  @override
  State<_WeatherLocationDialog> createState() => _WeatherLocationDialogState();
}

class _WeatherLocationDialogState extends State<_WeatherLocationDialog> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialLocation);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
    scrollable: true,
    insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
    title: const Text('Weather location'),
    content: TextField(
      controller: _controller,
      autofocus: true,
      textInputAction: TextInputAction.done,
      decoration: const InputDecoration(
        labelText: 'City name',
        hintText: 'e.g. Budapest',
      ),
      onSubmitted: (_) => _save(),
    ),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: const Text('Cancel'),
      ),
      FilledButton(onPressed: _save, child: const Text('Save')),
    ],
  );

  void _save() => Navigator.pop(context, _controller.text.trim());
}

