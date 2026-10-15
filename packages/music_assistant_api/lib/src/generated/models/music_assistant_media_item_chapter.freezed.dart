// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_media_item_chapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantMediaItemChapter {

/// position
@JsonKey(name: MusicAssistantMediaItemChapter.positionKey_) int get position;/// name
@JsonKey(name: MusicAssistantMediaItemChapter.nameKey_) String get name;/// start
@JsonKey(name: MusicAssistantMediaItemChapter.startKey_) double get start;/// end
@JsonKey(name: MusicAssistantMediaItemChapter.endKey_) double? get end;
/// Create a copy of MusicAssistantMediaItemChapter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantMediaItemChapterCopyWith<MusicAssistantMediaItemChapter> get copyWith => _$MusicAssistantMediaItemChapterCopyWithImpl<MusicAssistantMediaItemChapter>(this as MusicAssistantMediaItemChapter, _$identity);

  /// Serializes this MusicAssistantMediaItemChapter to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantMediaItemChapter&&(identical(other.position, position) || other.position == position)&&(identical(other.name, name) || other.name == name)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,position,name,start,end);

@override
String toString() {
  return 'MusicAssistantMediaItemChapter(position: $position, name: $name, start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantMediaItemChapterCopyWith<$Res>  {
  factory $MusicAssistantMediaItemChapterCopyWith(MusicAssistantMediaItemChapter value, $Res Function(MusicAssistantMediaItemChapter) _then) = _$MusicAssistantMediaItemChapterCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantMediaItemChapter.positionKey_) int position,@JsonKey(name: MusicAssistantMediaItemChapter.nameKey_) String name,@JsonKey(name: MusicAssistantMediaItemChapter.startKey_) double start,@JsonKey(name: MusicAssistantMediaItemChapter.endKey_) double? end
});




}
/// @nodoc
class _$MusicAssistantMediaItemChapterCopyWithImpl<$Res>
    implements $MusicAssistantMediaItemChapterCopyWith<$Res> {
  _$MusicAssistantMediaItemChapterCopyWithImpl(this._self, this._then);

  final MusicAssistantMediaItemChapter _self;
  final $Res Function(MusicAssistantMediaItemChapter) _then;

/// Create a copy of MusicAssistantMediaItemChapter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? position = null,Object? name = null,Object? start = null,Object? end = freezed,}) {
  return _then(_self.copyWith(
position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as double,end: freezed == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [MusicAssistantMediaItemChapter].
extension MusicAssistantMediaItemChapterPatterns on MusicAssistantMediaItemChapter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantMediaItemChapter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantMediaItemChapter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantMediaItemChapter value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantMediaItemChapter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantMediaItemChapter value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantMediaItemChapter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantMediaItemChapter.positionKey_)  int position, @JsonKey(name: MusicAssistantMediaItemChapter.nameKey_)  String name, @JsonKey(name: MusicAssistantMediaItemChapter.startKey_)  double start, @JsonKey(name: MusicAssistantMediaItemChapter.endKey_)  double? end)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantMediaItemChapter() when $default != null:
return $default(_that.position,_that.name,_that.start,_that.end);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantMediaItemChapter.positionKey_)  int position, @JsonKey(name: MusicAssistantMediaItemChapter.nameKey_)  String name, @JsonKey(name: MusicAssistantMediaItemChapter.startKey_)  double start, @JsonKey(name: MusicAssistantMediaItemChapter.endKey_)  double? end)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantMediaItemChapter():
return $default(_that.position,_that.name,_that.start,_that.end);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantMediaItemChapter.positionKey_)  int position, @JsonKey(name: MusicAssistantMediaItemChapter.nameKey_)  String name, @JsonKey(name: MusicAssistantMediaItemChapter.startKey_)  double start, @JsonKey(name: MusicAssistantMediaItemChapter.endKey_)  double? end)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantMediaItemChapter() when $default != null:
return $default(_that.position,_that.name,_that.start,_that.end);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantMediaItemChapter extends MusicAssistantMediaItemChapter {
  const _MusicAssistantMediaItemChapter({@JsonKey(name: MusicAssistantMediaItemChapter.positionKey_) required this.position, @JsonKey(name: MusicAssistantMediaItemChapter.nameKey_) required this.name, @JsonKey(name: MusicAssistantMediaItemChapter.startKey_) required this.start, @JsonKey(name: MusicAssistantMediaItemChapter.endKey_) this.end}): super._();
  factory _MusicAssistantMediaItemChapter.fromJson(Map<String, dynamic> json) => _$MusicAssistantMediaItemChapterFromJson(json);

/// position
@override@JsonKey(name: MusicAssistantMediaItemChapter.positionKey_) final  int position;
/// name
@override@JsonKey(name: MusicAssistantMediaItemChapter.nameKey_) final  String name;
/// start
@override@JsonKey(name: MusicAssistantMediaItemChapter.startKey_) final  double start;
/// end
@override@JsonKey(name: MusicAssistantMediaItemChapter.endKey_) final  double? end;

/// Create a copy of MusicAssistantMediaItemChapter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantMediaItemChapterCopyWith<_MusicAssistantMediaItemChapter> get copyWith => __$MusicAssistantMediaItemChapterCopyWithImpl<_MusicAssistantMediaItemChapter>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantMediaItemChapterToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantMediaItemChapter&&(identical(other.position, position) || other.position == position)&&(identical(other.name, name) || other.name == name)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,position,name,start,end);

@override
String toString() {
  return 'MusicAssistantMediaItemChapter(position: $position, name: $name, start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantMediaItemChapterCopyWith<$Res> implements $MusicAssistantMediaItemChapterCopyWith<$Res> {
  factory _$MusicAssistantMediaItemChapterCopyWith(_MusicAssistantMediaItemChapter value, $Res Function(_MusicAssistantMediaItemChapter) _then) = __$MusicAssistantMediaItemChapterCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantMediaItemChapter.positionKey_) int position,@JsonKey(name: MusicAssistantMediaItemChapter.nameKey_) String name,@JsonKey(name: MusicAssistantMediaItemChapter.startKey_) double start,@JsonKey(name: MusicAssistantMediaItemChapter.endKey_) double? end
});




}
/// @nodoc
class __$MusicAssistantMediaItemChapterCopyWithImpl<$Res>
    implements _$MusicAssistantMediaItemChapterCopyWith<$Res> {
  __$MusicAssistantMediaItemChapterCopyWithImpl(this._self, this._then);

  final _MusicAssistantMediaItemChapter _self;
  final $Res Function(_MusicAssistantMediaItemChapter) _then;

/// Create a copy of MusicAssistantMediaItemChapter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? position = null,Object? name = null,Object? start = null,Object? end = freezed,}) {
  return _then(_MusicAssistantMediaItemChapter(
position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as double,end: freezed == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
