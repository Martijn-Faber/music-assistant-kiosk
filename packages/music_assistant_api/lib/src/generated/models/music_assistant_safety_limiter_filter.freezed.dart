// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_safety_limiter_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantSafetyLimiterFilter {

/// enabled
@JsonKey(name: MusicAssistantSafetyLimiterFilter.enabledKey_) bool get enabled;/// type
@JsonKey(name: MusicAssistantSafetyLimiterFilter.typeKey_) MusicAssistantSafetyLimiterFilterType get type;/// ceiling
@JsonKey(name: MusicAssistantSafetyLimiterFilter.ceilingKey_) double get ceiling;
/// Create a copy of MusicAssistantSafetyLimiterFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantSafetyLimiterFilterCopyWith<MusicAssistantSafetyLimiterFilter> get copyWith => _$MusicAssistantSafetyLimiterFilterCopyWithImpl<MusicAssistantSafetyLimiterFilter>(this as MusicAssistantSafetyLimiterFilter, _$identity);

  /// Serializes this MusicAssistantSafetyLimiterFilter to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantSafetyLimiterFilter&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.type, type) || other.type == type)&&(identical(other.ceiling, ceiling) || other.ceiling == ceiling));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enabled,type,ceiling);

@override
String toString() {
  return 'MusicAssistantSafetyLimiterFilter(enabled: $enabled, type: $type, ceiling: $ceiling)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantSafetyLimiterFilterCopyWith<$Res>  {
  factory $MusicAssistantSafetyLimiterFilterCopyWith(MusicAssistantSafetyLimiterFilter value, $Res Function(MusicAssistantSafetyLimiterFilter) _then) = _$MusicAssistantSafetyLimiterFilterCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantSafetyLimiterFilter.enabledKey_) bool enabled,@JsonKey(name: MusicAssistantSafetyLimiterFilter.typeKey_) MusicAssistantSafetyLimiterFilterType type,@JsonKey(name: MusicAssistantSafetyLimiterFilter.ceilingKey_) double ceiling
});




}
/// @nodoc
class _$MusicAssistantSafetyLimiterFilterCopyWithImpl<$Res>
    implements $MusicAssistantSafetyLimiterFilterCopyWith<$Res> {
  _$MusicAssistantSafetyLimiterFilterCopyWithImpl(this._self, this._then);

  final MusicAssistantSafetyLimiterFilter _self;
  final $Res Function(MusicAssistantSafetyLimiterFilter) _then;

/// Create a copy of MusicAssistantSafetyLimiterFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enabled = null,Object? type = null,Object? ceiling = null,}) {
  return _then(_self.copyWith(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MusicAssistantSafetyLimiterFilterType,ceiling: null == ceiling ? _self.ceiling : ceiling // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [MusicAssistantSafetyLimiterFilter].
extension MusicAssistantSafetyLimiterFilterPatterns on MusicAssistantSafetyLimiterFilter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantSafetyLimiterFilter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantSafetyLimiterFilter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantSafetyLimiterFilter value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantSafetyLimiterFilter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantSafetyLimiterFilter value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantSafetyLimiterFilter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantSafetyLimiterFilter.enabledKey_)  bool enabled, @JsonKey(name: MusicAssistantSafetyLimiterFilter.typeKey_)  MusicAssistantSafetyLimiterFilterType type, @JsonKey(name: MusicAssistantSafetyLimiterFilter.ceilingKey_)  double ceiling)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantSafetyLimiterFilter() when $default != null:
return $default(_that.enabled,_that.type,_that.ceiling);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantSafetyLimiterFilter.enabledKey_)  bool enabled, @JsonKey(name: MusicAssistantSafetyLimiterFilter.typeKey_)  MusicAssistantSafetyLimiterFilterType type, @JsonKey(name: MusicAssistantSafetyLimiterFilter.ceilingKey_)  double ceiling)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantSafetyLimiterFilter():
return $default(_that.enabled,_that.type,_that.ceiling);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantSafetyLimiterFilter.enabledKey_)  bool enabled, @JsonKey(name: MusicAssistantSafetyLimiterFilter.typeKey_)  MusicAssistantSafetyLimiterFilterType type, @JsonKey(name: MusicAssistantSafetyLimiterFilter.ceilingKey_)  double ceiling)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantSafetyLimiterFilter() when $default != null:
return $default(_that.enabled,_that.type,_that.ceiling);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantSafetyLimiterFilter extends MusicAssistantSafetyLimiterFilter {
  const _MusicAssistantSafetyLimiterFilter({@JsonKey(name: MusicAssistantSafetyLimiterFilter.enabledKey_) required this.enabled, @JsonKey(name: MusicAssistantSafetyLimiterFilter.typeKey_) this.type = MusicAssistantSafetyLimiterFilterType.safetyLimiter, @JsonKey(name: MusicAssistantSafetyLimiterFilter.ceilingKey_) this.ceiling = -2.0}): super._();
  factory _MusicAssistantSafetyLimiterFilter.fromJson(Map<String, dynamic> json) => _$MusicAssistantSafetyLimiterFilterFromJson(json);

/// enabled
@override@JsonKey(name: MusicAssistantSafetyLimiterFilter.enabledKey_) final  bool enabled;
/// type
@override@JsonKey(name: MusicAssistantSafetyLimiterFilter.typeKey_) final  MusicAssistantSafetyLimiterFilterType type;
/// ceiling
@override@JsonKey(name: MusicAssistantSafetyLimiterFilter.ceilingKey_) final  double ceiling;

/// Create a copy of MusicAssistantSafetyLimiterFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantSafetyLimiterFilterCopyWith<_MusicAssistantSafetyLimiterFilter> get copyWith => __$MusicAssistantSafetyLimiterFilterCopyWithImpl<_MusicAssistantSafetyLimiterFilter>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantSafetyLimiterFilterToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantSafetyLimiterFilter&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.type, type) || other.type == type)&&(identical(other.ceiling, ceiling) || other.ceiling == ceiling));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enabled,type,ceiling);

@override
String toString() {
  return 'MusicAssistantSafetyLimiterFilter(enabled: $enabled, type: $type, ceiling: $ceiling)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantSafetyLimiterFilterCopyWith<$Res> implements $MusicAssistantSafetyLimiterFilterCopyWith<$Res> {
  factory _$MusicAssistantSafetyLimiterFilterCopyWith(_MusicAssistantSafetyLimiterFilter value, $Res Function(_MusicAssistantSafetyLimiterFilter) _then) = __$MusicAssistantSafetyLimiterFilterCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantSafetyLimiterFilter.enabledKey_) bool enabled,@JsonKey(name: MusicAssistantSafetyLimiterFilter.typeKey_) MusicAssistantSafetyLimiterFilterType type,@JsonKey(name: MusicAssistantSafetyLimiterFilter.ceilingKey_) double ceiling
});




}
/// @nodoc
class __$MusicAssistantSafetyLimiterFilterCopyWithImpl<$Res>
    implements _$MusicAssistantSafetyLimiterFilterCopyWith<$Res> {
  __$MusicAssistantSafetyLimiterFilterCopyWithImpl(this._self, this._then);

  final _MusicAssistantSafetyLimiterFilter _self;
  final $Res Function(_MusicAssistantSafetyLimiterFilter) _then;

/// Create a copy of MusicAssistantSafetyLimiterFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enabled = null,Object? type = null,Object? ceiling = null,}) {
  return _then(_MusicAssistantSafetyLimiterFilter(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MusicAssistantSafetyLimiterFilterType,ceiling: null == ceiling ? _self.ceiling : ceiling // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
