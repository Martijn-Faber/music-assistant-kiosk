import 'dart:async';

import 'package:flutter/material.dart';

import '../core/storage/session_storage.dart';
import '../l10n/generated/app_localizations.dart';
import 'app_theme.dart';
import 'session_gate.dart';
import '../design_system/global_snackbar.dart';

class MusicAssistantApp extends StatefulWidget {
  const MusicAssistantApp({super.key});

  @override
  State<MusicAssistantApp> createState() => _MusicAssistantAppState();
}

class _MusicAssistantAppState extends State<MusicAssistantApp> {
  final _storage = SessionStorage();
  Locale _locale = const Locale('en');
  bool _localeWasChanged = false;

  @override
  void initState() {
    super.initState();
    _restoreLocale();
  }

  Future<void> _restoreLocale() async {
    try {
      final saved = await _storage.readLocale();
      if (!mounted || _localeWasChanged || saved == null) return;
      if (saved != 'en' && saved != 'nl') return;
      setState(() => _locale = Locale(saved));
    } catch (_) {
      // English is the default when no saved language is available.
    }
  }

  void _changeLocale(Locale locale) {
    if (locale.languageCode != 'en' && locale.languageCode != 'nl') return;
    _localeWasChanged = true;
    setState(() => _locale = locale);
    unawaited(_saveLocale(locale.languageCode));
  }

  Future<void> _saveLocale(String languageCode) async {
    try {
      await _storage.saveLocale(languageCode);
    } catch (_) {
      // Keep the new language for this run if persistence is unavailable.
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Assistant',
      theme: AppTheme.dark,
      locale: _locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      home: SessionGate(onLocaleChanged: _changeLocale),
      builder: (context, child) => GlobalSnackbarHost(child: child!),
    );
  }
}
