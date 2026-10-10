// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:app/features/player/presentation/album_backdrop.dart';
import 'package:app/features/connection/presentation/connection_screen.dart';
import 'package:app/features/player/domain/player_summary.dart';
import 'package:app/features/player/presentation/player_settings_dialog.dart';
import 'package:app/features/player/domain/radio_station.dart';

void main() {
  testWidgets('shows Music Assistant sign-in fields', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ConnectionScreen(
          isLoading: false,
          error: null,
          onConnect: (_, _, _) async {},
        ),
      ),
    );

    expect(find.text('Connect your server'), findsOneWidget);
    expect(find.bySemanticsLabel('Server address'), findsOneWidget);
    expect(find.bySemanticsLabel('Username'), findsOneWidget);
    expect(find.bySemanticsLabel('Password'), findsOneWidget);
    expect(find.text('CONNECT'), findsOneWidget);
  });

  testWidgets('keeps player content visible without album artwork', (
    tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: AlbumBackdrop(
          imageUrl: null,
          serverUrl: 'http://music-assistant.local:8095',
          token: '',
          child: Center(child: Text('Now playing')),
        ),
      ),
    );

    expect(find.text('Now playing'), findsOneWidget);
  });

  testWidgets('shows connection and device details in player settings', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: PlayerSettingsDialog(
          players: const [
            PlayerSummary(
              id: 'living-room',
              name: 'Living Room Speaker',
              playbackState: 'idle',
            ),
          ],
          selectedPlayerId: 'living-room',
          serverAddress: 'music.example.local:8095',
          deviceName: 'Living Room Speaker',
          onSignOut: () {},
        ),
      ),
    );

    expect(find.text('music.example.local:8095'), findsOneWidget);
    expect(find.text('Living Room Speaker'), findsNWidgets(2));
    expect(find.text('SIGN OUT'), findsOneWidget);
  });

  test('parses a radio station library item', () {
    final station = RadioStation.fromMap({
      'media_item': {
        'media_type': 'radio',
        'item_id': 'jazz-fm',
        'uri': 'provider://radio/jazz-fm',
        'name': 'Jazz FM',
      },
    });

    expect(station.id, 'provider://radio/jazz-fm');
    expect(station.name, 'Jazz FM');
    expect(station.media['media_type'], 'radio');
  });
}
