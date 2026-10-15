// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_audio_queue_processing.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantAudioQueueProcessing {

/// pcmFormat
@JsonKey(name: MusicAssistantAudioQueueProcessing.pcmFormatKey_) MusicAssistantAudioFormat? get pcmFormat;/// normalization
@JsonKey(name: MusicAssistantAudioQueueProcessing.normalizationKey_) MusicAssistantAudioNormalizationDetails? get normalization;/// playbackSpeed
@JsonKey(name: MusicAssistantAudioQueueProcessing.playbackSpeedKey_) double get playbackSpeed;/// crossfadeMode
@JsonKey(name: MusicAssistantAudioQueueProcessing.crossfadeModeKey_) MusicAssistantCrossfadeMode get crossfadeMode;/// overlayActive
@JsonKey(name: MusicAssistantAudioQueueProcessing.overlayActiveKey_) bool get overlayActive;
/// Create a copy of MusicAssistantAudioQueueProcessing
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantAudioQueueProcessingCopyWith<MusicAssistantAudioQueueProcessing> get copyWith => _$MusicAssistantAudioQueueProcessingCopyWithImpl<MusicAssistantAudioQueueProcessing>(this as MusicAssistantAudioQueueProcessing, _$identity);

  /// Serializes this MusicAssistantAudioQueueProcessing to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantAudioQueueProcessing&&(identical(other.pcmFormat, pcmFormat) || other.pcmFormat == pcmFormat)&&(identical(other.normalization, normalization) || other.normalization == normalization)&&(identical(other.playbackSpeed, playbackSpeed) || other.playbackSpeed == playbackSpeed)&&(identical(other.crossfadeMode, crossfadeMode) || other.crossfadeMode == crossfadeMode)&&(identical(other.overlayActive, overlayActive) || other.overlayActive == overlayActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pcmFormat,normalization,playbackSpeed,crossfadeMode,overlayActive);

@override
String toString() {
  return 'MusicAssistantAudioQueueProcessing(pcmFormat: $pcmFormat, normalization: $normalization, playbackSpeed: $playbackSpeed, crossfadeMode: $crossfadeMode, overlayActive: $overlayActive)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantAudioQueueProcessingCopyWith<$Res>  {
  factory $MusicAssistantAudioQueueProcessingCopyWith(MusicAssistantAudioQueueProcessing value, $Res Function(MusicAssistantAudioQueueProcessing) _then) = _$MusicAssistantAudioQueueProcessingCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantAudioQueueProcessing.pcmFormatKey_) MusicAssistantAudioFormat? pcmFormat,@JsonKey(name: MusicAssistantAudioQueueProcessing.normalizationKey_) MusicAssistantAudioNormalizationDetails? normalization,@JsonKey(name: MusicAssistantAudioQueueProcessing.playbackSpeedKey_) double playbackSpeed,@JsonKey(name: MusicAssistantAudioQueueProcessing.crossfadeModeKey_) MusicAssistantCrossfadeMode crossfadeMode,@JsonKey(name: MusicAssistantAudioQueueProcessing.overlayActiveKey_) bool overlayActive
});


$MusicAssistantAudioFormatCopyWith<$Res>? get pcmFormat;$MusicAssistantAudioNormalizationDetailsCopyWith<$Res>? get normalization;

}
/// @nodoc
class _$MusicAssistantAudioQueueProcessingCopyWithImpl<$Res>
    implements $MusicAssistantAudioQueueProcessingCopyWith<$Res> {
  _$MusicAssistantAudioQueueProcessingCopyWithImpl(this._self, this._then);

  final MusicAssistantAudioQueueProcessing _self;
  final $Res Function(MusicAssistantAudioQueueProcessing) _then;

/// Create a copy of MusicAssistantAudioQueueProcessing
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pcmFormat = freezed,Object? normalization = freezed,Object? playbackSpeed = null,Object? crossfadeMode = null,Object? overlayActive = null,}) {
  return _then(_self.copyWith(
pcmFormat: freezed == pcmFormat ? _self.pcmFormat : pcmFormat // ignore: cast_nullable_to_non_nullable
as MusicAssistantAudioFormat?,normalization: freezed == normalization ? _self.normalization : normalization // ignore: cast_nullable_to_non_nullable
as MusicAssistantAudioNormalizationDetails?,playbackSpeed: null == playbackSpeed ? _self.playbackSpeed : playbackSpeed // ignore: cast_nullable_to_non_nullable
as double,crossfadeMode: null == crossfadeMode ? _self.crossfadeMode : crossfadeMode // ignore: cast_nullable_to_non_nullable
as MusicAssistantCrossfadeMode,overlayActive: null == overlayActive ? _self.overlayActive : overlayActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of MusicAssistantAudioQueueProcessing
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantAudioFormatCopyWith<$Res>? get pcmFormat {
    if (_self.pcmFormat == null) {
    return null;
  }

  return $MusicAssistantAudioFormatCopyWith<$Res>(_self.pcmFormat!, (value) {
    return _then(_self.copyWith(pcmFormat: value));
  });
}/// Create a copy of MusicAssistantAudioQueueProcessing
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantAudioNormalizationDetailsCopyWith<$Res>? get normalization {
    if (_self.normalization == null) {
    return null;
  }

  return $MusicAssistantAudioNormalizationDetailsCopyWith<$Res>(_self.normalization!, (value) {
    return _then(_self.copyWith(normalization: value));
  });
}
}


/// Adds pattern-matching-related methods to [MusicAssistantAudioQueueProcessing].
extension MusicAssistantAudioQueueProcessingPatterns on MusicAssistantAudioQueueProcessing {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantAudioQueueProcessing value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantAudioQueueProcessing() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantAudioQueueProcessing value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantAudioQueueProcessing():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantAudioQueueProcessing value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantAudioQueueProcessing() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantAudioQueueProcessing.pcmFormatKey_)  MusicAssistantAudioFormat? pcmFormat, @JsonKey(name: MusicAssistantAudioQueueProcessing.normalizationKey_)  MusicAssistantAudioNormalizationDetails? normalization, @JsonKey(name: MusicAssistantAudioQueueProcessing.playbackSpeedKey_)  double playbackSpeed, @JsonKey(name: MusicAssistantAudioQueueProcessing.crossfadeModeKey_)  MusicAssistantCrossfadeMode crossfadeMode, @JsonKey(name: MusicAssistantAudioQueueProcessing.overlayActiveKey_)  bool overlayActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantAudioQueueProcessing() when $default != null:
return $default(_that.pcmFormat,_that.normalization,_that.playbackSpeed,_that.crossfadeMode,_that.overlayActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantAudioQueueProcessing.pcmFormatKey_)  MusicAssistantAudioFormat? pcmFormat, @JsonKey(name: MusicAssistantAudioQueueProcessing.normalizationKey_)  MusicAssistantAudioNormalizationDetails? normalization, @JsonKey(name: MusicAssistantAudioQueueProcessing.playbackSpeedKey_)  double playbackSpeed, @JsonKey(name: MusicAssistantAudioQueueProcessing.crossfadeModeKey_)  MusicAssistantCrossfadeMode crossfadeMode, @JsonKey(name: MusicAssistantAudioQueueProcessing.overlayActiveKey_)  bool overlayActive)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantAudioQueueProcessing():
return $default(_that.pcmFormat,_that.normalization,_that.playbackSpeed,_that.crossfadeMode,_that.overlayActive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantAudioQueueProcessing.pcmFormatKey_)  MusicAssistantAudioFormat? pcmFormat, @JsonKey(name: MusicAssistantAudioQueueProcessing.normalizationKey_)  MusicAssistantAudioNormalizationDetails? normalization, @JsonKey(name: MusicAssistantAudioQueueProcessing.playbackSpeedKey_)  double playbackSpeed, @JsonKey(name: MusicAssistantAudioQueueProcessing.crossfadeModeKey_)  MusicAssistantCrossfadeMode crossfadeMode, @JsonKey(name: MusicAssistantAudioQueueProcessing.overlayActiveKey_)  bool overlayActive)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantAudioQueueProcessing() when $default != null:
return $default(_that.pcmFormat,_that.normalization,_that.playbackSpeed,_that.crossfadeMode,_that.overlayActive);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantAudioQueueProcessing extends MusicAssistantAudioQueueProcessing {
  const _MusicAssistantAudioQueueProcessing({@JsonKey(name: MusicAssistantAudioQueueProcessing.pcmFormatKey_) this.pcmFormat, @JsonKey(name: MusicAssistantAudioQueueProcessing.normalizationKey_) this.normalization, @JsonKey(name: MusicAssistantAudioQueueProcessing.playbackSpeedKey_) this.playbackSpeed = 1.0, @JsonKey(name: MusicAssistantAudioQueueProcessing.crossfadeModeKey_) this.crossfadeMode = MusicAssistantCrossfadeMode.disabled, @JsonKey(name: MusicAssistantAudioQueueProcessing.overlayActiveKey_) this.overlayActive = false}): super._();
  factory _MusicAssistantAudioQueueProcessing.fromJson(Map<String, dynamic> json) => _$MusicAssistantAudioQueueProcessingFromJson(json);

/// pcmFormat
@override@JsonKey(name: MusicAssistantAudioQueueProcessing.pcmFormatKey_) final  MusicAssistantAudioFormat? pcmFormat;
/// normalization
@override@JsonKey(name: MusicAssistantAudioQueueProcessing.normalizationKey_) final  MusicAssistantAudioNormalizationDetails? normalization;
/// playbackSpeed
@override@JsonKey(name: MusicAssistantAudioQueueProcessing.playbackSpeedKey_) final  double playbackSpeed;
/// crossfadeMode
@override@JsonKey(name: MusicAssistantAudioQueueProcessing.crossfadeModeKey_) final  MusicAssistantCrossfadeMode crossfadeMode;
/// overlayActive
@override@JsonKey(name: MusicAssistantAudioQueueProcessing.overlayActiveKey_) final  bool overlayActive;

/// Create a copy of MusicAssistantAudioQueueProcessing
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantAudioQueueProcessingCopyWith<_MusicAssistantAudioQueueProcessing> get copyWith => __$MusicAssistantAudioQueueProcessingCopyWithImpl<_MusicAssistantAudioQueueProcessing>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantAudioQueueProcessingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantAudioQueueProcessing&&(identical(other.pcmFormat, pcmFormat) || other.pcmFormat == pcmFormat)&&(identical(other.normalization, normalization) || other.normalization == normalization)&&(identical(other.playbackSpeed, playbackSpeed) || other.playbackSpeed == playbackSpeed)&&(identical(other.crossfadeMode, crossfadeMode) || other.crossfadeMode == crossfadeMode)&&(identical(other.overlayActive, overlayActive) || other.overlayActive == overlayActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pcmFormat,normalization,playbackSpeed,crossfadeMode,overlayActive);

@override
String toString() {
  return 'MusicAssistantAudioQueueProcessing(pcmFormat: $pcmFormat, normalization: $normalization, playbackSpeed: $playbackSpeed, crossfadeMode: $crossfadeMode, overlayActive: $overlayActive)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantAudioQueueProcessingCopyWith<$Res> implements $MusicAssistantAudioQueueProcessingCopyWith<$Res> {
  factory _$MusicAssistantAudioQueueProcessingCopyWith(_MusicAssistantAudioQueueProcessing value, $Res Function(_MusicAssistantAudioQueueProcessing) _then) = __$MusicAssistantAudioQueueProcessingCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantAudioQueueProcessing.pcmFormatKey_) MusicAssistantAudioFormat? pcmFormat,@JsonKey(name: MusicAssistantAudioQueueProcessing.normalizationKey_) MusicAssistantAudioNormalizationDetails? normalization,@JsonKey(name: MusicAssistantAudioQueueProcessing.playbackSpeedKey_) double playbackSpeed,@JsonKey(name: MusicAssistantAudioQueueProcessing.crossfadeModeKey_) MusicAssistantCrossfadeMode crossfadeMode,@JsonKey(name: MusicAssistantAudioQueueProcessing.overlayActiveKey_) bool overlayActive
});


@override $MusicAssistantAudioFormatCopyWith<$Res>? get pcmFormat;@override $MusicAssistantAudioNormalizationDetailsCopyWith<$Res>? get normalization;

}
/// @nodoc
class __$MusicAssistantAudioQueueProcessingCopyWithImpl<$Res>
    implements _$MusicAssistantAudioQueueProcessingCopyWith<$Res> {
  __$MusicAssistantAudioQueueProcessingCopyWithImpl(this._self, this._then);

  final _MusicAssistantAudioQueueProcessing _self;
  final $Res Function(_MusicAssistantAudioQueueProcessing) _then;

/// Create a copy of MusicAssistantAudioQueueProcessing
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pcmFormat = freezed,Object? normalization = freezed,Object? playbackSpeed = null,Object? crossfadeMode = null,Object? overlayActive = null,}) {
  return _then(_MusicAssistantAudioQueueProcessing(
pcmFormat: freezed == pcmFormat ? _self.pcmFormat : pcmFormat // ignore: cast_nullable_to_non_nullable
as MusicAssistantAudioFormat?,normalization: freezed == normalization ? _self.normalization : normalization // ignore: cast_nullable_to_non_nullable
as MusicAssistantAudioNormalizationDetails?,playbackSpeed: null == playbackSpeed ? _self.playbackSpeed : playbackSpeed // ignore: cast_nullable_to_non_nullable
as double,crossfadeMode: null == crossfadeMode ? _self.crossfadeMode : crossfadeMode // ignore: cast_nullable_to_non_nullable
as MusicAssistantCrossfadeMode,overlayActive: null == overlayActive ? _self.overlayActive : overlayActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of MusicAssistantAudioQueueProcessing
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantAudioFormatCopyWith<$Res>? get pcmFormat {
    if (_self.pcmFormat == null) {
    return null;
  }

  return $MusicAssistantAudioFormatCopyWith<$Res>(_self.pcmFormat!, (value) {
    return _then(_self.copyWith(pcmFormat: value));
  });
}/// Create a copy of MusicAssistantAudioQueueProcessing
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantAudioNormalizationDetailsCopyWith<$Res>? get normalization {
    if (_self.normalization == null) {
    return null;
  }

  return $MusicAssistantAudioNormalizationDetailsCopyWith<$Res>(_self.normalization!, (value) {
    return _then(_self.copyWith(normalization: value));
  });
}
}

// dart format on
