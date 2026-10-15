// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_compressor_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantCompressorFilter {

/// enabled
@JsonKey(name: MusicAssistantCompressorFilter.enabledKey_) bool get enabled;/// type
@JsonKey(name: MusicAssistantCompressorFilter.typeKey_) MusicAssistantCompressorFilterType get type;/// threshold
@JsonKey(name: MusicAssistantCompressorFilter.thresholdKey_) double get threshold;/// ratio
@JsonKey(name: MusicAssistantCompressorFilter.ratioKey_) double get ratio;/// attack
@JsonKey(name: MusicAssistantCompressorFilter.attackKey_) double get attack;/// release
@JsonKey(name: MusicAssistantCompressorFilter.releaseKey_) double get release;/// knee
@JsonKey(name: MusicAssistantCompressorFilter.kneeKey_) double get knee;/// makeup
@JsonKey(name: MusicAssistantCompressorFilter.makeupKey_) double get makeup;
/// Create a copy of MusicAssistantCompressorFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantCompressorFilterCopyWith<MusicAssistantCompressorFilter> get copyWith => _$MusicAssistantCompressorFilterCopyWithImpl<MusicAssistantCompressorFilter>(this as MusicAssistantCompressorFilter, _$identity);

  /// Serializes this MusicAssistantCompressorFilter to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantCompressorFilter&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.type, type) || other.type == type)&&(identical(other.threshold, threshold) || other.threshold == threshold)&&(identical(other.ratio, ratio) || other.ratio == ratio)&&(identical(other.attack, attack) || other.attack == attack)&&(identical(other.release, release) || other.release == release)&&(identical(other.knee, knee) || other.knee == knee)&&(identical(other.makeup, makeup) || other.makeup == makeup));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enabled,type,threshold,ratio,attack,release,knee,makeup);

@override
String toString() {
  return 'MusicAssistantCompressorFilter(enabled: $enabled, type: $type, threshold: $threshold, ratio: $ratio, attack: $attack, release: $release, knee: $knee, makeup: $makeup)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantCompressorFilterCopyWith<$Res>  {
  factory $MusicAssistantCompressorFilterCopyWith(MusicAssistantCompressorFilter value, $Res Function(MusicAssistantCompressorFilter) _then) = _$MusicAssistantCompressorFilterCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantCompressorFilter.enabledKey_) bool enabled,@JsonKey(name: MusicAssistantCompressorFilter.typeKey_) MusicAssistantCompressorFilterType type,@JsonKey(name: MusicAssistantCompressorFilter.thresholdKey_) double threshold,@JsonKey(name: MusicAssistantCompressorFilter.ratioKey_) double ratio,@JsonKey(name: MusicAssistantCompressorFilter.attackKey_) double attack,@JsonKey(name: MusicAssistantCompressorFilter.releaseKey_) double release,@JsonKey(name: MusicAssistantCompressorFilter.kneeKey_) double knee,@JsonKey(name: MusicAssistantCompressorFilter.makeupKey_) double makeup
});




}
/// @nodoc
class _$MusicAssistantCompressorFilterCopyWithImpl<$Res>
    implements $MusicAssistantCompressorFilterCopyWith<$Res> {
  _$MusicAssistantCompressorFilterCopyWithImpl(this._self, this._then);

  final MusicAssistantCompressorFilter _self;
  final $Res Function(MusicAssistantCompressorFilter) _then;

/// Create a copy of MusicAssistantCompressorFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enabled = null,Object? type = null,Object? threshold = null,Object? ratio = null,Object? attack = null,Object? release = null,Object? knee = null,Object? makeup = null,}) {
  return _then(_self.copyWith(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MusicAssistantCompressorFilterType,threshold: null == threshold ? _self.threshold : threshold // ignore: cast_nullable_to_non_nullable
as double,ratio: null == ratio ? _self.ratio : ratio // ignore: cast_nullable_to_non_nullable
as double,attack: null == attack ? _self.attack : attack // ignore: cast_nullable_to_non_nullable
as double,release: null == release ? _self.release : release // ignore: cast_nullable_to_non_nullable
as double,knee: null == knee ? _self.knee : knee // ignore: cast_nullable_to_non_nullable
as double,makeup: null == makeup ? _self.makeup : makeup // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [MusicAssistantCompressorFilter].
extension MusicAssistantCompressorFilterPatterns on MusicAssistantCompressorFilter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantCompressorFilter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantCompressorFilter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantCompressorFilter value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantCompressorFilter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantCompressorFilter value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantCompressorFilter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantCompressorFilter.enabledKey_)  bool enabled, @JsonKey(name: MusicAssistantCompressorFilter.typeKey_)  MusicAssistantCompressorFilterType type, @JsonKey(name: MusicAssistantCompressorFilter.thresholdKey_)  double threshold, @JsonKey(name: MusicAssistantCompressorFilter.ratioKey_)  double ratio, @JsonKey(name: MusicAssistantCompressorFilter.attackKey_)  double attack, @JsonKey(name: MusicAssistantCompressorFilter.releaseKey_)  double release, @JsonKey(name: MusicAssistantCompressorFilter.kneeKey_)  double knee, @JsonKey(name: MusicAssistantCompressorFilter.makeupKey_)  double makeup)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantCompressorFilter() when $default != null:
return $default(_that.enabled,_that.type,_that.threshold,_that.ratio,_that.attack,_that.release,_that.knee,_that.makeup);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantCompressorFilter.enabledKey_)  bool enabled, @JsonKey(name: MusicAssistantCompressorFilter.typeKey_)  MusicAssistantCompressorFilterType type, @JsonKey(name: MusicAssistantCompressorFilter.thresholdKey_)  double threshold, @JsonKey(name: MusicAssistantCompressorFilter.ratioKey_)  double ratio, @JsonKey(name: MusicAssistantCompressorFilter.attackKey_)  double attack, @JsonKey(name: MusicAssistantCompressorFilter.releaseKey_)  double release, @JsonKey(name: MusicAssistantCompressorFilter.kneeKey_)  double knee, @JsonKey(name: MusicAssistantCompressorFilter.makeupKey_)  double makeup)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantCompressorFilter():
return $default(_that.enabled,_that.type,_that.threshold,_that.ratio,_that.attack,_that.release,_that.knee,_that.makeup);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantCompressorFilter.enabledKey_)  bool enabled, @JsonKey(name: MusicAssistantCompressorFilter.typeKey_)  MusicAssistantCompressorFilterType type, @JsonKey(name: MusicAssistantCompressorFilter.thresholdKey_)  double threshold, @JsonKey(name: MusicAssistantCompressorFilter.ratioKey_)  double ratio, @JsonKey(name: MusicAssistantCompressorFilter.attackKey_)  double attack, @JsonKey(name: MusicAssistantCompressorFilter.releaseKey_)  double release, @JsonKey(name: MusicAssistantCompressorFilter.kneeKey_)  double knee, @JsonKey(name: MusicAssistantCompressorFilter.makeupKey_)  double makeup)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantCompressorFilter() when $default != null:
return $default(_that.enabled,_that.type,_that.threshold,_that.ratio,_that.attack,_that.release,_that.knee,_that.makeup);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantCompressorFilter extends MusicAssistantCompressorFilter {
  const _MusicAssistantCompressorFilter({@JsonKey(name: MusicAssistantCompressorFilter.enabledKey_) required this.enabled, @JsonKey(name: MusicAssistantCompressorFilter.typeKey_) this.type = MusicAssistantCompressorFilterType.compressor, @JsonKey(name: MusicAssistantCompressorFilter.thresholdKey_) this.threshold = -18.0, @JsonKey(name: MusicAssistantCompressorFilter.ratioKey_) this.ratio = 2.0, @JsonKey(name: MusicAssistantCompressorFilter.attackKey_) this.attack = 20.0, @JsonKey(name: MusicAssistantCompressorFilter.releaseKey_) this.release = 250.0, @JsonKey(name: MusicAssistantCompressorFilter.kneeKey_) this.knee = 9.0, @JsonKey(name: MusicAssistantCompressorFilter.makeupKey_) this.makeup = 0.0}): super._();
  factory _MusicAssistantCompressorFilter.fromJson(Map<String, dynamic> json) => _$MusicAssistantCompressorFilterFromJson(json);

/// enabled
@override@JsonKey(name: MusicAssistantCompressorFilter.enabledKey_) final  bool enabled;
/// type
@override@JsonKey(name: MusicAssistantCompressorFilter.typeKey_) final  MusicAssistantCompressorFilterType type;
/// threshold
@override@JsonKey(name: MusicAssistantCompressorFilter.thresholdKey_) final  double threshold;
/// ratio
@override@JsonKey(name: MusicAssistantCompressorFilter.ratioKey_) final  double ratio;
/// attack
@override@JsonKey(name: MusicAssistantCompressorFilter.attackKey_) final  double attack;
/// release
@override@JsonKey(name: MusicAssistantCompressorFilter.releaseKey_) final  double release;
/// knee
@override@JsonKey(name: MusicAssistantCompressorFilter.kneeKey_) final  double knee;
/// makeup
@override@JsonKey(name: MusicAssistantCompressorFilter.makeupKey_) final  double makeup;

/// Create a copy of MusicAssistantCompressorFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantCompressorFilterCopyWith<_MusicAssistantCompressorFilter> get copyWith => __$MusicAssistantCompressorFilterCopyWithImpl<_MusicAssistantCompressorFilter>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantCompressorFilterToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantCompressorFilter&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.type, type) || other.type == type)&&(identical(other.threshold, threshold) || other.threshold == threshold)&&(identical(other.ratio, ratio) || other.ratio == ratio)&&(identical(other.attack, attack) || other.attack == attack)&&(identical(other.release, release) || other.release == release)&&(identical(other.knee, knee) || other.knee == knee)&&(identical(other.makeup, makeup) || other.makeup == makeup));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enabled,type,threshold,ratio,attack,release,knee,makeup);

@override
String toString() {
  return 'MusicAssistantCompressorFilter(enabled: $enabled, type: $type, threshold: $threshold, ratio: $ratio, attack: $attack, release: $release, knee: $knee, makeup: $makeup)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantCompressorFilterCopyWith<$Res> implements $MusicAssistantCompressorFilterCopyWith<$Res> {
  factory _$MusicAssistantCompressorFilterCopyWith(_MusicAssistantCompressorFilter value, $Res Function(_MusicAssistantCompressorFilter) _then) = __$MusicAssistantCompressorFilterCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantCompressorFilter.enabledKey_) bool enabled,@JsonKey(name: MusicAssistantCompressorFilter.typeKey_) MusicAssistantCompressorFilterType type,@JsonKey(name: MusicAssistantCompressorFilter.thresholdKey_) double threshold,@JsonKey(name: MusicAssistantCompressorFilter.ratioKey_) double ratio,@JsonKey(name: MusicAssistantCompressorFilter.attackKey_) double attack,@JsonKey(name: MusicAssistantCompressorFilter.releaseKey_) double release,@JsonKey(name: MusicAssistantCompressorFilter.kneeKey_) double knee,@JsonKey(name: MusicAssistantCompressorFilter.makeupKey_) double makeup
});




}
/// @nodoc
class __$MusicAssistantCompressorFilterCopyWithImpl<$Res>
    implements _$MusicAssistantCompressorFilterCopyWith<$Res> {
  __$MusicAssistantCompressorFilterCopyWithImpl(this._self, this._then);

  final _MusicAssistantCompressorFilter _self;
  final $Res Function(_MusicAssistantCompressorFilter) _then;

/// Create a copy of MusicAssistantCompressorFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enabled = null,Object? type = null,Object? threshold = null,Object? ratio = null,Object? attack = null,Object? release = null,Object? knee = null,Object? makeup = null,}) {
  return _then(_MusicAssistantCompressorFilter(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MusicAssistantCompressorFilterType,threshold: null == threshold ? _self.threshold : threshold // ignore: cast_nullable_to_non_nullable
as double,ratio: null == ratio ? _self.ratio : ratio // ignore: cast_nullable_to_non_nullable
as double,attack: null == attack ? _self.attack : attack // ignore: cast_nullable_to_non_nullable
as double,release: null == release ? _self.release : release // ignore: cast_nullable_to_non_nullable
as double,knee: null == knee ? _self.knee : knee // ignore: cast_nullable_to_non_nullable
as double,makeup: null == makeup ? _self.makeup : makeup // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
