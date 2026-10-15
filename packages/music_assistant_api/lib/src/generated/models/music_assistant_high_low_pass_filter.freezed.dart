// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_high_low_pass_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantHighLowPassFilter {

/// enabled
@JsonKey(name: MusicAssistantHighLowPassFilter.enabledKey_) bool get enabled;/// type
@JsonKey(name: MusicAssistantHighLowPassFilter.typeKey_) MusicAssistantHighLowPassFilterType get type;/// mode
@JsonKey(name: MusicAssistantHighLowPassFilter.modeKey_) MusicAssistantHighLowPassMode get mode;/// frequency
@JsonKey(name: MusicAssistantHighLowPassFilter.frequencyKey_) double get frequency;/// slope
@JsonKey(name: MusicAssistantHighLowPassFilter.slopeKey_) MusicAssistantHighLowPassSlope get slope;
/// Create a copy of MusicAssistantHighLowPassFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantHighLowPassFilterCopyWith<MusicAssistantHighLowPassFilter> get copyWith => _$MusicAssistantHighLowPassFilterCopyWithImpl<MusicAssistantHighLowPassFilter>(this as MusicAssistantHighLowPassFilter, _$identity);

  /// Serializes this MusicAssistantHighLowPassFilter to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantHighLowPassFilter&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.type, type) || other.type == type)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.frequency, frequency) || other.frequency == frequency)&&(identical(other.slope, slope) || other.slope == slope));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enabled,type,mode,frequency,slope);

@override
String toString() {
  return 'MusicAssistantHighLowPassFilter(enabled: $enabled, type: $type, mode: $mode, frequency: $frequency, slope: $slope)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantHighLowPassFilterCopyWith<$Res>  {
  factory $MusicAssistantHighLowPassFilterCopyWith(MusicAssistantHighLowPassFilter value, $Res Function(MusicAssistantHighLowPassFilter) _then) = _$MusicAssistantHighLowPassFilterCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantHighLowPassFilter.enabledKey_) bool enabled,@JsonKey(name: MusicAssistantHighLowPassFilter.typeKey_) MusicAssistantHighLowPassFilterType type,@JsonKey(name: MusicAssistantHighLowPassFilter.modeKey_) MusicAssistantHighLowPassMode mode,@JsonKey(name: MusicAssistantHighLowPassFilter.frequencyKey_) double frequency,@JsonKey(name: MusicAssistantHighLowPassFilter.slopeKey_) MusicAssistantHighLowPassSlope slope
});




}
/// @nodoc
class _$MusicAssistantHighLowPassFilterCopyWithImpl<$Res>
    implements $MusicAssistantHighLowPassFilterCopyWith<$Res> {
  _$MusicAssistantHighLowPassFilterCopyWithImpl(this._self, this._then);

  final MusicAssistantHighLowPassFilter _self;
  final $Res Function(MusicAssistantHighLowPassFilter) _then;

/// Create a copy of MusicAssistantHighLowPassFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enabled = null,Object? type = null,Object? mode = null,Object? frequency = null,Object? slope = null,}) {
  return _then(_self.copyWith(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MusicAssistantHighLowPassFilterType,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as MusicAssistantHighLowPassMode,frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as double,slope: null == slope ? _self.slope : slope // ignore: cast_nullable_to_non_nullable
as MusicAssistantHighLowPassSlope,
  ));
}

}


/// Adds pattern-matching-related methods to [MusicAssistantHighLowPassFilter].
extension MusicAssistantHighLowPassFilterPatterns on MusicAssistantHighLowPassFilter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantHighLowPassFilter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantHighLowPassFilter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantHighLowPassFilter value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantHighLowPassFilter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantHighLowPassFilter value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantHighLowPassFilter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantHighLowPassFilter.enabledKey_)  bool enabled, @JsonKey(name: MusicAssistantHighLowPassFilter.typeKey_)  MusicAssistantHighLowPassFilterType type, @JsonKey(name: MusicAssistantHighLowPassFilter.modeKey_)  MusicAssistantHighLowPassMode mode, @JsonKey(name: MusicAssistantHighLowPassFilter.frequencyKey_)  double frequency, @JsonKey(name: MusicAssistantHighLowPassFilter.slopeKey_)  MusicAssistantHighLowPassSlope slope)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantHighLowPassFilter() when $default != null:
return $default(_that.enabled,_that.type,_that.mode,_that.frequency,_that.slope);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantHighLowPassFilter.enabledKey_)  bool enabled, @JsonKey(name: MusicAssistantHighLowPassFilter.typeKey_)  MusicAssistantHighLowPassFilterType type, @JsonKey(name: MusicAssistantHighLowPassFilter.modeKey_)  MusicAssistantHighLowPassMode mode, @JsonKey(name: MusicAssistantHighLowPassFilter.frequencyKey_)  double frequency, @JsonKey(name: MusicAssistantHighLowPassFilter.slopeKey_)  MusicAssistantHighLowPassSlope slope)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantHighLowPassFilter():
return $default(_that.enabled,_that.type,_that.mode,_that.frequency,_that.slope);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantHighLowPassFilter.enabledKey_)  bool enabled, @JsonKey(name: MusicAssistantHighLowPassFilter.typeKey_)  MusicAssistantHighLowPassFilterType type, @JsonKey(name: MusicAssistantHighLowPassFilter.modeKey_)  MusicAssistantHighLowPassMode mode, @JsonKey(name: MusicAssistantHighLowPassFilter.frequencyKey_)  double frequency, @JsonKey(name: MusicAssistantHighLowPassFilter.slopeKey_)  MusicAssistantHighLowPassSlope slope)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantHighLowPassFilter() when $default != null:
return $default(_that.enabled,_that.type,_that.mode,_that.frequency,_that.slope);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantHighLowPassFilter extends MusicAssistantHighLowPassFilter {
  const _MusicAssistantHighLowPassFilter({@JsonKey(name: MusicAssistantHighLowPassFilter.enabledKey_) required this.enabled, @JsonKey(name: MusicAssistantHighLowPassFilter.typeKey_) this.type = MusicAssistantHighLowPassFilterType.highLowPass, @JsonKey(name: MusicAssistantHighLowPassFilter.modeKey_) this.mode = MusicAssistantHighLowPassMode.highPass, @JsonKey(name: MusicAssistantHighLowPassFilter.frequencyKey_) this.frequency = 80.0, @JsonKey(name: MusicAssistantHighLowPassFilter.slopeKey_) this.slope = MusicAssistantHighLowPassSlope.value12}): super._();
  factory _MusicAssistantHighLowPassFilter.fromJson(Map<String, dynamic> json) => _$MusicAssistantHighLowPassFilterFromJson(json);

/// enabled
@override@JsonKey(name: MusicAssistantHighLowPassFilter.enabledKey_) final  bool enabled;
/// type
@override@JsonKey(name: MusicAssistantHighLowPassFilter.typeKey_) final  MusicAssistantHighLowPassFilterType type;
/// mode
@override@JsonKey(name: MusicAssistantHighLowPassFilter.modeKey_) final  MusicAssistantHighLowPassMode mode;
/// frequency
@override@JsonKey(name: MusicAssistantHighLowPassFilter.frequencyKey_) final  double frequency;
/// slope
@override@JsonKey(name: MusicAssistantHighLowPassFilter.slopeKey_) final  MusicAssistantHighLowPassSlope slope;

/// Create a copy of MusicAssistantHighLowPassFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantHighLowPassFilterCopyWith<_MusicAssistantHighLowPassFilter> get copyWith => __$MusicAssistantHighLowPassFilterCopyWithImpl<_MusicAssistantHighLowPassFilter>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantHighLowPassFilterToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantHighLowPassFilter&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.type, type) || other.type == type)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.frequency, frequency) || other.frequency == frequency)&&(identical(other.slope, slope) || other.slope == slope));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enabled,type,mode,frequency,slope);

@override
String toString() {
  return 'MusicAssistantHighLowPassFilter(enabled: $enabled, type: $type, mode: $mode, frequency: $frequency, slope: $slope)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantHighLowPassFilterCopyWith<$Res> implements $MusicAssistantHighLowPassFilterCopyWith<$Res> {
  factory _$MusicAssistantHighLowPassFilterCopyWith(_MusicAssistantHighLowPassFilter value, $Res Function(_MusicAssistantHighLowPassFilter) _then) = __$MusicAssistantHighLowPassFilterCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantHighLowPassFilter.enabledKey_) bool enabled,@JsonKey(name: MusicAssistantHighLowPassFilter.typeKey_) MusicAssistantHighLowPassFilterType type,@JsonKey(name: MusicAssistantHighLowPassFilter.modeKey_) MusicAssistantHighLowPassMode mode,@JsonKey(name: MusicAssistantHighLowPassFilter.frequencyKey_) double frequency,@JsonKey(name: MusicAssistantHighLowPassFilter.slopeKey_) MusicAssistantHighLowPassSlope slope
});




}
/// @nodoc
class __$MusicAssistantHighLowPassFilterCopyWithImpl<$Res>
    implements _$MusicAssistantHighLowPassFilterCopyWith<$Res> {
  __$MusicAssistantHighLowPassFilterCopyWithImpl(this._self, this._then);

  final _MusicAssistantHighLowPassFilter _self;
  final $Res Function(_MusicAssistantHighLowPassFilter) _then;

/// Create a copy of MusicAssistantHighLowPassFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enabled = null,Object? type = null,Object? mode = null,Object? frequency = null,Object? slope = null,}) {
  return _then(_MusicAssistantHighLowPassFilter(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MusicAssistantHighLowPassFilterType,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as MusicAssistantHighLowPassMode,frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as double,slope: null == slope ? _self.slope : slope // ignore: cast_nullable_to_non_nullable
as MusicAssistantHighLowPassSlope,
  ));
}


}

// dart format on
