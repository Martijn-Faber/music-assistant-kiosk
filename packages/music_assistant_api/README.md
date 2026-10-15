# music_assistant_api

Pure Dart Music Assistant API package, currently developed as a local package
inside the kiosk app repository.

The first implementation layer provides the OpenAPI HTTP routes (`/info`,
`/auth/providers`, `/auth/login`, `/setup`, and `/api`) plus an authenticated
WebSocket connection, request/response correlation, server events, and a generic
`sendCommand` method. The command methods accept any command exposed by a
Music Assistant server, including commands added by providers. Typed helpers
will be added in groups as the app migrates from the existing
`music_assistant` dependency.

The generated models are based on the scoped OpenAPI schema in `api/`.
Generation instructions are in the app's `docs/API_CODE_GENERATION.md`.

The kiosk app still uses its existing client during this transition. The new
package is added as a local path dependency so the old and new clients can be
compared while features move across.

The client exposes namespaced resources for player and music-library commands:

```dart
final players = await client.players.all();
final player = await client.players.get('player-id');
final radios = await client.music.radios.libraryItems();
final playlists = await client.music.playlists.libraryItems();
```

Library results preserve the server's array shape. Each entry is either a
typed radio or playlist item, or a `MusicAssistantLibraryCollection` that
contains the generated `MusicAssistantMediaCollection` DTO and typed child
items.
