// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_active_source_audio_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantActiveSourceAudioDetails {

/// inputFormat
@JsonKey(name: MusicAssistantActiveSourceAudioDetails.inputFormatKey_) MusicAssistantAudioFormat get inputFormat;/// inputFidelity
@JsonKey(name: MusicAssistantActiveSourceAudioDetails.inputFidelityKey_) MusicAssistantAudioFidelity? get inputFidelity;/// crossfadeMode
@JsonKey(name: MusicAssistantActiveSourceAudioDetails.crossfadeModeKey_) MusicAssistantCrossfadeMode get crossfadeMode;/// volumeNormalizationMode
@JsonKey(name: MusicAssistantActiveSourceAudioDetails.volumeNormalizationModeKey_) MusicAssistantVolumeNormalizationMode get volumeNormalizationMode;/// outputs
@JsonKey(name: MusicAssistantActiveSourceAudioDetails.outputsKey_) List<MusicAssistantAudioOutputDetails>? get outputs;
/// Create a copy of MusicAssistantActiveSourceAudioDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantActiveSourceAudioDetailsCopyWith<MusicAssistantActiveSourceAudioDetails> get copyWith => _$MusicAssistantActiveSourceAudioDetailsCopyWithImpl<MusicAssistantActiveSourceAudioDetails>(this as MusicAssistantActiveSourceAudioDetails, _$identity);

  /// Serializes this MusicAssistantActiveSourceAudioDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantActiveSourceAudioDetails&&(identical(other.inputFormat, inputFormat) || other.inputFormat == inputFormat)&&(identical(other.inputFidelity, inputFidelity) || other.inputFidelity == inputFidelity)&&(identical(other.crossfadeMode, crossfadeMode) || other.crossfadeMode == crossfadeMode)&&(identical(other.volumeNormalizationMode, volumeNormalizationMode) || other.volumeNormalizationMode == volumeNormalizationMode)&&const DeepCollectionEquality().equals(other.outputs, outputs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,inputFormat,inputFidelity,crossfadeMode,volumeNormalizationMode,const DeepCollectionEquality().hash(outputs));

@override
String toString() {
  return 'MusicAssistantActiveSourceAudioDetails(inputFormat: $inputFormat, inputFidelity: $inputFidelity, crossfadeMode: $crossfadeMode, volumeNormalizationMode: $volumeNormalizationMode, outputs: $outputs)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantActiveSourceAudioDetailsCopyWith<$Res>  {
  factory $MusicAssistantActiveSourceAudioDetailsCopyWith(MusicAssistantActiveSourceAudioDetails value, $Res Function(MusicAssistantActiveSourceAudioDetails) _then) = _$MusicAssistantActiveSourceAudioDetailsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantActiveSourceAudioDetails.inputFormatKey_) MusicAssistantAudioFormat inputFormat,@JsonKey(name: MusicAssistantActiveSourceAudioDetails.inputFidelityKey_) MusicAssistantAudioFidelity? inputFidelity,@JsonKey(name: MusicAssistantActiveSourceAudioDetails.crossfadeModeKey_) MusicAssistantCrossfadeMode crossfadeMode,@JsonKey(name: MusicAssistantActiveSourceAudioDetails.volumeNormalizationModeKey_) MusicAssistantVolumeNormalizationMode volumeNormalizationMode,@JsonKey(name: MusicAssistantActiveSourceAudioDetails.outputsKey_) List<MusicAssistantAudioOutputDetails>? outputs
});


$MusicAssistantAudioFormatCopyWith<$Res> get inputFormat;$MusicAssistantAudioFidelityCopyWith<$Res>? get inputFidelity;

}
/// @nodoc
class _$MusicAssistantActiveSourceAudioDetailsCopyWithImpl<$Res>
    implements $MusicAssistantActiveSourceAudioDetailsCopyWith<$Res> {
  _$MusicAssistantActiveSourceAudioDetailsCopyWithImpl(this._self, this._then);

  final MusicAssistantActiveSourceAudioDetails _self;
  final $Res Function(MusicAssistantActiveSourceAudioDetails) _then;

/// Create a copy of MusicAssistantActiveSourceAudioDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? inputFormat = null,Object? inputFidelity = freezed,Object? crossfadeMode = null,Object? volumeNormalizationMode = null,Object? outputs = freezed,}) {
  return _then(_self.copyWith(
inputFormat: null == inputFormat ? _self.inputFormat : inputFormat // ignore: cast_nullable_to_non_nullable
as MusicAssistantAudioFormat,inputFidelity: freezed == inputFidelity ? _self.inputFidelity : inputFidelity // ignore: cast_nullable_to_non_nullable
as MusicAssistantAudioFidelity?,crossfadeMode: null == crossfadeMode ? _self.crossfadeMode : crossfadeMode // ignore: cast_nullable_to_non_nullable
as MusicAssistantCrossfadeMode,volumeNormalizationMode: null == volumeNormalizationMode ? _self.volumeNormalizationMode : volumeNormalizationMode // ignore: cast_nullable_to_non_nullable
as MusicAssistantVolumeNormalizationMode,outputs: freezed == outputs ? _self.outputs : outputs // ignore: cast_nullable_to_non_nullable
as List<MusicAssistantAudioOutputDetails>?,
  ));
}
/// Create a copy of MusicAssistantActiveSourceAudioDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantAudioFormatCopyWith<$Res> get inputFormat {
  
  return $MusicAssistantAudioFormatCopyWith<$Res>(_self.inputFormat, (value) {
    return _then(_self.copyWith(inputFormat: value));
  });
}/// Create a copy of MusicAssistantActiveSourceAudioDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantAudioFidelityCopyWith<$Res>? get inputFidelity {
    if (_self.inputFidelity == null) {
    return null;
  }

  return $MusicAssistantAudioFidelityCopyWith<$Res>(_self.inputFidelity!, (value) {
    return _then(_self.copyWith(inputFidelity: value));
  });
}
}


/// Adds pattern-matching-related methods to [MusicAssistantActiveSourceAudioDetails].
extension MusicAssistantActiveSourceAudioDetailsPatterns on MusicAssistantActiveSourceAudioDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantActiveSourceAudioDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantActiveSourceAudioDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantActiveSourceAudioDetails value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantActiveSourceAudioDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantActiveSourceAudioDetails value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantActiveSourceAudioDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantActiveSourceAudioDetails.inputFormatKey_)  MusicAssistantAudioFormat inputFormat, @JsonKey(name: MusicAssistantActiveSourceAudioDetails.inputFidelityKey_)  MusicAssistantAudioFidelity? inputFidelity, @JsonKey(name: MusicAssistantActiveSourceAudioDetails.crossfadeModeKey_)  MusicAssistantCrossfadeMode crossfadeMode, @JsonKey(name: MusicAssistantActiveSourceAudioDetails.volumeNormalizationModeKey_)  MusicAssistantVolumeNormalizationMode volumeNormalizationMode, @JsonKey(name: MusicAssistantActiveSourceAudioDetails.outputsKey_)  List<MusicAssistantAudioOutputDetails>? outputs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantActiveSourceAudioDetails() when $default != null:
return $default(_that.inputFormat,_that.inputFidelity,_that.crossfadeMode,_that.volumeNormalizationMode,_that.outputs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantActiveSourceAudioDetails.inputFormatKey_)  MusicAssistantAudioFormat inputFormat, @JsonKey(name: MusicAssistantActiveSourceAudioDetails.inputFidelityKey_)  MusicAssistantAudioFidelity? inputFidelity, @JsonKey(name: MusicAssistantActiveSourceAudioDetails.crossfadeModeKey_)  MusicAssistantCrossfadeMode crossfadeMode, @JsonKey(name: MusicAssistantActiveSourceAudioDetails.volumeNormalizationModeKey_)  MusicAssistantVolumeNormalizationMode volumeNormalizationMode, @JsonKey(name: MusicAssistantActiveSourceAudioDetails.outputsKey_)  List<MusicAssistantAudioOutputDetails>? outputs)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantActiveSourceAudioDetails():
return $default(_that.inputFormat,_that.inputFidelity,_that.crossfadeMode,_that.volumeNormalizationMode,_that.outputs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantActiveSourceAudioDetails.inputFormatKey_)  MusicAssistantAudioFormat inputFormat, @JsonKey(name: MusicAssistantActiveSourceAudioDetails.inputFidelityKey_)  MusicAssistantAudioFidelity? inputFidelity, @JsonKey(name: MusicAssistantActiveSourceAudioDetails.crossfadeModeKey_)  MusicAssistantCrossfadeMode crossfadeMode, @JsonKey(name: MusicAssistantActiveSourceAudioDetails.volumeNormalizationModeKey_)  MusicAssistantVolumeNormalizationMode volumeNormalizationMode, @JsonKey(name: MusicAssistantActiveSourceAudioDetails.outputsKey_)  List<MusicAssistantAudioOutputDetails>? outputs)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantActiveSourceAudioDetails() when $default != null:
return $default(_that.inputFormat,_that.inputFidelity,_that.crossfadeMode,_that.volumeNormalizationMode,_that.outputs);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantActiveSourceAudioDetails extends MusicAssistantActiveSourceAudioDetails {
  const _MusicAssistantActiveSourceAudioDetails({@JsonKey(name: MusicAssistantActiveSourceAudioDetails.inputFormatKey_) required this.inputFormat, @JsonKey(name: MusicAssistantActiveSourceAudioDetails.inputFidelityKey_) this.inputFidelity, @JsonKey(name: MusicAssistantActiveSourceAudioDetails.crossfadeModeKey_) this.crossfadeMode = MusicAssistantCrossfadeMode.unknown, @JsonKey(name: MusicAssistantActiveSourceAudioDetails.volumeNormalizationModeKey_) this.volumeNormalizationMode = MusicAssistantVolumeNormalizationMode.unknown, @JsonKey(name: MusicAssistantActiveSourceAudioDetails.outputsKey_) final  List<MusicAssistantAudioOutputDetails>? outputs}): _outputs = outputs,super._();
  factory _MusicAssistantActiveSourceAudioDetails.fromJson(Map<String, dynamic> json) => _$MusicAssistantActiveSourceAudioDetailsFromJson(json);

/// inputFormat
@override@JsonKey(name: MusicAssistantActiveSourceAudioDetails.inputFormatKey_) final  MusicAssistantAudioFormat inputFormat;
/// inputFidelity
@override@JsonKey(name: MusicAssistantActiveSourceAudioDetails.inputFidelityKey_) final  MusicAssistantAudioFidelity? inputFidelity;
/// crossfadeMode
@override@JsonKey(name: MusicAssistantActiveSourceAudioDetails.crossfadeModeKey_) final  MusicAssistantCrossfadeMode crossfadeMode;
/// volumeNormalizationMode
@override@JsonKey(name: MusicAssistantActiveSourceAudioDetails.volumeNormalizationModeKey_) final  MusicAssistantVolumeNormalizationMode volumeNormalizationMode;
/// outputs
 final  List<MusicAssistantAudioOutputDetails>? _outputs;
/// outputs
@override@JsonKey(name: MusicAssistantActiveSourceAudioDetails.outputsKey_) List<MusicAssistantAudioOutputDetails>? get outputs {
  final value = _outputs;
  if (value == null) return null;
  if (_outputs is EqualUnmodifiableListView) return _outputs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of MusicAssistantActiveSourceAudioDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantActiveSourceAudioDetailsCopyWith<_MusicAssistantActiveSourceAudioDetails> get copyWith => __$MusicAssistantActiveSourceAudioDetailsCopyWithImpl<_MusicAssistantActiveSourceAudioDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantActiveSourceAudioDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantActiveSourceAudioDetails&&(identical(other.inputFormat, inputFormat) || other.inputFormat == inputFormat)&&(identical(other.inputFidelity, inputFidelity) || other.inputFidelity == inputFidelity)&&(identical(other.crossfadeMode, crossfadeMode) || other.crossfadeMode == crossfadeMode)&&(identical(other.volumeNormalizationMode, volumeNormalizationMode) || other.volumeNormalizationMode == volumeNormalizationMode)&&const DeepCollectionEquality().equals(other._outputs, _outputs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,inputFormat,inputFidelity,crossfadeMode,volumeNormalizationMode,const DeepCollectionEquality().hash(_outputs));

@override
String toString() {
  return 'MusicAssistantActiveSourceAudioDetails(inputFormat: $inputFormat, inputFidelity: $inputFidelity, crossfadeMode: $crossfadeMode, volumeNormalizationMode: $volumeNormalizationMode, outputs: $outputs)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantActiveSourceAudioDetailsCopyWith<$Res> implements $MusicAssistantActiveSourceAudioDetailsCopyWith<$Res> {
  factory _$MusicAssistantActiveSourceAudioDetailsCopyWith(_MusicAssistantActiveSourceAudioDetails value, $Res Function(_MusicAssistantActiveSourceAudioDetails) _then) = __$MusicAssistantActiveSourceAudioDetailsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantActiveSourceAudioDetails.inputFormatKey_) MusicAssistantAudioFormat inputFormat,@JsonKey(name: MusicAssistantActiveSourceAudioDetails.inputFidelityKey_) MusicAssistantAudioFidelity? inputFidelity,@JsonKey(name: MusicAssistantActiveSourceAudioDetails.crossfadeModeKey_) MusicAssistantCrossfadeMode crossfadeMode,@JsonKey(name: MusicAssistantActiveSourceAudioDetails.volumeNormalizationModeKey_) MusicAssistantVolumeNormalizationMode volumeNormalizationMode,@JsonKey(name: MusicAssistantActiveSourceAudioDetails.outputsKey_) List<MusicAssistantAudioOutputDetails>? outputs
});


@override $MusicAssistantAudioFormatCopyWith<$Res> get inputFormat;@override $MusicAssistantAudioFidelityCopyWith<$Res>? get inputFidelity;

}
/// @nodoc
class __$MusicAssistantActiveSourceAudioDetailsCopyWithImpl<$Res>
    implements _$MusicAssistantActiveSourceAudioDetailsCopyWith<$Res> {
  __$MusicAssistantActiveSourceAudioDetailsCopyWithImpl(this._self, this._then);

  final _MusicAssistantActiveSourceAudioDetails _self;
  final $Res Function(_MusicAssistantActiveSourceAudioDetails) _then;

/// Create a copy of MusicAssistantActiveSourceAudioDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? inputFormat = null,Object? inputFidelity = freezed,Object? crossfadeMode = null,Object? volumeNormalizationMode = null,Object? outputs = freezed,}) {
  return _then(_MusicAssistantActiveSourceAudioDetails(
inputFormat: null == inputFormat ? _self.inputFormat : inputFormat // ignore: cast_nullable_to_non_nullable
as MusicAssistantAudioFormat,inputFidelity: freezed == inputFidelity ? _self.inputFidelity : inputFidelity // ignore: cast_nullable_to_non_nullable
as MusicAssistantAudioFidelity?,crossfadeMode: null == crossfadeMode ? _self.crossfadeMode : crossfadeMode // ignore: cast_nullable_to_non_nullable
as MusicAssistantCrossfadeMode,volumeNormalizationMode: null == volumeNormalizationMode ? _self.volumeNormalizationMode : volumeNormalizationMode // ignore: cast_nullable_to_non_nullable
as MusicAssistantVolumeNormalizationMode,outputs: freezed == outputs ? _self._outputs : outputs // ignore: cast_nullable_to_non_nullable
as List<MusicAssistantAudioOutputDetails>?,
  ));
}

/// Create a copy of MusicAssistantActiveSourceAudioDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantAudioFormatCopyWith<$Res> get inputFormat {
  
  return $MusicAssistantAudioFormatCopyWith<$Res>(_self.inputFormat, (value) {
    return _then(_self.copyWith(inputFormat: value));
  });
}/// Create a copy of MusicAssistantActiveSourceAudioDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantAudioFidelityCopyWith<$Res>? get inputFidelity {
    if (_self.inputFidelity == null) {
    return null;
  }

  return $MusicAssistantAudioFidelityCopyWith<$Res>(_self.inputFidelity!, (value) {
    return _then(_self.copyWith(inputFidelity: value));
  });
}
}

// dart format on
