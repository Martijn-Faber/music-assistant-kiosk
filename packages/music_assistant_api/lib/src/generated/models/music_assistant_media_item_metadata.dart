/// MediaItemMetadata
///
/// ```json
/// {
///     "properties": {
///         "description": {
///             "type": "string",
///             "nullable": true
///         },
///         "description_language": {
///             "type": "string",
///             "nullable": true
///         },
///         "life_span": {
///             "$ref": "#/components/schemas/LifeSpan",
///             "nullable": true
///         },
///         "artist_entity_type": {
///             "$ref": "#/components/schemas/ArtistEntityType",
///             "nullable": true
///         },
///         "review": {
///             "type": "string",
///             "nullable": true
///         },
///         "explicit": {
///             "type": "boolean",
///             "nullable": true
///         },
///         "images": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/MediaItemImage"
///             },
///             "nullable": true
///         },
///         "grouping": {
///             "type": "string",
///             "nullable": true
///         },
///         "genres": {
///             "type": "array",
///             "items": {
///                 "type": "string"
///             },
///             "nullable": true
///         },
///         "mood": {
///             "type": "string",
///             "nullable": true
///         },
///         "style": {
///             "type": "string",
///             "nullable": true
///         },
///         "copyright": {
///             "type": "string",
///             "nullable": true
///         },
///         "lyrics": {
///             "type": "string",
///             "nullable": true
///         },
///         "lrc_lyrics": {
///             "type": "string",
///             "nullable": true
///         },
///         "transcript": {
///             "type": "string",
///             "nullable": true
///         },
///         "transcript_cues": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/MediaItemTranscriptCue"
///             },
///             "nullable": true
///         },
///         "has_transcript": {
///             "type": "boolean",
///             "nullable": true
///         },
///         "label": {
///             "type": "string",
///             "nullable": true
///         },
///         "links": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/MediaItemLink"
///             },
///             "nullable": true
///         },
///         "performers": {
///             "type": "array",
///             "items": {
///                 "type": "string"
///             },
///             "nullable": true
///         },
///         "preview": {
///             "type": "string",
///             "nullable": true
///         },
///         "popularity": {
///             "type": "integer",
///             "nullable": true
///         },
///         "release_date": {
///             "type": "string",
///             "format": "date-time",
///             "nullable": true
///         },
///         "languages": {
///             "type": "array",
///             "items": {
///                 "type": "string"
///             },
///             "nullable": true
///         },
///         "chapters": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/MediaItemChapter"
///             },
///             "nullable": true
///         },
///         "collections": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/MediaItemCollection"
///             },
///             "nullable": true
///         },
///         "last_refresh": {
///             "type": "integer",
///             "nullable": true
///         }
///     },
///     "type": "object"
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_media_item_metadata.freezed.dart';
part 'music_assistant_media_item_metadata.g.dart';

@freezed
abstract class MusicAssistantMediaItemMetadata
    with _$MusicAssistantMediaItemMetadata {
  const MusicAssistantMediaItemMetadata._();

  @jsonSerializable
  const factory MusicAssistantMediaItemMetadata({
    /// description
    @JsonKey(name: MusicAssistantMediaItemMetadata.descriptionKey_)
    String? description,

    /// descriptionLanguage
    @JsonKey(name: MusicAssistantMediaItemMetadata.descriptionLanguageKey_)
    String? descriptionLanguage,

    /// lifeSpan
    @JsonKey(name: MusicAssistantMediaItemMetadata.lifeSpanKey_)
    MusicAssistantLifeSpan? lifeSpan,

    /// artistEntityType
    @JsonKey(name: MusicAssistantMediaItemMetadata.artistEntityTypeKey_)
    MusicAssistantArtistEntityType? artistEntityType,

    /// review
    @JsonKey(name: MusicAssistantMediaItemMetadata.reviewKey_) String? review,

    /// explicit
    @JsonKey(name: MusicAssistantMediaItemMetadata.explicitKey_) bool? explicit,

    /// images
    @JsonKey(name: MusicAssistantMediaItemMetadata.imagesKey_)
    List<MusicAssistantMediaItemImage>? images,

    /// grouping
    @JsonKey(name: MusicAssistantMediaItemMetadata.groupingKey_)
    String? grouping,

    /// genres
    @JsonKey(name: MusicAssistantMediaItemMetadata.genresKey_)
    List<String>? genres,

    /// mood
    @JsonKey(name: MusicAssistantMediaItemMetadata.moodKey_) String? mood,

    /// style
    @JsonKey(name: MusicAssistantMediaItemMetadata.styleKey_) String? style,

    /// copyright
    @JsonKey(name: MusicAssistantMediaItemMetadata.copyrightKey_)
    String? copyright,

    /// lyrics
    @JsonKey(name: MusicAssistantMediaItemMetadata.lyricsKey_) String? lyrics,

    /// lrcLyrics
    @JsonKey(name: MusicAssistantMediaItemMetadata.lrcLyricsKey_)
    String? lrcLyrics,

    /// transcript
    @JsonKey(name: MusicAssistantMediaItemMetadata.transcriptKey_)
    String? transcript,

    /// transcriptCues
    @JsonKey(name: MusicAssistantMediaItemMetadata.transcriptCuesKey_)
    List<MusicAssistantMediaItemTranscriptCue>? transcriptCues,

    /// hasTranscript
    @JsonKey(name: MusicAssistantMediaItemMetadata.hasTranscriptKey_)
    bool? hasTranscript,

    /// label
    @JsonKey(name: MusicAssistantMediaItemMetadata.labelKey_) String? label,

    /// links
    @JsonKey(name: MusicAssistantMediaItemMetadata.linksKey_)
    List<MusicAssistantMediaItemLink>? links,

    /// performers
    @JsonKey(name: MusicAssistantMediaItemMetadata.performersKey_)
    List<String>? performers,

    /// preview
    @JsonKey(name: MusicAssistantMediaItemMetadata.previewKey_) String? preview,

    /// popularity
    @JsonKey(name: MusicAssistantMediaItemMetadata.popularityKey_)
    int? popularity,

    /// releaseDate
    @JsonKey(name: MusicAssistantMediaItemMetadata.releaseDateKey_)
    DateTime? releaseDate,

    /// languages
    @JsonKey(name: MusicAssistantMediaItemMetadata.languagesKey_)
    List<String>? languages,

    /// chapters
    @JsonKey(name: MusicAssistantMediaItemMetadata.chaptersKey_)
    List<MusicAssistantMediaItemChapter>? chapters,

    /// collections
    @JsonKey(name: MusicAssistantMediaItemMetadata.collectionsKey_)
    List<MusicAssistantMediaItemCollection>? collections,

    /// lastRefresh
    @JsonKey(name: MusicAssistantMediaItemMetadata.lastRefreshKey_)
    int? lastRefresh,
  }) = _MusicAssistantMediaItemMetadata;

  factory MusicAssistantMediaItemMetadata.fromJson(Map<String, dynamic> json) =>
      _$MusicAssistantMediaItemMetadataFromJson(json);

  static const String descriptionKey_ = 'description';

  static const String descriptionLanguageKey_ = 'description_language';

  static const String lifeSpanKey_ = 'life_span';

  static const String artistEntityTypeKey_ = 'artist_entity_type';

  static const String reviewKey_ = 'review';

  static const String explicitKey_ = 'explicit';

  static const String imagesKey_ = 'images';

  static const String groupingKey_ = 'grouping';

  static const String genresKey_ = 'genres';

  static const String moodKey_ = 'mood';

  static const String styleKey_ = 'style';

  static const String copyrightKey_ = 'copyright';

  static const String lyricsKey_ = 'lyrics';

  static const String lrcLyricsKey_ = 'lrc_lyrics';

  static const String transcriptKey_ = 'transcript';

  static const String transcriptCuesKey_ = 'transcript_cues';

  static const String hasTranscriptKey_ = 'has_transcript';

  static const String labelKey_ = 'label';

  static const String linksKey_ = 'links';

  static const String performersKey_ = 'performers';

  static const String previewKey_ = 'preview';

  static const String popularityKey_ = 'popularity';

  static const String releaseDateKey_ = 'release_date';

  static const String languagesKey_ = 'languages';

  static const String chaptersKey_ = 'chapters';

  static const String collectionsKey_ = 'collections';

  static const String lastRefreshKey_ = 'last_refresh';
}
