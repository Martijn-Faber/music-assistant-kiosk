import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:music_assistant_api/music_assistant_api.dart';

void main() {
  test('reconnects after the WebSocket closes', () async {
    final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    final secondConnection = Completer<void>();
    var connectionCount = 0;
    WebSocket? firstSocket;
    server.listen((request) async {
      final socket = await WebSocketTransformer.upgrade(request);
      connectionCount++;
      if (connectionCount == 1) firstSocket = socket;
      if (connectionCount == 2 && !secondConnection.isCompleted) {
        secondConnection.complete();
      }
      socket.add(jsonEncode({'server_id': 'test-server'}));
      socket.listen((frame) {
        final message = jsonDecode(frame as String) as Map<String, dynamic>;
        final command = message['command'];
        socket.add(
          jsonEncode({
            'message_id': message['message_id'],
            'result': command == 'auth'
                ? {'authenticated': true, 'user': {}}
                : {'ok': true},
          }),
        );
      });
    });

    final client = MusicAssistantClient(
      serverUrl: 'http://127.0.0.1:${server.port}',
      token: 'test-token',
      requestTimeout: const Duration(seconds: 2),
    );
    final reconnection = Completer<void>();
    var connectedCount = 0;
    final stateSubscription = client.state.listen((state) {
      if (state == MusicAssistantConnectionState.connected) {
        connectedCount++;
        if (connectedCount == 2 && !reconnection.isCompleted) {
          reconnection.complete();
        }
      }
    });

    try {
      await client.connect();
      await client.sendCommand('test/ping');
      await firstSocket!.close();
      await secondConnection.future.timeout(const Duration(seconds: 5));
      await reconnection.future.timeout(const Duration(seconds: 5));
      expect(await client.sendCommand('test/ping'), {'ok': true});
    } finally {
      await stateSubscription.cancel();
      await client.dispose();
      await server.close(force: true);
    }
  });
}
