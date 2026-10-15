/// Track
///
/// ```json
/// {
///     "properties": {
///         "item_id": {
///             "type": "string"
///         },
///         "provider": {
///             "type": "string"
///         },
///         "name": {
///             "type": "string"
///         },
///         "version": {
///             "type": "string",
///             "default": ""
///         },
///         "sort_name": {
///             "type": "string",
///             "nullable": true
///         },
///         "uri": {
///             "type": "string",
///             "nullable": true
///         },
///         "external_ids": {
///             "type": "array",
///             "items": {
///                 "type": "array",
///                 "items": {
///                     "$ref": "#/components/schemas/ExternalID"
///                 }
///             }
///         },
///         "is_playable": {
///             "type": "boolean",
///             "default": true
///         },
///         "media_type": {
///             "$ref": "#/components/schemas/MediaType",
///             "default": "track"
///         },
///         "provider_mappings": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/ProviderMapping"
///             }
///         },
///         "metadata": {
///             "$ref": "#/components/schemas/MediaItemMetadata"
///         },
///         "favorite": {
///             "type": "boolean",
///             "default": false
///         },
///         "position": {
///             "type": "integer",
///             "nullable": true
///         },
///         "date_added": {
///             "type": "string",
///             "format": "date-time",
///             "nullable": true
///         },
///         "duration": {
///             "type": "integer",
///             "default": 0
///         },
///         "artists": {
///             "type": "array",
///             "items": {
///                 "oneOf": [
///                     {
///                         "$ref": "#/components/schemas/Artist"
///                     },
///                     {
///                         "$ref": "#/components/schemas/ItemMapping"
///                     }
///                 ]
///             }
///         },
///         "last_played": {
///             "type": "integer",
///             "default": 0
///         },
///         "album": {
///             "$ref": "#/components/schemas/Album",
///             "nullable": true
///         },
///         "disc_number": {
///             "type": "integer",
///             "default": 0
///         },
///         "track_number": {
///             "type": "integer",
///             "default": 0
///         },
///         "audio_metadata": {
///             "$ref": "#/components/schemas/AudioMetadata",
///             "nullable": true
///         }
///     },
///     "type": "object",
///     "required": [
///         "item_id",
///         "provider",
///         "name",
///         "provider_mappings"
///     ]
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_track.freezed.dart';
part 'music_assistant_track.g.dart';

@freezed
abstract class MusicAssistantTrack with _$MusicAssistantTrack {
  const MusicAssistantTrack._();

  @jsonSerializable
  const factory MusicAssistantTrack({
    /// itemId
    @JsonKey(name: MusicAssistantTrack.itemIdKey_) required String itemId,

    /// provider
    @JsonKey(name: MusicAssistantTrack.providerKey_) required String provider,

    /// name
    @JsonKey(name: MusicAssistantTrack.nameKey_) required String name,

    /// version
    @Default('') @JsonKey(name: MusicAssistantTrack.versionKey_) String version,

    /// sortName
    @JsonKey(name: MusicAssistantTrack.sortNameKey_) String? sortName,

    /// uri
    @JsonKey(name: MusicAssistantTrack.uriKey_) String? uri,

    /// externalIds
    @JsonKey(name: MusicAssistantTrack.externalIdsKey_)
    List<List<MusicAssistantExternalID>>? externalIds,

    /// isPlayable
    @Default(true)
    @JsonKey(name: MusicAssistantTrack.isPlayableKey_)
    bool isPlayable,

    /// mediaType
    @Default(MusicAssistantMediaType.track)
    @JsonKey(name: MusicAssistantTrack.mediaTypeKey_)
    MusicAssistantMediaType mediaType,

    /// providerMappings
    @JsonKey(name: MusicAssistantTrack.providerMappingsKey_)
    required List<MusicAssistantProviderMapping> providerMappings,

    /// metadata
    @JsonKey(name: MusicAssistantTrack.metadataKey_)
    MusicAssistantMediaItemMetadata? metadata,

    /// favorite
    @Default(false)
    @JsonKey(name: MusicAssistantTrack.favoriteKey_)
    bool favorite,

    /// position
    @JsonKey(name: MusicAssistantTrack.positionKey_) int? position,

    /// dateAdded
    @JsonKey(name: MusicAssistantTrack.dateAddedKey_) DateTime? dateAdded,

    /// duration
    @Default(0) @JsonKey(name: MusicAssistantTrack.durationKey_) int duration,

    /// artists
    @JsonKey(name: MusicAssistantTrack.artistsKey_)
    List<MusicAssistantArtistOrItemMappingUnion>? artists,

    /// lastPlayed
    @Default(0)
    @JsonKey(name: MusicAssistantTrack.lastPlayedKey_)
    int lastPlayed,

    /// album
    @JsonKey(name: MusicAssistantTrack.albumKey_) MusicAssistantAlbum? album,

    /// discNumber
    @Default(0)
    @JsonKey(name: MusicAssistantTrack.discNumberKey_)
    int discNumber,

    /// trackNumber
    @Default(0)
    @JsonKey(name: MusicAssistantTrack.trackNumberKey_)
    int trackNumber,

    /// audioMetadata
    @JsonKey(name: MusicAssistantTrack.audioMetadataKey_)
    MusicAssistantAudioMetadata? audioMetadata,
  }) = _MusicAssistantTrack;

  factory MusicAssistantTrack.fromJson(Map<String, dynamic> json) =>
      _$MusicAssistantTrackFromJson(json);

  static const String itemIdKey_ = 'item_id';

  static const String providerKey_ = 'provider';

  static const String nameKey_ = 'name';

  static const String versionKey_ = 'version';

  static const String sortNameKey_ = 'sort_name';

  static const String uriKey_ = 'uri';

  static const String externalIdsKey_ = 'external_ids';

  static const String isPlayableKey_ = 'is_playable';

  static const String mediaTypeKey_ = 'media_type';

  static const String providerMappingsKey_ = 'provider_mappings';

  static const String metadataKey_ = 'metadata';

  static const String favoriteKey_ = 'favorite';

  static const String positionKey_ = 'position';

  static const String dateAddedKey_ = 'date_added';

  static const String durationKey_ = 'duration';

  static const String artistsKey_ = 'artists';

  static const String lastPlayedKey_ = 'last_played';

  static const String albumKey_ = 'album';

  static const String discNumberKey_ = 'disc_number';

  static const String trackNumberKey_ = 'track_number';

  static const String audioMetadataKey_ = 'audio_metadata';
}
