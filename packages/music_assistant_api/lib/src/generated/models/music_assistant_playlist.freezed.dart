// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_playlist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantPlaylist {

/// owner
@JsonKey(name: MusicAssistantPlaylist.ownerKey_) String get owner;/// favorite
@JsonKey(name: MusicAssistantPlaylist.favoriteKey_) bool get favorite;/// metadata
@JsonKey(name: MusicAssistantPlaylist.metadataKey_) MusicAssistantMediaItemMetadata? get metadata;/// itemId
@JsonKey(name: MusicAssistantPlaylist.itemIdKey_) String get itemId;/// provider
@JsonKey(name: MusicAssistantPlaylist.providerKey_) String get provider;/// name
@JsonKey(name: MusicAssistantPlaylist.nameKey_) String get name;/// uri
@JsonKey(name: MusicAssistantPlaylist.uriKey_) String? get uri;/// mediaType
@JsonKey(name: MusicAssistantPlaylist.mediaTypeKey_) MusicAssistantMediaType get mediaType;
/// Create a copy of MusicAssistantPlaylist
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantPlaylistCopyWith<MusicAssistantPlaylist> get copyWith => _$MusicAssistantPlaylistCopyWithImpl<MusicAssistantPlaylist>(this as MusicAssistantPlaylist, _$identity);

  /// Serializes this MusicAssistantPlaylist to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantPlaylist&&(identical(other.owner, owner) || other.owner == owner)&&(identical(other.favorite, favorite) || other.favorite == favorite)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.name, name) || other.name == name)&&(identical(other.uri, uri) || other.uri == uri)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,owner,favorite,metadata,itemId,provider,name,uri,mediaType);

@override
String toString() {
  return 'MusicAssistantPlaylist(owner: $owner, favorite: $favorite, metadata: $metadata, itemId: $itemId, provider: $provider, name: $name, uri: $uri, mediaType: $mediaType)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantPlaylistCopyWith<$Res>  {
  factory $MusicAssistantPlaylistCopyWith(MusicAssistantPlaylist value, $Res Function(MusicAssistantPlaylist) _then) = _$MusicAssistantPlaylistCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantPlaylist.ownerKey_) String owner,@JsonKey(name: MusicAssistantPlaylist.favoriteKey_) bool favorite,@JsonKey(name: MusicAssistantPlaylist.metadataKey_) MusicAssistantMediaItemMetadata? metadata,@JsonKey(name: MusicAssistantPlaylist.itemIdKey_) String itemId,@JsonKey(name: MusicAssistantPlaylist.providerKey_) String provider,@JsonKey(name: MusicAssistantPlaylist.nameKey_) String name,@JsonKey(name: MusicAssistantPlaylist.uriKey_) String? uri,@JsonKey(name: MusicAssistantPlaylist.mediaTypeKey_) MusicAssistantMediaType mediaType
});


$MusicAssistantMediaItemMetadataCopyWith<$Res>? get metadata;

}
/// @nodoc
class _$MusicAssistantPlaylistCopyWithImpl<$Res>
    implements $MusicAssistantPlaylistCopyWith<$Res> {
  _$MusicAssistantPlaylistCopyWithImpl(this._self, this._then);

  final MusicAssistantPlaylist _self;
  final $Res Function(MusicAssistantPlaylist) _then;

/// Create a copy of MusicAssistantPlaylist
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? owner = null,Object? favorite = null,Object? metadata = freezed,Object? itemId = null,Object? provider = null,Object? name = null,Object? uri = freezed,Object? mediaType = null,}) {
  return _then(_self.copyWith(
owner: null == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as String,favorite: null == favorite ? _self.favorite : favorite // ignore: cast_nullable_to_non_nullable
as bool,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as MusicAssistantMediaItemMetadata?,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,uri: freezed == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as String?,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as MusicAssistantMediaType,
  ));
}
/// Create a copy of MusicAssistantPlaylist
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


/// Adds pattern-matching-related methods to [MusicAssistantPlaylist].
extension MusicAssistantPlaylistPatterns on MusicAssistantPlaylist {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantPlaylist value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantPlaylist() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantPlaylist value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantPlaylist():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantPlaylist value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantPlaylist() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantPlaylist.ownerKey_)  String owner, @JsonKey(name: MusicAssistantPlaylist.favoriteKey_)  bool favorite, @JsonKey(name: MusicAssistantPlaylist.metadataKey_)  MusicAssistantMediaItemMetadata? metadata, @JsonKey(name: MusicAssistantPlaylist.itemIdKey_)  String itemId, @JsonKey(name: MusicAssistantPlaylist.providerKey_)  String provider, @JsonKey(name: MusicAssistantPlaylist.nameKey_)  String name, @JsonKey(name: MusicAssistantPlaylist.uriKey_)  String? uri, @JsonKey(name: MusicAssistantPlaylist.mediaTypeKey_)  MusicAssistantMediaType mediaType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantPlaylist() when $default != null:
return $default(_that.owner,_that.favorite,_that.metadata,_that.itemId,_that.provider,_that.name,_that.uri,_that.mediaType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantPlaylist.ownerKey_)  String owner, @JsonKey(name: MusicAssistantPlaylist.favoriteKey_)  bool favorite, @JsonKey(name: MusicAssistantPlaylist.metadataKey_)  MusicAssistantMediaItemMetadata? metadata, @JsonKey(name: MusicAssistantPlaylist.itemIdKey_)  String itemId, @JsonKey(name: MusicAssistantPlaylist.providerKey_)  String provider, @JsonKey(name: MusicAssistantPlaylist.nameKey_)  String name, @JsonKey(name: MusicAssistantPlaylist.uriKey_)  String? uri, @JsonKey(name: MusicAssistantPlaylist.mediaTypeKey_)  MusicAssistantMediaType mediaType)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantPlaylist():
return $default(_that.owner,_that.favorite,_that.metadata,_that.itemId,_that.provider,_that.name,_that.uri,_that.mediaType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantPlaylist.ownerKey_)  String owner, @JsonKey(name: MusicAssistantPlaylist.favoriteKey_)  bool favorite, @JsonKey(name: MusicAssistantPlaylist.metadataKey_)  MusicAssistantMediaItemMetadata? metadata, @JsonKey(name: MusicAssistantPlaylist.itemIdKey_)  String itemId, @JsonKey(name: MusicAssistantPlaylist.providerKey_)  String provider, @JsonKey(name: MusicAssistantPlaylist.nameKey_)  String name, @JsonKey(name: MusicAssistantPlaylist.uriKey_)  String? uri, @JsonKey(name: MusicAssistantPlaylist.mediaTypeKey_)  MusicAssistantMediaType mediaType)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantPlaylist() when $default != null:
return $default(_that.owner,_that.favorite,_that.metadata,_that.itemId,_that.provider,_that.name,_that.uri,_that.mediaType);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantPlaylist extends MusicAssistantPlaylist {
  const _MusicAssistantPlaylist({@JsonKey(name: MusicAssistantPlaylist.ownerKey_) this.owner = '', @JsonKey(name: MusicAssistantPlaylist.favoriteKey_) this.favorite = false, @JsonKey(name: MusicAssistantPlaylist.metadataKey_) this.metadata, @JsonKey(name: MusicAssistantPlaylist.itemIdKey_) required this.itemId, @JsonKey(name: MusicAssistantPlaylist.providerKey_) required this.provider, @JsonKey(name: MusicAssistantPlaylist.nameKey_) required this.name, @JsonKey(name: MusicAssistantPlaylist.uriKey_) this.uri, @JsonKey(name: MusicAssistantPlaylist.mediaTypeKey_) this.mediaType = MusicAssistantMediaType.playlist}): super._();
  factory _MusicAssistantPlaylist.fromJson(Map<String, dynamic> json) => _$MusicAssistantPlaylistFromJson(json);

/// owner
@override@JsonKey(name: MusicAssistantPlaylist.ownerKey_) final  String owner;
/// favorite
@override@JsonKey(name: MusicAssistantPlaylist.favoriteKey_) final  bool favorite;
/// metadata
@override@JsonKey(name: MusicAssistantPlaylist.metadataKey_) final  MusicAssistantMediaItemMetadata? metadata;
/// itemId
@override@JsonKey(name: MusicAssistantPlaylist.itemIdKey_) final  String itemId;
/// provider
@override@JsonKey(name: MusicAssistantPlaylist.providerKey_) final  String provider;
/// name
@override@JsonKey(name: MusicAssistantPlaylist.nameKey_) final  String name;
/// uri
@override@JsonKey(name: MusicAssistantPlaylist.uriKey_) final  String? uri;
/// mediaType
@override@JsonKey(name: MusicAssistantPlaylist.mediaTypeKey_) final  MusicAssistantMediaType mediaType;

/// Create a copy of MusicAssistantPlaylist
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantPlaylistCopyWith<_MusicAssistantPlaylist> get copyWith => __$MusicAssistantPlaylistCopyWithImpl<_MusicAssistantPlaylist>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantPlaylistToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantPlaylist&&(identical(other.owner, owner) || other.owner == owner)&&(identical(other.favorite, favorite) || other.favorite == favorite)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.name, name) || other.name == name)&&(identical(other.uri, uri) || other.uri == uri)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,owner,favorite,metadata,itemId,provider,name,uri,mediaType);

@override
String toString() {
  return 'MusicAssistantPlaylist(owner: $owner, favorite: $favorite, metadata: $metadata, itemId: $itemId, provider: $provider, name: $name, uri: $uri, mediaType: $mediaType)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantPlaylistCopyWith<$Res> implements $MusicAssistantPlaylistCopyWith<$Res> {
  factory _$MusicAssistantPlaylistCopyWith(_MusicAssistantPlaylist value, $Res Function(_MusicAssistantPlaylist) _then) = __$MusicAssistantPlaylistCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantPlaylist.ownerKey_) String owner,@JsonKey(name: MusicAssistantPlaylist.favoriteKey_) bool favorite,@JsonKey(name: MusicAssistantPlaylist.metadataKey_) MusicAssistantMediaItemMetadata? metadata,@JsonKey(name: MusicAssistantPlaylist.itemIdKey_) String itemId,@JsonKey(name: MusicAssistantPlaylist.providerKey_) String provider,@JsonKey(name: MusicAssistantPlaylist.nameKey_) String name,@JsonKey(name: MusicAssistantPlaylist.uriKey_) String? uri,@JsonKey(name: MusicAssistantPlaylist.mediaTypeKey_) MusicAssistantMediaType mediaType
});


@override $MusicAssistantMediaItemMetadataCopyWith<$Res>? get metadata;

}
/// @nodoc
class __$MusicAssistantPlaylistCopyWithImpl<$Res>
    implements _$MusicAssistantPlaylistCopyWith<$Res> {
  __$MusicAssistantPlaylistCopyWithImpl(this._self, this._then);

  final _MusicAssistantPlaylist _self;
  final $Res Function(_MusicAssistantPlaylist) _then;

/// Create a copy of MusicAssistantPlaylist
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? owner = null,Object? favorite = null,Object? metadata = freezed,Object? itemId = null,Object? provider = null,Object? name = null,Object? uri = freezed,Object? mediaType = null,}) {
  return _then(_MusicAssistantPlaylist(
owner: null == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as String,favorite: null == favorite ? _self.favorite : favorite // ignore: cast_nullable_to_non_nullable
as bool,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as MusicAssistantMediaItemMetadata?,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,uri: freezed == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as String?,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as MusicAssistantMediaType,
  ));
}

/// Create a copy of MusicAssistantPlaylist
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
