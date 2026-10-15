import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'session_gate.dart';
import '../design_system/global_snackbar.dart';

class MusicAssistantApp extends StatelessWidget {
  const MusicAssistantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Assistant',
      theme: AppTheme.dark,
      home: const SessionGate(),
      builder: (context, child) => GlobalSnackbarHost(child: child!),
    );
  }
}
