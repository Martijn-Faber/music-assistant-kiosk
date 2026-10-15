/// AlbumType
///
/// ```json
/// {
///     "type": "string",
///     "enum": [
///         "album",
///         "single",
///         "live",
///         "soundtrack",
///         "compilation",
///         "ep",
///         "unknown"
///     ],
///     "description": "Enum: AlbumType. Possible values: album, single, live, soundtrack, compilation, ep, unknown"
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_album_type.g.dart';

@JsonEnum(alwaysCreate: true)
enum MusicAssistantAlbumType {
  @JsonValue('album')
  album,
  @JsonValue('single')
  single,
  @JsonValue('live')
  live,
  @JsonValue('soundtrack')
  soundtrack,
  @JsonValue('compilation')
  compilation,
  @JsonValue('ep')
  ep,
  @JsonValue('unknown')
  unknown;

  factory MusicAssistantAlbumType.fromJson(String json) =>
      MusicAssistantAlbumType.values.firstWhere(
        (e) => e.toJson() == json,
        orElse: () => MusicAssistantAlbumType.unknown,
      );

  String toJson() => _$MusicAssistantAlbumTypeEnumMap[this]!;
}
