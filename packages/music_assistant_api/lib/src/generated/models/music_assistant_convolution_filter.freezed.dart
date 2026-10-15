// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_convolution_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantConvolutionFilter {

/// enabled
@JsonKey(name: MusicAssistantConvolutionFilter.enabledKey_) bool get enabled;/// type
@JsonKey(name: MusicAssistantConvolutionFilter.typeKey_) MusicAssistantConvolutionFilterType get type;/// irId
@JsonKey(name: MusicAssistantConvolutionFilter.irIdKey_) String get irId;/// gain
@JsonKey(name: MusicAssistantConvolutionFilter.gainKey_) double get gain;
/// Create a copy of MusicAssistantConvolutionFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantConvolutionFilterCopyWith<MusicAssistantConvolutionFilter> get copyWith => _$MusicAssistantConvolutionFilterCopyWithImpl<MusicAssistantConvolutionFilter>(this as MusicAssistantConvolutionFilter, _$identity);

  /// Serializes this MusicAssistantConvolutionFilter to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantConvolutionFilter&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.type, type) || other.type == type)&&(identical(other.irId, irId) || other.irId == irId)&&(identical(other.gain, gain) || other.gain == gain));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enabled,type,irId,gain);

@override
String toString() {
  return 'MusicAssistantConvolutionFilter(enabled: $enabled, type: $type, irId: $irId, gain: $gain)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantConvolutionFilterCopyWith<$Res>  {
  factory $MusicAssistantConvolutionFilterCopyWith(MusicAssistantConvolutionFilter value, $Res Function(MusicAssistantConvolutionFilter) _then) = _$MusicAssistantConvolutionFilterCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantConvolutionFilter.enabledKey_) bool enabled,@JsonKey(name: MusicAssistantConvolutionFilter.typeKey_) MusicAssistantConvolutionFilterType type,@JsonKey(name: MusicAssistantConvolutionFilter.irIdKey_) String irId,@JsonKey(name: MusicAssistantConvolutionFilter.gainKey_) double gain
});




}
/// @nodoc
class _$MusicAssistantConvolutionFilterCopyWithImpl<$Res>
    implements $MusicAssistantConvolutionFilterCopyWith<$Res> {
  _$MusicAssistantConvolutionFilterCopyWithImpl(this._self, this._then);

  final MusicAssistantConvolutionFilter _self;
  final $Res Function(MusicAssistantConvolutionFilter) _then;

/// Create a copy of MusicAssistantConvolutionFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enabled = null,Object? type = null,Object? irId = null,Object? gain = null,}) {
  return _then(_self.copyWith(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MusicAssistantConvolutionFilterType,irId: null == irId ? _self.irId : irId // ignore: cast_nullable_to_non_nullable
as String,gain: null == gain ? _self.gain : gain // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [MusicAssistantConvolutionFilter].
extension MusicAssistantConvolutionFilterPatterns on MusicAssistantConvolutionFilter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantConvolutionFilter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantConvolutionFilter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantConvolutionFilter value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantConvolutionFilter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantConvolutionFilter value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantConvolutionFilter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantConvolutionFilter.enabledKey_)  bool enabled, @JsonKey(name: MusicAssistantConvolutionFilter.typeKey_)  MusicAssistantConvolutionFilterType type, @JsonKey(name: MusicAssistantConvolutionFilter.irIdKey_)  String irId, @JsonKey(name: MusicAssistantConvolutionFilter.gainKey_)  double gain)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantConvolutionFilter() when $default != null:
return $default(_that.enabled,_that.type,_that.irId,_that.gain);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantConvolutionFilter.enabledKey_)  bool enabled, @JsonKey(name: MusicAssistantConvolutionFilter.typeKey_)  MusicAssistantConvolutionFilterType type, @JsonKey(name: MusicAssistantConvolutionFilter.irIdKey_)  String irId, @JsonKey(name: MusicAssistantConvolutionFilter.gainKey_)  double gain)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantConvolutionFilter():
return $default(_that.enabled,_that.type,_that.irId,_that.gain);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantConvolutionFilter.enabledKey_)  bool enabled, @JsonKey(name: MusicAssistantConvolutionFilter.typeKey_)  MusicAssistantConvolutionFilterType type, @JsonKey(name: MusicAssistantConvolutionFilter.irIdKey_)  String irId, @JsonKey(name: MusicAssistantConvolutionFilter.gainKey_)  double gain)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantConvolutionFilter() when $default != null:
return $default(_that.enabled,_that.type,_that.irId,_that.gain);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantConvolutionFilter extends MusicAssistantConvolutionFilter {
  const _MusicAssistantConvolutionFilter({@JsonKey(name: MusicAssistantConvolutionFilter.enabledKey_) required this.enabled, @JsonKey(name: MusicAssistantConvolutionFilter.typeKey_) this.type = MusicAssistantConvolutionFilterType.convolution, @JsonKey(name: MusicAssistantConvolutionFilter.irIdKey_) this.irId = '', @JsonKey(name: MusicAssistantConvolutionFilter.gainKey_) this.gain = 0.0}): super._();
  factory _MusicAssistantConvolutionFilter.fromJson(Map<String, dynamic> json) => _$MusicAssistantConvolutionFilterFromJson(json);

/// enabled
@override@JsonKey(name: MusicAssistantConvolutionFilter.enabledKey_) final  bool enabled;
/// type
@override@JsonKey(name: MusicAssistantConvolutionFilter.typeKey_) final  MusicAssistantConvolutionFilterType type;
/// irId
@override@JsonKey(name: MusicAssistantConvolutionFilter.irIdKey_) final  String irId;
/// gain
@override@JsonKey(name: MusicAssistantConvolutionFilter.gainKey_) final  double gain;

/// Create a copy of MusicAssistantConvolutionFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantConvolutionFilterCopyWith<_MusicAssistantConvolutionFilter> get copyWith => __$MusicAssistantConvolutionFilterCopyWithImpl<_MusicAssistantConvolutionFilter>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantConvolutionFilterToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantConvolutionFilter&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.type, type) || other.type == type)&&(identical(other.irId, irId) || other.irId == irId)&&(identical(other.gain, gain) || other.gain == gain));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enabled,type,irId,gain);

@override
String toString() {
  return 'MusicAssistantConvolutionFilter(enabled: $enabled, type: $type, irId: $irId, gain: $gain)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantConvolutionFilterCopyWith<$Res> implements $MusicAssistantConvolutionFilterCopyWith<$Res> {
  factory _$MusicAssistantConvolutionFilterCopyWith(_MusicAssistantConvolutionFilter value, $Res Function(_MusicAssistantConvolutionFilter) _then) = __$MusicAssistantConvolutionFilterCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantConvolutionFilter.enabledKey_) bool enabled,@JsonKey(name: MusicAssistantConvolutionFilter.typeKey_) MusicAssistantConvolutionFilterType type,@JsonKey(name: MusicAssistantConvolutionFilter.irIdKey_) String irId,@JsonKey(name: MusicAssistantConvolutionFilter.gainKey_) double gain
});




}
/// @nodoc
class __$MusicAssistantConvolutionFilterCopyWithImpl<$Res>
    implements _$MusicAssistantConvolutionFilterCopyWith<$Res> {
  __$MusicAssistantConvolutionFilterCopyWithImpl(this._self, this._then);

  final _MusicAssistantConvolutionFilter _self;
  final $Res Function(_MusicAssistantConvolutionFilter) _then;

/// Create a copy of MusicAssistantConvolutionFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enabled = null,Object? type = null,Object? irId = null,Object? gain = null,}) {
  return _then(_MusicAssistantConvolutionFilter(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MusicAssistantConvolutionFilterType,irId: null == irId ? _self.irId : irId // ignore: cast_nullable_to_non_nullable
as String,gain: null == gain ? _self.gain : gain // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
