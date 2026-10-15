// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_player_sound_mode.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantPlayerSoundMode {

/// id
@JsonKey(name: MusicAssistantPlayerSoundMode.idKey_) String get id;/// name
@JsonKey(name: MusicAssistantPlayerSoundMode.nameKey_) String get name;/// passive
@JsonKey(name: MusicAssistantPlayerSoundMode.passiveKey_) bool get passive;/// translationKey
@JsonKey(name: MusicAssistantPlayerSoundMode.translationKeyKey_) String get translationKey;
/// Create a copy of MusicAssistantPlayerSoundMode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantPlayerSoundModeCopyWith<MusicAssistantPlayerSoundMode> get copyWith => _$MusicAssistantPlayerSoundModeCopyWithImpl<MusicAssistantPlayerSoundMode>(this as MusicAssistantPlayerSoundMode, _$identity);

  /// Serializes this MusicAssistantPlayerSoundMode to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantPlayerSoundMode&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.passive, passive) || other.passive == passive)&&(identical(other.translationKey, translationKey) || other.translationKey == translationKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,passive,translationKey);

@override
String toString() {
  return 'MusicAssistantPlayerSoundMode(id: $id, name: $name, passive: $passive, translationKey: $translationKey)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantPlayerSoundModeCopyWith<$Res>  {
  factory $MusicAssistantPlayerSoundModeCopyWith(MusicAssistantPlayerSoundMode value, $Res Function(MusicAssistantPlayerSoundMode) _then) = _$MusicAssistantPlayerSoundModeCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantPlayerSoundMode.idKey_) String id,@JsonKey(name: MusicAssistantPlayerSoundMode.nameKey_) String name,@JsonKey(name: MusicAssistantPlayerSoundMode.passiveKey_) bool passive,@JsonKey(name: MusicAssistantPlayerSoundMode.translationKeyKey_) String translationKey
});




}
/// @nodoc
class _$MusicAssistantPlayerSoundModeCopyWithImpl<$Res>
    implements $MusicAssistantPlayerSoundModeCopyWith<$Res> {
  _$MusicAssistantPlayerSoundModeCopyWithImpl(this._self, this._then);

  final MusicAssistantPlayerSoundMode _self;
  final $Res Function(MusicAssistantPlayerSoundMode) _then;

/// Create a copy of MusicAssistantPlayerSoundMode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? passive = null,Object? translationKey = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,passive: null == passive ? _self.passive : passive // ignore: cast_nullable_to_non_nullable
as bool,translationKey: null == translationKey ? _self.translationKey : translationKey // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MusicAssistantPlayerSoundMode].
extension MusicAssistantPlayerSoundModePatterns on MusicAssistantPlayerSoundMode {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantPlayerSoundMode value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantPlayerSoundMode() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantPlayerSoundMode value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantPlayerSoundMode():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantPlayerSoundMode value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantPlayerSoundMode() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantPlayerSoundMode.idKey_)  String id, @JsonKey(name: MusicAssistantPlayerSoundMode.nameKey_)  String name, @JsonKey(name: MusicAssistantPlayerSoundMode.passiveKey_)  bool passive, @JsonKey(name: MusicAssistantPlayerSoundMode.translationKeyKey_)  String translationKey)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantPlayerSoundMode() when $default != null:
return $default(_that.id,_that.name,_that.passive,_that.translationKey);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantPlayerSoundMode.idKey_)  String id, @JsonKey(name: MusicAssistantPlayerSoundMode.nameKey_)  String name, @JsonKey(name: MusicAssistantPlayerSoundMode.passiveKey_)  bool passive, @JsonKey(name: MusicAssistantPlayerSoundMode.translationKeyKey_)  String translationKey)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantPlayerSoundMode():
return $default(_that.id,_that.name,_that.passive,_that.translationKey);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantPlayerSoundMode.idKey_)  String id, @JsonKey(name: MusicAssistantPlayerSoundMode.nameKey_)  String name, @JsonKey(name: MusicAssistantPlayerSoundMode.passiveKey_)  bool passive, @JsonKey(name: MusicAssistantPlayerSoundMode.translationKeyKey_)  String translationKey)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantPlayerSoundMode() when $default != null:
return $default(_that.id,_that.name,_that.passive,_that.translationKey);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantPlayerSoundMode extends MusicAssistantPlayerSoundMode {
  const _MusicAssistantPlayerSoundMode({@JsonKey(name: MusicAssistantPlayerSoundMode.idKey_) required this.id, @JsonKey(name: MusicAssistantPlayerSoundMode.nameKey_) required this.name, @JsonKey(name: MusicAssistantPlayerSoundMode.passiveKey_) this.passive = false, @JsonKey(name: MusicAssistantPlayerSoundMode.translationKeyKey_) this.translationKey = ''}): super._();
  factory _MusicAssistantPlayerSoundMode.fromJson(Map<String, dynamic> json) => _$MusicAssistantPlayerSoundModeFromJson(json);

/// id
@override@JsonKey(name: MusicAssistantPlayerSoundMode.idKey_) final  String id;
/// name
@override@JsonKey(name: MusicAssistantPlayerSoundMode.nameKey_) final  String name;
/// passive
@override@JsonKey(name: MusicAssistantPlayerSoundMode.passiveKey_) final  bool passive;
/// translationKey
@override@JsonKey(name: MusicAssistantPlayerSoundMode.translationKeyKey_) final  String translationKey;

/// Create a copy of MusicAssistantPlayerSoundMode
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantPlayerSoundModeCopyWith<_MusicAssistantPlayerSoundMode> get copyWith => __$MusicAssistantPlayerSoundModeCopyWithImpl<_MusicAssistantPlayerSoundMode>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantPlayerSoundModeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantPlayerSoundMode&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.passive, passive) || other.passive == passive)&&(identical(other.translationKey, translationKey) || other.translationKey == translationKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,passive,translationKey);

@override
String toString() {
  return 'MusicAssistantPlayerSoundMode(id: $id, name: $name, passive: $passive, translationKey: $translationKey)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantPlayerSoundModeCopyWith<$Res> implements $MusicAssistantPlayerSoundModeCopyWith<$Res> {
  factory _$MusicAssistantPlayerSoundModeCopyWith(_MusicAssistantPlayerSoundMode value, $Res Function(_MusicAssistantPlayerSoundMode) _then) = __$MusicAssistantPlayerSoundModeCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantPlayerSoundMode.idKey_) String id,@JsonKey(name: MusicAssistantPlayerSoundMode.nameKey_) String name,@JsonKey(name: MusicAssistantPlayerSoundMode.passiveKey_) bool passive,@JsonKey(name: MusicAssistantPlayerSoundMode.translationKeyKey_) String translationKey
});




}
/// @nodoc
class __$MusicAssistantPlayerSoundModeCopyWithImpl<$Res>
    implements _$MusicAssistantPlayerSoundModeCopyWith<$Res> {
  __$MusicAssistantPlayerSoundModeCopyWithImpl(this._self, this._then);

  final _MusicAssistantPlayerSoundMode _self;
  final $Res Function(_MusicAssistantPlayerSoundMode) _then;

/// Create a copy of MusicAssistantPlayerSoundMode
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? passive = null,Object? translationKey = null,}) {
  return _then(_MusicAssistantPlayerSoundMode(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,passive: null == passive ? _self.passive : passive // ignore: cast_nullable_to_non_nullable
as bool,translationKey: null == translationKey ? _self.translationKey : translationKey // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
