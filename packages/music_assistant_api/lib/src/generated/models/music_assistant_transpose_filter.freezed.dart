// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_transpose_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantTransposeFilter {

/// enabled
@JsonKey(name: MusicAssistantTransposeFilter.enabledKey_) bool get enabled;/// type
@JsonKey(name: MusicAssistantTransposeFilter.typeKey_) MusicAssistantTransposeFilterType get type;/// semitones
@JsonKey(name: MusicAssistantTransposeFilter.semitonesKey_) double get semitones;
/// Create a copy of MusicAssistantTransposeFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantTransposeFilterCopyWith<MusicAssistantTransposeFilter> get copyWith => _$MusicAssistantTransposeFilterCopyWithImpl<MusicAssistantTransposeFilter>(this as MusicAssistantTransposeFilter, _$identity);

  /// Serializes this MusicAssistantTransposeFilter to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantTransposeFilter&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.type, type) || other.type == type)&&(identical(other.semitones, semitones) || other.semitones == semitones));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enabled,type,semitones);

@override
String toString() {
  return 'MusicAssistantTransposeFilter(enabled: $enabled, type: $type, semitones: $semitones)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantTransposeFilterCopyWith<$Res>  {
  factory $MusicAssistantTransposeFilterCopyWith(MusicAssistantTransposeFilter value, $Res Function(MusicAssistantTransposeFilter) _then) = _$MusicAssistantTransposeFilterCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantTransposeFilter.enabledKey_) bool enabled,@JsonKey(name: MusicAssistantTransposeFilter.typeKey_) MusicAssistantTransposeFilterType type,@JsonKey(name: MusicAssistantTransposeFilter.semitonesKey_) double semitones
});




}
/// @nodoc
class _$MusicAssistantTransposeFilterCopyWithImpl<$Res>
    implements $MusicAssistantTransposeFilterCopyWith<$Res> {
  _$MusicAssistantTransposeFilterCopyWithImpl(this._self, this._then);

  final MusicAssistantTransposeFilter _self;
  final $Res Function(MusicAssistantTransposeFilter) _then;

/// Create a copy of MusicAssistantTransposeFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enabled = null,Object? type = null,Object? semitones = null,}) {
  return _then(_self.copyWith(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MusicAssistantTransposeFilterType,semitones: null == semitones ? _self.semitones : semitones // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [MusicAssistantTransposeFilter].
extension MusicAssistantTransposeFilterPatterns on MusicAssistantTransposeFilter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantTransposeFilter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantTransposeFilter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantTransposeFilter value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantTransposeFilter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantTransposeFilter value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantTransposeFilter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantTransposeFilter.enabledKey_)  bool enabled, @JsonKey(name: MusicAssistantTransposeFilter.typeKey_)  MusicAssistantTransposeFilterType type, @JsonKey(name: MusicAssistantTransposeFilter.semitonesKey_)  double semitones)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantTransposeFilter() when $default != null:
return $default(_that.enabled,_that.type,_that.semitones);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantTransposeFilter.enabledKey_)  bool enabled, @JsonKey(name: MusicAssistantTransposeFilter.typeKey_)  MusicAssistantTransposeFilterType type, @JsonKey(name: MusicAssistantTransposeFilter.semitonesKey_)  double semitones)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantTransposeFilter():
return $default(_that.enabled,_that.type,_that.semitones);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantTransposeFilter.enabledKey_)  bool enabled, @JsonKey(name: MusicAssistantTransposeFilter.typeKey_)  MusicAssistantTransposeFilterType type, @JsonKey(name: MusicAssistantTransposeFilter.semitonesKey_)  double semitones)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantTransposeFilter() when $default != null:
return $default(_that.enabled,_that.type,_that.semitones);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantTransposeFilter extends MusicAssistantTransposeFilter {
  const _MusicAssistantTransposeFilter({@JsonKey(name: MusicAssistantTransposeFilter.enabledKey_) required this.enabled, @JsonKey(name: MusicAssistantTransposeFilter.typeKey_) this.type = MusicAssistantTransposeFilterType.transpose, @JsonKey(name: MusicAssistantTransposeFilter.semitonesKey_) this.semitones = 0.0}): super._();
  factory _MusicAssistantTransposeFilter.fromJson(Map<String, dynamic> json) => _$MusicAssistantTransposeFilterFromJson(json);

/// enabled
@override@JsonKey(name: MusicAssistantTransposeFilter.enabledKey_) final  bool enabled;
/// type
@override@JsonKey(name: MusicAssistantTransposeFilter.typeKey_) final  MusicAssistantTransposeFilterType type;
/// semitones
@override@JsonKey(name: MusicAssistantTransposeFilter.semitonesKey_) final  double semitones;

/// Create a copy of MusicAssistantTransposeFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantTransposeFilterCopyWith<_MusicAssistantTransposeFilter> get copyWith => __$MusicAssistantTransposeFilterCopyWithImpl<_MusicAssistantTransposeFilter>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantTransposeFilterToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantTransposeFilter&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.type, type) || other.type == type)&&(identical(other.semitones, semitones) || other.semitones == semitones));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enabled,type,semitones);

@override
String toString() {
  return 'MusicAssistantTransposeFilter(enabled: $enabled, type: $type, semitones: $semitones)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantTransposeFilterCopyWith<$Res> implements $MusicAssistantTransposeFilterCopyWith<$Res> {
  factory _$MusicAssistantTransposeFilterCopyWith(_MusicAssistantTransposeFilter value, $Res Function(_MusicAssistantTransposeFilter) _then) = __$MusicAssistantTransposeFilterCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantTransposeFilter.enabledKey_) bool enabled,@JsonKey(name: MusicAssistantTransposeFilter.typeKey_) MusicAssistantTransposeFilterType type,@JsonKey(name: MusicAssistantTransposeFilter.semitonesKey_) double semitones
});




}
/// @nodoc
class __$MusicAssistantTransposeFilterCopyWithImpl<$Res>
    implements _$MusicAssistantTransposeFilterCopyWith<$Res> {
  __$MusicAssistantTransposeFilterCopyWithImpl(this._self, this._then);

  final _MusicAssistantTransposeFilter _self;
  final $Res Function(_MusicAssistantTransposeFilter) _then;

/// Create a copy of MusicAssistantTransposeFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enabled = null,Object? type = null,Object? semitones = null,}) {
  return _then(_MusicAssistantTransposeFilter(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MusicAssistantTransposeFilterType,semitones: null == semitones ? _self.semitones : semitones // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
