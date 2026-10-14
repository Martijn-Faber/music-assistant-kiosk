// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_audio_format.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantAudioFormat {

/// bitRate
@JsonKey(name: MusicAssistantAudioFormat.bitRateKey_) int? get bitRate;/// contentType
@JsonKey(name: MusicAssistantAudioFormat.contentTypeKey_) MusicAssistantContentType get contentType;/// bitDepth
@JsonKey(name: MusicAssistantAudioFormat.bitDepthKey_) int get bitDepth;/// sampleRate
@JsonKey(name: MusicAssistantAudioFormat.sampleRateKey_) int get sampleRate;/// channels
@JsonKey(name: MusicAssistantAudioFormat.channelsKey_) int get channels;/// codecType
@JsonKey(name: MusicAssistantAudioFormat.codecTypeKey_) MusicAssistantContentType get codecType;
/// Create a copy of MusicAssistantAudioFormat
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantAudioFormatCopyWith<MusicAssistantAudioFormat> get copyWith => _$MusicAssistantAudioFormatCopyWithImpl<MusicAssistantAudioFormat>(this as MusicAssistantAudioFormat, _$identity);

  /// Serializes this MusicAssistantAudioFormat to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantAudioFormat&&(identical(other.bitRate, bitRate) || other.bitRate == bitRate)&&(identical(other.contentType, contentType) || other.contentType == contentType)&&(identical(other.bitDepth, bitDepth) || other.bitDepth == bitDepth)&&(identical(other.sampleRate, sampleRate) || other.sampleRate == sampleRate)&&(identical(other.channels, channels) || other.channels == channels)&&(identical(other.codecType, codecType) || other.codecType == codecType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bitRate,contentType,bitDepth,sampleRate,channels,codecType);

@override
String toString() {
  return 'MusicAssistantAudioFormat(bitRate: $bitRate, contentType: $contentType, bitDepth: $bitDepth, sampleRate: $sampleRate, channels: $channels, codecType: $codecType)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantAudioFormatCopyWith<$Res>  {
  factory $MusicAssistantAudioFormatCopyWith(MusicAssistantAudioFormat value, $Res Function(MusicAssistantAudioFormat) _then) = _$MusicAssistantAudioFormatCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantAudioFormat.bitRateKey_) int? bitRate,@JsonKey(name: MusicAssistantAudioFormat.contentTypeKey_) MusicAssistantContentType contentType,@JsonKey(name: MusicAssistantAudioFormat.bitDepthKey_) int bitDepth,@JsonKey(name: MusicAssistantAudioFormat.sampleRateKey_) int sampleRate,@JsonKey(name: MusicAssistantAudioFormat.channelsKey_) int channels,@JsonKey(name: MusicAssistantAudioFormat.codecTypeKey_) MusicAssistantContentType codecType
});




}
/// @nodoc
class _$MusicAssistantAudioFormatCopyWithImpl<$Res>
    implements $MusicAssistantAudioFormatCopyWith<$Res> {
  _$MusicAssistantAudioFormatCopyWithImpl(this._self, this._then);

  final MusicAssistantAudioFormat _self;
  final $Res Function(MusicAssistantAudioFormat) _then;

/// Create a copy of MusicAssistantAudioFormat
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bitRate = freezed,Object? contentType = null,Object? bitDepth = null,Object? sampleRate = null,Object? channels = null,Object? codecType = null,}) {
  return _then(_self.copyWith(
bitRate: freezed == bitRate ? _self.bitRate : bitRate // ignore: cast_nullable_to_non_nullable
as int?,contentType: null == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as MusicAssistantContentType,bitDepth: null == bitDepth ? _self.bitDepth : bitDepth // ignore: cast_nullable_to_non_nullable
as int,sampleRate: null == sampleRate ? _self.sampleRate : sampleRate // ignore: cast_nullable_to_non_nullable
as int,channels: null == channels ? _self.channels : channels // ignore: cast_nullable_to_non_nullable
as int,codecType: null == codecType ? _self.codecType : codecType // ignore: cast_nullable_to_non_nullable
as MusicAssistantContentType,
  ));
}

}


/// Adds pattern-matching-related methods to [MusicAssistantAudioFormat].
extension MusicAssistantAudioFormatPatterns on MusicAssistantAudioFormat {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantAudioFormat value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantAudioFormat() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantAudioFormat value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantAudioFormat():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantAudioFormat value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantAudioFormat() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantAudioFormat.bitRateKey_)  int? bitRate, @JsonKey(name: MusicAssistantAudioFormat.contentTypeKey_)  MusicAssistantContentType contentType, @JsonKey(name: MusicAssistantAudioFormat.bitDepthKey_)  int bitDepth, @JsonKey(name: MusicAssistantAudioFormat.sampleRateKey_)  int sampleRate, @JsonKey(name: MusicAssistantAudioFormat.channelsKey_)  int channels, @JsonKey(name: MusicAssistantAudioFormat.codecTypeKey_)  MusicAssistantContentType codecType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantAudioFormat() when $default != null:
return $default(_that.bitRate,_that.contentType,_that.bitDepth,_that.sampleRate,_that.channels,_that.codecType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantAudioFormat.bitRateKey_)  int? bitRate, @JsonKey(name: MusicAssistantAudioFormat.contentTypeKey_)  MusicAssistantContentType contentType, @JsonKey(name: MusicAssistantAudioFormat.bitDepthKey_)  int bitDepth, @JsonKey(name: MusicAssistantAudioFormat.sampleRateKey_)  int sampleRate, @JsonKey(name: MusicAssistantAudioFormat.channelsKey_)  int channels, @JsonKey(name: MusicAssistantAudioFormat.codecTypeKey_)  MusicAssistantContentType codecType)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantAudioFormat():
return $default(_that.bitRate,_that.contentType,_that.bitDepth,_that.sampleRate,_that.channels,_that.codecType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantAudioFormat.bitRateKey_)  int? bitRate, @JsonKey(name: MusicAssistantAudioFormat.contentTypeKey_)  MusicAssistantContentType contentType, @JsonKey(name: MusicAssistantAudioFormat.bitDepthKey_)  int bitDepth, @JsonKey(name: MusicAssistantAudioFormat.sampleRateKey_)  int sampleRate, @JsonKey(name: MusicAssistantAudioFormat.channelsKey_)  int channels, @JsonKey(name: MusicAssistantAudioFormat.codecTypeKey_)  MusicAssistantContentType codecType)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantAudioFormat() when $default != null:
return $default(_that.bitRate,_that.contentType,_that.bitDepth,_that.sampleRate,_that.channels,_that.codecType);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantAudioFormat extends MusicAssistantAudioFormat {
  const _MusicAssistantAudioFormat({@JsonKey(name: MusicAssistantAudioFormat.bitRateKey_) this.bitRate, @JsonKey(name: MusicAssistantAudioFormat.contentTypeKey_) this.contentType = MusicAssistantContentType.value61, @JsonKey(name: MusicAssistantAudioFormat.bitDepthKey_) this.bitDepth = 16, @JsonKey(name: MusicAssistantAudioFormat.sampleRateKey_) this.sampleRate = 44100, @JsonKey(name: MusicAssistantAudioFormat.channelsKey_) this.channels = 2, @JsonKey(name: MusicAssistantAudioFormat.codecTypeKey_) this.codecType = MusicAssistantContentType.value61}): super._();
  factory _MusicAssistantAudioFormat.fromJson(Map<String, dynamic> json) => _$MusicAssistantAudioFormatFromJson(json);

/// bitRate
@override@JsonKey(name: MusicAssistantAudioFormat.bitRateKey_) final  int? bitRate;
/// contentType
@override@JsonKey(name: MusicAssistantAudioFormat.contentTypeKey_) final  MusicAssistantContentType contentType;
/// bitDepth
@override@JsonKey(name: MusicAssistantAudioFormat.bitDepthKey_) final  int bitDepth;
/// sampleRate
@override@JsonKey(name: MusicAssistantAudioFormat.sampleRateKey_) final  int sampleRate;
/// channels
@override@JsonKey(name: MusicAssistantAudioFormat.channelsKey_) final  int channels;
/// codecType
@override@JsonKey(name: MusicAssistantAudioFormat.codecTypeKey_) final  MusicAssistantContentType codecType;

/// Create a copy of MusicAssistantAudioFormat
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantAudioFormatCopyWith<_MusicAssistantAudioFormat> get copyWith => __$MusicAssistantAudioFormatCopyWithImpl<_MusicAssistantAudioFormat>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantAudioFormatToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantAudioFormat&&(identical(other.bitRate, bitRate) || other.bitRate == bitRate)&&(identical(other.contentType, contentType) || other.contentType == contentType)&&(identical(other.bitDepth, bitDepth) || other.bitDepth == bitDepth)&&(identical(other.sampleRate, sampleRate) || other.sampleRate == sampleRate)&&(identical(other.channels, channels) || other.channels == channels)&&(identical(other.codecType, codecType) || other.codecType == codecType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bitRate,contentType,bitDepth,sampleRate,channels,codecType);

@override
String toString() {
  return 'MusicAssistantAudioFormat(bitRate: $bitRate, contentType: $contentType, bitDepth: $bitDepth, sampleRate: $sampleRate, channels: $channels, codecType: $codecType)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantAudioFormatCopyWith<$Res> implements $MusicAssistantAudioFormatCopyWith<$Res> {
  factory _$MusicAssistantAudioFormatCopyWith(_MusicAssistantAudioFormat value, $Res Function(_MusicAssistantAudioFormat) _then) = __$MusicAssistantAudioFormatCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantAudioFormat.bitRateKey_) int? bitRate,@JsonKey(name: MusicAssistantAudioFormat.contentTypeKey_) MusicAssistantContentType contentType,@JsonKey(name: MusicAssistantAudioFormat.bitDepthKey_) int bitDepth,@JsonKey(name: MusicAssistantAudioFormat.sampleRateKey_) int sampleRate,@JsonKey(name: MusicAssistantAudioFormat.channelsKey_) int channels,@JsonKey(name: MusicAssistantAudioFormat.codecTypeKey_) MusicAssistantContentType codecType
});




}
/// @nodoc
class __$MusicAssistantAudioFormatCopyWithImpl<$Res>
    implements _$MusicAssistantAudioFormatCopyWith<$Res> {
  __$MusicAssistantAudioFormatCopyWithImpl(this._self, this._then);

  final _MusicAssistantAudioFormat _self;
  final $Res Function(_MusicAssistantAudioFormat) _then;

/// Create a copy of MusicAssistantAudioFormat
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bitRate = freezed,Object? contentType = null,Object? bitDepth = null,Object? sampleRate = null,Object? channels = null,Object? codecType = null,}) {
  return _then(_MusicAssistantAudioFormat(
bitRate: freezed == bitRate ? _self.bitRate : bitRate // ignore: cast_nullable_to_non_nullable
as int?,contentType: null == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as MusicAssistantContentType,bitDepth: null == bitDepth ? _self.bitDepth : bitDepth // ignore: cast_nullable_to_non_nullable
as int,sampleRate: null == sampleRate ? _self.sampleRate : sampleRate // ignore: cast_nullable_to_non_nullable
as int,channels: null == channels ? _self.channels : channels // ignore: cast_nullable_to_non_nullable
as int,codecType: null == codecType ? _self.codecType : codecType // ignore: cast_nullable_to_non_nullable
as MusicAssistantContentType,
  ));
}


}

// dart format on
