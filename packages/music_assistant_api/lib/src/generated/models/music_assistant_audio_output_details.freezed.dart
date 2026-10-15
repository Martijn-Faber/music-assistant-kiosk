// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_audio_output_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantAudioOutputDetails {

/// playerIds
@JsonKey(name: MusicAssistantAudioOutputDetails.playerIdsKey_) List<String>? get playerIds;/// dsp
@JsonKey(name: MusicAssistantAudioOutputDetails.dspKey_) MusicAssistantAudioDSPDetails? get dsp;/// sourceChannel
@JsonKey(name: MusicAssistantAudioOutputDetails.sourceChannelKey_) MusicAssistantAudioChannel? get sourceChannel;/// outputFormat
@JsonKey(name: MusicAssistantAudioOutputDetails.outputFormatKey_) MusicAssistantAudioFormat? get outputFormat;/// fidelity
@JsonKey(name: MusicAssistantAudioOutputDetails.fidelityKey_) MusicAssistantAudioFidelity? get fidelity;
/// Create a copy of MusicAssistantAudioOutputDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantAudioOutputDetailsCopyWith<MusicAssistantAudioOutputDetails> get copyWith => _$MusicAssistantAudioOutputDetailsCopyWithImpl<MusicAssistantAudioOutputDetails>(this as MusicAssistantAudioOutputDetails, _$identity);

  /// Serializes this MusicAssistantAudioOutputDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantAudioOutputDetails&&const DeepCollectionEquality().equals(other.playerIds, playerIds)&&(identical(other.dsp, dsp) || other.dsp == dsp)&&(identical(other.sourceChannel, sourceChannel) || other.sourceChannel == sourceChannel)&&(identical(other.outputFormat, outputFormat) || other.outputFormat == outputFormat)&&(identical(other.fidelity, fidelity) || other.fidelity == fidelity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(playerIds),dsp,sourceChannel,outputFormat,fidelity);

@override
String toString() {
  return 'MusicAssistantAudioOutputDetails(playerIds: $playerIds, dsp: $dsp, sourceChannel: $sourceChannel, outputFormat: $outputFormat, fidelity: $fidelity)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantAudioOutputDetailsCopyWith<$Res>  {
  factory $MusicAssistantAudioOutputDetailsCopyWith(MusicAssistantAudioOutputDetails value, $Res Function(MusicAssistantAudioOutputDetails) _then) = _$MusicAssistantAudioOutputDetailsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantAudioOutputDetails.playerIdsKey_) List<String>? playerIds,@JsonKey(name: MusicAssistantAudioOutputDetails.dspKey_) MusicAssistantAudioDSPDetails? dsp,@JsonKey(name: MusicAssistantAudioOutputDetails.sourceChannelKey_) MusicAssistantAudioChannel? sourceChannel,@JsonKey(name: MusicAssistantAudioOutputDetails.outputFormatKey_) MusicAssistantAudioFormat? outputFormat,@JsonKey(name: MusicAssistantAudioOutputDetails.fidelityKey_) MusicAssistantAudioFidelity? fidelity
});


$MusicAssistantAudioDSPDetailsCopyWith<$Res>? get dsp;$MusicAssistantAudioFormatCopyWith<$Res>? get outputFormat;$MusicAssistantAudioFidelityCopyWith<$Res>? get fidelity;

}
/// @nodoc
class _$MusicAssistantAudioOutputDetailsCopyWithImpl<$Res>
    implements $MusicAssistantAudioOutputDetailsCopyWith<$Res> {
  _$MusicAssistantAudioOutputDetailsCopyWithImpl(this._self, this._then);

  final MusicAssistantAudioOutputDetails _self;
  final $Res Function(MusicAssistantAudioOutputDetails) _then;

/// Create a copy of MusicAssistantAudioOutputDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? playerIds = freezed,Object? dsp = freezed,Object? sourceChannel = freezed,Object? outputFormat = freezed,Object? fidelity = freezed,}) {
  return _then(_self.copyWith(
playerIds: freezed == playerIds ? _self.playerIds : playerIds // ignore: cast_nullable_to_non_nullable
as List<String>?,dsp: freezed == dsp ? _self.dsp : dsp // ignore: cast_nullable_to_non_nullable
as MusicAssistantAudioDSPDetails?,sourceChannel: freezed == sourceChannel ? _self.sourceChannel : sourceChannel // ignore: cast_nullable_to_non_nullable
as MusicAssistantAudioChannel?,outputFormat: freezed == outputFormat ? _self.outputFormat : outputFormat // ignore: cast_nullable_to_non_nullable
as MusicAssistantAudioFormat?,fidelity: freezed == fidelity ? _self.fidelity : fidelity // ignore: cast_nullable_to_non_nullable
as MusicAssistantAudioFidelity?,
  ));
}
/// Create a copy of MusicAssistantAudioOutputDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantAudioDSPDetailsCopyWith<$Res>? get dsp {
    if (_self.dsp == null) {
    return null;
  }

  return $MusicAssistantAudioDSPDetailsCopyWith<$Res>(_self.dsp!, (value) {
    return _then(_self.copyWith(dsp: value));
  });
}/// Create a copy of MusicAssistantAudioOutputDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantAudioFormatCopyWith<$Res>? get outputFormat {
    if (_self.outputFormat == null) {
    return null;
  }

  return $MusicAssistantAudioFormatCopyWith<$Res>(_self.outputFormat!, (value) {
    return _then(_self.copyWith(outputFormat: value));
  });
}/// Create a copy of MusicAssistantAudioOutputDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantAudioFidelityCopyWith<$Res>? get fidelity {
    if (_self.fidelity == null) {
    return null;
  }

  return $MusicAssistantAudioFidelityCopyWith<$Res>(_self.fidelity!, (value) {
    return _then(_self.copyWith(fidelity: value));
  });
}
}


/// Adds pattern-matching-related methods to [MusicAssistantAudioOutputDetails].
extension MusicAssistantAudioOutputDetailsPatterns on MusicAssistantAudioOutputDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantAudioOutputDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantAudioOutputDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantAudioOutputDetails value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantAudioOutputDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantAudioOutputDetails value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantAudioOutputDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantAudioOutputDetails.playerIdsKey_)  List<String>? playerIds, @JsonKey(name: MusicAssistantAudioOutputDetails.dspKey_)  MusicAssistantAudioDSPDetails? dsp, @JsonKey(name: MusicAssistantAudioOutputDetails.sourceChannelKey_)  MusicAssistantAudioChannel? sourceChannel, @JsonKey(name: MusicAssistantAudioOutputDetails.outputFormatKey_)  MusicAssistantAudioFormat? outputFormat, @JsonKey(name: MusicAssistantAudioOutputDetails.fidelityKey_)  MusicAssistantAudioFidelity? fidelity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantAudioOutputDetails() when $default != null:
return $default(_that.playerIds,_that.dsp,_that.sourceChannel,_that.outputFormat,_that.fidelity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantAudioOutputDetails.playerIdsKey_)  List<String>? playerIds, @JsonKey(name: MusicAssistantAudioOutputDetails.dspKey_)  MusicAssistantAudioDSPDetails? dsp, @JsonKey(name: MusicAssistantAudioOutputDetails.sourceChannelKey_)  MusicAssistantAudioChannel? sourceChannel, @JsonKey(name: MusicAssistantAudioOutputDetails.outputFormatKey_)  MusicAssistantAudioFormat? outputFormat, @JsonKey(name: MusicAssistantAudioOutputDetails.fidelityKey_)  MusicAssistantAudioFidelity? fidelity)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantAudioOutputDetails():
return $default(_that.playerIds,_that.dsp,_that.sourceChannel,_that.outputFormat,_that.fidelity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantAudioOutputDetails.playerIdsKey_)  List<String>? playerIds, @JsonKey(name: MusicAssistantAudioOutputDetails.dspKey_)  MusicAssistantAudioDSPDetails? dsp, @JsonKey(name: MusicAssistantAudioOutputDetails.sourceChannelKey_)  MusicAssistantAudioChannel? sourceChannel, @JsonKey(name: MusicAssistantAudioOutputDetails.outputFormatKey_)  MusicAssistantAudioFormat? outputFormat, @JsonKey(name: MusicAssistantAudioOutputDetails.fidelityKey_)  MusicAssistantAudioFidelity? fidelity)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantAudioOutputDetails() when $default != null:
return $default(_that.playerIds,_that.dsp,_that.sourceChannel,_that.outputFormat,_that.fidelity);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantAudioOutputDetails extends MusicAssistantAudioOutputDetails {
  const _MusicAssistantAudioOutputDetails({@JsonKey(name: MusicAssistantAudioOutputDetails.playerIdsKey_) final  List<String>? playerIds, @JsonKey(name: MusicAssistantAudioOutputDetails.dspKey_) this.dsp, @JsonKey(name: MusicAssistantAudioOutputDetails.sourceChannelKey_) this.sourceChannel, @JsonKey(name: MusicAssistantAudioOutputDetails.outputFormatKey_) this.outputFormat, @JsonKey(name: MusicAssistantAudioOutputDetails.fidelityKey_) this.fidelity}): _playerIds = playerIds,super._();
  factory _MusicAssistantAudioOutputDetails.fromJson(Map<String, dynamic> json) => _$MusicAssistantAudioOutputDetailsFromJson(json);

/// playerIds
 final  List<String>? _playerIds;
/// playerIds
@override@JsonKey(name: MusicAssistantAudioOutputDetails.playerIdsKey_) List<String>? get playerIds {
  final value = _playerIds;
  if (value == null) return null;
  if (_playerIds is EqualUnmodifiableListView) return _playerIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// dsp
@override@JsonKey(name: MusicAssistantAudioOutputDetails.dspKey_) final  MusicAssistantAudioDSPDetails? dsp;
/// sourceChannel
@override@JsonKey(name: MusicAssistantAudioOutputDetails.sourceChannelKey_) final  MusicAssistantAudioChannel? sourceChannel;
/// outputFormat
@override@JsonKey(name: MusicAssistantAudioOutputDetails.outputFormatKey_) final  MusicAssistantAudioFormat? outputFormat;
/// fidelity
@override@JsonKey(name: MusicAssistantAudioOutputDetails.fidelityKey_) final  MusicAssistantAudioFidelity? fidelity;

/// Create a copy of MusicAssistantAudioOutputDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantAudioOutputDetailsCopyWith<_MusicAssistantAudioOutputDetails> get copyWith => __$MusicAssistantAudioOutputDetailsCopyWithImpl<_MusicAssistantAudioOutputDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantAudioOutputDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantAudioOutputDetails&&const DeepCollectionEquality().equals(other._playerIds, _playerIds)&&(identical(other.dsp, dsp) || other.dsp == dsp)&&(identical(other.sourceChannel, sourceChannel) || other.sourceChannel == sourceChannel)&&(identical(other.outputFormat, outputFormat) || other.outputFormat == outputFormat)&&(identical(other.fidelity, fidelity) || other.fidelity == fidelity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_playerIds),dsp,sourceChannel,outputFormat,fidelity);

@override
String toString() {
  return 'MusicAssistantAudioOutputDetails(playerIds: $playerIds, dsp: $dsp, sourceChannel: $sourceChannel, outputFormat: $outputFormat, fidelity: $fidelity)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantAudioOutputDetailsCopyWith<$Res> implements $MusicAssistantAudioOutputDetailsCopyWith<$Res> {
  factory _$MusicAssistantAudioOutputDetailsCopyWith(_MusicAssistantAudioOutputDetails value, $Res Function(_MusicAssistantAudioOutputDetails) _then) = __$MusicAssistantAudioOutputDetailsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantAudioOutputDetails.playerIdsKey_) List<String>? playerIds,@JsonKey(name: MusicAssistantAudioOutputDetails.dspKey_) MusicAssistantAudioDSPDetails? dsp,@JsonKey(name: MusicAssistantAudioOutputDetails.sourceChannelKey_) MusicAssistantAudioChannel? sourceChannel,@JsonKey(name: MusicAssistantAudioOutputDetails.outputFormatKey_) MusicAssistantAudioFormat? outputFormat,@JsonKey(name: MusicAssistantAudioOutputDetails.fidelityKey_) MusicAssistantAudioFidelity? fidelity
});


@override $MusicAssistantAudioDSPDetailsCopyWith<$Res>? get dsp;@override $MusicAssistantAudioFormatCopyWith<$Res>? get outputFormat;@override $MusicAssistantAudioFidelityCopyWith<$Res>? get fidelity;

}
/// @nodoc
class __$MusicAssistantAudioOutputDetailsCopyWithImpl<$Res>
    implements _$MusicAssistantAudioOutputDetailsCopyWith<$Res> {
  __$MusicAssistantAudioOutputDetailsCopyWithImpl(this._self, this._then);

  final _MusicAssistantAudioOutputDetails _self;
  final $Res Function(_MusicAssistantAudioOutputDetails) _then;

/// Create a copy of MusicAssistantAudioOutputDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? playerIds = freezed,Object? dsp = freezed,Object? sourceChannel = freezed,Object? outputFormat = freezed,Object? fidelity = freezed,}) {
  return _then(_MusicAssistantAudioOutputDetails(
playerIds: freezed == playerIds ? _self._playerIds : playerIds // ignore: cast_nullable_to_non_nullable
as List<String>?,dsp: freezed == dsp ? _self.dsp : dsp // ignore: cast_nullable_to_non_nullable
as MusicAssistantAudioDSPDetails?,sourceChannel: freezed == sourceChannel ? _self.sourceChannel : sourceChannel // ignore: cast_nullable_to_non_nullable
as MusicAssistantAudioChannel?,outputFormat: freezed == outputFormat ? _self.outputFormat : outputFormat // ignore: cast_nullable_to_non_nullable
as MusicAssistantAudioFormat?,fidelity: freezed == fidelity ? _self.fidelity : fidelity // ignore: cast_nullable_to_non_nullable
as MusicAssistantAudioFidelity?,
  ));
}

/// Create a copy of MusicAssistantAudioOutputDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantAudioDSPDetailsCopyWith<$Res>? get dsp {
    if (_self.dsp == null) {
    return null;
  }

  return $MusicAssistantAudioDSPDetailsCopyWith<$Res>(_self.dsp!, (value) {
    return _then(_self.copyWith(dsp: value));
  });
}/// Create a copy of MusicAssistantAudioOutputDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantAudioFormatCopyWith<$Res>? get outputFormat {
    if (_self.outputFormat == null) {
    return null;
  }

  return $MusicAssistantAudioFormatCopyWith<$Res>(_self.outputFormat!, (value) {
    return _then(_self.copyWith(outputFormat: value));
  });
}/// Create a copy of MusicAssistantAudioOutputDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantAudioFidelityCopyWith<$Res>? get fidelity {
    if (_self.fidelity == null) {
    return null;
  }

  return $MusicAssistantAudioFidelityCopyWith<$Res>(_self.fidelity!, (value) {
    return _then(_self.copyWith(fidelity: value));
  });
}
}

// dart format on
