import 'package:flutter/services.dart';

typedef HardwareButtonHandler = Future<void> Function(String action);

class VolumeButtonBridge {
  static const _channel = MethodChannel('com.example.app/volume_buttons');

  void setHandler(HardwareButtonHandler handler) {
    _channel.setMethodCallHandler((call) {
      if ({'volumeUp', 'volumeDown', 'togglePlayback'}.contains(call.method)) {
        return handler(call.method);
      }
      return Future<void>.value();
    });
  }

  Future<void> setEnabled(bool enabled) =>
      _channel.invokeMethod<void>('setEnabled', enabled);

  void dispose() => _channel.setMethodCallHandler(null);
}
