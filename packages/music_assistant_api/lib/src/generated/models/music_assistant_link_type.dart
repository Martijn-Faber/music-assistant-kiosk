/// LinkType
///
/// ```json
/// {
///     "type": "string",
///     "enum": [
///         "website",
///         "facebook",
///         "twitter",
///         "lastfm",
///         "youtube",
///         "instagram",
///         "snapchat",
///         "tiktok",
///         "discogs",
///         "wikipedia",
///         "allmusic",
///         "unknown"
///     ],
///     "description": "Enum: LinkType. Possible values: website, facebook, twitter, lastfm, youtube, instagram, snapchat, tiktok, discogs, wikipedia, allmusic, unknown"
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_link_type.g.dart';

@JsonEnum(alwaysCreate: true)
enum MusicAssistantLinkType {
  @JsonValue('website')
  website,
  @JsonValue('facebook')
  facebook,
  @JsonValue('twitter')
  twitter,
  @JsonValue('lastfm')
  lastfm,
  @JsonValue('youtube')
  youtube,
  @JsonValue('instagram')
  instagram,
  @JsonValue('snapchat')
  snapchat,
  @JsonValue('tiktok')
  tiktok,
  @JsonValue('discogs')
  discogs,
  @JsonValue('wikipedia')
  wikipedia,
  @JsonValue('allmusic')
  allmusic,
  @JsonValue('unknown')
  unknown;

  factory MusicAssistantLinkType.fromJson(String json) =>
      MusicAssistantLinkType.values.firstWhere(
        (e) => e.toJson() == json,
        orElse: () => MusicAssistantLinkType.unknown,
      );

  String toJson() => _$MusicAssistantLinkTypeEnumMap[this]!;
}
