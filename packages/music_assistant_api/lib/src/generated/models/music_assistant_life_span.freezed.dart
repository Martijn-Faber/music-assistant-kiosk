// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_life_span.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantLifeSpan {

/// begin
@JsonKey(name: MusicAssistantLifeSpan.beginKey_) String? get begin;/// end
@JsonKey(name: MusicAssistantLifeSpan.endKey_) String? get end;/// ended
@JsonKey(name: MusicAssistantLifeSpan.endedKey_) bool get ended;
/// Create a copy of MusicAssistantLifeSpan
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantLifeSpanCopyWith<MusicAssistantLifeSpan> get copyWith => _$MusicAssistantLifeSpanCopyWithImpl<MusicAssistantLifeSpan>(this as MusicAssistantLifeSpan, _$identity);

  /// Serializes this MusicAssistantLifeSpan to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantLifeSpan&&(identical(other.begin, begin) || other.begin == begin)&&(identical(other.end, end) || other.end == end)&&(identical(other.ended, ended) || other.ended == ended));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,begin,end,ended);

@override
String toString() {
  return 'MusicAssistantLifeSpan(begin: $begin, end: $end, ended: $ended)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantLifeSpanCopyWith<$Res>  {
  factory $MusicAssistantLifeSpanCopyWith(MusicAssistantLifeSpan value, $Res Function(MusicAssistantLifeSpan) _then) = _$MusicAssistantLifeSpanCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantLifeSpan.beginKey_) String? begin,@JsonKey(name: MusicAssistantLifeSpan.endKey_) String? end,@JsonKey(name: MusicAssistantLifeSpan.endedKey_) bool ended
});




}
/// @nodoc
class _$MusicAssistantLifeSpanCopyWithImpl<$Res>
    implements $MusicAssistantLifeSpanCopyWith<$Res> {
  _$MusicAssistantLifeSpanCopyWithImpl(this._self, this._then);

  final MusicAssistantLifeSpan _self;
  final $Res Function(MusicAssistantLifeSpan) _then;

/// Create a copy of MusicAssistantLifeSpan
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? begin = freezed,Object? end = freezed,Object? ended = null,}) {
  return _then(_self.copyWith(
begin: freezed == begin ? _self.begin : begin // ignore: cast_nullable_to_non_nullable
as String?,end: freezed == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as String?,ended: null == ended ? _self.ended : ended // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MusicAssistantLifeSpan].
extension MusicAssistantLifeSpanPatterns on MusicAssistantLifeSpan {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantLifeSpan value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantLifeSpan() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantLifeSpan value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantLifeSpan():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantLifeSpan value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantLifeSpan() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantLifeSpan.beginKey_)  String? begin, @JsonKey(name: MusicAssistantLifeSpan.endKey_)  String? end, @JsonKey(name: MusicAssistantLifeSpan.endedKey_)  bool ended)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantLifeSpan() when $default != null:
return $default(_that.begin,_that.end,_that.ended);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantLifeSpan.beginKey_)  String? begin, @JsonKey(name: MusicAssistantLifeSpan.endKey_)  String? end, @JsonKey(name: MusicAssistantLifeSpan.endedKey_)  bool ended)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantLifeSpan():
return $default(_that.begin,_that.end,_that.ended);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantLifeSpan.beginKey_)  String? begin, @JsonKey(name: MusicAssistantLifeSpan.endKey_)  String? end, @JsonKey(name: MusicAssistantLifeSpan.endedKey_)  bool ended)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantLifeSpan() when $default != null:
return $default(_that.begin,_that.end,_that.ended);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantLifeSpan extends MusicAssistantLifeSpan {
  const _MusicAssistantLifeSpan({@JsonKey(name: MusicAssistantLifeSpan.beginKey_) this.begin, @JsonKey(name: MusicAssistantLifeSpan.endKey_) this.end, @JsonKey(name: MusicAssistantLifeSpan.endedKey_) this.ended = false}): super._();
  factory _MusicAssistantLifeSpan.fromJson(Map<String, dynamic> json) => _$MusicAssistantLifeSpanFromJson(json);

/// begin
@override@JsonKey(name: MusicAssistantLifeSpan.beginKey_) final  String? begin;
/// end
@override@JsonKey(name: MusicAssistantLifeSpan.endKey_) final  String? end;
/// ended
@override@JsonKey(name: MusicAssistantLifeSpan.endedKey_) final  bool ended;

/// Create a copy of MusicAssistantLifeSpan
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantLifeSpanCopyWith<_MusicAssistantLifeSpan> get copyWith => __$MusicAssistantLifeSpanCopyWithImpl<_MusicAssistantLifeSpan>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantLifeSpanToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantLifeSpan&&(identical(other.begin, begin) || other.begin == begin)&&(identical(other.end, end) || other.end == end)&&(identical(other.ended, ended) || other.ended == ended));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,begin,end,ended);

@override
String toString() {
  return 'MusicAssistantLifeSpan(begin: $begin, end: $end, ended: $ended)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantLifeSpanCopyWith<$Res> implements $MusicAssistantLifeSpanCopyWith<$Res> {
  factory _$MusicAssistantLifeSpanCopyWith(_MusicAssistantLifeSpan value, $Res Function(_MusicAssistantLifeSpan) _then) = __$MusicAssistantLifeSpanCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantLifeSpan.beginKey_) String? begin,@JsonKey(name: MusicAssistantLifeSpan.endKey_) String? end,@JsonKey(name: MusicAssistantLifeSpan.endedKey_) bool ended
});




}
/// @nodoc
class __$MusicAssistantLifeSpanCopyWithImpl<$Res>
    implements _$MusicAssistantLifeSpanCopyWith<$Res> {
  __$MusicAssistantLifeSpanCopyWithImpl(this._self, this._then);

  final _MusicAssistantLifeSpan _self;
  final $Res Function(_MusicAssistantLifeSpan) _then;

/// Create a copy of MusicAssistantLifeSpan
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? begin = freezed,Object? end = freezed,Object? ended = null,}) {
  return _then(_MusicAssistantLifeSpan(
begin: freezed == begin ? _self.begin : begin // ignore: cast_nullable_to_non_nullable
as String?,end: freezed == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as String?,ended: null == ended ? _self.ended : ended // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
