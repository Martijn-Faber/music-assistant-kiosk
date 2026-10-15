// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_media_item_collection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantMediaItemCollection {

/// title
@JsonKey(name: MusicAssistantMediaItemCollection.titleKey_) String get title;/// sequence
@JsonKey(name: MusicAssistantMediaItemCollection.sequenceKey_) double? get sequence;
/// Create a copy of MusicAssistantMediaItemCollection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantMediaItemCollectionCopyWith<MusicAssistantMediaItemCollection> get copyWith => _$MusicAssistantMediaItemCollectionCopyWithImpl<MusicAssistantMediaItemCollection>(this as MusicAssistantMediaItemCollection, _$identity);

  /// Serializes this MusicAssistantMediaItemCollection to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantMediaItemCollection&&(identical(other.title, title) || other.title == title)&&(identical(other.sequence, sequence) || other.sequence == sequence));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,sequence);

@override
String toString() {
  return 'MusicAssistantMediaItemCollection(title: $title, sequence: $sequence)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantMediaItemCollectionCopyWith<$Res>  {
  factory $MusicAssistantMediaItemCollectionCopyWith(MusicAssistantMediaItemCollection value, $Res Function(MusicAssistantMediaItemCollection) _then) = _$MusicAssistantMediaItemCollectionCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantMediaItemCollection.titleKey_) String title,@JsonKey(name: MusicAssistantMediaItemCollection.sequenceKey_) double? sequence
});




}
/// @nodoc
class _$MusicAssistantMediaItemCollectionCopyWithImpl<$Res>
    implements $MusicAssistantMediaItemCollectionCopyWith<$Res> {
  _$MusicAssistantMediaItemCollectionCopyWithImpl(this._self, this._then);

  final MusicAssistantMediaItemCollection _self;
  final $Res Function(MusicAssistantMediaItemCollection) _then;

/// Create a copy of MusicAssistantMediaItemCollection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? sequence = freezed,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,sequence: freezed == sequence ? _self.sequence : sequence // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [MusicAssistantMediaItemCollection].
extension MusicAssistantMediaItemCollectionPatterns on MusicAssistantMediaItemCollection {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantMediaItemCollection value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantMediaItemCollection() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantMediaItemCollection value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantMediaItemCollection():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantMediaItemCollection value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantMediaItemCollection() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantMediaItemCollection.titleKey_)  String title, @JsonKey(name: MusicAssistantMediaItemCollection.sequenceKey_)  double? sequence)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantMediaItemCollection() when $default != null:
return $default(_that.title,_that.sequence);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantMediaItemCollection.titleKey_)  String title, @JsonKey(name: MusicAssistantMediaItemCollection.sequenceKey_)  double? sequence)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantMediaItemCollection():
return $default(_that.title,_that.sequence);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantMediaItemCollection.titleKey_)  String title, @JsonKey(name: MusicAssistantMediaItemCollection.sequenceKey_)  double? sequence)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantMediaItemCollection() when $default != null:
return $default(_that.title,_that.sequence);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantMediaItemCollection extends MusicAssistantMediaItemCollection {
  const _MusicAssistantMediaItemCollection({@JsonKey(name: MusicAssistantMediaItemCollection.titleKey_) required this.title, @JsonKey(name: MusicAssistantMediaItemCollection.sequenceKey_) this.sequence}): super._();
  factory _MusicAssistantMediaItemCollection.fromJson(Map<String, dynamic> json) => _$MusicAssistantMediaItemCollectionFromJson(json);

/// title
@override@JsonKey(name: MusicAssistantMediaItemCollection.titleKey_) final  String title;
/// sequence
@override@JsonKey(name: MusicAssistantMediaItemCollection.sequenceKey_) final  double? sequence;

/// Create a copy of MusicAssistantMediaItemCollection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantMediaItemCollectionCopyWith<_MusicAssistantMediaItemCollection> get copyWith => __$MusicAssistantMediaItemCollectionCopyWithImpl<_MusicAssistantMediaItemCollection>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantMediaItemCollectionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantMediaItemCollection&&(identical(other.title, title) || other.title == title)&&(identical(other.sequence, sequence) || other.sequence == sequence));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,sequence);

@override
String toString() {
  return 'MusicAssistantMediaItemCollection(title: $title, sequence: $sequence)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantMediaItemCollectionCopyWith<$Res> implements $MusicAssistantMediaItemCollectionCopyWith<$Res> {
  factory _$MusicAssistantMediaItemCollectionCopyWith(_MusicAssistantMediaItemCollection value, $Res Function(_MusicAssistantMediaItemCollection) _then) = __$MusicAssistantMediaItemCollectionCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantMediaItemCollection.titleKey_) String title,@JsonKey(name: MusicAssistantMediaItemCollection.sequenceKey_) double? sequence
});




}
/// @nodoc
class __$MusicAssistantMediaItemCollectionCopyWithImpl<$Res>
    implements _$MusicAssistantMediaItemCollectionCopyWith<$Res> {
  __$MusicAssistantMediaItemCollectionCopyWithImpl(this._self, this._then);

  final _MusicAssistantMediaItemCollection _self;
  final $Res Function(_MusicAssistantMediaItemCollection) _then;

/// Create a copy of MusicAssistantMediaItemCollection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? sequence = freezed,}) {
  return _then(_MusicAssistantMediaItemCollection(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,sequence: freezed == sequence ? _self.sequence : sequence // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
