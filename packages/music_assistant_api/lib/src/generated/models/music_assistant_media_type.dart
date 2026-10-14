/// MediaType
///
/// ```json
/// {
///     "type": "string",
///     "enum": [
///         "artist",
///         "album",
///         "track",
///         "playlist",
///         "radio",
///         "audiobook",
///         "podcast",
///         "podcast_episode",
///         "folder",
///         "collection",
///         "announcement",
///         "flow_stream",
///         "plugin_source",
///         "audio_source",
///         "sound_effect",
///         "genre",
///         "unknown"
///     ],
///     "description": "Enum: MediaType. Possible values: artist, album, track, playlist, radio, audiobook, podcast, podcast_episode, folder, collection, announcement, flow_stream, plugin_source, audio_source, sound_effect, genre, unknown"
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_media_type.g.dart';

@JsonEnum(alwaysCreate: true)
enum MusicAssistantMediaType {
  @JsonValue('artist')
  artist,
  @JsonValue('album')
  album,
  @JsonValue('track')
  track,
  @JsonValue('playlist')
  playlist,
  @JsonValue('radio')
  radio,
  @JsonValue('audiobook')
  audiobook,
  @JsonValue('podcast')
  podcast,
  @JsonValue('podcast_episode')
  podcastEpisode,
  @JsonValue('folder')
  folder,
  @JsonValue('collection')
  collection,
  @JsonValue('announcement')
  announcement,
  @JsonValue('flow_stream')
  flowStream,
  @JsonValue('plugin_source')
  pluginSource,
  @JsonValue('audio_source')
  audioSource,
  @JsonValue('sound_effect')
  soundEffect,
  @JsonValue('genre')
  genre,
  @JsonValue('unknown')
  unknown;

  factory MusicAssistantMediaType.fromJson(String json) =>
      MusicAssistantMediaType.values.firstWhere(
        (e) => e.toJson() == json,
        orElse: () => MusicAssistantMediaType.unknown,
      );

  String toJson() => _$MusicAssistantMediaTypeEnumMap[this]!;
}
