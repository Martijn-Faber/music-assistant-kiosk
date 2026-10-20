# Player grouping and playback routing

This note describes how the kiosk handles Music Assistant groups when the
selected player is changed or playback is started.

## Add a speaker to the selected group

The speaker and volume dialog lists players Music Assistant says can join the
selected player. Group players (`type: group`) are excluded, so a group cannot
be added to another group. When a speaker is added, the local
`music_assistant_api` SDK sends:

```json
{
  "command": "players/cmd/group_many",
  "args": {
    "target_player": "<group player id>",
    "child_player_ids": ["<speaker player id>"]
  }
}
```

The Sync Group must allow dynamic members for Music Assistant to accept changes
to its active membership. The app displays the server error if the command
fails.

## Start playback on the selected player

The idle screen passes the selected player ID from Settings to the repository.
Before starting content, the repository reads the current player using the
local SDK's `players/get` command.

- For an individual player (`type: player`), if it is synced to another player
  (`synced_to` is set) or has multiple group members, the local SDK sends
  `players/cmd/ungroup` with `player_id` set to that individual player.
- Playback for an individual player targets a queue whose ID is that player's
  own player ID. This avoids resolving the active queue to the group it just
  left.
- For a group player, the repository resolves its active queue and starts
  playback on that queue, preserving group playback.

The queue operations used to play radio, playlists, recent media, or a selected
queue item are currently provided by the app's existing `music_assistant`
client. The local `music_assistant_api` SDK provides the player lookup,
`group_many`, and `ungroupPlayer` commands. This is part of the ongoing SDK
migration.

Relevant code:

- `packages/music_assistant_api/lib/src/music_assistant_client.dart` — SDK
  player grouping commands.
- `lib/features/player/data/music_assistant_repository.dart` — player
  selection routing and playback queue selection.
- `lib/features/player/viewmodels/player_volume_dialog_view_model.dart` —
  compatible speaker filtering for the add-to-group action.
