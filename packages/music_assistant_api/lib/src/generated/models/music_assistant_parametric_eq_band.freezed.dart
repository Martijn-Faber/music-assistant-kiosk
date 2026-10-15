// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_parametric_eq_band.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantParametricEQBand {

/// frequency
@JsonKey(name: MusicAssistantParametricEQBand.frequencyKey_) double get frequency;/// q
@JsonKey(name: MusicAssistantParametricEQBand.qKey_) double get q;/// gain
@JsonKey(name: MusicAssistantParametricEQBand.gainKey_) double get gain;/// type
@JsonKey(name: MusicAssistantParametricEQBand.typeKey_) MusicAssistantParametricEQBandType get type;/// enabled
@JsonKey(name: MusicAssistantParametricEQBand.enabledKey_) bool get enabled;/// channel
@JsonKey(name: MusicAssistantParametricEQBand.channelKey_) MusicAssistantAudioChannel get channel;
/// Create a copy of MusicAssistantParametricEQBand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantParametricEQBandCopyWith<MusicAssistantParametricEQBand> get copyWith => _$MusicAssistantParametricEQBandCopyWithImpl<MusicAssistantParametricEQBand>(this as MusicAssistantParametricEQBand, _$identity);

  /// Serializes this MusicAssistantParametricEQBand to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantParametricEQBand&&(identical(other.frequency, frequency) || other.frequency == frequency)&&(identical(other.q, q) || other.q == q)&&(identical(other.gain, gain) || other.gain == gain)&&(identical(other.type, type) || other.type == type)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.channel, channel) || other.channel == channel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,frequency,q,gain,type,enabled,channel);

@override
String toString() {
  return 'MusicAssistantParametricEQBand(frequency: $frequency, q: $q, gain: $gain, type: $type, enabled: $enabled, channel: $channel)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantParametricEQBandCopyWith<$Res>  {
  factory $MusicAssistantParametricEQBandCopyWith(MusicAssistantParametricEQBand value, $Res Function(MusicAssistantParametricEQBand) _then) = _$MusicAssistantParametricEQBandCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantParametricEQBand.frequencyKey_) double frequency,@JsonKey(name: MusicAssistantParametricEQBand.qKey_) double q,@JsonKey(name: MusicAssistantParametricEQBand.gainKey_) double gain,@JsonKey(name: MusicAssistantParametricEQBand.typeKey_) MusicAssistantParametricEQBandType type,@JsonKey(name: MusicAssistantParametricEQBand.enabledKey_) bool enabled,@JsonKey(name: MusicAssistantParametricEQBand.channelKey_) MusicAssistantAudioChannel channel
});




}
/// @nodoc
class _$MusicAssistantParametricEQBandCopyWithImpl<$Res>
    implements $MusicAssistantParametricEQBandCopyWith<$Res> {
  _$MusicAssistantParametricEQBandCopyWithImpl(this._self, this._then);

  final MusicAssistantParametricEQBand _self;
  final $Res Function(MusicAssistantParametricEQBand) _then;

/// Create a copy of MusicAssistantParametricEQBand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? frequency = null,Object? q = null,Object? gain = null,Object? type = null,Object? enabled = null,Object? channel = null,}) {
  return _then(_self.copyWith(
frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as double,q: null == q ? _self.q : q // ignore: cast_nullable_to_non_nullable
as double,gain: null == gain ? _self.gain : gain // ignore: cast_nullable_to_non_nullable
as double,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MusicAssistantParametricEQBandType,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,channel: null == channel ? _self.channel : channel // ignore: cast_nullable_to_non_nullable
as MusicAssistantAudioChannel,
  ));
}

}


/// Adds pattern-matching-related methods to [MusicAssistantParametricEQBand].
extension MusicAssistantParametricEQBandPatterns on MusicAssistantParametricEQBand {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantParametricEQBand value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantParametricEQBand() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantParametricEQBand value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantParametricEQBand():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantParametricEQBand value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantParametricEQBand() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantParametricEQBand.frequencyKey_)  double frequency, @JsonKey(name: MusicAssistantParametricEQBand.qKey_)  double q, @JsonKey(name: MusicAssistantParametricEQBand.gainKey_)  double gain, @JsonKey(name: MusicAssistantParametricEQBand.typeKey_)  MusicAssistantParametricEQBandType type, @JsonKey(name: MusicAssistantParametricEQBand.enabledKey_)  bool enabled, @JsonKey(name: MusicAssistantParametricEQBand.channelKey_)  MusicAssistantAudioChannel channel)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantParametricEQBand() when $default != null:
return $default(_that.frequency,_that.q,_that.gain,_that.type,_that.enabled,_that.channel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantParametricEQBand.frequencyKey_)  double frequency, @JsonKey(name: MusicAssistantParametricEQBand.qKey_)  double q, @JsonKey(name: MusicAssistantParametricEQBand.gainKey_)  double gain, @JsonKey(name: MusicAssistantParametricEQBand.typeKey_)  MusicAssistantParametricEQBandType type, @JsonKey(name: MusicAssistantParametricEQBand.enabledKey_)  bool enabled, @JsonKey(name: MusicAssistantParametricEQBand.channelKey_)  MusicAssistantAudioChannel channel)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantParametricEQBand():
return $default(_that.frequency,_that.q,_that.gain,_that.type,_that.enabled,_that.channel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantParametricEQBand.frequencyKey_)  double frequency, @JsonKey(name: MusicAssistantParametricEQBand.qKey_)  double q, @JsonKey(name: MusicAssistantParametricEQBand.gainKey_)  double gain, @JsonKey(name: MusicAssistantParametricEQBand.typeKey_)  MusicAssistantParametricEQBandType type, @JsonKey(name: MusicAssistantParametricEQBand.enabledKey_)  bool enabled, @JsonKey(name: MusicAssistantParametricEQBand.channelKey_)  MusicAssistantAudioChannel channel)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantParametricEQBand() when $default != null:
return $default(_that.frequency,_that.q,_that.gain,_that.type,_that.enabled,_that.channel);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantParametricEQBand extends MusicAssistantParametricEQBand {
  const _MusicAssistantParametricEQBand({@JsonKey(name: MusicAssistantParametricEQBand.frequencyKey_) this.frequency = 1000.0, @JsonKey(name: MusicAssistantParametricEQBand.qKey_) this.q = 1.0, @JsonKey(name: MusicAssistantParametricEQBand.gainKey_) this.gain = 0.0, @JsonKey(name: MusicAssistantParametricEQBand.typeKey_) this.type = MusicAssistantParametricEQBandType.peak, @JsonKey(name: MusicAssistantParametricEQBand.enabledKey_) this.enabled = true, @JsonKey(name: MusicAssistantParametricEQBand.channelKey_) this.channel = MusicAssistantAudioChannel.all}): super._();
  factory _MusicAssistantParametricEQBand.fromJson(Map<String, dynamic> json) => _$MusicAssistantParametricEQBandFromJson(json);

/// frequency
@override@JsonKey(name: MusicAssistantParametricEQBand.frequencyKey_) final  double frequency;
/// q
@override@JsonKey(name: MusicAssistantParametricEQBand.qKey_) final  double q;
/// gain
@override@JsonKey(name: MusicAssistantParametricEQBand.gainKey_) final  double gain;
/// type
@override@JsonKey(name: MusicAssistantParametricEQBand.typeKey_) final  MusicAssistantParametricEQBandType type;
/// enabled
@override@JsonKey(name: MusicAssistantParametricEQBand.enabledKey_) final  bool enabled;
/// channel
@override@JsonKey(name: MusicAssistantParametricEQBand.channelKey_) final  MusicAssistantAudioChannel channel;

/// Create a copy of MusicAssistantParametricEQBand
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantParametricEQBandCopyWith<_MusicAssistantParametricEQBand> get copyWith => __$MusicAssistantParametricEQBandCopyWithImpl<_MusicAssistantParametricEQBand>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantParametricEQBandToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantParametricEQBand&&(identical(other.frequency, frequency) || other.frequency == frequency)&&(identical(other.q, q) || other.q == q)&&(identical(other.gain, gain) || other.gain == gain)&&(identical(other.type, type) || other.type == type)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.channel, channel) || other.channel == channel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,frequency,q,gain,type,enabled,channel);

@override
String toString() {
  return 'MusicAssistantParametricEQBand(frequency: $frequency, q: $q, gain: $gain, type: $type, enabled: $enabled, channel: $channel)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantParametricEQBandCopyWith<$Res> implements $MusicAssistantParametricEQBandCopyWith<$Res> {
  factory _$MusicAssistantParametricEQBandCopyWith(_MusicAssistantParametricEQBand value, $Res Function(_MusicAssistantParametricEQBand) _then) = __$MusicAssistantParametricEQBandCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantParametricEQBand.frequencyKey_) double frequency,@JsonKey(name: MusicAssistantParametricEQBand.qKey_) double q,@JsonKey(name: MusicAssistantParametricEQBand.gainKey_) double gain,@JsonKey(name: MusicAssistantParametricEQBand.typeKey_) MusicAssistantParametricEQBandType type,@JsonKey(name: MusicAssistantParametricEQBand.enabledKey_) bool enabled,@JsonKey(name: MusicAssistantParametricEQBand.channelKey_) MusicAssistantAudioChannel channel
});




}
/// @nodoc
class __$MusicAssistantParametricEQBandCopyWithImpl<$Res>
    implements _$MusicAssistantParametricEQBandCopyWith<$Res> {
  __$MusicAssistantParametricEQBandCopyWithImpl(this._self, this._then);

  final _MusicAssistantParametricEQBand _self;
  final $Res Function(_MusicAssistantParametricEQBand) _then;

/// Create a copy of MusicAssistantParametricEQBand
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? frequency = null,Object? q = null,Object? gain = null,Object? type = null,Object? enabled = null,Object? channel = null,}) {
  return _then(_MusicAssistantParametricEQBand(
frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as double,q: null == q ? _self.q : q // ignore: cast_nullable_to_non_nullable
as double,gain: null == gain ? _self.gain : gain // ignore: cast_nullable_to_non_nullable
as double,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MusicAssistantParametricEQBandType,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,channel: null == channel ? _self.channel : channel // ignore: cast_nullable_to_non_nullable
as MusicAssistantAudioChannel,
  ));
}


}

// dart format on
