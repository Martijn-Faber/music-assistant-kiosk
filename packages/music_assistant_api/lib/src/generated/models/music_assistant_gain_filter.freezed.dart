// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_gain_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantGainFilter {

/// enabled
@JsonKey(name: MusicAssistantGainFilter.enabledKey_) bool get enabled;/// type
@JsonKey(name: MusicAssistantGainFilter.typeKey_) MusicAssistantGainFilterType get type;/// gain
@JsonKey(name: MusicAssistantGainFilter.gainKey_) double get gain;
/// Create a copy of MusicAssistantGainFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantGainFilterCopyWith<MusicAssistantGainFilter> get copyWith => _$MusicAssistantGainFilterCopyWithImpl<MusicAssistantGainFilter>(this as MusicAssistantGainFilter, _$identity);

  /// Serializes this MusicAssistantGainFilter to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantGainFilter&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.type, type) || other.type == type)&&(identical(other.gain, gain) || other.gain == gain));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enabled,type,gain);

@override
String toString() {
  return 'MusicAssistantGainFilter(enabled: $enabled, type: $type, gain: $gain)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantGainFilterCopyWith<$Res>  {
  factory $MusicAssistantGainFilterCopyWith(MusicAssistantGainFilter value, $Res Function(MusicAssistantGainFilter) _then) = _$MusicAssistantGainFilterCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantGainFilter.enabledKey_) bool enabled,@JsonKey(name: MusicAssistantGainFilter.typeKey_) MusicAssistantGainFilterType type,@JsonKey(name: MusicAssistantGainFilter.gainKey_) double gain
});




}
/// @nodoc
class _$MusicAssistantGainFilterCopyWithImpl<$Res>
    implements $MusicAssistantGainFilterCopyWith<$Res> {
  _$MusicAssistantGainFilterCopyWithImpl(this._self, this._then);

  final MusicAssistantGainFilter _self;
  final $Res Function(MusicAssistantGainFilter) _then;

/// Create a copy of MusicAssistantGainFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enabled = null,Object? type = null,Object? gain = null,}) {
  return _then(_self.copyWith(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MusicAssistantGainFilterType,gain: null == gain ? _self.gain : gain // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [MusicAssistantGainFilter].
extension MusicAssistantGainFilterPatterns on MusicAssistantGainFilter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantGainFilter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantGainFilter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantGainFilter value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantGainFilter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantGainFilter value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantGainFilter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantGainFilter.enabledKey_)  bool enabled, @JsonKey(name: MusicAssistantGainFilter.typeKey_)  MusicAssistantGainFilterType type, @JsonKey(name: MusicAssistantGainFilter.gainKey_)  double gain)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantGainFilter() when $default != null:
return $default(_that.enabled,_that.type,_that.gain);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantGainFilter.enabledKey_)  bool enabled, @JsonKey(name: MusicAssistantGainFilter.typeKey_)  MusicAssistantGainFilterType type, @JsonKey(name: MusicAssistantGainFilter.gainKey_)  double gain)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantGainFilter():
return $default(_that.enabled,_that.type,_that.gain);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantGainFilter.enabledKey_)  bool enabled, @JsonKey(name: MusicAssistantGainFilter.typeKey_)  MusicAssistantGainFilterType type, @JsonKey(name: MusicAssistantGainFilter.gainKey_)  double gain)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantGainFilter() when $default != null:
return $default(_that.enabled,_that.type,_that.gain);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantGainFilter extends MusicAssistantGainFilter {
  const _MusicAssistantGainFilter({@JsonKey(name: MusicAssistantGainFilter.enabledKey_) required this.enabled, @JsonKey(name: MusicAssistantGainFilter.typeKey_) this.type = MusicAssistantGainFilterType.gain, @JsonKey(name: MusicAssistantGainFilter.gainKey_) this.gain = 0.0}): super._();
  factory _MusicAssistantGainFilter.fromJson(Map<String, dynamic> json) => _$MusicAssistantGainFilterFromJson(json);

/// enabled
@override@JsonKey(name: MusicAssistantGainFilter.enabledKey_) final  bool enabled;
/// type
@override@JsonKey(name: MusicAssistantGainFilter.typeKey_) final  MusicAssistantGainFilterType type;
/// gain
@override@JsonKey(name: MusicAssistantGainFilter.gainKey_) final  double gain;

/// Create a copy of MusicAssistantGainFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantGainFilterCopyWith<_MusicAssistantGainFilter> get copyWith => __$MusicAssistantGainFilterCopyWithImpl<_MusicAssistantGainFilter>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantGainFilterToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantGainFilter&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.type, type) || other.type == type)&&(identical(other.gain, gain) || other.gain == gain));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enabled,type,gain);

@override
String toString() {
  return 'MusicAssistantGainFilter(enabled: $enabled, type: $type, gain: $gain)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantGainFilterCopyWith<$Res> implements $MusicAssistantGainFilterCopyWith<$Res> {
  factory _$MusicAssistantGainFilterCopyWith(_MusicAssistantGainFilter value, $Res Function(_MusicAssistantGainFilter) _then) = __$MusicAssistantGainFilterCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantGainFilter.enabledKey_) bool enabled,@JsonKey(name: MusicAssistantGainFilter.typeKey_) MusicAssistantGainFilterType type,@JsonKey(name: MusicAssistantGainFilter.gainKey_) double gain
});




}
/// @nodoc
class __$MusicAssistantGainFilterCopyWithImpl<$Res>
    implements _$MusicAssistantGainFilterCopyWith<$Res> {
  __$MusicAssistantGainFilterCopyWithImpl(this._self, this._then);

  final _MusicAssistantGainFilter _self;
  final $Res Function(_MusicAssistantGainFilter) _then;

/// Create a copy of MusicAssistantGainFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enabled = null,Object? type = null,Object? gain = null,}) {
  return _then(_MusicAssistantGainFilter(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MusicAssistantGainFilterType,gain: null == gain ? _self.gain : gain // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
