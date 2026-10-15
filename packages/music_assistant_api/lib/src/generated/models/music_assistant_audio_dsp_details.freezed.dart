// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_audio_dsp_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantAudioDSPDetails {

/// state
@JsonKey(name: MusicAssistantAudioDSPDetails.stateKey_) MusicAssistantDSPState get state;/// inputGain
@JsonKey(name: MusicAssistantAudioDSPDetails.inputGainKey_) double get inputGain;/// filters
@JsonKey(name: MusicAssistantAudioDSPDetails.filtersKey_) List<MusicAssistantAudioDSPFilter>? get filters;/// outputGain
@JsonKey(name: MusicAssistantAudioDSPDetails.outputGainKey_) double get outputGain;/// presetId
@JsonKey(name: MusicAssistantAudioDSPDetails.presetIdKey_) String? get presetId;
/// Create a copy of MusicAssistantAudioDSPDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantAudioDSPDetailsCopyWith<MusicAssistantAudioDSPDetails> get copyWith => _$MusicAssistantAudioDSPDetailsCopyWithImpl<MusicAssistantAudioDSPDetails>(this as MusicAssistantAudioDSPDetails, _$identity);

  /// Serializes this MusicAssistantAudioDSPDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantAudioDSPDetails&&(identical(other.state, state) || other.state == state)&&(identical(other.inputGain, inputGain) || other.inputGain == inputGain)&&const DeepCollectionEquality().equals(other.filters, filters)&&(identical(other.outputGain, outputGain) || other.outputGain == outputGain)&&(identical(other.presetId, presetId) || other.presetId == presetId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,state,inputGain,const DeepCollectionEquality().hash(filters),outputGain,presetId);

@override
String toString() {
  return 'MusicAssistantAudioDSPDetails(state: $state, inputGain: $inputGain, filters: $filters, outputGain: $outputGain, presetId: $presetId)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantAudioDSPDetailsCopyWith<$Res>  {
  factory $MusicAssistantAudioDSPDetailsCopyWith(MusicAssistantAudioDSPDetails value, $Res Function(MusicAssistantAudioDSPDetails) _then) = _$MusicAssistantAudioDSPDetailsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantAudioDSPDetails.stateKey_) MusicAssistantDSPState state,@JsonKey(name: MusicAssistantAudioDSPDetails.inputGainKey_) double inputGain,@JsonKey(name: MusicAssistantAudioDSPDetails.filtersKey_) List<MusicAssistantAudioDSPFilter>? filters,@JsonKey(name: MusicAssistantAudioDSPDetails.outputGainKey_) double outputGain,@JsonKey(name: MusicAssistantAudioDSPDetails.presetIdKey_) String? presetId
});




}
/// @nodoc
class _$MusicAssistantAudioDSPDetailsCopyWithImpl<$Res>
    implements $MusicAssistantAudioDSPDetailsCopyWith<$Res> {
  _$MusicAssistantAudioDSPDetailsCopyWithImpl(this._self, this._then);

  final MusicAssistantAudioDSPDetails _self;
  final $Res Function(MusicAssistantAudioDSPDetails) _then;

/// Create a copy of MusicAssistantAudioDSPDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? state = null,Object? inputGain = null,Object? filters = freezed,Object? outputGain = null,Object? presetId = freezed,}) {
  return _then(_self.copyWith(
state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as MusicAssistantDSPState,inputGain: null == inputGain ? _self.inputGain : inputGain // ignore: cast_nullable_to_non_nullable
as double,filters: freezed == filters ? _self.filters : filters // ignore: cast_nullable_to_non_nullable
as List<MusicAssistantAudioDSPFilter>?,outputGain: null == outputGain ? _self.outputGain : outputGain // ignore: cast_nullable_to_non_nullable
as double,presetId: freezed == presetId ? _self.presetId : presetId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MusicAssistantAudioDSPDetails].
extension MusicAssistantAudioDSPDetailsPatterns on MusicAssistantAudioDSPDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantAudioDSPDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantAudioDSPDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantAudioDSPDetails value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantAudioDSPDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantAudioDSPDetails value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantAudioDSPDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantAudioDSPDetails.stateKey_)  MusicAssistantDSPState state, @JsonKey(name: MusicAssistantAudioDSPDetails.inputGainKey_)  double inputGain, @JsonKey(name: MusicAssistantAudioDSPDetails.filtersKey_)  List<MusicAssistantAudioDSPFilter>? filters, @JsonKey(name: MusicAssistantAudioDSPDetails.outputGainKey_)  double outputGain, @JsonKey(name: MusicAssistantAudioDSPDetails.presetIdKey_)  String? presetId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantAudioDSPDetails() when $default != null:
return $default(_that.state,_that.inputGain,_that.filters,_that.outputGain,_that.presetId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantAudioDSPDetails.stateKey_)  MusicAssistantDSPState state, @JsonKey(name: MusicAssistantAudioDSPDetails.inputGainKey_)  double inputGain, @JsonKey(name: MusicAssistantAudioDSPDetails.filtersKey_)  List<MusicAssistantAudioDSPFilter>? filters, @JsonKey(name: MusicAssistantAudioDSPDetails.outputGainKey_)  double outputGain, @JsonKey(name: MusicAssistantAudioDSPDetails.presetIdKey_)  String? presetId)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantAudioDSPDetails():
return $default(_that.state,_that.inputGain,_that.filters,_that.outputGain,_that.presetId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantAudioDSPDetails.stateKey_)  MusicAssistantDSPState state, @JsonKey(name: MusicAssistantAudioDSPDetails.inputGainKey_)  double inputGain, @JsonKey(name: MusicAssistantAudioDSPDetails.filtersKey_)  List<MusicAssistantAudioDSPFilter>? filters, @JsonKey(name: MusicAssistantAudioDSPDetails.outputGainKey_)  double outputGain, @JsonKey(name: MusicAssistantAudioDSPDetails.presetIdKey_)  String? presetId)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantAudioDSPDetails() when $default != null:
return $default(_that.state,_that.inputGain,_that.filters,_that.outputGain,_that.presetId);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantAudioDSPDetails extends MusicAssistantAudioDSPDetails {
  const _MusicAssistantAudioDSPDetails({@JsonKey(name: MusicAssistantAudioDSPDetails.stateKey_) this.state = MusicAssistantDSPState.unknown, @JsonKey(name: MusicAssistantAudioDSPDetails.inputGainKey_) this.inputGain = 0.0, @JsonKey(name: MusicAssistantAudioDSPDetails.filtersKey_) final  List<MusicAssistantAudioDSPFilter>? filters, @JsonKey(name: MusicAssistantAudioDSPDetails.outputGainKey_) this.outputGain = 0.0, @JsonKey(name: MusicAssistantAudioDSPDetails.presetIdKey_) this.presetId}): _filters = filters,super._();
  factory _MusicAssistantAudioDSPDetails.fromJson(Map<String, dynamic> json) => _$MusicAssistantAudioDSPDetailsFromJson(json);

/// state
@override@JsonKey(name: MusicAssistantAudioDSPDetails.stateKey_) final  MusicAssistantDSPState state;
/// inputGain
@override@JsonKey(name: MusicAssistantAudioDSPDetails.inputGainKey_) final  double inputGain;
/// filters
 final  List<MusicAssistantAudioDSPFilter>? _filters;
/// filters
@override@JsonKey(name: MusicAssistantAudioDSPDetails.filtersKey_) List<MusicAssistantAudioDSPFilter>? get filters {
  final value = _filters;
  if (value == null) return null;
  if (_filters is EqualUnmodifiableListView) return _filters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// outputGain
@override@JsonKey(name: MusicAssistantAudioDSPDetails.outputGainKey_) final  double outputGain;
/// presetId
@override@JsonKey(name: MusicAssistantAudioDSPDetails.presetIdKey_) final  String? presetId;

/// Create a copy of MusicAssistantAudioDSPDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantAudioDSPDetailsCopyWith<_MusicAssistantAudioDSPDetails> get copyWith => __$MusicAssistantAudioDSPDetailsCopyWithImpl<_MusicAssistantAudioDSPDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantAudioDSPDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantAudioDSPDetails&&(identical(other.state, state) || other.state == state)&&(identical(other.inputGain, inputGain) || other.inputGain == inputGain)&&const DeepCollectionEquality().equals(other._filters, _filters)&&(identical(other.outputGain, outputGain) || other.outputGain == outputGain)&&(identical(other.presetId, presetId) || other.presetId == presetId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,state,inputGain,const DeepCollectionEquality().hash(_filters),outputGain,presetId);

@override
String toString() {
  return 'MusicAssistantAudioDSPDetails(state: $state, inputGain: $inputGain, filters: $filters, outputGain: $outputGain, presetId: $presetId)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantAudioDSPDetailsCopyWith<$Res> implements $MusicAssistantAudioDSPDetailsCopyWith<$Res> {
  factory _$MusicAssistantAudioDSPDetailsCopyWith(_MusicAssistantAudioDSPDetails value, $Res Function(_MusicAssistantAudioDSPDetails) _then) = __$MusicAssistantAudioDSPDetailsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantAudioDSPDetails.stateKey_) MusicAssistantDSPState state,@JsonKey(name: MusicAssistantAudioDSPDetails.inputGainKey_) double inputGain,@JsonKey(name: MusicAssistantAudioDSPDetails.filtersKey_) List<MusicAssistantAudioDSPFilter>? filters,@JsonKey(name: MusicAssistantAudioDSPDetails.outputGainKey_) double outputGain,@JsonKey(name: MusicAssistantAudioDSPDetails.presetIdKey_) String? presetId
});




}
/// @nodoc
class __$MusicAssistantAudioDSPDetailsCopyWithImpl<$Res>
    implements _$MusicAssistantAudioDSPDetailsCopyWith<$Res> {
  __$MusicAssistantAudioDSPDetailsCopyWithImpl(this._self, this._then);

  final _MusicAssistantAudioDSPDetails _self;
  final $Res Function(_MusicAssistantAudioDSPDetails) _then;

/// Create a copy of MusicAssistantAudioDSPDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? state = null,Object? inputGain = null,Object? filters = freezed,Object? outputGain = null,Object? presetId = freezed,}) {
  return _then(_MusicAssistantAudioDSPDetails(
state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as MusicAssistantDSPState,inputGain: null == inputGain ? _self.inputGain : inputGain // ignore: cast_nullable_to_non_nullable
as double,filters: freezed == filters ? _self._filters : filters // ignore: cast_nullable_to_non_nullable
as List<MusicAssistantAudioDSPFilter>?,outputGain: null == outputGain ? _self.outputGain : outputGain // ignore: cast_nullable_to_non_nullable
as double,presetId: freezed == presetId ? _self.presetId : presetId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
