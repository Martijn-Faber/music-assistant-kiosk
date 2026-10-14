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

The WebSocket client includes typed wrappers for the `players/all` and
`players/get` commands:

```dart
final players = await client.getPlayers();
final player = await client.getPlayer('player-id');
```
