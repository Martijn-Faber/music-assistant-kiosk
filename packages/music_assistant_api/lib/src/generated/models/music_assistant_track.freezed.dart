// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_track.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantTrack {

/// album
@JsonKey(name: MusicAssistantTrack.albumKey_) MusicAssistantTrackAlbum? get album;/// artists
@JsonKey(name: MusicAssistantTrack.artistsKey_) List<MusicAssistantTrackArtistsItem>? get artists;/// itemId
@JsonKey(name: MusicAssistantTrack.itemIdKey_) String get itemId;/// provider
@JsonKey(name: MusicAssistantTrack.providerKey_) String get provider;/// metadata
@JsonKey(name: MusicAssistantTrack.metadataKey_) MusicAssistantMediaItemMetadata? get metadata;/// duration
@JsonKey(name: MusicAssistantTrack.durationKey_) int get duration;/// name
@JsonKey(name: MusicAssistantTrack.nameKey_) String get name;/// mediaType
@JsonKey(name: MusicAssistantTrack.mediaTypeKey_) MusicAssistantMediaType get mediaType;/// uri
@JsonKey(name: MusicAssistantTrack.uriKey_) String? get uri;/// favorite
@JsonKey(name: MusicAssistantTrack.favoriteKey_) bool get favorite;
/// Create a copy of MusicAssistantTrack
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantTrackCopyWith<MusicAssistantTrack> get copyWith => _$MusicAssistantTrackCopyWithImpl<MusicAssistantTrack>(this as MusicAssistantTrack, _$identity);

  /// Serializes this MusicAssistantTrack to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantTrack&&(identical(other.album, album) || other.album == album)&&const DeepCollectionEquality().equals(other.artists, artists)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.name, name) || other.name == name)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.uri, uri) || other.uri == uri)&&(identical(other.favorite, favorite) || other.favorite == favorite));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,album,const DeepCollectionEquality().hash(artists),itemId,provider,metadata,duration,name,mediaType,uri,favorite);

@override
String toString() {
  return 'MusicAssistantTrack(album: $album, artists: $artists, itemId: $itemId, provider: $provider, metadata: $metadata, duration: $duration, name: $name, mediaType: $mediaType, uri: $uri, favorite: $favorite)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantTrackCopyWith<$Res>  {
  factory $MusicAssistantTrackCopyWith(MusicAssistantTrack value, $Res Function(MusicAssistantTrack) _then) = _$MusicAssistantTrackCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantTrack.albumKey_) MusicAssistantTrackAlbum? album,@JsonKey(name: MusicAssistantTrack.artistsKey_) List<MusicAssistantTrackArtistsItem>? artists,@JsonKey(name: MusicAssistantTrack.itemIdKey_) String itemId,@JsonKey(name: MusicAssistantTrack.providerKey_) String provider,@JsonKey(name: MusicAssistantTrack.metadataKey_) MusicAssistantMediaItemMetadata? metadata,@JsonKey(name: MusicAssistantTrack.durationKey_) int duration,@JsonKey(name: MusicAssistantTrack.nameKey_) String name,@JsonKey(name: MusicAssistantTrack.mediaTypeKey_) MusicAssistantMediaType mediaType,@JsonKey(name: MusicAssistantTrack.uriKey_) String? uri,@JsonKey(name: MusicAssistantTrack.favoriteKey_) bool favorite
});


$MusicAssistantTrackAlbumCopyWith<$Res>? get album;$MusicAssistantMediaItemMetadataCopyWith<$Res>? get metadata;

}
/// @nodoc
class _$MusicAssistantTrackCopyWithImpl<$Res>
    implements $MusicAssistantTrackCopyWith<$Res> {
  _$MusicAssistantTrackCopyWithImpl(this._self, this._then);

  final MusicAssistantTrack _self;
  final $Res Function(MusicAssistantTrack) _then;

/// Create a copy of MusicAssistantTrack
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? album = freezed,Object? artists = freezed,Object? itemId = null,Object? provider = null,Object? metadata = freezed,Object? duration = null,Object? name = null,Object? mediaType = null,Object? uri = freezed,Object? favorite = null,}) {
  return _then(_self.copyWith(
album: freezed == album ? _self.album : album // ignore: cast_nullable_to_non_nullable
as MusicAssistantTrackAlbum?,artists: freezed == artists ? _self.artists : artists // ignore: cast_nullable_to_non_nullable
as List<MusicAssistantTrackArtistsItem>?,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as MusicAssistantMediaItemMetadata?,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as MusicAssistantMediaType,uri: freezed == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as String?,favorite: null == favorite ? _self.favorite : favorite // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of MusicAssistantTrack
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantTrackAlbumCopyWith<$Res>? get album {
    if (_self.album == null) {
    return null;
  }

  return $MusicAssistantTrackAlbumCopyWith<$Res>(_self.album!, (value) {
    return _then(_self.copyWith(album: value));
  });
}/// Create a copy of MusicAssistantTrack
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantMediaItemMetadataCopyWith<$Res>? get metadata {
    if (_self.metadata == null) {
    return null;
  }

  return $MusicAssistantMediaItemMetadataCopyWith<$Res>(_self.metadata!, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}


/// Adds pattern-matching-related methods to [MusicAssistantTrack].
extension MusicAssistantTrackPatterns on MusicAssistantTrack {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantTrack value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantTrack() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantTrack value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantTrack():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantTrack value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantTrack() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantTrack.albumKey_)  MusicAssistantTrackAlbum? album, @JsonKey(name: MusicAssistantTrack.artistsKey_)  List<MusicAssistantTrackArtistsItem>? artists, @JsonKey(name: MusicAssistantTrack.itemIdKey_)  String itemId, @JsonKey(name: MusicAssistantTrack.providerKey_)  String provider, @JsonKey(name: MusicAssistantTrack.metadataKey_)  MusicAssistantMediaItemMetadata? metadata, @JsonKey(name: MusicAssistantTrack.durationKey_)  int duration, @JsonKey(name: MusicAssistantTrack.nameKey_)  String name, @JsonKey(name: MusicAssistantTrack.mediaTypeKey_)  MusicAssistantMediaType mediaType, @JsonKey(name: MusicAssistantTrack.uriKey_)  String? uri, @JsonKey(name: MusicAssistantTrack.favoriteKey_)  bool favorite)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantTrack() when $default != null:
return $default(_that.album,_that.artists,_that.itemId,_that.provider,_that.metadata,_that.duration,_that.name,_that.mediaType,_that.uri,_that.favorite);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantTrack.albumKey_)  MusicAssistantTrackAlbum? album, @JsonKey(name: MusicAssistantTrack.artistsKey_)  List<MusicAssistantTrackArtistsItem>? artists, @JsonKey(name: MusicAssistantTrack.itemIdKey_)  String itemId, @JsonKey(name: MusicAssistantTrack.providerKey_)  String provider, @JsonKey(name: MusicAssistantTrack.metadataKey_)  MusicAssistantMediaItemMetadata? metadata, @JsonKey(name: MusicAssistantTrack.durationKey_)  int duration, @JsonKey(name: MusicAssistantTrack.nameKey_)  String name, @JsonKey(name: MusicAssistantTrack.mediaTypeKey_)  MusicAssistantMediaType mediaType, @JsonKey(name: MusicAssistantTrack.uriKey_)  String? uri, @JsonKey(name: MusicAssistantTrack.favoriteKey_)  bool favorite)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantTrack():
return $default(_that.album,_that.artists,_that.itemId,_that.provider,_that.metadata,_that.duration,_that.name,_that.mediaType,_that.uri,_that.favorite);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantTrack.albumKey_)  MusicAssistantTrackAlbum? album, @JsonKey(name: MusicAssistantTrack.artistsKey_)  List<MusicAssistantTrackArtistsItem>? artists, @JsonKey(name: MusicAssistantTrack.itemIdKey_)  String itemId, @JsonKey(name: MusicAssistantTrack.providerKey_)  String provider, @JsonKey(name: MusicAssistantTrack.metadataKey_)  MusicAssistantMediaItemMetadata? metadata, @JsonKey(name: MusicAssistantTrack.durationKey_)  int duration, @JsonKey(name: MusicAssistantTrack.nameKey_)  String name, @JsonKey(name: MusicAssistantTrack.mediaTypeKey_)  MusicAssistantMediaType mediaType, @JsonKey(name: MusicAssistantTrack.uriKey_)  String? uri, @JsonKey(name: MusicAssistantTrack.favoriteKey_)  bool favorite)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantTrack() when $default != null:
return $default(_that.album,_that.artists,_that.itemId,_that.provider,_that.metadata,_that.duration,_that.name,_that.mediaType,_that.uri,_that.favorite);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantTrack extends MusicAssistantTrack {
  const _MusicAssistantTrack({@JsonKey(name: MusicAssistantTrack.albumKey_) this.album, @JsonKey(name: MusicAssistantTrack.artistsKey_) final  List<MusicAssistantTrackArtistsItem>? artists, @JsonKey(name: MusicAssistantTrack.itemIdKey_) required this.itemId, @JsonKey(name: MusicAssistantTrack.providerKey_) required this.provider, @JsonKey(name: MusicAssistantTrack.metadataKey_) this.metadata, @JsonKey(name: MusicAssistantTrack.durationKey_) this.duration = 0, @JsonKey(name: MusicAssistantTrack.nameKey_) required this.name, @JsonKey(name: MusicAssistantTrack.mediaTypeKey_) this.mediaType = MusicAssistantMediaType.track, @JsonKey(name: MusicAssistantTrack.uriKey_) this.uri, @JsonKey(name: MusicAssistantTrack.favoriteKey_) this.favorite = false}): _artists = artists,super._();
  factory _MusicAssistantTrack.fromJson(Map<String, dynamic> json) => _$MusicAssistantTrackFromJson(json);

/// album
@override@JsonKey(name: MusicAssistantTrack.albumKey_) final  MusicAssistantTrackAlbum? album;
/// artists
 final  List<MusicAssistantTrackArtistsItem>? _artists;
/// artists
@override@JsonKey(name: MusicAssistantTrack.artistsKey_) List<MusicAssistantTrackArtistsItem>? get artists {
  final value = _artists;
  if (value == null) return null;
  if (_artists is EqualUnmodifiableListView) return _artists;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// itemId
@override@JsonKey(name: MusicAssistantTrack.itemIdKey_) final  String itemId;
/// provider
@override@JsonKey(name: MusicAssistantTrack.providerKey_) final  String provider;
/// metadata
@override@JsonKey(name: MusicAssistantTrack.metadataKey_) final  MusicAssistantMediaItemMetadata? metadata;
/// duration
@override@JsonKey(name: MusicAssistantTrack.durationKey_) final  int duration;
/// name
@override@JsonKey(name: MusicAssistantTrack.nameKey_) final  String name;
/// mediaType
@override@JsonKey(name: MusicAssistantTrack.mediaTypeKey_) final  MusicAssistantMediaType mediaType;
/// uri
@override@JsonKey(name: MusicAssistantTrack.uriKey_) final  String? uri;
/// favorite
@override@JsonKey(name: MusicAssistantTrack.favoriteKey_) final  bool favorite;

/// Create a copy of MusicAssistantTrack
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantTrackCopyWith<_MusicAssistantTrack> get copyWith => __$MusicAssistantTrackCopyWithImpl<_MusicAssistantTrack>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantTrackToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantTrack&&(identical(other.album, album) || other.album == album)&&const DeepCollectionEquality().equals(other._artists, _artists)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.name, name) || other.name == name)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.uri, uri) || other.uri == uri)&&(identical(other.favorite, favorite) || other.favorite == favorite));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,album,const DeepCollectionEquality().hash(_artists),itemId,provider,metadata,duration,name,mediaType,uri,favorite);

@override
String toString() {
  return 'MusicAssistantTrack(album: $album, artists: $artists, itemId: $itemId, provider: $provider, metadata: $metadata, duration: $duration, name: $name, mediaType: $mediaType, uri: $uri, favorite: $favorite)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantTrackCopyWith<$Res> implements $MusicAssistantTrackCopyWith<$Res> {
  factory _$MusicAssistantTrackCopyWith(_MusicAssistantTrack value, $Res Function(_MusicAssistantTrack) _then) = __$MusicAssistantTrackCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantTrack.albumKey_) MusicAssistantTrackAlbum? album,@JsonKey(name: MusicAssistantTrack.artistsKey_) List<MusicAssistantTrackArtistsItem>? artists,@JsonKey(name: MusicAssistantTrack.itemIdKey_) String itemId,@JsonKey(name: MusicAssistantTrack.providerKey_) String provider,@JsonKey(name: MusicAssistantTrack.metadataKey_) MusicAssistantMediaItemMetadata? metadata,@JsonKey(name: MusicAssistantTrack.durationKey_) int duration,@JsonKey(name: MusicAssistantTrack.nameKey_) String name,@JsonKey(name: MusicAssistantTrack.mediaTypeKey_) MusicAssistantMediaType mediaType,@JsonKey(name: MusicAssistantTrack.uriKey_) String? uri,@JsonKey(name: MusicAssistantTrack.favoriteKey_) bool favorite
});


@override $MusicAssistantTrackAlbumCopyWith<$Res>? get album;@override $MusicAssistantMediaItemMetadataCopyWith<$Res>? get metadata;

}
/// @nodoc
class __$MusicAssistantTrackCopyWithImpl<$Res>
    implements _$MusicAssistantTrackCopyWith<$Res> {
  __$MusicAssistantTrackCopyWithImpl(this._self, this._then);

  final _MusicAssistantTrack _self;
  final $Res Function(_MusicAssistantTrack) _then;

/// Create a copy of MusicAssistantTrack
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? album = freezed,Object? artists = freezed,Object? itemId = null,Object? provider = null,Object? metadata = freezed,Object? duration = null,Object? name = null,Object? mediaType = null,Object? uri = freezed,Object? favorite = null,}) {
  return _then(_MusicAssistantTrack(
album: freezed == album ? _self.album : album // ignore: cast_nullable_to_non_nullable
as MusicAssistantTrackAlbum?,artists: freezed == artists ? _self._artists : artists // ignore: cast_nullable_to_non_nullable
as List<MusicAssistantTrackArtistsItem>?,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as MusicAssistantMediaItemMetadata?,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as MusicAssistantMediaType,uri: freezed == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as String?,favorite: null == favorite ? _self.favorite : favorite // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of MusicAssistantTrack
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantTrackAlbumCopyWith<$Res>? get album {
    if (_self.album == null) {
    return null;
  }

  return $MusicAssistantTrackAlbumCopyWith<$Res>(_self.album!, (value) {
    return _then(_self.copyWith(album: value));
  });
}/// Create a copy of MusicAssistantTrack
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantMediaItemMetadataCopyWith<$Res>? get metadata {
    if (_self.metadata == null) {
    return null;
  }

  return $MusicAssistantMediaItemMetadataCopyWith<$Res>(_self.metadata!, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}

// dart format on
