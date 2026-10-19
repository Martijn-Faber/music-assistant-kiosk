import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// Controls brightness for this app's Android window.
class ScreenBrightnessBridge {
  ScreenBrightnessBridge._();

  static const _channel = MethodChannel('com.example.app/screen_brightness');

  static Future<void> setDimmed(bool dimmed) async {
    try {
      await _channel.invokeMethod<void>(
        'setDimmed',
        <String, Object>{'dimmed': dimmed},
      );
    } on MissingPluginException {
      // Keep other Flutter targets usable; brightness control is Android-only.
    } on PlatformException {
      // Brightness control is best effort and should not disrupt the UI.
    }
  }
}
