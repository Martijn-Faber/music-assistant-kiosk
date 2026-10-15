// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_tone_control_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantToneControlFilter {

/// enabled
@JsonKey(name: MusicAssistantToneControlFilter.enabledKey_) bool get enabled;/// type
@JsonKey(name: MusicAssistantToneControlFilter.typeKey_) MusicAssistantToneControlFilterType get type;/// bassLevel
@JsonKey(name: MusicAssistantToneControlFilter.bassLevelKey_) double get bassLevel;/// midLevel
@JsonKey(name: MusicAssistantToneControlFilter.midLevelKey_) double get midLevel;/// trebleLevel
@JsonKey(name: MusicAssistantToneControlFilter.trebleLevelKey_) double get trebleLevel;
/// Create a copy of MusicAssistantToneControlFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantToneControlFilterCopyWith<MusicAssistantToneControlFilter> get copyWith => _$MusicAssistantToneControlFilterCopyWithImpl<MusicAssistantToneControlFilter>(this as MusicAssistantToneControlFilter, _$identity);

  /// Serializes this MusicAssistantToneControlFilter to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantToneControlFilter&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.type, type) || other.type == type)&&(identical(other.bassLevel, bassLevel) || other.bassLevel == bassLevel)&&(identical(other.midLevel, midLevel) || other.midLevel == midLevel)&&(identical(other.trebleLevel, trebleLevel) || other.trebleLevel == trebleLevel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enabled,type,bassLevel,midLevel,trebleLevel);

@override
String toString() {
  return 'MusicAssistantToneControlFilter(enabled: $enabled, type: $type, bassLevel: $bassLevel, midLevel: $midLevel, trebleLevel: $trebleLevel)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantToneControlFilterCopyWith<$Res>  {
  factory $MusicAssistantToneControlFilterCopyWith(MusicAssistantToneControlFilter value, $Res Function(MusicAssistantToneControlFilter) _then) = _$MusicAssistantToneControlFilterCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantToneControlFilter.enabledKey_) bool enabled,@JsonKey(name: MusicAssistantToneControlFilter.typeKey_) MusicAssistantToneControlFilterType type,@JsonKey(name: MusicAssistantToneControlFilter.bassLevelKey_) double bassLevel,@JsonKey(name: MusicAssistantToneControlFilter.midLevelKey_) double midLevel,@JsonKey(name: MusicAssistantToneControlFilter.trebleLevelKey_) double trebleLevel
});




}
/// @nodoc
class _$MusicAssistantToneControlFilterCopyWithImpl<$Res>
    implements $MusicAssistantToneControlFilterCopyWith<$Res> {
  _$MusicAssistantToneControlFilterCopyWithImpl(this._self, this._then);

  final MusicAssistantToneControlFilter _self;
  final $Res Function(MusicAssistantToneControlFilter) _then;

/// Create a copy of MusicAssistantToneControlFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enabled = null,Object? type = null,Object? bassLevel = null,Object? midLevel = null,Object? trebleLevel = null,}) {
  return _then(_self.copyWith(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MusicAssistantToneControlFilterType,bassLevel: null == bassLevel ? _self.bassLevel : bassLevel // ignore: cast_nullable_to_non_nullable
as double,midLevel: null == midLevel ? _self.midLevel : midLevel // ignore: cast_nullable_to_non_nullable
as double,trebleLevel: null == trebleLevel ? _self.trebleLevel : trebleLevel // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [MusicAssistantToneControlFilter].
extension MusicAssistantToneControlFilterPatterns on MusicAssistantToneControlFilter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantToneControlFilter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantToneControlFilter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantToneControlFilter value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantToneControlFilter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantToneControlFilter value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantToneControlFilter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantToneControlFilter.enabledKey_)  bool enabled, @JsonKey(name: MusicAssistantToneControlFilter.typeKey_)  MusicAssistantToneControlFilterType type, @JsonKey(name: MusicAssistantToneControlFilter.bassLevelKey_)  double bassLevel, @JsonKey(name: MusicAssistantToneControlFilter.midLevelKey_)  double midLevel, @JsonKey(name: MusicAssistantToneControlFilter.trebleLevelKey_)  double trebleLevel)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantToneControlFilter() when $default != null:
return $default(_that.enabled,_that.type,_that.bassLevel,_that.midLevel,_that.trebleLevel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantToneControlFilter.enabledKey_)  bool enabled, @JsonKey(name: MusicAssistantToneControlFilter.typeKey_)  MusicAssistantToneControlFilterType type, @JsonKey(name: MusicAssistantToneControlFilter.bassLevelKey_)  double bassLevel, @JsonKey(name: MusicAssistantToneControlFilter.midLevelKey_)  double midLevel, @JsonKey(name: MusicAssistantToneControlFilter.trebleLevelKey_)  double trebleLevel)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantToneControlFilter():
return $default(_that.enabled,_that.type,_that.bassLevel,_that.midLevel,_that.trebleLevel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantToneControlFilter.enabledKey_)  bool enabled, @JsonKey(name: MusicAssistantToneControlFilter.typeKey_)  MusicAssistantToneControlFilterType type, @JsonKey(name: MusicAssistantToneControlFilter.bassLevelKey_)  double bassLevel, @JsonKey(name: MusicAssistantToneControlFilter.midLevelKey_)  double midLevel, @JsonKey(name: MusicAssistantToneControlFilter.trebleLevelKey_)  double trebleLevel)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantToneControlFilter() when $default != null:
return $default(_that.enabled,_that.type,_that.bassLevel,_that.midLevel,_that.trebleLevel);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantToneControlFilter extends MusicAssistantToneControlFilter {
  const _MusicAssistantToneControlFilter({@JsonKey(name: MusicAssistantToneControlFilter.enabledKey_) required this.enabled, @JsonKey(name: MusicAssistantToneControlFilter.typeKey_) this.type = MusicAssistantToneControlFilterType.toneControl, @JsonKey(name: MusicAssistantToneControlFilter.bassLevelKey_) this.bassLevel = 0.0, @JsonKey(name: MusicAssistantToneControlFilter.midLevelKey_) this.midLevel = 0.0, @JsonKey(name: MusicAssistantToneControlFilter.trebleLevelKey_) this.trebleLevel = 0.0}): super._();
  factory _MusicAssistantToneControlFilter.fromJson(Map<String, dynamic> json) => _$MusicAssistantToneControlFilterFromJson(json);

/// enabled
@override@JsonKey(name: MusicAssistantToneControlFilter.enabledKey_) final  bool enabled;
/// type
@override@JsonKey(name: MusicAssistantToneControlFilter.typeKey_) final  MusicAssistantToneControlFilterType type;
/// bassLevel
@override@JsonKey(name: MusicAssistantToneControlFilter.bassLevelKey_) final  double bassLevel;
/// midLevel
@override@JsonKey(name: MusicAssistantToneControlFilter.midLevelKey_) final  double midLevel;
/// trebleLevel
@override@JsonKey(name: MusicAssistantToneControlFilter.trebleLevelKey_) final  double trebleLevel;

/// Create a copy of MusicAssistantToneControlFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantToneControlFilterCopyWith<_MusicAssistantToneControlFilter> get copyWith => __$MusicAssistantToneControlFilterCopyWithImpl<_MusicAssistantToneControlFilter>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantToneControlFilterToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantToneControlFilter&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.type, type) || other.type == type)&&(identical(other.bassLevel, bassLevel) || other.bassLevel == bassLevel)&&(identical(other.midLevel, midLevel) || other.midLevel == midLevel)&&(identical(other.trebleLevel, trebleLevel) || other.trebleLevel == trebleLevel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enabled,type,bassLevel,midLevel,trebleLevel);

@override
String toString() {
  return 'MusicAssistantToneControlFilter(enabled: $enabled, type: $type, bassLevel: $bassLevel, midLevel: $midLevel, trebleLevel: $trebleLevel)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantToneControlFilterCopyWith<$Res> implements $MusicAssistantToneControlFilterCopyWith<$Res> {
  factory _$MusicAssistantToneControlFilterCopyWith(_MusicAssistantToneControlFilter value, $Res Function(_MusicAssistantToneControlFilter) _then) = __$MusicAssistantToneControlFilterCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantToneControlFilter.enabledKey_) bool enabled,@JsonKey(name: MusicAssistantToneControlFilter.typeKey_) MusicAssistantToneControlFilterType type,@JsonKey(name: MusicAssistantToneControlFilter.bassLevelKey_) double bassLevel,@JsonKey(name: MusicAssistantToneControlFilter.midLevelKey_) double midLevel,@JsonKey(name: MusicAssistantToneControlFilter.trebleLevelKey_) double trebleLevel
});




}
/// @nodoc
class __$MusicAssistantToneControlFilterCopyWithImpl<$Res>
    implements _$MusicAssistantToneControlFilterCopyWith<$Res> {
  __$MusicAssistantToneControlFilterCopyWithImpl(this._self, this._then);

  final _MusicAssistantToneControlFilter _self;
  final $Res Function(_MusicAssistantToneControlFilter) _then;

/// Create a copy of MusicAssistantToneControlFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enabled = null,Object? type = null,Object? bassLevel = null,Object? midLevel = null,Object? trebleLevel = null,}) {
  return _then(_MusicAssistantToneControlFilter(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MusicAssistantToneControlFilterType,bassLevel: null == bassLevel ? _self.bassLevel : bassLevel // ignore: cast_nullable_to_non_nullable
as double,midLevel: null == midLevel ? _self.midLevel : midLevel // ignore: cast_nullable_to_non_nullable
as double,trebleLevel: null == trebleLevel ? _self.trebleLevel : trebleLevel // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
