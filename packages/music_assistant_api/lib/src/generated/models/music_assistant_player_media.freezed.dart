// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_player_media.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantPlayerMedia {

/// uri
@JsonKey(name: MusicAssistantPlayerMedia.uriKey_) String get uri;/// mediaType
@JsonKey(name: MusicAssistantPlayerMedia.mediaTypeKey_) MusicAssistantMediaType get mediaType;/// title
@JsonKey(name: MusicAssistantPlayerMedia.titleKey_) String? get title;/// artist
@JsonKey(name: MusicAssistantPlayerMedia.artistKey_) String? get artist;/// album
@JsonKey(name: MusicAssistantPlayerMedia.albumKey_) String? get album;/// albumArtist
@JsonKey(name: MusicAssistantPlayerMedia.albumArtistKey_) String? get albumArtist;/// imageUrl
@JsonKey(name: MusicAssistantPlayerMedia.imageUrlKey_) String? get imageUrl;/// palette
@JsonKey(name: MusicAssistantPlayerMedia.paletteKey_) MusicAssistantMediaItemPalette? get palette;/// duration
@JsonKey(name: MusicAssistantPlayerMedia.durationKey_) int? get duration;/// streamDuration
@JsonKey(name: MusicAssistantPlayerMedia.streamDurationKey_) int? get streamDuration;/// sourceId
@JsonKey(name: MusicAssistantPlayerMedia.sourceIdKey_) String? get sourceId;/// queueItemId
@JsonKey(name: MusicAssistantPlayerMedia.queueItemIdKey_) String? get queueItemId;/// customData
@JsonKey(name: MusicAssistantPlayerMedia.customDataKey_) Map<String, MusicAssistantAny>? get customData;/// elapsedTime
@JsonKey(name: MusicAssistantPlayerMedia.elapsedTimeKey_) int? get elapsedTime;/// elapsedTimeLastUpdated
@JsonKey(name: MusicAssistantPlayerMedia.elapsedTimeLastUpdatedKey_) double? get elapsedTimeLastUpdated;
/// Create a copy of MusicAssistantPlayerMedia
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantPlayerMediaCopyWith<MusicAssistantPlayerMedia> get copyWith => _$MusicAssistantPlayerMediaCopyWithImpl<MusicAssistantPlayerMedia>(this as MusicAssistantPlayerMedia, _$identity);

  /// Serializes this MusicAssistantPlayerMedia to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantPlayerMedia&&(identical(other.uri, uri) || other.uri == uri)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.title, title) || other.title == title)&&(identical(other.artist, artist) || other.artist == artist)&&(identical(other.album, album) || other.album == album)&&(identical(other.albumArtist, albumArtist) || other.albumArtist == albumArtist)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.palette, palette) || other.palette == palette)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.streamDuration, streamDuration) || other.streamDuration == streamDuration)&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId)&&(identical(other.queueItemId, queueItemId) || other.queueItemId == queueItemId)&&const DeepCollectionEquality().equals(other.customData, customData)&&(identical(other.elapsedTime, elapsedTime) || other.elapsedTime == elapsedTime)&&(identical(other.elapsedTimeLastUpdated, elapsedTimeLastUpdated) || other.elapsedTimeLastUpdated == elapsedTimeLastUpdated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uri,mediaType,title,artist,album,albumArtist,imageUrl,palette,duration,streamDuration,sourceId,queueItemId,const DeepCollectionEquality().hash(customData),elapsedTime,elapsedTimeLastUpdated);

@override
String toString() {
  return 'MusicAssistantPlayerMedia(uri: $uri, mediaType: $mediaType, title: $title, artist: $artist, album: $album, albumArtist: $albumArtist, imageUrl: $imageUrl, palette: $palette, duration: $duration, streamDuration: $streamDuration, sourceId: $sourceId, queueItemId: $queueItemId, customData: $customData, elapsedTime: $elapsedTime, elapsedTimeLastUpdated: $elapsedTimeLastUpdated)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantPlayerMediaCopyWith<$Res>  {
  factory $MusicAssistantPlayerMediaCopyWith(MusicAssistantPlayerMedia value, $Res Function(MusicAssistantPlayerMedia) _then) = _$MusicAssistantPlayerMediaCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantPlayerMedia.uriKey_) String uri,@JsonKey(name: MusicAssistantPlayerMedia.mediaTypeKey_) MusicAssistantMediaType mediaType,@JsonKey(name: MusicAssistantPlayerMedia.titleKey_) String? title,@JsonKey(name: MusicAssistantPlayerMedia.artistKey_) String? artist,@JsonKey(name: MusicAssistantPlayerMedia.albumKey_) String? album,@JsonKey(name: MusicAssistantPlayerMedia.albumArtistKey_) String? albumArtist,@JsonKey(name: MusicAssistantPlayerMedia.imageUrlKey_) String? imageUrl,@JsonKey(name: MusicAssistantPlayerMedia.paletteKey_) MusicAssistantMediaItemPalette? palette,@JsonKey(name: MusicAssistantPlayerMedia.durationKey_) int? duration,@JsonKey(name: MusicAssistantPlayerMedia.streamDurationKey_) int? streamDuration,@JsonKey(name: MusicAssistantPlayerMedia.sourceIdKey_) String? sourceId,@JsonKey(name: MusicAssistantPlayerMedia.queueItemIdKey_) String? queueItemId,@JsonKey(name: MusicAssistantPlayerMedia.customDataKey_) Map<String, MusicAssistantAny>? customData,@JsonKey(name: MusicAssistantPlayerMedia.elapsedTimeKey_) int? elapsedTime,@JsonKey(name: MusicAssistantPlayerMedia.elapsedTimeLastUpdatedKey_) double? elapsedTimeLastUpdated
});


$MusicAssistantMediaItemPaletteCopyWith<$Res>? get palette;

}
/// @nodoc
class _$MusicAssistantPlayerMediaCopyWithImpl<$Res>
    implements $MusicAssistantPlayerMediaCopyWith<$Res> {
  _$MusicAssistantPlayerMediaCopyWithImpl(this._self, this._then);

  final MusicAssistantPlayerMedia _self;
  final $Res Function(MusicAssistantPlayerMedia) _then;

/// Create a copy of MusicAssistantPlayerMedia
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uri = null,Object? mediaType = null,Object? title = freezed,Object? artist = freezed,Object? album = freezed,Object? albumArtist = freezed,Object? imageUrl = freezed,Object? palette = freezed,Object? duration = freezed,Object? streamDuration = freezed,Object? sourceId = freezed,Object? queueItemId = freezed,Object? customData = freezed,Object? elapsedTime = freezed,Object? elapsedTimeLastUpdated = freezed,}) {
  return _then(_self.copyWith(
uri: null == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as String,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as MusicAssistantMediaType,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,artist: freezed == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as String?,album: freezed == album ? _self.album : album // ignore: cast_nullable_to_non_nullable
as String?,albumArtist: freezed == albumArtist ? _self.albumArtist : albumArtist // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,palette: freezed == palette ? _self.palette : palette // ignore: cast_nullable_to_non_nullable
as MusicAssistantMediaItemPalette?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int?,streamDuration: freezed == streamDuration ? _self.streamDuration : streamDuration // ignore: cast_nullable_to_non_nullable
as int?,sourceId: freezed == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String?,queueItemId: freezed == queueItemId ? _self.queueItemId : queueItemId // ignore: cast_nullable_to_non_nullable
as String?,customData: freezed == customData ? _self.customData : customData // ignore: cast_nullable_to_non_nullable
as Map<String, MusicAssistantAny>?,elapsedTime: freezed == elapsedTime ? _self.elapsedTime : elapsedTime // ignore: cast_nullable_to_non_nullable
as int?,elapsedTimeLastUpdated: freezed == elapsedTimeLastUpdated ? _self.elapsedTimeLastUpdated : elapsedTimeLastUpdated // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}
/// Create a copy of MusicAssistantPlayerMedia
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantMediaItemPaletteCopyWith<$Res>? get palette {
    if (_self.palette == null) {
    return null;
  }

  return $MusicAssistantMediaItemPaletteCopyWith<$Res>(_self.palette!, (value) {
    return _then(_self.copyWith(palette: value));
  });
}
}


/// Adds pattern-matching-related methods to [MusicAssistantPlayerMedia].
extension MusicAssistantPlayerMediaPatterns on MusicAssistantPlayerMedia {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantPlayerMedia value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantPlayerMedia() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantPlayerMedia value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantPlayerMedia():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantPlayerMedia value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantPlayerMedia() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantPlayerMedia.uriKey_)  String uri, @JsonKey(name: MusicAssistantPlayerMedia.mediaTypeKey_)  MusicAssistantMediaType mediaType, @JsonKey(name: MusicAssistantPlayerMedia.titleKey_)  String? title, @JsonKey(name: MusicAssistantPlayerMedia.artistKey_)  String? artist, @JsonKey(name: MusicAssistantPlayerMedia.albumKey_)  String? album, @JsonKey(name: MusicAssistantPlayerMedia.albumArtistKey_)  String? albumArtist, @JsonKey(name: MusicAssistantPlayerMedia.imageUrlKey_)  String? imageUrl, @JsonKey(name: MusicAssistantPlayerMedia.paletteKey_)  MusicAssistantMediaItemPalette? palette, @JsonKey(name: MusicAssistantPlayerMedia.durationKey_)  int? duration, @JsonKey(name: MusicAssistantPlayerMedia.streamDurationKey_)  int? streamDuration, @JsonKey(name: MusicAssistantPlayerMedia.sourceIdKey_)  String? sourceId, @JsonKey(name: MusicAssistantPlayerMedia.queueItemIdKey_)  String? queueItemId, @JsonKey(name: MusicAssistantPlayerMedia.customDataKey_)  Map<String, MusicAssistantAny>? customData, @JsonKey(name: MusicAssistantPlayerMedia.elapsedTimeKey_)  int? elapsedTime, @JsonKey(name: MusicAssistantPlayerMedia.elapsedTimeLastUpdatedKey_)  double? elapsedTimeLastUpdated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantPlayerMedia() when $default != null:
return $default(_that.uri,_that.mediaType,_that.title,_that.artist,_that.album,_that.albumArtist,_that.imageUrl,_that.palette,_that.duration,_that.streamDuration,_that.sourceId,_that.queueItemId,_that.customData,_that.elapsedTime,_that.elapsedTimeLastUpdated);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantPlayerMedia.uriKey_)  String uri, @JsonKey(name: MusicAssistantPlayerMedia.mediaTypeKey_)  MusicAssistantMediaType mediaType, @JsonKey(name: MusicAssistantPlayerMedia.titleKey_)  String? title, @JsonKey(name: MusicAssistantPlayerMedia.artistKey_)  String? artist, @JsonKey(name: MusicAssistantPlayerMedia.albumKey_)  String? album, @JsonKey(name: MusicAssistantPlayerMedia.albumArtistKey_)  String? albumArtist, @JsonKey(name: MusicAssistantPlayerMedia.imageUrlKey_)  String? imageUrl, @JsonKey(name: MusicAssistantPlayerMedia.paletteKey_)  MusicAssistantMediaItemPalette? palette, @JsonKey(name: MusicAssistantPlayerMedia.durationKey_)  int? duration, @JsonKey(name: MusicAssistantPlayerMedia.streamDurationKey_)  int? streamDuration, @JsonKey(name: MusicAssistantPlayerMedia.sourceIdKey_)  String? sourceId, @JsonKey(name: MusicAssistantPlayerMedia.queueItemIdKey_)  String? queueItemId, @JsonKey(name: MusicAssistantPlayerMedia.customDataKey_)  Map<String, MusicAssistantAny>? customData, @JsonKey(name: MusicAssistantPlayerMedia.elapsedTimeKey_)  int? elapsedTime, @JsonKey(name: MusicAssistantPlayerMedia.elapsedTimeLastUpdatedKey_)  double? elapsedTimeLastUpdated)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantPlayerMedia():
return $default(_that.uri,_that.mediaType,_that.title,_that.artist,_that.album,_that.albumArtist,_that.imageUrl,_that.palette,_that.duration,_that.streamDuration,_that.sourceId,_that.queueItemId,_that.customData,_that.elapsedTime,_that.elapsedTimeLastUpdated);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantPlayerMedia.uriKey_)  String uri, @JsonKey(name: MusicAssistantPlayerMedia.mediaTypeKey_)  MusicAssistantMediaType mediaType, @JsonKey(name: MusicAssistantPlayerMedia.titleKey_)  String? title, @JsonKey(name: MusicAssistantPlayerMedia.artistKey_)  String? artist, @JsonKey(name: MusicAssistantPlayerMedia.albumKey_)  String? album, @JsonKey(name: MusicAssistantPlayerMedia.albumArtistKey_)  String? albumArtist, @JsonKey(name: MusicAssistantPlayerMedia.imageUrlKey_)  String? imageUrl, @JsonKey(name: MusicAssistantPlayerMedia.paletteKey_)  MusicAssistantMediaItemPalette? palette, @JsonKey(name: MusicAssistantPlayerMedia.durationKey_)  int? duration, @JsonKey(name: MusicAssistantPlayerMedia.streamDurationKey_)  int? streamDuration, @JsonKey(name: MusicAssistantPlayerMedia.sourceIdKey_)  String? sourceId, @JsonKey(name: MusicAssistantPlayerMedia.queueItemIdKey_)  String? queueItemId, @JsonKey(name: MusicAssistantPlayerMedia.customDataKey_)  Map<String, MusicAssistantAny>? customData, @JsonKey(name: MusicAssistantPlayerMedia.elapsedTimeKey_)  int? elapsedTime, @JsonKey(name: MusicAssistantPlayerMedia.elapsedTimeLastUpdatedKey_)  double? elapsedTimeLastUpdated)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantPlayerMedia() when $default != null:
return $default(_that.uri,_that.mediaType,_that.title,_that.artist,_that.album,_that.albumArtist,_that.imageUrl,_that.palette,_that.duration,_that.streamDuration,_that.sourceId,_that.queueItemId,_that.customData,_that.elapsedTime,_that.elapsedTimeLastUpdated);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantPlayerMedia extends MusicAssistantPlayerMedia {
  const _MusicAssistantPlayerMedia({@JsonKey(name: MusicAssistantPlayerMedia.uriKey_) required this.uri, @JsonKey(name: MusicAssistantPlayerMedia.mediaTypeKey_) this.mediaType = MusicAssistantMediaType.unknown, @JsonKey(name: MusicAssistantPlayerMedia.titleKey_) this.title, @JsonKey(name: MusicAssistantPlayerMedia.artistKey_) this.artist, @JsonKey(name: MusicAssistantPlayerMedia.albumKey_) this.album, @JsonKey(name: MusicAssistantPlayerMedia.albumArtistKey_) this.albumArtist, @JsonKey(name: MusicAssistantPlayerMedia.imageUrlKey_) this.imageUrl, @JsonKey(name: MusicAssistantPlayerMedia.paletteKey_) this.palette, @JsonKey(name: MusicAssistantPlayerMedia.durationKey_) this.duration, @JsonKey(name: MusicAssistantPlayerMedia.streamDurationKey_) this.streamDuration, @JsonKey(name: MusicAssistantPlayerMedia.sourceIdKey_) this.sourceId, @JsonKey(name: MusicAssistantPlayerMedia.queueItemIdKey_) this.queueItemId, @JsonKey(name: MusicAssistantPlayerMedia.customDataKey_) final  Map<String, MusicAssistantAny>? customData, @JsonKey(name: MusicAssistantPlayerMedia.elapsedTimeKey_) this.elapsedTime, @JsonKey(name: MusicAssistantPlayerMedia.elapsedTimeLastUpdatedKey_) this.elapsedTimeLastUpdated}): _customData = customData,super._();
  factory _MusicAssistantPlayerMedia.fromJson(Map<String, dynamic> json) => _$MusicAssistantPlayerMediaFromJson(json);

/// uri
@override@JsonKey(name: MusicAssistantPlayerMedia.uriKey_) final  String uri;
/// mediaType
@override@JsonKey(name: MusicAssistantPlayerMedia.mediaTypeKey_) final  MusicAssistantMediaType mediaType;
/// title
@override@JsonKey(name: MusicAssistantPlayerMedia.titleKey_) final  String? title;
/// artist
@override@JsonKey(name: MusicAssistantPlayerMedia.artistKey_) final  String? artist;
/// album
@override@JsonKey(name: MusicAssistantPlayerMedia.albumKey_) final  String? album;
/// albumArtist
@override@JsonKey(name: MusicAssistantPlayerMedia.albumArtistKey_) final  String? albumArtist;
/// imageUrl
@override@JsonKey(name: MusicAssistantPlayerMedia.imageUrlKey_) final  String? imageUrl;
/// palette
@override@JsonKey(name: MusicAssistantPlayerMedia.paletteKey_) final  MusicAssistantMediaItemPalette? palette;
/// duration
@override@JsonKey(name: MusicAssistantPlayerMedia.durationKey_) final  int? duration;
/// streamDuration
@override@JsonKey(name: MusicAssistantPlayerMedia.streamDurationKey_) final  int? streamDuration;
/// sourceId
@override@JsonKey(name: MusicAssistantPlayerMedia.sourceIdKey_) final  String? sourceId;
/// queueItemId
@override@JsonKey(name: MusicAssistantPlayerMedia.queueItemIdKey_) final  String? queueItemId;
/// customData
 final  Map<String, MusicAssistantAny>? _customData;
/// customData
@override@JsonKey(name: MusicAssistantPlayerMedia.customDataKey_) Map<String, MusicAssistantAny>? get customData {
  final value = _customData;
  if (value == null) return null;
  if (_customData is EqualUnmodifiableMapView) return _customData;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

/// elapsedTime
@override@JsonKey(name: MusicAssistantPlayerMedia.elapsedTimeKey_) final  int? elapsedTime;
/// elapsedTimeLastUpdated
@override@JsonKey(name: MusicAssistantPlayerMedia.elapsedTimeLastUpdatedKey_) final  double? elapsedTimeLastUpdated;

/// Create a copy of MusicAssistantPlayerMedia
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantPlayerMediaCopyWith<_MusicAssistantPlayerMedia> get copyWith => __$MusicAssistantPlayerMediaCopyWithImpl<_MusicAssistantPlayerMedia>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantPlayerMediaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantPlayerMedia&&(identical(other.uri, uri) || other.uri == uri)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.title, title) || other.title == title)&&(identical(other.artist, artist) || other.artist == artist)&&(identical(other.album, album) || other.album == album)&&(identical(other.albumArtist, albumArtist) || other.albumArtist == albumArtist)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.palette, palette) || other.palette == palette)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.streamDuration, streamDuration) || other.streamDuration == streamDuration)&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId)&&(identical(other.queueItemId, queueItemId) || other.queueItemId == queueItemId)&&const DeepCollectionEquality().equals(other._customData, _customData)&&(identical(other.elapsedTime, elapsedTime) || other.elapsedTime == elapsedTime)&&(identical(other.elapsedTimeLastUpdated, elapsedTimeLastUpdated) || other.elapsedTimeLastUpdated == elapsedTimeLastUpdated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uri,mediaType,title,artist,album,albumArtist,imageUrl,palette,duration,streamDuration,sourceId,queueItemId,const DeepCollectionEquality().hash(_customData),elapsedTime,elapsedTimeLastUpdated);

@override
String toString() {
  return 'MusicAssistantPlayerMedia(uri: $uri, mediaType: $mediaType, title: $title, artist: $artist, album: $album, albumArtist: $albumArtist, imageUrl: $imageUrl, palette: $palette, duration: $duration, streamDuration: $streamDuration, sourceId: $sourceId, queueItemId: $queueItemId, customData: $customData, elapsedTime: $elapsedTime, elapsedTimeLastUpdated: $elapsedTimeLastUpdated)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantPlayerMediaCopyWith<$Res> implements $MusicAssistantPlayerMediaCopyWith<$Res> {
  factory _$MusicAssistantPlayerMediaCopyWith(_MusicAssistantPlayerMedia value, $Res Function(_MusicAssistantPlayerMedia) _then) = __$MusicAssistantPlayerMediaCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantPlayerMedia.uriKey_) String uri,@JsonKey(name: MusicAssistantPlayerMedia.mediaTypeKey_) MusicAssistantMediaType mediaType,@JsonKey(name: MusicAssistantPlayerMedia.titleKey_) String? title,@JsonKey(name: MusicAssistantPlayerMedia.artistKey_) String? artist,@JsonKey(name: MusicAssistantPlayerMedia.albumKey_) String? album,@JsonKey(name: MusicAssistantPlayerMedia.albumArtistKey_) String? albumArtist,@JsonKey(name: MusicAssistantPlayerMedia.imageUrlKey_) String? imageUrl,@JsonKey(name: MusicAssistantPlayerMedia.paletteKey_) MusicAssistantMediaItemPalette? palette,@JsonKey(name: MusicAssistantPlayerMedia.durationKey_) int? duration,@JsonKey(name: MusicAssistantPlayerMedia.streamDurationKey_) int? streamDuration,@JsonKey(name: MusicAssistantPlayerMedia.sourceIdKey_) String? sourceId,@JsonKey(name: MusicAssistantPlayerMedia.queueItemIdKey_) String? queueItemId,@JsonKey(name: MusicAssistantPlayerMedia.customDataKey_) Map<String, MusicAssistantAny>? customData,@JsonKey(name: MusicAssistantPlayerMedia.elapsedTimeKey_) int? elapsedTime,@JsonKey(name: MusicAssistantPlayerMedia.elapsedTimeLastUpdatedKey_) double? elapsedTimeLastUpdated
});


@override $MusicAssistantMediaItemPaletteCopyWith<$Res>? get palette;

}
/// @nodoc
class __$MusicAssistantPlayerMediaCopyWithImpl<$Res>
    implements _$MusicAssistantPlayerMediaCopyWith<$Res> {
  __$MusicAssistantPlayerMediaCopyWithImpl(this._self, this._then);

  final _MusicAssistantPlayerMedia _self;
  final $Res Function(_MusicAssistantPlayerMedia) _then;

/// Create a copy of MusicAssistantPlayerMedia
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uri = null,Object? mediaType = null,Object? title = freezed,Object? artist = freezed,Object? album = freezed,Object? albumArtist = freezed,Object? imageUrl = freezed,Object? palette = freezed,Object? duration = freezed,Object? streamDuration = freezed,Object? sourceId = freezed,Object? queueItemId = freezed,Object? customData = freezed,Object? elapsedTime = freezed,Object? elapsedTimeLastUpdated = freezed,}) {
  return _then(_MusicAssistantPlayerMedia(
uri: null == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as String,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as MusicAssistantMediaType,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,artist: freezed == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as String?,album: freezed == album ? _self.album : album // ignore: cast_nullable_to_non_nullable
as String?,albumArtist: freezed == albumArtist ? _self.albumArtist : albumArtist // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,palette: freezed == palette ? _self.palette : palette // ignore: cast_nullable_to_non_nullable
as MusicAssistantMediaItemPalette?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int?,streamDuration: freezed == streamDuration ? _self.streamDuration : streamDuration // ignore: cast_nullable_to_non_nullable
as int?,sourceId: freezed == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String?,queueItemId: freezed == queueItemId ? _self.queueItemId : queueItemId // ignore: cast_nullable_to_non_nullable
as String?,customData: freezed == customData ? _self._customData : customData // ignore: cast_nullable_to_non_nullable
as Map<String, MusicAssistantAny>?,elapsedTime: freezed == elapsedTime ? _self.elapsedTime : elapsedTime // ignore: cast_nullable_to_non_nullable
as int?,elapsedTimeLastUpdated: freezed == elapsedTimeLastUpdated ? _self.elapsedTimeLastUpdated : elapsedTimeLastUpdated // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

/// Create a copy of MusicAssistantPlayerMedia
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantMediaItemPaletteCopyWith<$Res>? get palette {
    if (_self.palette == null) {
    return null;
  }

  return $MusicAssistantMediaItemPaletteCopyWith<$Res>(_self.palette!, (value) {
    return _then(_self.copyWith(palette: value));
  });
}
}

// dart format on
