# Living Room Music Assistant

A Flutter client for controlling Music Assistant from a living room display. The app connects to a Music Assistant server, discovers servers on the local network, and provides playback, queue, volume, and player controls.

## Requirements

- Flutter and Dart versions matching the constraints in `pubspec.yaml`
- A reachable Music Assistant server

## Music Assistant API compatibility

The app's API models are based on the Music Assistant OpenAPI schema for
**Music Assistant 2.10.5**. The generated model set covers the server info,
player, current media, queue, track, radio, playlist, media image and palette,
and stream audio format schemas used by the app. Music Assistant versions
other than 2.10.5 have not been explicitly verified.

The full source schema and the scoped schema used to generate models are in
`api/`. See [`docs/API_CODE_GENERATION.md`](docs/API_CODE_GENERATION.md) for
the model generation workflow.

The app is transitioning to its own pure Dart client in
`packages/music_assistant_api`. It currently provides the documented HTTP
routes and a generic WebSocket command method; the app uses it for server info
while the remaining features still use the existing `music_assistant` client.

## Run

```sh
flutter pub get
flutter run
```

The Android app uses immersive mode and keeps the screen awake for kiosk use. On first launch, enter the Music Assistant server address and account credentials. The session is saved securely on the device.
