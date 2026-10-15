// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_crossfeed_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantCrossfeedFilter {

/// enabled
@JsonKey(name: MusicAssistantCrossfeedFilter.enabledKey_) bool get enabled;/// type
@JsonKey(name: MusicAssistantCrossfeedFilter.typeKey_) MusicAssistantCrossfeedFilterType get type;/// strength
@JsonKey(name: MusicAssistantCrossfeedFilter.strengthKey_) double get strength;/// soundstage
@JsonKey(name: MusicAssistantCrossfeedFilter.soundstageKey_) double get soundstage;
/// Create a copy of MusicAssistantCrossfeedFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantCrossfeedFilterCopyWith<MusicAssistantCrossfeedFilter> get copyWith => _$MusicAssistantCrossfeedFilterCopyWithImpl<MusicAssistantCrossfeedFilter>(this as MusicAssistantCrossfeedFilter, _$identity);

  /// Serializes this MusicAssistantCrossfeedFilter to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantCrossfeedFilter&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.type, type) || other.type == type)&&(identical(other.strength, strength) || other.strength == strength)&&(identical(other.soundstage, soundstage) || other.soundstage == soundstage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enabled,type,strength,soundstage);

@override
String toString() {
  return 'MusicAssistantCrossfeedFilter(enabled: $enabled, type: $type, strength: $strength, soundstage: $soundstage)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantCrossfeedFilterCopyWith<$Res>  {
  factory $MusicAssistantCrossfeedFilterCopyWith(MusicAssistantCrossfeedFilter value, $Res Function(MusicAssistantCrossfeedFilter) _then) = _$MusicAssistantCrossfeedFilterCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantCrossfeedFilter.enabledKey_) bool enabled,@JsonKey(name: MusicAssistantCrossfeedFilter.typeKey_) MusicAssistantCrossfeedFilterType type,@JsonKey(name: MusicAssistantCrossfeedFilter.strengthKey_) double strength,@JsonKey(name: MusicAssistantCrossfeedFilter.soundstageKey_) double soundstage
});




}
/// @nodoc
class _$MusicAssistantCrossfeedFilterCopyWithImpl<$Res>
    implements $MusicAssistantCrossfeedFilterCopyWith<$Res> {
  _$MusicAssistantCrossfeedFilterCopyWithImpl(this._self, this._then);

  final MusicAssistantCrossfeedFilter _self;
  final $Res Function(MusicAssistantCrossfeedFilter) _then;

/// Create a copy of MusicAssistantCrossfeedFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enabled = null,Object? type = null,Object? strength = null,Object? soundstage = null,}) {
  return _then(_self.copyWith(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MusicAssistantCrossfeedFilterType,strength: null == strength ? _self.strength : strength // ignore: cast_nullable_to_non_nullable
as double,soundstage: null == soundstage ? _self.soundstage : soundstage // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [MusicAssistantCrossfeedFilter].
extension MusicAssistantCrossfeedFilterPatterns on MusicAssistantCrossfeedFilter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantCrossfeedFilter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantCrossfeedFilter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantCrossfeedFilter value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantCrossfeedFilter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantCrossfeedFilter value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantCrossfeedFilter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantCrossfeedFilter.enabledKey_)  bool enabled, @JsonKey(name: MusicAssistantCrossfeedFilter.typeKey_)  MusicAssistantCrossfeedFilterType type, @JsonKey(name: MusicAssistantCrossfeedFilter.strengthKey_)  double strength, @JsonKey(name: MusicAssistantCrossfeedFilter.soundstageKey_)  double soundstage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantCrossfeedFilter() when $default != null:
return $default(_that.enabled,_that.type,_that.strength,_that.soundstage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantCrossfeedFilter.enabledKey_)  bool enabled, @JsonKey(name: MusicAssistantCrossfeedFilter.typeKey_)  MusicAssistantCrossfeedFilterType type, @JsonKey(name: MusicAssistantCrossfeedFilter.strengthKey_)  double strength, @JsonKey(name: MusicAssistantCrossfeedFilter.soundstageKey_)  double soundstage)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantCrossfeedFilter():
return $default(_that.enabled,_that.type,_that.strength,_that.soundstage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantCrossfeedFilter.enabledKey_)  bool enabled, @JsonKey(name: MusicAssistantCrossfeedFilter.typeKey_)  MusicAssistantCrossfeedFilterType type, @JsonKey(name: MusicAssistantCrossfeedFilter.strengthKey_)  double strength, @JsonKey(name: MusicAssistantCrossfeedFilter.soundstageKey_)  double soundstage)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantCrossfeedFilter() when $default != null:
return $default(_that.enabled,_that.type,_that.strength,_that.soundstage);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantCrossfeedFilter extends MusicAssistantCrossfeedFilter {
  const _MusicAssistantCrossfeedFilter({@JsonKey(name: MusicAssistantCrossfeedFilter.enabledKey_) required this.enabled, @JsonKey(name: MusicAssistantCrossfeedFilter.typeKey_) this.type = MusicAssistantCrossfeedFilterType.crossfeed, @JsonKey(name: MusicAssistantCrossfeedFilter.strengthKey_) this.strength = 0.2, @JsonKey(name: MusicAssistantCrossfeedFilter.soundstageKey_) this.soundstage = 0.5}): super._();
  factory _MusicAssistantCrossfeedFilter.fromJson(Map<String, dynamic> json) => _$MusicAssistantCrossfeedFilterFromJson(json);

/// enabled
@override@JsonKey(name: MusicAssistantCrossfeedFilter.enabledKey_) final  bool enabled;
/// type
@override@JsonKey(name: MusicAssistantCrossfeedFilter.typeKey_) final  MusicAssistantCrossfeedFilterType type;
/// strength
@override@JsonKey(name: MusicAssistantCrossfeedFilter.strengthKey_) final  double strength;
/// soundstage
@override@JsonKey(name: MusicAssistantCrossfeedFilter.soundstageKey_) final  double soundstage;

/// Create a copy of MusicAssistantCrossfeedFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantCrossfeedFilterCopyWith<_MusicAssistantCrossfeedFilter> get copyWith => __$MusicAssistantCrossfeedFilterCopyWithImpl<_MusicAssistantCrossfeedFilter>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantCrossfeedFilterToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantCrossfeedFilter&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.type, type) || other.type == type)&&(identical(other.strength, strength) || other.strength == strength)&&(identical(other.soundstage, soundstage) || other.soundstage == soundstage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enabled,type,strength,soundstage);

@override
String toString() {
  return 'MusicAssistantCrossfeedFilter(enabled: $enabled, type: $type, strength: $strength, soundstage: $soundstage)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantCrossfeedFilterCopyWith<$Res> implements $MusicAssistantCrossfeedFilterCopyWith<$Res> {
  factory _$MusicAssistantCrossfeedFilterCopyWith(_MusicAssistantCrossfeedFilter value, $Res Function(_MusicAssistantCrossfeedFilter) _then) = __$MusicAssistantCrossfeedFilterCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantCrossfeedFilter.enabledKey_) bool enabled,@JsonKey(name: MusicAssistantCrossfeedFilter.typeKey_) MusicAssistantCrossfeedFilterType type,@JsonKey(name: MusicAssistantCrossfeedFilter.strengthKey_) double strength,@JsonKey(name: MusicAssistantCrossfeedFilter.soundstageKey_) double soundstage
});




}
/// @nodoc
class __$MusicAssistantCrossfeedFilterCopyWithImpl<$Res>
    implements _$MusicAssistantCrossfeedFilterCopyWith<$Res> {
  __$MusicAssistantCrossfeedFilterCopyWithImpl(this._self, this._then);

  final _MusicAssistantCrossfeedFilter _self;
  final $Res Function(_MusicAssistantCrossfeedFilter) _then;

/// Create a copy of MusicAssistantCrossfeedFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enabled = null,Object? type = null,Object? strength = null,Object? soundstage = null,}) {
  return _then(_MusicAssistantCrossfeedFilter(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MusicAssistantCrossfeedFilterType,strength: null == strength ? _self.strength : strength // ignore: cast_nullable_to_non_nullable
as double,soundstage: null == soundstage ? _self.soundstage : soundstage // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
