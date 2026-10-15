// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_media_item_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantMediaItemImage {

/// type
@JsonKey(name: MusicAssistantMediaItemImage.typeKey_) MusicAssistantImageType get type;/// path
@JsonKey(name: MusicAssistantMediaItemImage.pathKey_) String get path;/// provider
@JsonKey(name: MusicAssistantMediaItemImage.providerKey_) String get provider;/// remotelyAccessible
@JsonKey(name: MusicAssistantMediaItemImage.remotelyAccessibleKey_) bool get remotelyAccessible;/// proxyId
@JsonKey(name: MusicAssistantMediaItemImage.proxyIdKey_) String? get proxyId;
/// Create a copy of MusicAssistantMediaItemImage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantMediaItemImageCopyWith<MusicAssistantMediaItemImage> get copyWith => _$MusicAssistantMediaItemImageCopyWithImpl<MusicAssistantMediaItemImage>(this as MusicAssistantMediaItemImage, _$identity);

  /// Serializes this MusicAssistantMediaItemImage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantMediaItemImage&&(identical(other.type, type) || other.type == type)&&(identical(other.path, path) || other.path == path)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.remotelyAccessible, remotelyAccessible) || other.remotelyAccessible == remotelyAccessible)&&(identical(other.proxyId, proxyId) || other.proxyId == proxyId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,path,provider,remotelyAccessible,proxyId);

@override
String toString() {
  return 'MusicAssistantMediaItemImage(type: $type, path: $path, provider: $provider, remotelyAccessible: $remotelyAccessible, proxyId: $proxyId)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantMediaItemImageCopyWith<$Res>  {
  factory $MusicAssistantMediaItemImageCopyWith(MusicAssistantMediaItemImage value, $Res Function(MusicAssistantMediaItemImage) _then) = _$MusicAssistantMediaItemImageCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantMediaItemImage.typeKey_) MusicAssistantImageType type,@JsonKey(name: MusicAssistantMediaItemImage.pathKey_) String path,@JsonKey(name: MusicAssistantMediaItemImage.providerKey_) String provider,@JsonKey(name: MusicAssistantMediaItemImage.remotelyAccessibleKey_) bool remotelyAccessible,@JsonKey(name: MusicAssistantMediaItemImage.proxyIdKey_) String? proxyId
});




}
/// @nodoc
class _$MusicAssistantMediaItemImageCopyWithImpl<$Res>
    implements $MusicAssistantMediaItemImageCopyWith<$Res> {
  _$MusicAssistantMediaItemImageCopyWithImpl(this._self, this._then);

  final MusicAssistantMediaItemImage _self;
  final $Res Function(MusicAssistantMediaItemImage) _then;

/// Create a copy of MusicAssistantMediaItemImage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? path = null,Object? provider = null,Object? remotelyAccessible = null,Object? proxyId = freezed,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MusicAssistantImageType,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String,remotelyAccessible: null == remotelyAccessible ? _self.remotelyAccessible : remotelyAccessible // ignore: cast_nullable_to_non_nullable
as bool,proxyId: freezed == proxyId ? _self.proxyId : proxyId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MusicAssistantMediaItemImage].
extension MusicAssistantMediaItemImagePatterns on MusicAssistantMediaItemImage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantMediaItemImage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantMediaItemImage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantMediaItemImage value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantMediaItemImage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantMediaItemImage value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantMediaItemImage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantMediaItemImage.typeKey_)  MusicAssistantImageType type, @JsonKey(name: MusicAssistantMediaItemImage.pathKey_)  String path, @JsonKey(name: MusicAssistantMediaItemImage.providerKey_)  String provider, @JsonKey(name: MusicAssistantMediaItemImage.remotelyAccessibleKey_)  bool remotelyAccessible, @JsonKey(name: MusicAssistantMediaItemImage.proxyIdKey_)  String? proxyId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantMediaItemImage() when $default != null:
return $default(_that.type,_that.path,_that.provider,_that.remotelyAccessible,_that.proxyId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantMediaItemImage.typeKey_)  MusicAssistantImageType type, @JsonKey(name: MusicAssistantMediaItemImage.pathKey_)  String path, @JsonKey(name: MusicAssistantMediaItemImage.providerKey_)  String provider, @JsonKey(name: MusicAssistantMediaItemImage.remotelyAccessibleKey_)  bool remotelyAccessible, @JsonKey(name: MusicAssistantMediaItemImage.proxyIdKey_)  String? proxyId)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantMediaItemImage():
return $default(_that.type,_that.path,_that.provider,_that.remotelyAccessible,_that.proxyId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantMediaItemImage.typeKey_)  MusicAssistantImageType type, @JsonKey(name: MusicAssistantMediaItemImage.pathKey_)  String path, @JsonKey(name: MusicAssistantMediaItemImage.providerKey_)  String provider, @JsonKey(name: MusicAssistantMediaItemImage.remotelyAccessibleKey_)  bool remotelyAccessible, @JsonKey(name: MusicAssistantMediaItemImage.proxyIdKey_)  String? proxyId)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantMediaItemImage() when $default != null:
return $default(_that.type,_that.path,_that.provider,_that.remotelyAccessible,_that.proxyId);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantMediaItemImage extends MusicAssistantMediaItemImage {
  const _MusicAssistantMediaItemImage({@JsonKey(name: MusicAssistantMediaItemImage.typeKey_) required this.type, @JsonKey(name: MusicAssistantMediaItemImage.pathKey_) required this.path, @JsonKey(name: MusicAssistantMediaItemImage.providerKey_) required this.provider, @JsonKey(name: MusicAssistantMediaItemImage.remotelyAccessibleKey_) this.remotelyAccessible = false, @JsonKey(name: MusicAssistantMediaItemImage.proxyIdKey_) this.proxyId}): super._();
  factory _MusicAssistantMediaItemImage.fromJson(Map<String, dynamic> json) => _$MusicAssistantMediaItemImageFromJson(json);

/// type
@override@JsonKey(name: MusicAssistantMediaItemImage.typeKey_) final  MusicAssistantImageType type;
/// path
@override@JsonKey(name: MusicAssistantMediaItemImage.pathKey_) final  String path;
/// provider
@override@JsonKey(name: MusicAssistantMediaItemImage.providerKey_) final  String provider;
/// remotelyAccessible
@override@JsonKey(name: MusicAssistantMediaItemImage.remotelyAccessibleKey_) final  bool remotelyAccessible;
/// proxyId
@override@JsonKey(name: MusicAssistantMediaItemImage.proxyIdKey_) final  String? proxyId;

/// Create a copy of MusicAssistantMediaItemImage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantMediaItemImageCopyWith<_MusicAssistantMediaItemImage> get copyWith => __$MusicAssistantMediaItemImageCopyWithImpl<_MusicAssistantMediaItemImage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantMediaItemImageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantMediaItemImage&&(identical(other.type, type) || other.type == type)&&(identical(other.path, path) || other.path == path)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.remotelyAccessible, remotelyAccessible) || other.remotelyAccessible == remotelyAccessible)&&(identical(other.proxyId, proxyId) || other.proxyId == proxyId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,path,provider,remotelyAccessible,proxyId);

@override
String toString() {
  return 'MusicAssistantMediaItemImage(type: $type, path: $path, provider: $provider, remotelyAccessible: $remotelyAccessible, proxyId: $proxyId)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantMediaItemImageCopyWith<$Res> implements $MusicAssistantMediaItemImageCopyWith<$Res> {
  factory _$MusicAssistantMediaItemImageCopyWith(_MusicAssistantMediaItemImage value, $Res Function(_MusicAssistantMediaItemImage) _then) = __$MusicAssistantMediaItemImageCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantMediaItemImage.typeKey_) MusicAssistantImageType type,@JsonKey(name: MusicAssistantMediaItemImage.pathKey_) String path,@JsonKey(name: MusicAssistantMediaItemImage.providerKey_) String provider,@JsonKey(name: MusicAssistantMediaItemImage.remotelyAccessibleKey_) bool remotelyAccessible,@JsonKey(name: MusicAssistantMediaItemImage.proxyIdKey_) String? proxyId
});




}
/// @nodoc
class __$MusicAssistantMediaItemImageCopyWithImpl<$Res>
    implements _$MusicAssistantMediaItemImageCopyWith<$Res> {
  __$MusicAssistantMediaItemImageCopyWithImpl(this._self, this._then);

  final _MusicAssistantMediaItemImage _self;
  final $Res Function(_MusicAssistantMediaItemImage) _then;

/// Create a copy of MusicAssistantMediaItemImage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? path = null,Object? provider = null,Object? remotelyAccessible = null,Object? proxyId = freezed,}) {
  return _then(_MusicAssistantMediaItemImage(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MusicAssistantImageType,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String,remotelyAccessible: null == remotelyAccessible ? _self.remotelyAccessible : remotelyAccessible // ignore: cast_nullable_to_non_nullable
as bool,proxyId: freezed == proxyId ? _self.proxyId : proxyId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
