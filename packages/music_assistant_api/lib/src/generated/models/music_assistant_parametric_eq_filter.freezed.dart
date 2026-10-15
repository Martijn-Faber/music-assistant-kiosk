// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_parametric_eq_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantParametricEQFilter {

/// enabled
@JsonKey(name: MusicAssistantParametricEQFilter.enabledKey_) bool get enabled;/// preamp
@JsonKey(name: MusicAssistantParametricEQFilter.preampKey_) double? get preamp;/// perChannelPreamp
@JsonKey(name: MusicAssistantParametricEQFilter.perChannelPreampKey_) Map<String, double>? get perChannelPreamp;/// type
@JsonKey(name: MusicAssistantParametricEQFilter.typeKey_) MusicAssistantParametricEQFilterType get type;/// bands
@JsonKey(name: MusicAssistantParametricEQFilter.bandsKey_) List<MusicAssistantParametricEQBand>? get bands;
/// Create a copy of MusicAssistantParametricEQFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantParametricEQFilterCopyWith<MusicAssistantParametricEQFilter> get copyWith => _$MusicAssistantParametricEQFilterCopyWithImpl<MusicAssistantParametricEQFilter>(this as MusicAssistantParametricEQFilter, _$identity);

  /// Serializes this MusicAssistantParametricEQFilter to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantParametricEQFilter&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.preamp, preamp) || other.preamp == preamp)&&const DeepCollectionEquality().equals(other.perChannelPreamp, perChannelPreamp)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.bands, bands));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enabled,preamp,const DeepCollectionEquality().hash(perChannelPreamp),type,const DeepCollectionEquality().hash(bands));

@override
String toString() {
  return 'MusicAssistantParametricEQFilter(enabled: $enabled, preamp: $preamp, perChannelPreamp: $perChannelPreamp, type: $type, bands: $bands)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantParametricEQFilterCopyWith<$Res>  {
  factory $MusicAssistantParametricEQFilterCopyWith(MusicAssistantParametricEQFilter value, $Res Function(MusicAssistantParametricEQFilter) _then) = _$MusicAssistantParametricEQFilterCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantParametricEQFilter.enabledKey_) bool enabled,@JsonKey(name: MusicAssistantParametricEQFilter.preampKey_) double? preamp,@JsonKey(name: MusicAssistantParametricEQFilter.perChannelPreampKey_) Map<String, double>? perChannelPreamp,@JsonKey(name: MusicAssistantParametricEQFilter.typeKey_) MusicAssistantParametricEQFilterType type,@JsonKey(name: MusicAssistantParametricEQFilter.bandsKey_) List<MusicAssistantParametricEQBand>? bands
});




}
/// @nodoc
class _$MusicAssistantParametricEQFilterCopyWithImpl<$Res>
    implements $MusicAssistantParametricEQFilterCopyWith<$Res> {
  _$MusicAssistantParametricEQFilterCopyWithImpl(this._self, this._then);

  final MusicAssistantParametricEQFilter _self;
  final $Res Function(MusicAssistantParametricEQFilter) _then;

/// Create a copy of MusicAssistantParametricEQFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enabled = null,Object? preamp = freezed,Object? perChannelPreamp = freezed,Object? type = null,Object? bands = freezed,}) {
  return _then(_self.copyWith(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,preamp: freezed == preamp ? _self.preamp : preamp // ignore: cast_nullable_to_non_nullable
as double?,perChannelPreamp: freezed == perChannelPreamp ? _self.perChannelPreamp : perChannelPreamp // ignore: cast_nullable_to_non_nullable
as Map<String, double>?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MusicAssistantParametricEQFilterType,bands: freezed == bands ? _self.bands : bands // ignore: cast_nullable_to_non_nullable
as List<MusicAssistantParametricEQBand>?,
  ));
}

}


/// Adds pattern-matching-related methods to [MusicAssistantParametricEQFilter].
extension MusicAssistantParametricEQFilterPatterns on MusicAssistantParametricEQFilter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantParametricEQFilter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantParametricEQFilter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantParametricEQFilter value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantParametricEQFilter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantParametricEQFilter value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantParametricEQFilter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantParametricEQFilter.enabledKey_)  bool enabled, @JsonKey(name: MusicAssistantParametricEQFilter.preampKey_)  double? preamp, @JsonKey(name: MusicAssistantParametricEQFilter.perChannelPreampKey_)  Map<String, double>? perChannelPreamp, @JsonKey(name: MusicAssistantParametricEQFilter.typeKey_)  MusicAssistantParametricEQFilterType type, @JsonKey(name: MusicAssistantParametricEQFilter.bandsKey_)  List<MusicAssistantParametricEQBand>? bands)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantParametricEQFilter() when $default != null:
return $default(_that.enabled,_that.preamp,_that.perChannelPreamp,_that.type,_that.bands);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantParametricEQFilter.enabledKey_)  bool enabled, @JsonKey(name: MusicAssistantParametricEQFilter.preampKey_)  double? preamp, @JsonKey(name: MusicAssistantParametricEQFilter.perChannelPreampKey_)  Map<String, double>? perChannelPreamp, @JsonKey(name: MusicAssistantParametricEQFilter.typeKey_)  MusicAssistantParametricEQFilterType type, @JsonKey(name: MusicAssistantParametricEQFilter.bandsKey_)  List<MusicAssistantParametricEQBand>? bands)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantParametricEQFilter():
return $default(_that.enabled,_that.preamp,_that.perChannelPreamp,_that.type,_that.bands);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantParametricEQFilter.enabledKey_)  bool enabled, @JsonKey(name: MusicAssistantParametricEQFilter.preampKey_)  double? preamp, @JsonKey(name: MusicAssistantParametricEQFilter.perChannelPreampKey_)  Map<String, double>? perChannelPreamp, @JsonKey(name: MusicAssistantParametricEQFilter.typeKey_)  MusicAssistantParametricEQFilterType type, @JsonKey(name: MusicAssistantParametricEQFilter.bandsKey_)  List<MusicAssistantParametricEQBand>? bands)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantParametricEQFilter() when $default != null:
return $default(_that.enabled,_that.preamp,_that.perChannelPreamp,_that.type,_that.bands);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantParametricEQFilter extends MusicAssistantParametricEQFilter {
  const _MusicAssistantParametricEQFilter({@JsonKey(name: MusicAssistantParametricEQFilter.enabledKey_) required this.enabled, @JsonKey(name: MusicAssistantParametricEQFilter.preampKey_) this.preamp = 0.0, @JsonKey(name: MusicAssistantParametricEQFilter.perChannelPreampKey_) final  Map<String, double>? perChannelPreamp, @JsonKey(name: MusicAssistantParametricEQFilter.typeKey_) this.type = MusicAssistantParametricEQFilterType.parametricEq, @JsonKey(name: MusicAssistantParametricEQFilter.bandsKey_) final  List<MusicAssistantParametricEQBand>? bands}): _perChannelPreamp = perChannelPreamp,_bands = bands,super._();
  factory _MusicAssistantParametricEQFilter.fromJson(Map<String, dynamic> json) => _$MusicAssistantParametricEQFilterFromJson(json);

/// enabled
@override@JsonKey(name: MusicAssistantParametricEQFilter.enabledKey_) final  bool enabled;
/// preamp
@override@JsonKey(name: MusicAssistantParametricEQFilter.preampKey_) final  double? preamp;
/// perChannelPreamp
 final  Map<String, double>? _perChannelPreamp;
/// perChannelPreamp
@override@JsonKey(name: MusicAssistantParametricEQFilter.perChannelPreampKey_) Map<String, double>? get perChannelPreamp {
  final value = _perChannelPreamp;
  if (value == null) return null;
  if (_perChannelPreamp is EqualUnmodifiableMapView) return _perChannelPreamp;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

/// type
@override@JsonKey(name: MusicAssistantParametricEQFilter.typeKey_) final  MusicAssistantParametricEQFilterType type;
/// bands
 final  List<MusicAssistantParametricEQBand>? _bands;
/// bands
@override@JsonKey(name: MusicAssistantParametricEQFilter.bandsKey_) List<MusicAssistantParametricEQBand>? get bands {
  final value = _bands;
  if (value == null) return null;
  if (_bands is EqualUnmodifiableListView) return _bands;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of MusicAssistantParametricEQFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantParametricEQFilterCopyWith<_MusicAssistantParametricEQFilter> get copyWith => __$MusicAssistantParametricEQFilterCopyWithImpl<_MusicAssistantParametricEQFilter>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantParametricEQFilterToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantParametricEQFilter&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.preamp, preamp) || other.preamp == preamp)&&const DeepCollectionEquality().equals(other._perChannelPreamp, _perChannelPreamp)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._bands, _bands));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enabled,preamp,const DeepCollectionEquality().hash(_perChannelPreamp),type,const DeepCollectionEquality().hash(_bands));

@override
String toString() {
  return 'MusicAssistantParametricEQFilter(enabled: $enabled, preamp: $preamp, perChannelPreamp: $perChannelPreamp, type: $type, bands: $bands)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantParametricEQFilterCopyWith<$Res> implements $MusicAssistantParametricEQFilterCopyWith<$Res> {
  factory _$MusicAssistantParametricEQFilterCopyWith(_MusicAssistantParametricEQFilter value, $Res Function(_MusicAssistantParametricEQFilter) _then) = __$MusicAssistantParametricEQFilterCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantParametricEQFilter.enabledKey_) bool enabled,@JsonKey(name: MusicAssistantParametricEQFilter.preampKey_) double? preamp,@JsonKey(name: MusicAssistantParametricEQFilter.perChannelPreampKey_) Map<String, double>? perChannelPreamp,@JsonKey(name: MusicAssistantParametricEQFilter.typeKey_) MusicAssistantParametricEQFilterType type,@JsonKey(name: MusicAssistantParametricEQFilter.bandsKey_) List<MusicAssistantParametricEQBand>? bands
});




}
/// @nodoc
class __$MusicAssistantParametricEQFilterCopyWithImpl<$Res>
    implements _$MusicAssistantParametricEQFilterCopyWith<$Res> {
  __$MusicAssistantParametricEQFilterCopyWithImpl(this._self, this._then);

  final _MusicAssistantParametricEQFilter _self;
  final $Res Function(_MusicAssistantParametricEQFilter) _then;

/// Create a copy of MusicAssistantParametricEQFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enabled = null,Object? preamp = freezed,Object? perChannelPreamp = freezed,Object? type = null,Object? bands = freezed,}) {
  return _then(_MusicAssistantParametricEQFilter(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,preamp: freezed == preamp ? _self.preamp : preamp // ignore: cast_nullable_to_non_nullable
as double?,perChannelPreamp: freezed == perChannelPreamp ? _self._perChannelPreamp : perChannelPreamp // ignore: cast_nullable_to_non_nullable
as Map<String, double>?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MusicAssistantParametricEQFilterType,bands: freezed == bands ? _self._bands : bands // ignore: cast_nullable_to_non_nullable
as List<MusicAssistantParametricEQBand>?,
  ));
}


}

// dart format on
