// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_track_album.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantTrackAlbum {

/// uri
@JsonKey(name: MusicAssistantTrackAlbum.uriKey_) String? get uri;/// imageUrl
@JsonKey(name: MusicAssistantTrackAlbum.imageUrlKey_) String? get imageUrl;/// name
@JsonKey(name: MusicAssistantTrackAlbum.nameKey_) String? get name;
/// Create a copy of MusicAssistantTrackAlbum
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantTrackAlbumCopyWith<MusicAssistantTrackAlbum> get copyWith => _$MusicAssistantTrackAlbumCopyWithImpl<MusicAssistantTrackAlbum>(this as MusicAssistantTrackAlbum, _$identity);

  /// Serializes this MusicAssistantTrackAlbum to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantTrackAlbum&&(identical(other.uri, uri) || other.uri == uri)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uri,imageUrl,name);

@override
String toString() {
  return 'MusicAssistantTrackAlbum(uri: $uri, imageUrl: $imageUrl, name: $name)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantTrackAlbumCopyWith<$Res>  {
  factory $MusicAssistantTrackAlbumCopyWith(MusicAssistantTrackAlbum value, $Res Function(MusicAssistantTrackAlbum) _then) = _$MusicAssistantTrackAlbumCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantTrackAlbum.uriKey_) String? uri,@JsonKey(name: MusicAssistantTrackAlbum.imageUrlKey_) String? imageUrl,@JsonKey(name: MusicAssistantTrackAlbum.nameKey_) String? name
});




}
/// @nodoc
class _$MusicAssistantTrackAlbumCopyWithImpl<$Res>
    implements $MusicAssistantTrackAlbumCopyWith<$Res> {
  _$MusicAssistantTrackAlbumCopyWithImpl(this._self, this._then);

  final MusicAssistantTrackAlbum _self;
  final $Res Function(MusicAssistantTrackAlbum) _then;

/// Create a copy of MusicAssistantTrackAlbum
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uri = freezed,Object? imageUrl = freezed,Object? name = freezed,}) {
  return _then(_self.copyWith(
uri: freezed == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MusicAssistantTrackAlbum].
extension MusicAssistantTrackAlbumPatterns on MusicAssistantTrackAlbum {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantTrackAlbum value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantTrackAlbum() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantTrackAlbum value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantTrackAlbum():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantTrackAlbum value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantTrackAlbum() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantTrackAlbum.uriKey_)  String? uri, @JsonKey(name: MusicAssistantTrackAlbum.imageUrlKey_)  String? imageUrl, @JsonKey(name: MusicAssistantTrackAlbum.nameKey_)  String? name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantTrackAlbum() when $default != null:
return $default(_that.uri,_that.imageUrl,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantTrackAlbum.uriKey_)  String? uri, @JsonKey(name: MusicAssistantTrackAlbum.imageUrlKey_)  String? imageUrl, @JsonKey(name: MusicAssistantTrackAlbum.nameKey_)  String? name)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantTrackAlbum():
return $default(_that.uri,_that.imageUrl,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantTrackAlbum.uriKey_)  String? uri, @JsonKey(name: MusicAssistantTrackAlbum.imageUrlKey_)  String? imageUrl, @JsonKey(name: MusicAssistantTrackAlbum.nameKey_)  String? name)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantTrackAlbum() when $default != null:
return $default(_that.uri,_that.imageUrl,_that.name);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantTrackAlbum extends MusicAssistantTrackAlbum {
  const _MusicAssistantTrackAlbum({@JsonKey(name: MusicAssistantTrackAlbum.uriKey_) this.uri, @JsonKey(name: MusicAssistantTrackAlbum.imageUrlKey_) this.imageUrl, @JsonKey(name: MusicAssistantTrackAlbum.nameKey_) this.name}): super._();
  factory _MusicAssistantTrackAlbum.fromJson(Map<String, dynamic> json) => _$MusicAssistantTrackAlbumFromJson(json);

/// uri
@override@JsonKey(name: MusicAssistantTrackAlbum.uriKey_) final  String? uri;
/// imageUrl
@override@JsonKey(name: MusicAssistantTrackAlbum.imageUrlKey_) final  String? imageUrl;
/// name
@override@JsonKey(name: MusicAssistantTrackAlbum.nameKey_) final  String? name;

/// Create a copy of MusicAssistantTrackAlbum
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantTrackAlbumCopyWith<_MusicAssistantTrackAlbum> get copyWith => __$MusicAssistantTrackAlbumCopyWithImpl<_MusicAssistantTrackAlbum>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantTrackAlbumToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantTrackAlbum&&(identical(other.uri, uri) || other.uri == uri)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uri,imageUrl,name);

@override
String toString() {
  return 'MusicAssistantTrackAlbum(uri: $uri, imageUrl: $imageUrl, name: $name)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantTrackAlbumCopyWith<$Res> implements $MusicAssistantTrackAlbumCopyWith<$Res> {
  factory _$MusicAssistantTrackAlbumCopyWith(_MusicAssistantTrackAlbum value, $Res Function(_MusicAssistantTrackAlbum) _then) = __$MusicAssistantTrackAlbumCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantTrackAlbum.uriKey_) String? uri,@JsonKey(name: MusicAssistantTrackAlbum.imageUrlKey_) String? imageUrl,@JsonKey(name: MusicAssistantTrackAlbum.nameKey_) String? name
});




}
/// @nodoc
class __$MusicAssistantTrackAlbumCopyWithImpl<$Res>
    implements _$MusicAssistantTrackAlbumCopyWith<$Res> {
  __$MusicAssistantTrackAlbumCopyWithImpl(this._self, this._then);

  final _MusicAssistantTrackAlbum _self;
  final $Res Function(_MusicAssistantTrackAlbum) _then;

/// Create a copy of MusicAssistantTrackAlbum
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uri = freezed,Object? imageUrl = freezed,Object? name = freezed,}) {
  return _then(_MusicAssistantTrackAlbum(
uri: freezed == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
