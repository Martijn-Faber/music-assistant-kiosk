// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_audio_metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantAudioMetadata {

/// bpm
@JsonKey(name: MusicAssistantAudioMetadata.bpmKey_) double? get bpm;/// musicalKey
@JsonKey(name: MusicAssistantAudioMetadata.musicalKeyKey_) String? get musicalKey;
/// Create a copy of MusicAssistantAudioMetadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantAudioMetadataCopyWith<MusicAssistantAudioMetadata> get copyWith => _$MusicAssistantAudioMetadataCopyWithImpl<MusicAssistantAudioMetadata>(this as MusicAssistantAudioMetadata, _$identity);

  /// Serializes this MusicAssistantAudioMetadata to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantAudioMetadata&&(identical(other.bpm, bpm) || other.bpm == bpm)&&(identical(other.musicalKey, musicalKey) || other.musicalKey == musicalKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bpm,musicalKey);

@override
String toString() {
  return 'MusicAssistantAudioMetadata(bpm: $bpm, musicalKey: $musicalKey)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantAudioMetadataCopyWith<$Res>  {
  factory $MusicAssistantAudioMetadataCopyWith(MusicAssistantAudioMetadata value, $Res Function(MusicAssistantAudioMetadata) _then) = _$MusicAssistantAudioMetadataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantAudioMetadata.bpmKey_) double? bpm,@JsonKey(name: MusicAssistantAudioMetadata.musicalKeyKey_) String? musicalKey
});




}
/// @nodoc
class _$MusicAssistantAudioMetadataCopyWithImpl<$Res>
    implements $MusicAssistantAudioMetadataCopyWith<$Res> {
  _$MusicAssistantAudioMetadataCopyWithImpl(this._self, this._then);

  final MusicAssistantAudioMetadata _self;
  final $Res Function(MusicAssistantAudioMetadata) _then;

/// Create a copy of MusicAssistantAudioMetadata
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bpm = freezed,Object? musicalKey = freezed,}) {
  return _then(_self.copyWith(
bpm: freezed == bpm ? _self.bpm : bpm // ignore: cast_nullable_to_non_nullable
as double?,musicalKey: freezed == musicalKey ? _self.musicalKey : musicalKey // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MusicAssistantAudioMetadata].
extension MusicAssistantAudioMetadataPatterns on MusicAssistantAudioMetadata {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantAudioMetadata value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantAudioMetadata() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantAudioMetadata value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantAudioMetadata():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantAudioMetadata value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantAudioMetadata() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantAudioMetadata.bpmKey_)  double? bpm, @JsonKey(name: MusicAssistantAudioMetadata.musicalKeyKey_)  String? musicalKey)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantAudioMetadata() when $default != null:
return $default(_that.bpm,_that.musicalKey);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantAudioMetadata.bpmKey_)  double? bpm, @JsonKey(name: MusicAssistantAudioMetadata.musicalKeyKey_)  String? musicalKey)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantAudioMetadata():
return $default(_that.bpm,_that.musicalKey);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantAudioMetadata.bpmKey_)  double? bpm, @JsonKey(name: MusicAssistantAudioMetadata.musicalKeyKey_)  String? musicalKey)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantAudioMetadata() when $default != null:
return $default(_that.bpm,_that.musicalKey);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantAudioMetadata extends MusicAssistantAudioMetadata {
  const _MusicAssistantAudioMetadata({@JsonKey(name: MusicAssistantAudioMetadata.bpmKey_) this.bpm, @JsonKey(name: MusicAssistantAudioMetadata.musicalKeyKey_) this.musicalKey}): super._();
  factory _MusicAssistantAudioMetadata.fromJson(Map<String, dynamic> json) => _$MusicAssistantAudioMetadataFromJson(json);

/// bpm
@override@JsonKey(name: MusicAssistantAudioMetadata.bpmKey_) final  double? bpm;
/// musicalKey
@override@JsonKey(name: MusicAssistantAudioMetadata.musicalKeyKey_) final  String? musicalKey;

/// Create a copy of MusicAssistantAudioMetadata
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantAudioMetadataCopyWith<_MusicAssistantAudioMetadata> get copyWith => __$MusicAssistantAudioMetadataCopyWithImpl<_MusicAssistantAudioMetadata>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantAudioMetadataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantAudioMetadata&&(identical(other.bpm, bpm) || other.bpm == bpm)&&(identical(other.musicalKey, musicalKey) || other.musicalKey == musicalKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bpm,musicalKey);

@override
String toString() {
  return 'MusicAssistantAudioMetadata(bpm: $bpm, musicalKey: $musicalKey)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantAudioMetadataCopyWith<$Res> implements $MusicAssistantAudioMetadataCopyWith<$Res> {
  factory _$MusicAssistantAudioMetadataCopyWith(_MusicAssistantAudioMetadata value, $Res Function(_MusicAssistantAudioMetadata) _then) = __$MusicAssistantAudioMetadataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantAudioMetadata.bpmKey_) double? bpm,@JsonKey(name: MusicAssistantAudioMetadata.musicalKeyKey_) String? musicalKey
});




}
/// @nodoc
class __$MusicAssistantAudioMetadataCopyWithImpl<$Res>
    implements _$MusicAssistantAudioMetadataCopyWith<$Res> {
  __$MusicAssistantAudioMetadataCopyWithImpl(this._self, this._then);

  final _MusicAssistantAudioMetadata _self;
  final $Res Function(_MusicAssistantAudioMetadata) _then;

/// Create a copy of MusicAssistantAudioMetadata
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bpm = freezed,Object? musicalKey = freezed,}) {
  return _then(_MusicAssistantAudioMetadata(
bpm: freezed == bpm ? _self.bpm : bpm // ignore: cast_nullable_to_non_nullable
as double?,musicalKey: freezed == musicalKey ? _self.musicalKey : musicalKey // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
