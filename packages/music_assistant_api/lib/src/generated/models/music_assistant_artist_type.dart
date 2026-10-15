/// ArtistType
///
/// ```json
/// {
///     "type": "string",
///     "enum": [
///         "singer",
///         "author",
///         "narrator",
///         "unknown"
///     ],
///     "description": "Enum: ArtistType. Possible values: singer, author, narrator, unknown"
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_artist_type.g.dart';

@JsonEnum(alwaysCreate: true)
enum MusicAssistantArtistType {
  @JsonValue('singer')
  singer,
  @JsonValue('author')
  author,
  @JsonValue('narrator')
  narrator,
  @JsonValue('unknown')
  unknown;

  factory MusicAssistantArtistType.fromJson(String json) =>
      MusicAssistantArtistType.values.firstWhere(
        (e) => e.toJson() == json,
        orElse: () => MusicAssistantArtistType.unknown,
      );

  String toJson() => _$MusicAssistantArtistTypeEnumMap[this]!;
}
