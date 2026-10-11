import 'dart:async';

import 'package:flutter/services.dart';
import 'package:multicast_dns/multicast_dns.dart';

class DiscoveredMusicAssistantServer {
  const DiscoveredMusicAssistantServer({
    required this.name,
    required this.host,
    required this.port,
  });

  final String name;
  final String host;
  final int port;

  String get url => Uri(scheme: 'http', host: host, port: port).toString();
}

class MusicAssistantServerDiscovery {
  static const _serviceType = '_mass._tcp.local';
  static const _networkChannel = MethodChannel(
    'com.example.app/network_discovery',
  );

  Future<List<DiscoveredMusicAssistantServer>> discover({
    Duration scanDuration = const Duration(seconds: 5),
  }) async {
    await _setMulticastLock(true);
    final client = MDnsClient();
    try {
      await client.start(onError: (_) {});

      final found = <String, DiscoveredMusicAssistantServer>{};
      final resolving = <Future<void>>[];
      final seenInstances = <String>{};
      final subscription = client
          .lookup<PtrResourceRecord>(
            ResourceRecordQuery.serverPointer(_serviceType),
          )
          .listen((record) {
            if (seenInstances.add(record.domainName)) {
              resolving.add(_resolve(client, record, found));
            }
          }, onError: (_) {});

      try {
        await Future<void>.delayed(scanDuration);
        await subscription.cancel();
        await Future.wait(resolving);
        final results = found.values.toList()
          ..sort(
            (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()),
          );
        return results;
      } finally {
        await subscription.cancel();
      }
    } finally {
      client.stop();
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

  Future<void> _resolve(
    MDnsClient client,
    PtrResourceRecord pointer,
    Map<String, DiscoveredMusicAssistantServer> found,
  ) async {
    try {
      final service = await client
          .lookup<SrvResourceRecord>(
            ResourceRecordQuery.service(pointer.domainName),
          )
          .first
          .timeout(const Duration(seconds: 2));
      final address = await client
          .lookup<IPAddressResourceRecord>(
            ResourceRecordQuery.addressIPv4(service.target),
          )
          .first
          .timeout(const Duration(seconds: 2));

      final instanceSuffix = '.$_serviceType';
      final name = pointer.domainName.endsWith(instanceSuffix)
          ? pointer.domainName.substring(
              0,
              pointer.domainName.length - instanceSuffix.length,
            )
          : service.target.replaceAll(RegExp(r'\.$'), '');
      final server = DiscoveredMusicAssistantServer(
        name: name,
        host: address.address.address,
        port: service.port,
      );
      found['${server.host}:${server.port}'] = server;
    } on TimeoutException {
      // A partly advertised service should not block the remaining results.
    } catch (_) {
      // Ignore malformed or stale advertisements and keep scanning.
    }
  }
}
