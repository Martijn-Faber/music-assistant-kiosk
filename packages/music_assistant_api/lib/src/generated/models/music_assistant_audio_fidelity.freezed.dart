// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_audio_fidelity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantAudioFidelity {

/// quality
@JsonKey(name: MusicAssistantAudioFidelity.qualityKey_) MusicAssistantAudioQuality get quality;/// bitPerfect
@JsonKey(name: MusicAssistantAudioFidelity.bitPerfectKey_) bool? get bitPerfect;
/// Create a copy of MusicAssistantAudioFidelity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantAudioFidelityCopyWith<MusicAssistantAudioFidelity> get copyWith => _$MusicAssistantAudioFidelityCopyWithImpl<MusicAssistantAudioFidelity>(this as MusicAssistantAudioFidelity, _$identity);

  /// Serializes this MusicAssistantAudioFidelity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantAudioFidelity&&(identical(other.quality, quality) || other.quality == quality)&&(identical(other.bitPerfect, bitPerfect) || other.bitPerfect == bitPerfect));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,quality,bitPerfect);

@override
String toString() {
  return 'MusicAssistantAudioFidelity(quality: $quality, bitPerfect: $bitPerfect)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantAudioFidelityCopyWith<$Res>  {
  factory $MusicAssistantAudioFidelityCopyWith(MusicAssistantAudioFidelity value, $Res Function(MusicAssistantAudioFidelity) _then) = _$MusicAssistantAudioFidelityCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantAudioFidelity.qualityKey_) MusicAssistantAudioQuality quality,@JsonKey(name: MusicAssistantAudioFidelity.bitPerfectKey_) bool? bitPerfect
});




}
/// @nodoc
class _$MusicAssistantAudioFidelityCopyWithImpl<$Res>
    implements $MusicAssistantAudioFidelityCopyWith<$Res> {
  _$MusicAssistantAudioFidelityCopyWithImpl(this._self, this._then);

  final MusicAssistantAudioFidelity _self;
  final $Res Function(MusicAssistantAudioFidelity) _then;

/// Create a copy of MusicAssistantAudioFidelity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? quality = null,Object? bitPerfect = freezed,}) {
  return _then(_self.copyWith(
quality: null == quality ? _self.quality : quality // ignore: cast_nullable_to_non_nullable
as MusicAssistantAudioQuality,bitPerfect: freezed == bitPerfect ? _self.bitPerfect : bitPerfect // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [MusicAssistantAudioFidelity].
extension MusicAssistantAudioFidelityPatterns on MusicAssistantAudioFidelity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantAudioFidelity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantAudioFidelity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantAudioFidelity value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantAudioFidelity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantAudioFidelity value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantAudioFidelity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantAudioFidelity.qualityKey_)  MusicAssistantAudioQuality quality, @JsonKey(name: MusicAssistantAudioFidelity.bitPerfectKey_)  bool? bitPerfect)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantAudioFidelity() when $default != null:
return $default(_that.quality,_that.bitPerfect);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantAudioFidelity.qualityKey_)  MusicAssistantAudioQuality quality, @JsonKey(name: MusicAssistantAudioFidelity.bitPerfectKey_)  bool? bitPerfect)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantAudioFidelity():
return $default(_that.quality,_that.bitPerfect);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantAudioFidelity.qualityKey_)  MusicAssistantAudioQuality quality, @JsonKey(name: MusicAssistantAudioFidelity.bitPerfectKey_)  bool? bitPerfect)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantAudioFidelity() when $default != null:
return $default(_that.quality,_that.bitPerfect);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantAudioFidelity extends MusicAssistantAudioFidelity {
  const _MusicAssistantAudioFidelity({@JsonKey(name: MusicAssistantAudioFidelity.qualityKey_) this.quality = MusicAssistantAudioQuality.unknown, @JsonKey(name: MusicAssistantAudioFidelity.bitPerfectKey_) this.bitPerfect}): super._();
  factory _MusicAssistantAudioFidelity.fromJson(Map<String, dynamic> json) => _$MusicAssistantAudioFidelityFromJson(json);

/// quality
@override@JsonKey(name: MusicAssistantAudioFidelity.qualityKey_) final  MusicAssistantAudioQuality quality;
/// bitPerfect
@override@JsonKey(name: MusicAssistantAudioFidelity.bitPerfectKey_) final  bool? bitPerfect;

/// Create a copy of MusicAssistantAudioFidelity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantAudioFidelityCopyWith<_MusicAssistantAudioFidelity> get copyWith => __$MusicAssistantAudioFidelityCopyWithImpl<_MusicAssistantAudioFidelity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantAudioFidelityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantAudioFidelity&&(identical(other.quality, quality) || other.quality == quality)&&(identical(other.bitPerfect, bitPerfect) || other.bitPerfect == bitPerfect));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,quality,bitPerfect);

@override
String toString() {
  return 'MusicAssistantAudioFidelity(quality: $quality, bitPerfect: $bitPerfect)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantAudioFidelityCopyWith<$Res> implements $MusicAssistantAudioFidelityCopyWith<$Res> {
  factory _$MusicAssistantAudioFidelityCopyWith(_MusicAssistantAudioFidelity value, $Res Function(_MusicAssistantAudioFidelity) _then) = __$MusicAssistantAudioFidelityCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantAudioFidelity.qualityKey_) MusicAssistantAudioQuality quality,@JsonKey(name: MusicAssistantAudioFidelity.bitPerfectKey_) bool? bitPerfect
});




}
/// @nodoc
class __$MusicAssistantAudioFidelityCopyWithImpl<$Res>
    implements _$MusicAssistantAudioFidelityCopyWith<$Res> {
  __$MusicAssistantAudioFidelityCopyWithImpl(this._self, this._then);

  final _MusicAssistantAudioFidelity _self;
  final $Res Function(_MusicAssistantAudioFidelity) _then;

/// Create a copy of MusicAssistantAudioFidelity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? quality = null,Object? bitPerfect = freezed,}) {
  return _then(_MusicAssistantAudioFidelity(
quality: null == quality ? _self.quality : quality // ignore: cast_nullable_to_non_nullable
as MusicAssistantAudioQuality,bitPerfect: freezed == bitPerfect ? _self.bitPerfect : bitPerfect // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
