// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_audio_normalization_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantAudioNormalizationDetails {

/// mode
@JsonKey(name: MusicAssistantAudioNormalizationDetails.modeKey_) MusicAssistantVolumeNormalizationMode get mode;/// measurementSource
@JsonKey(name: MusicAssistantAudioNormalizationDetails.measurementSourceKey_) MusicAssistantAudioNormalizationMeasurementSource get measurementSource;/// targetLufs
@JsonKey(name: MusicAssistantAudioNormalizationDetails.targetLufsKey_) double? get targetLufs;/// measuredLufs
@JsonKey(name: MusicAssistantAudioNormalizationDetails.measuredLufsKey_) double? get measuredLufs;/// appliedGainDb
@JsonKey(name: MusicAssistantAudioNormalizationDetails.appliedGainDbKey_) double? get appliedGainDb;
/// Create a copy of MusicAssistantAudioNormalizationDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantAudioNormalizationDetailsCopyWith<MusicAssistantAudioNormalizationDetails> get copyWith => _$MusicAssistantAudioNormalizationDetailsCopyWithImpl<MusicAssistantAudioNormalizationDetails>(this as MusicAssistantAudioNormalizationDetails, _$identity);

  /// Serializes this MusicAssistantAudioNormalizationDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantAudioNormalizationDetails&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.measurementSource, measurementSource) || other.measurementSource == measurementSource)&&(identical(other.targetLufs, targetLufs) || other.targetLufs == targetLufs)&&(identical(other.measuredLufs, measuredLufs) || other.measuredLufs == measuredLufs)&&(identical(other.appliedGainDb, appliedGainDb) || other.appliedGainDb == appliedGainDb));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mode,measurementSource,targetLufs,measuredLufs,appliedGainDb);

@override
String toString() {
  return 'MusicAssistantAudioNormalizationDetails(mode: $mode, measurementSource: $measurementSource, targetLufs: $targetLufs, measuredLufs: $measuredLufs, appliedGainDb: $appliedGainDb)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantAudioNormalizationDetailsCopyWith<$Res>  {
  factory $MusicAssistantAudioNormalizationDetailsCopyWith(MusicAssistantAudioNormalizationDetails value, $Res Function(MusicAssistantAudioNormalizationDetails) _then) = _$MusicAssistantAudioNormalizationDetailsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantAudioNormalizationDetails.modeKey_) MusicAssistantVolumeNormalizationMode mode,@JsonKey(name: MusicAssistantAudioNormalizationDetails.measurementSourceKey_) MusicAssistantAudioNormalizationMeasurementSource measurementSource,@JsonKey(name: MusicAssistantAudioNormalizationDetails.targetLufsKey_) double? targetLufs,@JsonKey(name: MusicAssistantAudioNormalizationDetails.measuredLufsKey_) double? measuredLufs,@JsonKey(name: MusicAssistantAudioNormalizationDetails.appliedGainDbKey_) double? appliedGainDb
});




}
/// @nodoc
class _$MusicAssistantAudioNormalizationDetailsCopyWithImpl<$Res>
    implements $MusicAssistantAudioNormalizationDetailsCopyWith<$Res> {
  _$MusicAssistantAudioNormalizationDetailsCopyWithImpl(this._self, this._then);

  final MusicAssistantAudioNormalizationDetails _self;
  final $Res Function(MusicAssistantAudioNormalizationDetails) _then;

/// Create a copy of MusicAssistantAudioNormalizationDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mode = null,Object? measurementSource = null,Object? targetLufs = freezed,Object? measuredLufs = freezed,Object? appliedGainDb = freezed,}) {
  return _then(_self.copyWith(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as MusicAssistantVolumeNormalizationMode,measurementSource: null == measurementSource ? _self.measurementSource : measurementSource // ignore: cast_nullable_to_non_nullable
as MusicAssistantAudioNormalizationMeasurementSource,targetLufs: freezed == targetLufs ? _self.targetLufs : targetLufs // ignore: cast_nullable_to_non_nullable
as double?,measuredLufs: freezed == measuredLufs ? _self.measuredLufs : measuredLufs // ignore: cast_nullable_to_non_nullable
as double?,appliedGainDb: freezed == appliedGainDb ? _self.appliedGainDb : appliedGainDb // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [MusicAssistantAudioNormalizationDetails].
extension MusicAssistantAudioNormalizationDetailsPatterns on MusicAssistantAudioNormalizationDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantAudioNormalizationDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantAudioNormalizationDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantAudioNormalizationDetails value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantAudioNormalizationDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantAudioNormalizationDetails value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantAudioNormalizationDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantAudioNormalizationDetails.modeKey_)  MusicAssistantVolumeNormalizationMode mode, @JsonKey(name: MusicAssistantAudioNormalizationDetails.measurementSourceKey_)  MusicAssistantAudioNormalizationMeasurementSource measurementSource, @JsonKey(name: MusicAssistantAudioNormalizationDetails.targetLufsKey_)  double? targetLufs, @JsonKey(name: MusicAssistantAudioNormalizationDetails.measuredLufsKey_)  double? measuredLufs, @JsonKey(name: MusicAssistantAudioNormalizationDetails.appliedGainDbKey_)  double? appliedGainDb)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantAudioNormalizationDetails() when $default != null:
return $default(_that.mode,_that.measurementSource,_that.targetLufs,_that.measuredLufs,_that.appliedGainDb);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantAudioNormalizationDetails.modeKey_)  MusicAssistantVolumeNormalizationMode mode, @JsonKey(name: MusicAssistantAudioNormalizationDetails.measurementSourceKey_)  MusicAssistantAudioNormalizationMeasurementSource measurementSource, @JsonKey(name: MusicAssistantAudioNormalizationDetails.targetLufsKey_)  double? targetLufs, @JsonKey(name: MusicAssistantAudioNormalizationDetails.measuredLufsKey_)  double? measuredLufs, @JsonKey(name: MusicAssistantAudioNormalizationDetails.appliedGainDbKey_)  double? appliedGainDb)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantAudioNormalizationDetails():
return $default(_that.mode,_that.measurementSource,_that.targetLufs,_that.measuredLufs,_that.appliedGainDb);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantAudioNormalizationDetails.modeKey_)  MusicAssistantVolumeNormalizationMode mode, @JsonKey(name: MusicAssistantAudioNormalizationDetails.measurementSourceKey_)  MusicAssistantAudioNormalizationMeasurementSource measurementSource, @JsonKey(name: MusicAssistantAudioNormalizationDetails.targetLufsKey_)  double? targetLufs, @JsonKey(name: MusicAssistantAudioNormalizationDetails.measuredLufsKey_)  double? measuredLufs, @JsonKey(name: MusicAssistantAudioNormalizationDetails.appliedGainDbKey_)  double? appliedGainDb)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantAudioNormalizationDetails() when $default != null:
return $default(_that.mode,_that.measurementSource,_that.targetLufs,_that.measuredLufs,_that.appliedGainDb);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantAudioNormalizationDetails extends MusicAssistantAudioNormalizationDetails {
  const _MusicAssistantAudioNormalizationDetails({@JsonKey(name: MusicAssistantAudioNormalizationDetails.modeKey_) this.mode = MusicAssistantVolumeNormalizationMode.unknown, @JsonKey(name: MusicAssistantAudioNormalizationDetails.measurementSourceKey_) this.measurementSource = MusicAssistantAudioNormalizationMeasurementSource.unknown, @JsonKey(name: MusicAssistantAudioNormalizationDetails.targetLufsKey_) this.targetLufs, @JsonKey(name: MusicAssistantAudioNormalizationDetails.measuredLufsKey_) this.measuredLufs, @JsonKey(name: MusicAssistantAudioNormalizationDetails.appliedGainDbKey_) this.appliedGainDb}): super._();
  factory _MusicAssistantAudioNormalizationDetails.fromJson(Map<String, dynamic> json) => _$MusicAssistantAudioNormalizationDetailsFromJson(json);

/// mode
@override@JsonKey(name: MusicAssistantAudioNormalizationDetails.modeKey_) final  MusicAssistantVolumeNormalizationMode mode;
/// measurementSource
@override@JsonKey(name: MusicAssistantAudioNormalizationDetails.measurementSourceKey_) final  MusicAssistantAudioNormalizationMeasurementSource measurementSource;
/// targetLufs
@override@JsonKey(name: MusicAssistantAudioNormalizationDetails.targetLufsKey_) final  double? targetLufs;
/// measuredLufs
@override@JsonKey(name: MusicAssistantAudioNormalizationDetails.measuredLufsKey_) final  double? measuredLufs;
/// appliedGainDb
@override@JsonKey(name: MusicAssistantAudioNormalizationDetails.appliedGainDbKey_) final  double? appliedGainDb;

/// Create a copy of MusicAssistantAudioNormalizationDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantAudioNormalizationDetailsCopyWith<_MusicAssistantAudioNormalizationDetails> get copyWith => __$MusicAssistantAudioNormalizationDetailsCopyWithImpl<_MusicAssistantAudioNormalizationDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantAudioNormalizationDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantAudioNormalizationDetails&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.measurementSource, measurementSource) || other.measurementSource == measurementSource)&&(identical(other.targetLufs, targetLufs) || other.targetLufs == targetLufs)&&(identical(other.measuredLufs, measuredLufs) || other.measuredLufs == measuredLufs)&&(identical(other.appliedGainDb, appliedGainDb) || other.appliedGainDb == appliedGainDb));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mode,measurementSource,targetLufs,measuredLufs,appliedGainDb);

@override
String toString() {
  return 'MusicAssistantAudioNormalizationDetails(mode: $mode, measurementSource: $measurementSource, targetLufs: $targetLufs, measuredLufs: $measuredLufs, appliedGainDb: $appliedGainDb)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantAudioNormalizationDetailsCopyWith<$Res> implements $MusicAssistantAudioNormalizationDetailsCopyWith<$Res> {
  factory _$MusicAssistantAudioNormalizationDetailsCopyWith(_MusicAssistantAudioNormalizationDetails value, $Res Function(_MusicAssistantAudioNormalizationDetails) _then) = __$MusicAssistantAudioNormalizationDetailsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantAudioNormalizationDetails.modeKey_) MusicAssistantVolumeNormalizationMode mode,@JsonKey(name: MusicAssistantAudioNormalizationDetails.measurementSourceKey_) MusicAssistantAudioNormalizationMeasurementSource measurementSource,@JsonKey(name: MusicAssistantAudioNormalizationDetails.targetLufsKey_) double? targetLufs,@JsonKey(name: MusicAssistantAudioNormalizationDetails.measuredLufsKey_) double? measuredLufs,@JsonKey(name: MusicAssistantAudioNormalizationDetails.appliedGainDbKey_) double? appliedGainDb
});




}
/// @nodoc
class __$MusicAssistantAudioNormalizationDetailsCopyWithImpl<$Res>
    implements _$MusicAssistantAudioNormalizationDetailsCopyWith<$Res> {
  __$MusicAssistantAudioNormalizationDetailsCopyWithImpl(this._self, this._then);

  final _MusicAssistantAudioNormalizationDetails _self;
  final $Res Function(_MusicAssistantAudioNormalizationDetails) _then;

/// Create a copy of MusicAssistantAudioNormalizationDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mode = null,Object? measurementSource = null,Object? targetLufs = freezed,Object? measuredLufs = freezed,Object? appliedGainDb = freezed,}) {
  return _then(_MusicAssistantAudioNormalizationDetails(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as MusicAssistantVolumeNormalizationMode,measurementSource: null == measurementSource ? _self.measurementSource : measurementSource // ignore: cast_nullable_to_non_nullable
as MusicAssistantAudioNormalizationMeasurementSource,targetLufs: freezed == targetLufs ? _self.targetLufs : targetLufs // ignore: cast_nullable_to_non_nullable
as double?,measuredLufs: freezed == measuredLufs ? _self.measuredLufs : measuredLufs // ignore: cast_nullable_to_non_nullable
as double?,appliedGainDb: freezed == appliedGainDb ? _self.appliedGainDb : appliedGainDb // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
