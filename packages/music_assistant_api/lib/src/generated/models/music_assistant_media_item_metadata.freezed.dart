// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_media_item_metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantMediaItemMetadata {

/// description
@JsonKey(name: MusicAssistantMediaItemMetadata.descriptionKey_) String? get description;/// descriptionLanguage
@JsonKey(name: MusicAssistantMediaItemMetadata.descriptionLanguageKey_) String? get descriptionLanguage;/// lifeSpan
@JsonKey(name: MusicAssistantMediaItemMetadata.lifeSpanKey_) MusicAssistantLifeSpan? get lifeSpan;/// artistEntityType
@JsonKey(name: MusicAssistantMediaItemMetadata.artistEntityTypeKey_) MusicAssistantArtistEntityType? get artistEntityType;/// review
@JsonKey(name: MusicAssistantMediaItemMetadata.reviewKey_) String? get review;/// explicit
@JsonKey(name: MusicAssistantMediaItemMetadata.explicitKey_) bool? get explicit;/// images
@JsonKey(name: MusicAssistantMediaItemMetadata.imagesKey_) List<MusicAssistantMediaItemImage>? get images;/// grouping
@JsonKey(name: MusicAssistantMediaItemMetadata.groupingKey_) String? get grouping;/// genres
@JsonKey(name: MusicAssistantMediaItemMetadata.genresKey_) List<String>? get genres;/// mood
@JsonKey(name: MusicAssistantMediaItemMetadata.moodKey_) String? get mood;/// style
@JsonKey(name: MusicAssistantMediaItemMetadata.styleKey_) String? get style;/// copyright
@JsonKey(name: MusicAssistantMediaItemMetadata.copyrightKey_) String? get copyright;/// lyrics
@JsonKey(name: MusicAssistantMediaItemMetadata.lyricsKey_) String? get lyrics;/// lrcLyrics
@JsonKey(name: MusicAssistantMediaItemMetadata.lrcLyricsKey_) String? get lrcLyrics;/// transcript
@JsonKey(name: MusicAssistantMediaItemMetadata.transcriptKey_) String? get transcript;/// transcriptCues
@JsonKey(name: MusicAssistantMediaItemMetadata.transcriptCuesKey_) List<MusicAssistantMediaItemTranscriptCue>? get transcriptCues;/// hasTranscript
@JsonKey(name: MusicAssistantMediaItemMetadata.hasTranscriptKey_) bool? get hasTranscript;/// label
@JsonKey(name: MusicAssistantMediaItemMetadata.labelKey_) String? get label;/// links
@JsonKey(name: MusicAssistantMediaItemMetadata.linksKey_) List<MusicAssistantMediaItemLink>? get links;/// performers
@JsonKey(name: MusicAssistantMediaItemMetadata.performersKey_) List<String>? get performers;/// preview
@JsonKey(name: MusicAssistantMediaItemMetadata.previewKey_) String? get preview;/// popularity
@JsonKey(name: MusicAssistantMediaItemMetadata.popularityKey_) int? get popularity;/// releaseDate
@JsonKey(name: MusicAssistantMediaItemMetadata.releaseDateKey_) DateTime? get releaseDate;/// languages
@JsonKey(name: MusicAssistantMediaItemMetadata.languagesKey_) List<String>? get languages;/// chapters
@JsonKey(name: MusicAssistantMediaItemMetadata.chaptersKey_) List<MusicAssistantMediaItemChapter>? get chapters;/// collections
@JsonKey(name: MusicAssistantMediaItemMetadata.collectionsKey_) List<MusicAssistantMediaItemCollection>? get collections;/// lastRefresh
@JsonKey(name: MusicAssistantMediaItemMetadata.lastRefreshKey_) int? get lastRefresh;
/// Create a copy of MusicAssistantMediaItemMetadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantMediaItemMetadataCopyWith<MusicAssistantMediaItemMetadata> get copyWith => _$MusicAssistantMediaItemMetadataCopyWithImpl<MusicAssistantMediaItemMetadata>(this as MusicAssistantMediaItemMetadata, _$identity);

  /// Serializes this MusicAssistantMediaItemMetadata to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantMediaItemMetadata&&(identical(other.description, description) || other.description == description)&&(identical(other.descriptionLanguage, descriptionLanguage) || other.descriptionLanguage == descriptionLanguage)&&(identical(other.lifeSpan, lifeSpan) || other.lifeSpan == lifeSpan)&&(identical(other.artistEntityType, artistEntityType) || other.artistEntityType == artistEntityType)&&(identical(other.review, review) || other.review == review)&&(identical(other.explicit, explicit) || other.explicit == explicit)&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.grouping, grouping) || other.grouping == grouping)&&const DeepCollectionEquality().equals(other.genres, genres)&&(identical(other.mood, mood) || other.mood == mood)&&(identical(other.style, style) || other.style == style)&&(identical(other.copyright, copyright) || other.copyright == copyright)&&(identical(other.lyrics, lyrics) || other.lyrics == lyrics)&&(identical(other.lrcLyrics, lrcLyrics) || other.lrcLyrics == lrcLyrics)&&(identical(other.transcript, transcript) || other.transcript == transcript)&&const DeepCollectionEquality().equals(other.transcriptCues, transcriptCues)&&(identical(other.hasTranscript, hasTranscript) || other.hasTranscript == hasTranscript)&&(identical(other.label, label) || other.label == label)&&const DeepCollectionEquality().equals(other.links, links)&&const DeepCollectionEquality().equals(other.performers, performers)&&(identical(other.preview, preview) || other.preview == preview)&&(identical(other.popularity, popularity) || other.popularity == popularity)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&const DeepCollectionEquality().equals(other.languages, languages)&&const DeepCollectionEquality().equals(other.chapters, chapters)&&const DeepCollectionEquality().equals(other.collections, collections)&&(identical(other.lastRefresh, lastRefresh) || other.lastRefresh == lastRefresh));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,description,descriptionLanguage,lifeSpan,artistEntityType,review,explicit,const DeepCollectionEquality().hash(images),grouping,const DeepCollectionEquality().hash(genres),mood,style,copyright,lyrics,lrcLyrics,transcript,const DeepCollectionEquality().hash(transcriptCues),hasTranscript,label,const DeepCollectionEquality().hash(links),const DeepCollectionEquality().hash(performers),preview,popularity,releaseDate,const DeepCollectionEquality().hash(languages),const DeepCollectionEquality().hash(chapters),const DeepCollectionEquality().hash(collections),lastRefresh]);

@override
String toString() {
  return 'MusicAssistantMediaItemMetadata(description: $description, descriptionLanguage: $descriptionLanguage, lifeSpan: $lifeSpan, artistEntityType: $artistEntityType, review: $review, explicit: $explicit, images: $images, grouping: $grouping, genres: $genres, mood: $mood, style: $style, copyright: $copyright, lyrics: $lyrics, lrcLyrics: $lrcLyrics, transcript: $transcript, transcriptCues: $transcriptCues, hasTranscript: $hasTranscript, label: $label, links: $links, performers: $performers, preview: $preview, popularity: $popularity, releaseDate: $releaseDate, languages: $languages, chapters: $chapters, collections: $collections, lastRefresh: $lastRefresh)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantMediaItemMetadataCopyWith<$Res>  {
  factory $MusicAssistantMediaItemMetadataCopyWith(MusicAssistantMediaItemMetadata value, $Res Function(MusicAssistantMediaItemMetadata) _then) = _$MusicAssistantMediaItemMetadataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantMediaItemMetadata.descriptionKey_) String? description,@JsonKey(name: MusicAssistantMediaItemMetadata.descriptionLanguageKey_) String? descriptionLanguage,@JsonKey(name: MusicAssistantMediaItemMetadata.lifeSpanKey_) MusicAssistantLifeSpan? lifeSpan,@JsonKey(name: MusicAssistantMediaItemMetadata.artistEntityTypeKey_) MusicAssistantArtistEntityType? artistEntityType,@JsonKey(name: MusicAssistantMediaItemMetadata.reviewKey_) String? review,@JsonKey(name: MusicAssistantMediaItemMetadata.explicitKey_) bool? explicit,@JsonKey(name: MusicAssistantMediaItemMetadata.imagesKey_) List<MusicAssistantMediaItemImage>? images,@JsonKey(name: MusicAssistantMediaItemMetadata.groupingKey_) String? grouping,@JsonKey(name: MusicAssistantMediaItemMetadata.genresKey_) List<String>? genres,@JsonKey(name: MusicAssistantMediaItemMetadata.moodKey_) String? mood,@JsonKey(name: MusicAssistantMediaItemMetadata.styleKey_) String? style,@JsonKey(name: MusicAssistantMediaItemMetadata.copyrightKey_) String? copyright,@JsonKey(name: MusicAssistantMediaItemMetadata.lyricsKey_) String? lyrics,@JsonKey(name: MusicAssistantMediaItemMetadata.lrcLyricsKey_) String? lrcLyrics,@JsonKey(name: MusicAssistantMediaItemMetadata.transcriptKey_) String? transcript,@JsonKey(name: MusicAssistantMediaItemMetadata.transcriptCuesKey_) List<MusicAssistantMediaItemTranscriptCue>? transcriptCues,@JsonKey(name: MusicAssistantMediaItemMetadata.hasTranscriptKey_) bool? hasTranscript,@JsonKey(name: MusicAssistantMediaItemMetadata.labelKey_) String? label,@JsonKey(name: MusicAssistantMediaItemMetadata.linksKey_) List<MusicAssistantMediaItemLink>? links,@JsonKey(name: MusicAssistantMediaItemMetadata.performersKey_) List<String>? performers,@JsonKey(name: MusicAssistantMediaItemMetadata.previewKey_) String? preview,@JsonKey(name: MusicAssistantMediaItemMetadata.popularityKey_) int? popularity,@JsonKey(name: MusicAssistantMediaItemMetadata.releaseDateKey_) DateTime? releaseDate,@JsonKey(name: MusicAssistantMediaItemMetadata.languagesKey_) List<String>? languages,@JsonKey(name: MusicAssistantMediaItemMetadata.chaptersKey_) List<MusicAssistantMediaItemChapter>? chapters,@JsonKey(name: MusicAssistantMediaItemMetadata.collectionsKey_) List<MusicAssistantMediaItemCollection>? collections,@JsonKey(name: MusicAssistantMediaItemMetadata.lastRefreshKey_) int? lastRefresh
});


$MusicAssistantLifeSpanCopyWith<$Res>? get lifeSpan;

}
/// @nodoc
class _$MusicAssistantMediaItemMetadataCopyWithImpl<$Res>
    implements $MusicAssistantMediaItemMetadataCopyWith<$Res> {
  _$MusicAssistantMediaItemMetadataCopyWithImpl(this._self, this._then);

  final MusicAssistantMediaItemMetadata _self;
  final $Res Function(MusicAssistantMediaItemMetadata) _then;

/// Create a copy of MusicAssistantMediaItemMetadata
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? description = freezed,Object? descriptionLanguage = freezed,Object? lifeSpan = freezed,Object? artistEntityType = freezed,Object? review = freezed,Object? explicit = freezed,Object? images = freezed,Object? grouping = freezed,Object? genres = freezed,Object? mood = freezed,Object? style = freezed,Object? copyright = freezed,Object? lyrics = freezed,Object? lrcLyrics = freezed,Object? transcript = freezed,Object? transcriptCues = freezed,Object? hasTranscript = freezed,Object? label = freezed,Object? links = freezed,Object? performers = freezed,Object? preview = freezed,Object? popularity = freezed,Object? releaseDate = freezed,Object? languages = freezed,Object? chapters = freezed,Object? collections = freezed,Object? lastRefresh = freezed,}) {
  return _then(_self.copyWith(
description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,descriptionLanguage: freezed == descriptionLanguage ? _self.descriptionLanguage : descriptionLanguage // ignore: cast_nullable_to_non_nullable
as String?,lifeSpan: freezed == lifeSpan ? _self.lifeSpan : lifeSpan // ignore: cast_nullable_to_non_nullable
as MusicAssistantLifeSpan?,artistEntityType: freezed == artistEntityType ? _self.artistEntityType : artistEntityType // ignore: cast_nullable_to_non_nullable
as MusicAssistantArtistEntityType?,review: freezed == review ? _self.review : review // ignore: cast_nullable_to_non_nullable
as String?,explicit: freezed == explicit ? _self.explicit : explicit // ignore: cast_nullable_to_non_nullable
as bool?,images: freezed == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<MusicAssistantMediaItemImage>?,grouping: freezed == grouping ? _self.grouping : grouping // ignore: cast_nullable_to_non_nullable
as String?,genres: freezed == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as List<String>?,mood: freezed == mood ? _self.mood : mood // ignore: cast_nullable_to_non_nullable
as String?,style: freezed == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as String?,copyright: freezed == copyright ? _self.copyright : copyright // ignore: cast_nullable_to_non_nullable
as String?,lyrics: freezed == lyrics ? _self.lyrics : lyrics // ignore: cast_nullable_to_non_nullable
as String?,lrcLyrics: freezed == lrcLyrics ? _self.lrcLyrics : lrcLyrics // ignore: cast_nullable_to_non_nullable
as String?,transcript: freezed == transcript ? _self.transcript : transcript // ignore: cast_nullable_to_non_nullable
as String?,transcriptCues: freezed == transcriptCues ? _self.transcriptCues : transcriptCues // ignore: cast_nullable_to_non_nullable
as List<MusicAssistantMediaItemTranscriptCue>?,hasTranscript: freezed == hasTranscript ? _self.hasTranscript : hasTranscript // ignore: cast_nullable_to_non_nullable
as bool?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,links: freezed == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as List<MusicAssistantMediaItemLink>?,performers: freezed == performers ? _self.performers : performers // ignore: cast_nullable_to_non_nullable
as List<String>?,preview: freezed == preview ? _self.preview : preview // ignore: cast_nullable_to_non_nullable
as String?,popularity: freezed == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as int?,releaseDate: freezed == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as DateTime?,languages: freezed == languages ? _self.languages : languages // ignore: cast_nullable_to_non_nullable
as List<String>?,chapters: freezed == chapters ? _self.chapters : chapters // ignore: cast_nullable_to_non_nullable
as List<MusicAssistantMediaItemChapter>?,collections: freezed == collections ? _self.collections : collections // ignore: cast_nullable_to_non_nullable
as List<MusicAssistantMediaItemCollection>?,lastRefresh: freezed == lastRefresh ? _self.lastRefresh : lastRefresh // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of MusicAssistantMediaItemMetadata
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantLifeSpanCopyWith<$Res>? get lifeSpan {
    if (_self.lifeSpan == null) {
    return null;
  }

  return $MusicAssistantLifeSpanCopyWith<$Res>(_self.lifeSpan!, (value) {
    return _then(_self.copyWith(lifeSpan: value));
  });
}
}


/// Adds pattern-matching-related methods to [MusicAssistantMediaItemMetadata].
extension MusicAssistantMediaItemMetadataPatterns on MusicAssistantMediaItemMetadata {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantMediaItemMetadata value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantMediaItemMetadata() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantMediaItemMetadata value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantMediaItemMetadata():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantMediaItemMetadata value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantMediaItemMetadata() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantMediaItemMetadata.descriptionKey_)  String? description, @JsonKey(name: MusicAssistantMediaItemMetadata.descriptionLanguageKey_)  String? descriptionLanguage, @JsonKey(name: MusicAssistantMediaItemMetadata.lifeSpanKey_)  MusicAssistantLifeSpan? lifeSpan, @JsonKey(name: MusicAssistantMediaItemMetadata.artistEntityTypeKey_)  MusicAssistantArtistEntityType? artistEntityType, @JsonKey(name: MusicAssistantMediaItemMetadata.reviewKey_)  String? review, @JsonKey(name: MusicAssistantMediaItemMetadata.explicitKey_)  bool? explicit, @JsonKey(name: MusicAssistantMediaItemMetadata.imagesKey_)  List<MusicAssistantMediaItemImage>? images, @JsonKey(name: MusicAssistantMediaItemMetadata.groupingKey_)  String? grouping, @JsonKey(name: MusicAssistantMediaItemMetadata.genresKey_)  List<String>? genres, @JsonKey(name: MusicAssistantMediaItemMetadata.moodKey_)  String? mood, @JsonKey(name: MusicAssistantMediaItemMetadata.styleKey_)  String? style, @JsonKey(name: MusicAssistantMediaItemMetadata.copyrightKey_)  String? copyright, @JsonKey(name: MusicAssistantMediaItemMetadata.lyricsKey_)  String? lyrics, @JsonKey(name: MusicAssistantMediaItemMetadata.lrcLyricsKey_)  String? lrcLyrics, @JsonKey(name: MusicAssistantMediaItemMetadata.transcriptKey_)  String? transcript, @JsonKey(name: MusicAssistantMediaItemMetadata.transcriptCuesKey_)  List<MusicAssistantMediaItemTranscriptCue>? transcriptCues, @JsonKey(name: MusicAssistantMediaItemMetadata.hasTranscriptKey_)  bool? hasTranscript, @JsonKey(name: MusicAssistantMediaItemMetadata.labelKey_)  String? label, @JsonKey(name: MusicAssistantMediaItemMetadata.linksKey_)  List<MusicAssistantMediaItemLink>? links, @JsonKey(name: MusicAssistantMediaItemMetadata.performersKey_)  List<String>? performers, @JsonKey(name: MusicAssistantMediaItemMetadata.previewKey_)  String? preview, @JsonKey(name: MusicAssistantMediaItemMetadata.popularityKey_)  int? popularity, @JsonKey(name: MusicAssistantMediaItemMetadata.releaseDateKey_)  DateTime? releaseDate, @JsonKey(name: MusicAssistantMediaItemMetadata.languagesKey_)  List<String>? languages, @JsonKey(name: MusicAssistantMediaItemMetadata.chaptersKey_)  List<MusicAssistantMediaItemChapter>? chapters, @JsonKey(name: MusicAssistantMediaItemMetadata.collectionsKey_)  List<MusicAssistantMediaItemCollection>? collections, @JsonKey(name: MusicAssistantMediaItemMetadata.lastRefreshKey_)  int? lastRefresh)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantMediaItemMetadata() when $default != null:
return $default(_that.description,_that.descriptionLanguage,_that.lifeSpan,_that.artistEntityType,_that.review,_that.explicit,_that.images,_that.grouping,_that.genres,_that.mood,_that.style,_that.copyright,_that.lyrics,_that.lrcLyrics,_that.transcript,_that.transcriptCues,_that.hasTranscript,_that.label,_that.links,_that.performers,_that.preview,_that.popularity,_that.releaseDate,_that.languages,_that.chapters,_that.collections,_that.lastRefresh);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantMediaItemMetadata.descriptionKey_)  String? description, @JsonKey(name: MusicAssistantMediaItemMetadata.descriptionLanguageKey_)  String? descriptionLanguage, @JsonKey(name: MusicAssistantMediaItemMetadata.lifeSpanKey_)  MusicAssistantLifeSpan? lifeSpan, @JsonKey(name: MusicAssistantMediaItemMetadata.artistEntityTypeKey_)  MusicAssistantArtistEntityType? artistEntityType, @JsonKey(name: MusicAssistantMediaItemMetadata.reviewKey_)  String? review, @JsonKey(name: MusicAssistantMediaItemMetadata.explicitKey_)  bool? explicit, @JsonKey(name: MusicAssistantMediaItemMetadata.imagesKey_)  List<MusicAssistantMediaItemImage>? images, @JsonKey(name: MusicAssistantMediaItemMetadata.groupingKey_)  String? grouping, @JsonKey(name: MusicAssistantMediaItemMetadata.genresKey_)  List<String>? genres, @JsonKey(name: MusicAssistantMediaItemMetadata.moodKey_)  String? mood, @JsonKey(name: MusicAssistantMediaItemMetadata.styleKey_)  String? style, @JsonKey(name: MusicAssistantMediaItemMetadata.copyrightKey_)  String? copyright, @JsonKey(name: MusicAssistantMediaItemMetadata.lyricsKey_)  String? lyrics, @JsonKey(name: MusicAssistantMediaItemMetadata.lrcLyricsKey_)  String? lrcLyrics, @JsonKey(name: MusicAssistantMediaItemMetadata.transcriptKey_)  String? transcript, @JsonKey(name: MusicAssistantMediaItemMetadata.transcriptCuesKey_)  List<MusicAssistantMediaItemTranscriptCue>? transcriptCues, @JsonKey(name: MusicAssistantMediaItemMetadata.hasTranscriptKey_)  bool? hasTranscript, @JsonKey(name: MusicAssistantMediaItemMetadata.labelKey_)  String? label, @JsonKey(name: MusicAssistantMediaItemMetadata.linksKey_)  List<MusicAssistantMediaItemLink>? links, @JsonKey(name: MusicAssistantMediaItemMetadata.performersKey_)  List<String>? performers, @JsonKey(name: MusicAssistantMediaItemMetadata.previewKey_)  String? preview, @JsonKey(name: MusicAssistantMediaItemMetadata.popularityKey_)  int? popularity, @JsonKey(name: MusicAssistantMediaItemMetadata.releaseDateKey_)  DateTime? releaseDate, @JsonKey(name: MusicAssistantMediaItemMetadata.languagesKey_)  List<String>? languages, @JsonKey(name: MusicAssistantMediaItemMetadata.chaptersKey_)  List<MusicAssistantMediaItemChapter>? chapters, @JsonKey(name: MusicAssistantMediaItemMetadata.collectionsKey_)  List<MusicAssistantMediaItemCollection>? collections, @JsonKey(name: MusicAssistantMediaItemMetadata.lastRefreshKey_)  int? lastRefresh)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantMediaItemMetadata():
return $default(_that.description,_that.descriptionLanguage,_that.lifeSpan,_that.artistEntityType,_that.review,_that.explicit,_that.images,_that.grouping,_that.genres,_that.mood,_that.style,_that.copyright,_that.lyrics,_that.lrcLyrics,_that.transcript,_that.transcriptCues,_that.hasTranscript,_that.label,_that.links,_that.performers,_that.preview,_that.popularity,_that.releaseDate,_that.languages,_that.chapters,_that.collections,_that.lastRefresh);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantMediaItemMetadata.descriptionKey_)  String? description, @JsonKey(name: MusicAssistantMediaItemMetadata.descriptionLanguageKey_)  String? descriptionLanguage, @JsonKey(name: MusicAssistantMediaItemMetadata.lifeSpanKey_)  MusicAssistantLifeSpan? lifeSpan, @JsonKey(name: MusicAssistantMediaItemMetadata.artistEntityTypeKey_)  MusicAssistantArtistEntityType? artistEntityType, @JsonKey(name: MusicAssistantMediaItemMetadata.reviewKey_)  String? review, @JsonKey(name: MusicAssistantMediaItemMetadata.explicitKey_)  bool? explicit, @JsonKey(name: MusicAssistantMediaItemMetadata.imagesKey_)  List<MusicAssistantMediaItemImage>? images, @JsonKey(name: MusicAssistantMediaItemMetadata.groupingKey_)  String? grouping, @JsonKey(name: MusicAssistantMediaItemMetadata.genresKey_)  List<String>? genres, @JsonKey(name: MusicAssistantMediaItemMetadata.moodKey_)  String? mood, @JsonKey(name: MusicAssistantMediaItemMetadata.styleKey_)  String? style, @JsonKey(name: MusicAssistantMediaItemMetadata.copyrightKey_)  String? copyright, @JsonKey(name: MusicAssistantMediaItemMetadata.lyricsKey_)  String? lyrics, @JsonKey(name: MusicAssistantMediaItemMetadata.lrcLyricsKey_)  String? lrcLyrics, @JsonKey(name: MusicAssistantMediaItemMetadata.transcriptKey_)  String? transcript, @JsonKey(name: MusicAssistantMediaItemMetadata.transcriptCuesKey_)  List<MusicAssistantMediaItemTranscriptCue>? transcriptCues, @JsonKey(name: MusicAssistantMediaItemMetadata.hasTranscriptKey_)  bool? hasTranscript, @JsonKey(name: MusicAssistantMediaItemMetadata.labelKey_)  String? label, @JsonKey(name: MusicAssistantMediaItemMetadata.linksKey_)  List<MusicAssistantMediaItemLink>? links, @JsonKey(name: MusicAssistantMediaItemMetadata.performersKey_)  List<String>? performers, @JsonKey(name: MusicAssistantMediaItemMetadata.previewKey_)  String? preview, @JsonKey(name: MusicAssistantMediaItemMetadata.popularityKey_)  int? popularity, @JsonKey(name: MusicAssistantMediaItemMetadata.releaseDateKey_)  DateTime? releaseDate, @JsonKey(name: MusicAssistantMediaItemMetadata.languagesKey_)  List<String>? languages, @JsonKey(name: MusicAssistantMediaItemMetadata.chaptersKey_)  List<MusicAssistantMediaItemChapter>? chapters, @JsonKey(name: MusicAssistantMediaItemMetadata.collectionsKey_)  List<MusicAssistantMediaItemCollection>? collections, @JsonKey(name: MusicAssistantMediaItemMetadata.lastRefreshKey_)  int? lastRefresh)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantMediaItemMetadata() when $default != null:
return $default(_that.description,_that.descriptionLanguage,_that.lifeSpan,_that.artistEntityType,_that.review,_that.explicit,_that.images,_that.grouping,_that.genres,_that.mood,_that.style,_that.copyright,_that.lyrics,_that.lrcLyrics,_that.transcript,_that.transcriptCues,_that.hasTranscript,_that.label,_that.links,_that.performers,_that.preview,_that.popularity,_that.releaseDate,_that.languages,_that.chapters,_that.collections,_that.lastRefresh);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantMediaItemMetadata extends MusicAssistantMediaItemMetadata {
  const _MusicAssistantMediaItemMetadata({@JsonKey(name: MusicAssistantMediaItemMetadata.descriptionKey_) this.description, @JsonKey(name: MusicAssistantMediaItemMetadata.descriptionLanguageKey_) this.descriptionLanguage, @JsonKey(name: MusicAssistantMediaItemMetadata.lifeSpanKey_) this.lifeSpan, @JsonKey(name: MusicAssistantMediaItemMetadata.artistEntityTypeKey_) this.artistEntityType, @JsonKey(name: MusicAssistantMediaItemMetadata.reviewKey_) this.review, @JsonKey(name: MusicAssistantMediaItemMetadata.explicitKey_) this.explicit, @JsonKey(name: MusicAssistantMediaItemMetadata.imagesKey_) final  List<MusicAssistantMediaItemImage>? images, @JsonKey(name: MusicAssistantMediaItemMetadata.groupingKey_) this.grouping, @JsonKey(name: MusicAssistantMediaItemMetadata.genresKey_) final  List<String>? genres, @JsonKey(name: MusicAssistantMediaItemMetadata.moodKey_) this.mood, @JsonKey(name: MusicAssistantMediaItemMetadata.styleKey_) this.style, @JsonKey(name: MusicAssistantMediaItemMetadata.copyrightKey_) this.copyright, @JsonKey(name: MusicAssistantMediaItemMetadata.lyricsKey_) this.lyrics, @JsonKey(name: MusicAssistantMediaItemMetadata.lrcLyricsKey_) this.lrcLyrics, @JsonKey(name: MusicAssistantMediaItemMetadata.transcriptKey_) this.transcript, @JsonKey(name: MusicAssistantMediaItemMetadata.transcriptCuesKey_) final  List<MusicAssistantMediaItemTranscriptCue>? transcriptCues, @JsonKey(name: MusicAssistantMediaItemMetadata.hasTranscriptKey_) this.hasTranscript, @JsonKey(name: MusicAssistantMediaItemMetadata.labelKey_) this.label, @JsonKey(name: MusicAssistantMediaItemMetadata.linksKey_) final  List<MusicAssistantMediaItemLink>? links, @JsonKey(name: MusicAssistantMediaItemMetadata.performersKey_) final  List<String>? performers, @JsonKey(name: MusicAssistantMediaItemMetadata.previewKey_) this.preview, @JsonKey(name: MusicAssistantMediaItemMetadata.popularityKey_) this.popularity, @JsonKey(name: MusicAssistantMediaItemMetadata.releaseDateKey_) this.releaseDate, @JsonKey(name: MusicAssistantMediaItemMetadata.languagesKey_) final  List<String>? languages, @JsonKey(name: MusicAssistantMediaItemMetadata.chaptersKey_) final  List<MusicAssistantMediaItemChapter>? chapters, @JsonKey(name: MusicAssistantMediaItemMetadata.collectionsKey_) final  List<MusicAssistantMediaItemCollection>? collections, @JsonKey(name: MusicAssistantMediaItemMetadata.lastRefreshKey_) this.lastRefresh}): _images = images,_genres = genres,_transcriptCues = transcriptCues,_links = links,_performers = performers,_languages = languages,_chapters = chapters,_collections = collections,super._();
  factory _MusicAssistantMediaItemMetadata.fromJson(Map<String, dynamic> json) => _$MusicAssistantMediaItemMetadataFromJson(json);

/// description
@override@JsonKey(name: MusicAssistantMediaItemMetadata.descriptionKey_) final  String? description;
/// descriptionLanguage
@override@JsonKey(name: MusicAssistantMediaItemMetadata.descriptionLanguageKey_) final  String? descriptionLanguage;
/// lifeSpan
@override@JsonKey(name: MusicAssistantMediaItemMetadata.lifeSpanKey_) final  MusicAssistantLifeSpan? lifeSpan;
/// artistEntityType
@override@JsonKey(name: MusicAssistantMediaItemMetadata.artistEntityTypeKey_) final  MusicAssistantArtistEntityType? artistEntityType;
/// review
@override@JsonKey(name: MusicAssistantMediaItemMetadata.reviewKey_) final  String? review;
/// explicit
@override@JsonKey(name: MusicAssistantMediaItemMetadata.explicitKey_) final  bool? explicit;
/// images
 final  List<MusicAssistantMediaItemImage>? _images;
/// images
@override@JsonKey(name: MusicAssistantMediaItemMetadata.imagesKey_) List<MusicAssistantMediaItemImage>? get images {
  final value = _images;
  if (value == null) return null;
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// grouping
@override@JsonKey(name: MusicAssistantMediaItemMetadata.groupingKey_) final  String? grouping;
/// genres
 final  List<String>? _genres;
/// genres
@override@JsonKey(name: MusicAssistantMediaItemMetadata.genresKey_) List<String>? get genres {
  final value = _genres;
  if (value == null) return null;
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// mood
@override@JsonKey(name: MusicAssistantMediaItemMetadata.moodKey_) final  String? mood;
/// style
@override@JsonKey(name: MusicAssistantMediaItemMetadata.styleKey_) final  String? style;
/// copyright
@override@JsonKey(name: MusicAssistantMediaItemMetadata.copyrightKey_) final  String? copyright;
/// lyrics
@override@JsonKey(name: MusicAssistantMediaItemMetadata.lyricsKey_) final  String? lyrics;
/// lrcLyrics
@override@JsonKey(name: MusicAssistantMediaItemMetadata.lrcLyricsKey_) final  String? lrcLyrics;
/// transcript
@override@JsonKey(name: MusicAssistantMediaItemMetadata.transcriptKey_) final  String? transcript;
/// transcriptCues
 final  List<MusicAssistantMediaItemTranscriptCue>? _transcriptCues;
/// transcriptCues
@override@JsonKey(name: MusicAssistantMediaItemMetadata.transcriptCuesKey_) List<MusicAssistantMediaItemTranscriptCue>? get transcriptCues {
  final value = _transcriptCues;
  if (value == null) return null;
  if (_transcriptCues is EqualUnmodifiableListView) return _transcriptCues;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// hasTranscript
@override@JsonKey(name: MusicAssistantMediaItemMetadata.hasTranscriptKey_) final  bool? hasTranscript;
/// label
@override@JsonKey(name: MusicAssistantMediaItemMetadata.labelKey_) final  String? label;
/// links
 final  List<MusicAssistantMediaItemLink>? _links;
/// links
@override@JsonKey(name: MusicAssistantMediaItemMetadata.linksKey_) List<MusicAssistantMediaItemLink>? get links {
  final value = _links;
  if (value == null) return null;
  if (_links is EqualUnmodifiableListView) return _links;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// performers
 final  List<String>? _performers;
/// performers
@override@JsonKey(name: MusicAssistantMediaItemMetadata.performersKey_) List<String>? get performers {
  final value = _performers;
  if (value == null) return null;
  if (_performers is EqualUnmodifiableListView) return _performers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// preview
@override@JsonKey(name: MusicAssistantMediaItemMetadata.previewKey_) final  String? preview;
/// popularity
@override@JsonKey(name: MusicAssistantMediaItemMetadata.popularityKey_) final  int? popularity;
/// releaseDate
@override@JsonKey(name: MusicAssistantMediaItemMetadata.releaseDateKey_) final  DateTime? releaseDate;
/// languages
 final  List<String>? _languages;
/// languages
@override@JsonKey(name: MusicAssistantMediaItemMetadata.languagesKey_) List<String>? get languages {
  final value = _languages;
  if (value == null) return null;
  if (_languages is EqualUnmodifiableListView) return _languages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// chapters
 final  List<MusicAssistantMediaItemChapter>? _chapters;
/// chapters
@override@JsonKey(name: MusicAssistantMediaItemMetadata.chaptersKey_) List<MusicAssistantMediaItemChapter>? get chapters {
  final value = _chapters;
  if (value == null) return null;
  if (_chapters is EqualUnmodifiableListView) return _chapters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// collections
 final  List<MusicAssistantMediaItemCollection>? _collections;
/// collections
@override@JsonKey(name: MusicAssistantMediaItemMetadata.collectionsKey_) List<MusicAssistantMediaItemCollection>? get collections {
  final value = _collections;
  if (value == null) return null;
  if (_collections is EqualUnmodifiableListView) return _collections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// lastRefresh
@override@JsonKey(name: MusicAssistantMediaItemMetadata.lastRefreshKey_) final  int? lastRefresh;

/// Create a copy of MusicAssistantMediaItemMetadata
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantMediaItemMetadataCopyWith<_MusicAssistantMediaItemMetadata> get copyWith => __$MusicAssistantMediaItemMetadataCopyWithImpl<_MusicAssistantMediaItemMetadata>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantMediaItemMetadataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantMediaItemMetadata&&(identical(other.description, description) || other.description == description)&&(identical(other.descriptionLanguage, descriptionLanguage) || other.descriptionLanguage == descriptionLanguage)&&(identical(other.lifeSpan, lifeSpan) || other.lifeSpan == lifeSpan)&&(identical(other.artistEntityType, artistEntityType) || other.artistEntityType == artistEntityType)&&(identical(other.review, review) || other.review == review)&&(identical(other.explicit, explicit) || other.explicit == explicit)&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.grouping, grouping) || other.grouping == grouping)&&const DeepCollectionEquality().equals(other._genres, _genres)&&(identical(other.mood, mood) || other.mood == mood)&&(identical(other.style, style) || other.style == style)&&(identical(other.copyright, copyright) || other.copyright == copyright)&&(identical(other.lyrics, lyrics) || other.lyrics == lyrics)&&(identical(other.lrcLyrics, lrcLyrics) || other.lrcLyrics == lrcLyrics)&&(identical(other.transcript, transcript) || other.transcript == transcript)&&const DeepCollectionEquality().equals(other._transcriptCues, _transcriptCues)&&(identical(other.hasTranscript, hasTranscript) || other.hasTranscript == hasTranscript)&&(identical(other.label, label) || other.label == label)&&const DeepCollectionEquality().equals(other._links, _links)&&const DeepCollectionEquality().equals(other._performers, _performers)&&(identical(other.preview, preview) || other.preview == preview)&&(identical(other.popularity, popularity) || other.popularity == popularity)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&const DeepCollectionEquality().equals(other._languages, _languages)&&const DeepCollectionEquality().equals(other._chapters, _chapters)&&const DeepCollectionEquality().equals(other._collections, _collections)&&(identical(other.lastRefresh, lastRefresh) || other.lastRefresh == lastRefresh));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,description,descriptionLanguage,lifeSpan,artistEntityType,review,explicit,const DeepCollectionEquality().hash(_images),grouping,const DeepCollectionEquality().hash(_genres),mood,style,copyright,lyrics,lrcLyrics,transcript,const DeepCollectionEquality().hash(_transcriptCues),hasTranscript,label,const DeepCollectionEquality().hash(_links),const DeepCollectionEquality().hash(_performers),preview,popularity,releaseDate,const DeepCollectionEquality().hash(_languages),const DeepCollectionEquality().hash(_chapters),const DeepCollectionEquality().hash(_collections),lastRefresh]);

@override
String toString() {
  return 'MusicAssistantMediaItemMetadata(description: $description, descriptionLanguage: $descriptionLanguage, lifeSpan: $lifeSpan, artistEntityType: $artistEntityType, review: $review, explicit: $explicit, images: $images, grouping: $grouping, genres: $genres, mood: $mood, style: $style, copyright: $copyright, lyrics: $lyrics, lrcLyrics: $lrcLyrics, transcript: $transcript, transcriptCues: $transcriptCues, hasTranscript: $hasTranscript, label: $label, links: $links, performers: $performers, preview: $preview, popularity: $popularity, releaseDate: $releaseDate, languages: $languages, chapters: $chapters, collections: $collections, lastRefresh: $lastRefresh)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantMediaItemMetadataCopyWith<$Res> implements $MusicAssistantMediaItemMetadataCopyWith<$Res> {
  factory _$MusicAssistantMediaItemMetadataCopyWith(_MusicAssistantMediaItemMetadata value, $Res Function(_MusicAssistantMediaItemMetadata) _then) = __$MusicAssistantMediaItemMetadataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantMediaItemMetadata.descriptionKey_) String? description,@JsonKey(name: MusicAssistantMediaItemMetadata.descriptionLanguageKey_) String? descriptionLanguage,@JsonKey(name: MusicAssistantMediaItemMetadata.lifeSpanKey_) MusicAssistantLifeSpan? lifeSpan,@JsonKey(name: MusicAssistantMediaItemMetadata.artistEntityTypeKey_) MusicAssistantArtistEntityType? artistEntityType,@JsonKey(name: MusicAssistantMediaItemMetadata.reviewKey_) String? review,@JsonKey(name: MusicAssistantMediaItemMetadata.explicitKey_) bool? explicit,@JsonKey(name: MusicAssistantMediaItemMetadata.imagesKey_) List<MusicAssistantMediaItemImage>? images,@JsonKey(name: MusicAssistantMediaItemMetadata.groupingKey_) String? grouping,@JsonKey(name: MusicAssistantMediaItemMetadata.genresKey_) List<String>? genres,@JsonKey(name: MusicAssistantMediaItemMetadata.moodKey_) String? mood,@JsonKey(name: MusicAssistantMediaItemMetadata.styleKey_) String? style,@JsonKey(name: MusicAssistantMediaItemMetadata.copyrightKey_) String? copyright,@JsonKey(name: MusicAssistantMediaItemMetadata.lyricsKey_) String? lyrics,@JsonKey(name: MusicAssistantMediaItemMetadata.lrcLyricsKey_) String? lrcLyrics,@JsonKey(name: MusicAssistantMediaItemMetadata.transcriptKey_) String? transcript,@JsonKey(name: MusicAssistantMediaItemMetadata.transcriptCuesKey_) List<MusicAssistantMediaItemTranscriptCue>? transcriptCues,@JsonKey(name: MusicAssistantMediaItemMetadata.hasTranscriptKey_) bool? hasTranscript,@JsonKey(name: MusicAssistantMediaItemMetadata.labelKey_) String? label,@JsonKey(name: MusicAssistantMediaItemMetadata.linksKey_) List<MusicAssistantMediaItemLink>? links,@JsonKey(name: MusicAssistantMediaItemMetadata.performersKey_) List<String>? performers,@JsonKey(name: MusicAssistantMediaItemMetadata.previewKey_) String? preview,@JsonKey(name: MusicAssistantMediaItemMetadata.popularityKey_) int? popularity,@JsonKey(name: MusicAssistantMediaItemMetadata.releaseDateKey_) DateTime? releaseDate,@JsonKey(name: MusicAssistantMediaItemMetadata.languagesKey_) List<String>? languages,@JsonKey(name: MusicAssistantMediaItemMetadata.chaptersKey_) List<MusicAssistantMediaItemChapter>? chapters,@JsonKey(name: MusicAssistantMediaItemMetadata.collectionsKey_) List<MusicAssistantMediaItemCollection>? collections,@JsonKey(name: MusicAssistantMediaItemMetadata.lastRefreshKey_) int? lastRefresh
});


@override $MusicAssistantLifeSpanCopyWith<$Res>? get lifeSpan;

}
/// @nodoc
class __$MusicAssistantMediaItemMetadataCopyWithImpl<$Res>
    implements _$MusicAssistantMediaItemMetadataCopyWith<$Res> {
  __$MusicAssistantMediaItemMetadataCopyWithImpl(this._self, this._then);

  final _MusicAssistantMediaItemMetadata _self;
  final $Res Function(_MusicAssistantMediaItemMetadata) _then;

/// Create a copy of MusicAssistantMediaItemMetadata
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? description = freezed,Object? descriptionLanguage = freezed,Object? lifeSpan = freezed,Object? artistEntityType = freezed,Object? review = freezed,Object? explicit = freezed,Object? images = freezed,Object? grouping = freezed,Object? genres = freezed,Object? mood = freezed,Object? style = freezed,Object? copyright = freezed,Object? lyrics = freezed,Object? lrcLyrics = freezed,Object? transcript = freezed,Object? transcriptCues = freezed,Object? hasTranscript = freezed,Object? label = freezed,Object? links = freezed,Object? performers = freezed,Object? preview = freezed,Object? popularity = freezed,Object? releaseDate = freezed,Object? languages = freezed,Object? chapters = freezed,Object? collections = freezed,Object? lastRefresh = freezed,}) {
  return _then(_MusicAssistantMediaItemMetadata(
description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,descriptionLanguage: freezed == descriptionLanguage ? _self.descriptionLanguage : descriptionLanguage // ignore: cast_nullable_to_non_nullable
as String?,lifeSpan: freezed == lifeSpan ? _self.lifeSpan : lifeSpan // ignore: cast_nullable_to_non_nullable
as MusicAssistantLifeSpan?,artistEntityType: freezed == artistEntityType ? _self.artistEntityType : artistEntityType // ignore: cast_nullable_to_non_nullable
as MusicAssistantArtistEntityType?,review: freezed == review ? _self.review : review // ignore: cast_nullable_to_non_nullable
as String?,explicit: freezed == explicit ? _self.explicit : explicit // ignore: cast_nullable_to_non_nullable
as bool?,images: freezed == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<MusicAssistantMediaItemImage>?,grouping: freezed == grouping ? _self.grouping : grouping // ignore: cast_nullable_to_non_nullable
as String?,genres: freezed == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<String>?,mood: freezed == mood ? _self.mood : mood // ignore: cast_nullable_to_non_nullable
as String?,style: freezed == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as String?,copyright: freezed == copyright ? _self.copyright : copyright // ignore: cast_nullable_to_non_nullable
as String?,lyrics: freezed == lyrics ? _self.lyrics : lyrics // ignore: cast_nullable_to_non_nullable
as String?,lrcLyrics: freezed == lrcLyrics ? _self.lrcLyrics : lrcLyrics // ignore: cast_nullable_to_non_nullable
as String?,transcript: freezed == transcript ? _self.transcript : transcript // ignore: cast_nullable_to_non_nullable
as String?,transcriptCues: freezed == transcriptCues ? _self._transcriptCues : transcriptCues // ignore: cast_nullable_to_non_nullable
as List<MusicAssistantMediaItemTranscriptCue>?,hasTranscript: freezed == hasTranscript ? _self.hasTranscript : hasTranscript // ignore: cast_nullable_to_non_nullable
as bool?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,links: freezed == links ? _self._links : links // ignore: cast_nullable_to_non_nullable
as List<MusicAssistantMediaItemLink>?,performers: freezed == performers ? _self._performers : performers // ignore: cast_nullable_to_non_nullable
as List<String>?,preview: freezed == preview ? _self.preview : preview // ignore: cast_nullable_to_non_nullable
as String?,popularity: freezed == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as int?,releaseDate: freezed == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as DateTime?,languages: freezed == languages ? _self._languages : languages // ignore: cast_nullable_to_non_nullable
as List<String>?,chapters: freezed == chapters ? _self._chapters : chapters // ignore: cast_nullable_to_non_nullable
as List<MusicAssistantMediaItemChapter>?,collections: freezed == collections ? _self._collections : collections // ignore: cast_nullable_to_non_nullable
as List<MusicAssistantMediaItemCollection>?,lastRefresh: freezed == lastRefresh ? _self.lastRefresh : lastRefresh // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of MusicAssistantMediaItemMetadata
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantLifeSpanCopyWith<$Res>? get lifeSpan {
    if (_self.lifeSpan == null) {
    return null;
  }

  return $MusicAssistantLifeSpanCopyWith<$Res>(_self.lifeSpan!, (value) {
    return _then(_self.copyWith(lifeSpan: value));
  });
}
}

// dart format on
