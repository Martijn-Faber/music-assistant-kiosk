/// ArtistEntityType
///
/// ```json
/// {
///     "type": "string",
///     "enum": [
///         "person",
///         "group",
///         "orchestra",
///         "choir",
///         "character",
///         "other",
///         "unknown"
///     ],
///     "description": "Enum: ArtistEntityType. Possible values: person, group, orchestra, choir, character, other, unknown"
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_artist_entity_type.g.dart';

@JsonEnum(alwaysCreate: true)
enum MusicAssistantArtistEntityType {
  @JsonValue('person')
  person,
  @JsonValue('group')
  group,
  @JsonValue('orchestra')
  orchestra,
  @JsonValue('choir')
  choir,
  @JsonValue('character')
  character,
  @JsonValue('other')
  other,
  @JsonValue('unknown')
  unknown;

  factory MusicAssistantArtistEntityType.fromJson(String json) =>
      MusicAssistantArtistEntityType.values.firstWhere(
        (e) => e.toJson() == json,
        orElse: () => MusicAssistantArtistEntityType.unknown,
      );

  String toJson() => _$MusicAssistantArtistEntityTypeEnumMap[this]!;
}
