import 'dart:async';

import 'package:flutter/services.dart';
import 'package:music_assistant/auth_helpers.dart';

class DiscoveredMusicAssistantServer {
  const DiscoveredMusicAssistantServer({
    required this.url,
    required this.name,
    required this.serverVersion,
  });

  final String url;
  final String name;
  final String serverVersion;

  String get host => Uri.parse(url).host;
  int get port => Uri.parse(url).port;
}

class MusicAssistantServerDiscovery {
  static const _networkChannel = MethodChannel(
    'com.example.app/network_discovery',
  );

  Future<List<DiscoveredMusicAssistantServer>> discover() async {
    await _setMulticastLock(true);
    try {
      final urls = await discoverServers();
      final servers = await Future.wait(
        urls.map((url) async {
          final uri = Uri.parse(url);
          try {
            final info = await getServerInfo(url);
            return DiscoveredMusicAssistantServer(
              url: url,
              name: info.name?.trim().isNotEmpty == true
                  ? info.name!.trim()
                  : info.serverId,
              serverVersion: info.serverVersion,
            );
          } catch (_) {
            // Keep a discovered server selectable even if its info endpoint
            // is unavailable or requires authentication.
            return DiscoveredMusicAssistantServer(
              url: url,
              name: uri.host,
              serverVersion: '',
            );
          }
        }),
      );
      servers.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
      return servers;
    } finally {
      await _setMulticastLock(false);
    }
  }

  Future<void> _setMulticastLock(bool enabled) async {
    try {
      await _networkChannel.invokeMethod<void>(
        enabled ? 'acquireMulticastLock' : 'releaseMulticastLock',
      );
    } on MissingPluginException {
      // The lock is Android-specific; other platforms can still scan mDNS.
    }
  }
}
