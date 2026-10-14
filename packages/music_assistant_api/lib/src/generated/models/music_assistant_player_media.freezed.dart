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

/// palette
@JsonKey(name: MusicAssistantPlayerMedia.paletteKey_) MusicAssistantMediaItemPalette? get palette;/// imageUrl
@JsonKey(name: MusicAssistantPlayerMedia.imageUrlKey_) String? get imageUrl;/// duration
@JsonKey(name: MusicAssistantPlayerMedia.durationKey_) int? get duration;/// title
@JsonKey(name: MusicAssistantPlayerMedia.titleKey_) String? get title;/// artist
@JsonKey(name: MusicAssistantPlayerMedia.artistKey_) String? get artist;/// mediaType
@JsonKey(name: MusicAssistantPlayerMedia.mediaTypeKey_) MusicAssistantMediaType get mediaType;/// uri
@JsonKey(name: MusicAssistantPlayerMedia.uriKey_) String get uri;/// album
@JsonKey(name: MusicAssistantPlayerMedia.albumKey_) String? get album;
/// Create a copy of MusicAssistantPlayerMedia
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantPlayerMediaCopyWith<MusicAssistantPlayerMedia> get copyWith => _$MusicAssistantPlayerMediaCopyWithImpl<MusicAssistantPlayerMedia>(this as MusicAssistantPlayerMedia, _$identity);

  /// Serializes this MusicAssistantPlayerMedia to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantPlayerMedia&&(identical(other.palette, palette) || other.palette == palette)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.title, title) || other.title == title)&&(identical(other.artist, artist) || other.artist == artist)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.uri, uri) || other.uri == uri)&&(identical(other.album, album) || other.album == album));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,palette,imageUrl,duration,title,artist,mediaType,uri,album);

@override
String toString() {
  return 'MusicAssistantPlayerMedia(palette: $palette, imageUrl: $imageUrl, duration: $duration, title: $title, artist: $artist, mediaType: $mediaType, uri: $uri, album: $album)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantPlayerMediaCopyWith<$Res>  {
  factory $MusicAssistantPlayerMediaCopyWith(MusicAssistantPlayerMedia value, $Res Function(MusicAssistantPlayerMedia) _then) = _$MusicAssistantPlayerMediaCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantPlayerMedia.paletteKey_) MusicAssistantMediaItemPalette? palette,@JsonKey(name: MusicAssistantPlayerMedia.imageUrlKey_) String? imageUrl,@JsonKey(name: MusicAssistantPlayerMedia.durationKey_) int? duration,@JsonKey(name: MusicAssistantPlayerMedia.titleKey_) String? title,@JsonKey(name: MusicAssistantPlayerMedia.artistKey_) String? artist,@JsonKey(name: MusicAssistantPlayerMedia.mediaTypeKey_) MusicAssistantMediaType mediaType,@JsonKey(name: MusicAssistantPlayerMedia.uriKey_) String uri,@JsonKey(name: MusicAssistantPlayerMedia.albumKey_) String? album
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
@pragma('vm:prefer-inline') @override $Res call({Object? palette = freezed,Object? imageUrl = freezed,Object? duration = freezed,Object? title = freezed,Object? artist = freezed,Object? mediaType = null,Object? uri = null,Object? album = freezed,}) {
  return _then(_self.copyWith(
palette: freezed == palette ? _self.palette : palette // ignore: cast_nullable_to_non_nullable
as MusicAssistantMediaItemPalette?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,artist: freezed == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as String?,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as MusicAssistantMediaType,uri: null == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as String,album: freezed == album ? _self.album : album // ignore: cast_nullable_to_non_nullable
as String?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantPlayerMedia.paletteKey_)  MusicAssistantMediaItemPalette? palette, @JsonKey(name: MusicAssistantPlayerMedia.imageUrlKey_)  String? imageUrl, @JsonKey(name: MusicAssistantPlayerMedia.durationKey_)  int? duration, @JsonKey(name: MusicAssistantPlayerMedia.titleKey_)  String? title, @JsonKey(name: MusicAssistantPlayerMedia.artistKey_)  String? artist, @JsonKey(name: MusicAssistantPlayerMedia.mediaTypeKey_)  MusicAssistantMediaType mediaType, @JsonKey(name: MusicAssistantPlayerMedia.uriKey_)  String uri, @JsonKey(name: MusicAssistantPlayerMedia.albumKey_)  String? album)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantPlayerMedia() when $default != null:
return $default(_that.palette,_that.imageUrl,_that.duration,_that.title,_that.artist,_that.mediaType,_that.uri,_that.album);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantPlayerMedia.paletteKey_)  MusicAssistantMediaItemPalette? palette, @JsonKey(name: MusicAssistantPlayerMedia.imageUrlKey_)  String? imageUrl, @JsonKey(name: MusicAssistantPlayerMedia.durationKey_)  int? duration, @JsonKey(name: MusicAssistantPlayerMedia.titleKey_)  String? title, @JsonKey(name: MusicAssistantPlayerMedia.artistKey_)  String? artist, @JsonKey(name: MusicAssistantPlayerMedia.mediaTypeKey_)  MusicAssistantMediaType mediaType, @JsonKey(name: MusicAssistantPlayerMedia.uriKey_)  String uri, @JsonKey(name: MusicAssistantPlayerMedia.albumKey_)  String? album)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantPlayerMedia():
return $default(_that.palette,_that.imageUrl,_that.duration,_that.title,_that.artist,_that.mediaType,_that.uri,_that.album);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantPlayerMedia.paletteKey_)  MusicAssistantMediaItemPalette? palette, @JsonKey(name: MusicAssistantPlayerMedia.imageUrlKey_)  String? imageUrl, @JsonKey(name: MusicAssistantPlayerMedia.durationKey_)  int? duration, @JsonKey(name: MusicAssistantPlayerMedia.titleKey_)  String? title, @JsonKey(name: MusicAssistantPlayerMedia.artistKey_)  String? artist, @JsonKey(name: MusicAssistantPlayerMedia.mediaTypeKey_)  MusicAssistantMediaType mediaType, @JsonKey(name: MusicAssistantPlayerMedia.uriKey_)  String uri, @JsonKey(name: MusicAssistantPlayerMedia.albumKey_)  String? album)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantPlayerMedia() when $default != null:
return $default(_that.palette,_that.imageUrl,_that.duration,_that.title,_that.artist,_that.mediaType,_that.uri,_that.album);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantPlayerMedia extends MusicAssistantPlayerMedia {
  const _MusicAssistantPlayerMedia({@JsonKey(name: MusicAssistantPlayerMedia.paletteKey_) this.palette, @JsonKey(name: MusicAssistantPlayerMedia.imageUrlKey_) this.imageUrl, @JsonKey(name: MusicAssistantPlayerMedia.durationKey_) this.duration, @JsonKey(name: MusicAssistantPlayerMedia.titleKey_) this.title, @JsonKey(name: MusicAssistantPlayerMedia.artistKey_) this.artist, @JsonKey(name: MusicAssistantPlayerMedia.mediaTypeKey_) this.mediaType = MusicAssistantMediaType.unknown, @JsonKey(name: MusicAssistantPlayerMedia.uriKey_) required this.uri, @JsonKey(name: MusicAssistantPlayerMedia.albumKey_) this.album}): super._();
  factory _MusicAssistantPlayerMedia.fromJson(Map<String, dynamic> json) => _$MusicAssistantPlayerMediaFromJson(json);

/// palette
@override@JsonKey(name: MusicAssistantPlayerMedia.paletteKey_) final  MusicAssistantMediaItemPalette? palette;
/// imageUrl
@override@JsonKey(name: MusicAssistantPlayerMedia.imageUrlKey_) final  String? imageUrl;
/// duration
@override@JsonKey(name: MusicAssistantPlayerMedia.durationKey_) final  int? duration;
/// title
@override@JsonKey(name: MusicAssistantPlayerMedia.titleKey_) final  String? title;
/// artist
@override@JsonKey(name: MusicAssistantPlayerMedia.artistKey_) final  String? artist;
/// mediaType
@override@JsonKey(name: MusicAssistantPlayerMedia.mediaTypeKey_) final  MusicAssistantMediaType mediaType;
/// uri
@override@JsonKey(name: MusicAssistantPlayerMedia.uriKey_) final  String uri;
/// album
@override@JsonKey(name: MusicAssistantPlayerMedia.albumKey_) final  String? album;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantPlayerMedia&&(identical(other.palette, palette) || other.palette == palette)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.title, title) || other.title == title)&&(identical(other.artist, artist) || other.artist == artist)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.uri, uri) || other.uri == uri)&&(identical(other.album, album) || other.album == album));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,palette,imageUrl,duration,title,artist,mediaType,uri,album);

@override
String toString() {
  return 'MusicAssistantPlayerMedia(palette: $palette, imageUrl: $imageUrl, duration: $duration, title: $title, artist: $artist, mediaType: $mediaType, uri: $uri, album: $album)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantPlayerMediaCopyWith<$Res> implements $MusicAssistantPlayerMediaCopyWith<$Res> {
  factory _$MusicAssistantPlayerMediaCopyWith(_MusicAssistantPlayerMedia value, $Res Function(_MusicAssistantPlayerMedia) _then) = __$MusicAssistantPlayerMediaCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantPlayerMedia.paletteKey_) MusicAssistantMediaItemPalette? palette,@JsonKey(name: MusicAssistantPlayerMedia.imageUrlKey_) String? imageUrl,@JsonKey(name: MusicAssistantPlayerMedia.durationKey_) int? duration,@JsonKey(name: MusicAssistantPlayerMedia.titleKey_) String? title,@JsonKey(name: MusicAssistantPlayerMedia.artistKey_) String? artist,@JsonKey(name: MusicAssistantPlayerMedia.mediaTypeKey_) MusicAssistantMediaType mediaType,@JsonKey(name: MusicAssistantPlayerMedia.uriKey_) String uri,@JsonKey(name: MusicAssistantPlayerMedia.albumKey_) String? album
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
@override @pragma('vm:prefer-inline') $Res call({Object? palette = freezed,Object? imageUrl = freezed,Object? duration = freezed,Object? title = freezed,Object? artist = freezed,Object? mediaType = null,Object? uri = null,Object? album = freezed,}) {
  return _then(_MusicAssistantPlayerMedia(
palette: freezed == palette ? _self.palette : palette // ignore: cast_nullable_to_non_nullable
as MusicAssistantMediaItemPalette?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,artist: freezed == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as String?,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as MusicAssistantMediaType,uri: null == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as String,album: freezed == album ? _self.album : album // ignore: cast_nullable_to_non_nullable
as String?,
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
