// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_media_item_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantMediaItemMetadata _$MusicAssistantMediaItemMetadataFromJson(
  Map<String, dynamic> json,
) => _MusicAssistantMediaItemMetadata(
  description: json['description'] as String?,
  descriptionLanguage: json['description_language'] as String?,
  lifeSpan: json['life_span'] == null
      ? null
      : MusicAssistantLifeSpan.fromJson(
          json['life_span'] as Map<String, dynamic>,
        ),
  artistEntityType: json['artist_entity_type'] == null
      ? null
      : MusicAssistantArtistEntityType.fromJson(
          json['artist_entity_type'] as String,
        ),
  review: json['review'] as String?,
  explicit: json['explicit'] as bool?,
  images: (json['images'] as List<dynamic>?)
      ?.map(
        (e) => MusicAssistantMediaItemImage.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  grouping: json['grouping'] as String?,
  genres: (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
  mood: json['mood'] as String?,
  style: json['style'] as String?,
  copyright: json['copyright'] as String?,
  lyrics: json['lyrics'] as String?,
  lrcLyrics: json['lrc_lyrics'] as String?,
  transcript: json['transcript'] as String?,
  transcriptCues: (json['transcript_cues'] as List<dynamic>?)
      ?.map(
        (e) => MusicAssistantMediaItemTranscriptCue.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList(),
  hasTranscript: json['has_transcript'] as bool?,
  label: json['label'] as String?,
  links: (json['links'] as List<dynamic>?)
      ?.map(
        (e) => MusicAssistantMediaItemLink.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  performers: (json['performers'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  preview: json['preview'] as String?,
  popularity: (json['popularity'] as num?)?.toInt(),
  releaseDate: json['release_date'] == null
      ? null
      : DateTime.parse(json['release_date'] as String),
  languages: (json['languages'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  chapters: (json['chapters'] as List<dynamic>?)
      ?.map(
        (e) =>
            MusicAssistantMediaItemChapter.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  collections: (json['collections'] as List<dynamic>?)
      ?.map(
        (e) => MusicAssistantMediaItemCollection.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList(),
  lastRefresh: (json['last_refresh'] as num?)?.toInt(),
);

Map<String, dynamic> _$MusicAssistantMediaItemMetadataToJson(
  _MusicAssistantMediaItemMetadata instance,
) => <String, dynamic>{
  'description': instance.description,
  'description_language': instance.descriptionLanguage,
  'life_span': instance.lifeSpan?.toJson(),
  'artist_entity_type': instance.artistEntityType?.toJson(),
  'review': instance.review,
  'explicit': instance.explicit,
  'images': instance.images?.map((e) => e.toJson()).toList(),
  'grouping': instance.grouping,
  'genres': instance.genres,
  'mood': instance.mood,
  'style': instance.style,
  'copyright': instance.copyright,
  'lyrics': instance.lyrics,
  'lrc_lyrics': instance.lrcLyrics,
  'transcript': instance.transcript,
  'transcript_cues': instance.transcriptCues?.map((e) => e.toJson()).toList(),
  'has_transcript': instance.hasTranscript,
  'label': instance.label,
  'links': instance.links?.map((e) => e.toJson()).toList(),
  'performers': instance.performers,
  'preview': instance.preview,
  'popularity': instance.popularity,
  'release_date': instance.releaseDate?.toIso8601String(),
  'languages': instance.languages,
  'chapters': instance.chapters?.map((e) => e.toJson()).toList(),
  'collections': instance.collections?.map((e) => e.toJson()).toList(),
  'last_refresh': instance.lastRefresh,
};
