# Living Room Music Assistant

A Flutter client for controlling Music Assistant from a living room display. The app connects to a Music Assistant server, discovers servers on the local network, and provides playback, queue, volume, and player controls.

## Requirements

- Flutter and Dart versions matching the constraints in `pubspec.yaml`
- A reachable Music Assistant server

## Run

```sh
flutter pub get
flutter run
```

The Android app uses immersive mode and keeps the screen awake for kiosk use. On first launch, enter the Music Assistant server address and account credentials. The session is saved securely on the device.
