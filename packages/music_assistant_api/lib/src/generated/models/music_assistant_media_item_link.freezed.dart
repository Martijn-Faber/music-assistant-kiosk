// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_media_item_link.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantMediaItemLink {

/// type
@JsonKey(name: MusicAssistantMediaItemLink.typeKey_) MusicAssistantLinkType get type;/// url
@JsonKey(name: MusicAssistantMediaItemLink.urlKey_) String get url;
/// Create a copy of MusicAssistantMediaItemLink
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantMediaItemLinkCopyWith<MusicAssistantMediaItemLink> get copyWith => _$MusicAssistantMediaItemLinkCopyWithImpl<MusicAssistantMediaItemLink>(this as MusicAssistantMediaItemLink, _$identity);

  /// Serializes this MusicAssistantMediaItemLink to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantMediaItemLink&&(identical(other.type, type) || other.type == type)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,url);

@override
String toString() {
  return 'MusicAssistantMediaItemLink(type: $type, url: $url)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantMediaItemLinkCopyWith<$Res>  {
  factory $MusicAssistantMediaItemLinkCopyWith(MusicAssistantMediaItemLink value, $Res Function(MusicAssistantMediaItemLink) _then) = _$MusicAssistantMediaItemLinkCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantMediaItemLink.typeKey_) MusicAssistantLinkType type,@JsonKey(name: MusicAssistantMediaItemLink.urlKey_) String url
});




}
/// @nodoc
class _$MusicAssistantMediaItemLinkCopyWithImpl<$Res>
    implements $MusicAssistantMediaItemLinkCopyWith<$Res> {
  _$MusicAssistantMediaItemLinkCopyWithImpl(this._self, this._then);

  final MusicAssistantMediaItemLink _self;
  final $Res Function(MusicAssistantMediaItemLink) _then;

/// Create a copy of MusicAssistantMediaItemLink
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? url = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MusicAssistantLinkType,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MusicAssistantMediaItemLink].
extension MusicAssistantMediaItemLinkPatterns on MusicAssistantMediaItemLink {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantMediaItemLink value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantMediaItemLink() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantMediaItemLink value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantMediaItemLink():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantMediaItemLink value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantMediaItemLink() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantMediaItemLink.typeKey_)  MusicAssistantLinkType type, @JsonKey(name: MusicAssistantMediaItemLink.urlKey_)  String url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantMediaItemLink() when $default != null:
return $default(_that.type,_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantMediaItemLink.typeKey_)  MusicAssistantLinkType type, @JsonKey(name: MusicAssistantMediaItemLink.urlKey_)  String url)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantMediaItemLink():
return $default(_that.type,_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantMediaItemLink.typeKey_)  MusicAssistantLinkType type, @JsonKey(name: MusicAssistantMediaItemLink.urlKey_)  String url)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantMediaItemLink() when $default != null:
return $default(_that.type,_that.url);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantMediaItemLink extends MusicAssistantMediaItemLink {
  const _MusicAssistantMediaItemLink({@JsonKey(name: MusicAssistantMediaItemLink.typeKey_) required this.type, @JsonKey(name: MusicAssistantMediaItemLink.urlKey_) required this.url}): super._();
  factory _MusicAssistantMediaItemLink.fromJson(Map<String, dynamic> json) => _$MusicAssistantMediaItemLinkFromJson(json);

/// type
@override@JsonKey(name: MusicAssistantMediaItemLink.typeKey_) final  MusicAssistantLinkType type;
/// url
@override@JsonKey(name: MusicAssistantMediaItemLink.urlKey_) final  String url;

/// Create a copy of MusicAssistantMediaItemLink
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantMediaItemLinkCopyWith<_MusicAssistantMediaItemLink> get copyWith => __$MusicAssistantMediaItemLinkCopyWithImpl<_MusicAssistantMediaItemLink>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantMediaItemLinkToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantMediaItemLink&&(identical(other.type, type) || other.type == type)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,url);

@override
String toString() {
  return 'MusicAssistantMediaItemLink(type: $type, url: $url)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantMediaItemLinkCopyWith<$Res> implements $MusicAssistantMediaItemLinkCopyWith<$Res> {
  factory _$MusicAssistantMediaItemLinkCopyWith(_MusicAssistantMediaItemLink value, $Res Function(_MusicAssistantMediaItemLink) _then) = __$MusicAssistantMediaItemLinkCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantMediaItemLink.typeKey_) MusicAssistantLinkType type,@JsonKey(name: MusicAssistantMediaItemLink.urlKey_) String url
});




}
/// @nodoc
class __$MusicAssistantMediaItemLinkCopyWithImpl<$Res>
    implements _$MusicAssistantMediaItemLinkCopyWith<$Res> {
  __$MusicAssistantMediaItemLinkCopyWithImpl(this._self, this._then);

  final _MusicAssistantMediaItemLink _self;
  final $Res Function(_MusicAssistantMediaItemLink) _then;

/// Create a copy of MusicAssistantMediaItemLink
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? url = null,}) {
  return _then(_MusicAssistantMediaItemLink(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MusicAssistantLinkType,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
