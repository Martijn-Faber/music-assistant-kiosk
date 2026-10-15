# Music Assistant API models

The full Music Assistant OpenAPI specification is checked in at
`packages/music_assistant_api/api/music_assistant.openapi.json`. The generator
reads the scoped `music_assistant_models.openapi.json`, which includes schemas
used by the current app and excludes unrelated schemas that create overlong
generated filenames on Windows. Generated Dart code goes in
`packages/music_assistant_api/lib/src/generated/`; keep handwritten code
outside that generated folder because generation can replace its contents.

After replacing the full spec with the copy from your target server, refresh the
scoped schema and run code generation from the package directory:

```sh
dart pub get
dart run tool/refresh_scoped_openapi.dart
dart run swagger_to_dart
dart run build_runner build --delete-conflicting-outputs
```

From the Flutter app directory, run `flutter pub get` to resolve the local path
dependency after package or app dependency changes.

`swagger_to_dart` creates model source from the scoped OpenAPI file.
`build_runner` creates the Freezed and JSON serialization parts. The package's
handwritten REST client implements the documented HTTP routes; its generic
WebSocket method can send any Music Assistant command. The app has started using
the new package for server info and still uses `music_assistant` for the other
features during migration.

The refresh script copies the app's selected schema roots and their referenced
schemas from the full spec. It also names the inline DSP filter union so the
generated filename stays within Windows path limits. The app references this
package through a local path dependency while the client is being developed.
