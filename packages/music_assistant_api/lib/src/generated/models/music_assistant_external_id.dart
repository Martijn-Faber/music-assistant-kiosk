/// ExternalID
///
/// ```json
/// {
///     "type": "string",
///     "enum": [
///         "musicbrainz_artistid",
///         "musicbrainz_albumid",
///         "musicbrainz_releasegroupid",
///         "musicbrainz_trackid",
///         "musicbrainz_recordingid",
///         "isrc",
///         "barcode",
///         "acoustid",
///         "asin",
///         "discogs",
///         "tadb",
///         "unknown"
///     ],
///     "description": "Enum: ExternalID. Possible values: musicbrainz_artistid, musicbrainz_albumid, musicbrainz_releasegroupid, musicbrainz_trackid, musicbrainz_recordingid, isrc, barcode, acoustid, asin, discogs, tadb, unknown"
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_external_id.g.dart';

@JsonEnum(alwaysCreate: true)
enum MusicAssistantExternalID {
  @JsonValue('musicbrainz_artistid')
  musicbrainzArtistid,
  @JsonValue('musicbrainz_albumid')
  musicbrainzAlbumid,
  @JsonValue('musicbrainz_releasegroupid')
  musicbrainzReleasegroupid,
  @JsonValue('musicbrainz_trackid')
  musicbrainzTrackid,
  @JsonValue('musicbrainz_recordingid')
  musicbrainzRecordingid,
  @JsonValue('isrc')
  isrc,
  @JsonValue('barcode')
  barcode,
  @JsonValue('acoustid')
  acoustid,
  @JsonValue('asin')
  asin,
  @JsonValue('discogs')
  discogs,
  @JsonValue('tadb')
  tadb,
  @JsonValue('unknown')
  unknown;

  factory MusicAssistantExternalID.fromJson(String json) =>
      MusicAssistantExternalID.values.firstWhere(
        (e) => e.toJson() == json,
        orElse: () => MusicAssistantExternalID.unknown,
      );

  String toJson() => _$MusicAssistantExternalIDEnumMap[this]!;
}
