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

/// contentType
@JsonKey(name: MusicAssistantAudioFormat.contentTypeKey_) MusicAssistantContentType get contentType;/// codecType
@JsonKey(name: MusicAssistantAudioFormat.codecTypeKey_) MusicAssistantContentType get codecType;/// sampleRate
@JsonKey(name: MusicAssistantAudioFormat.sampleRateKey_) int get sampleRate;/// bitDepth
@JsonKey(name: MusicAssistantAudioFormat.bitDepthKey_) int get bitDepth;/// channels
@JsonKey(name: MusicAssistantAudioFormat.channelsKey_) int get channels;/// outputFormatStr
@JsonKey(name: MusicAssistantAudioFormat.outputFormatStrKey_) String get outputFormatStr;/// bitRate
@JsonKey(name: MusicAssistantAudioFormat.bitRateKey_) int? get bitRate;
/// Create a copy of MusicAssistantAudioFormat
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantAudioFormatCopyWith<MusicAssistantAudioFormat> get copyWith => _$MusicAssistantAudioFormatCopyWithImpl<MusicAssistantAudioFormat>(this as MusicAssistantAudioFormat, _$identity);

  /// Serializes this MusicAssistantAudioFormat to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantAudioFormat&&(identical(other.contentType, contentType) || other.contentType == contentType)&&(identical(other.codecType, codecType) || other.codecType == codecType)&&(identical(other.sampleRate, sampleRate) || other.sampleRate == sampleRate)&&(identical(other.bitDepth, bitDepth) || other.bitDepth == bitDepth)&&(identical(other.channels, channels) || other.channels == channels)&&(identical(other.outputFormatStr, outputFormatStr) || other.outputFormatStr == outputFormatStr)&&(identical(other.bitRate, bitRate) || other.bitRate == bitRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,contentType,codecType,sampleRate,bitDepth,channels,outputFormatStr,bitRate);

@override
String toString() {
  return 'MusicAssistantAudioFormat(contentType: $contentType, codecType: $codecType, sampleRate: $sampleRate, bitDepth: $bitDepth, channels: $channels, outputFormatStr: $outputFormatStr, bitRate: $bitRate)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantAudioFormatCopyWith<$Res>  {
  factory $MusicAssistantAudioFormatCopyWith(MusicAssistantAudioFormat value, $Res Function(MusicAssistantAudioFormat) _then) = _$MusicAssistantAudioFormatCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantAudioFormat.contentTypeKey_) MusicAssistantContentType contentType,@JsonKey(name: MusicAssistantAudioFormat.codecTypeKey_) MusicAssistantContentType codecType,@JsonKey(name: MusicAssistantAudioFormat.sampleRateKey_) int sampleRate,@JsonKey(name: MusicAssistantAudioFormat.bitDepthKey_) int bitDepth,@JsonKey(name: MusicAssistantAudioFormat.channelsKey_) int channels,@JsonKey(name: MusicAssistantAudioFormat.outputFormatStrKey_) String outputFormatStr,@JsonKey(name: MusicAssistantAudioFormat.bitRateKey_) int? bitRate
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
@pragma('vm:prefer-inline') @override $Res call({Object? contentType = null,Object? codecType = null,Object? sampleRate = null,Object? bitDepth = null,Object? channels = null,Object? outputFormatStr = null,Object? bitRate = freezed,}) {
  return _then(_self.copyWith(
contentType: null == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as MusicAssistantContentType,codecType: null == codecType ? _self.codecType : codecType // ignore: cast_nullable_to_non_nullable
as MusicAssistantContentType,sampleRate: null == sampleRate ? _self.sampleRate : sampleRate // ignore: cast_nullable_to_non_nullable
as int,bitDepth: null == bitDepth ? _self.bitDepth : bitDepth // ignore: cast_nullable_to_non_nullable
as int,channels: null == channels ? _self.channels : channels // ignore: cast_nullable_to_non_nullable
as int,outputFormatStr: null == outputFormatStr ? _self.outputFormatStr : outputFormatStr // ignore: cast_nullable_to_non_nullable
as String,bitRate: freezed == bitRate ? _self.bitRate : bitRate // ignore: cast_nullable_to_non_nullable
as int?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantAudioFormat.contentTypeKey_)  MusicAssistantContentType contentType, @JsonKey(name: MusicAssistantAudioFormat.codecTypeKey_)  MusicAssistantContentType codecType, @JsonKey(name: MusicAssistantAudioFormat.sampleRateKey_)  int sampleRate, @JsonKey(name: MusicAssistantAudioFormat.bitDepthKey_)  int bitDepth, @JsonKey(name: MusicAssistantAudioFormat.channelsKey_)  int channels, @JsonKey(name: MusicAssistantAudioFormat.outputFormatStrKey_)  String outputFormatStr, @JsonKey(name: MusicAssistantAudioFormat.bitRateKey_)  int? bitRate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantAudioFormat() when $default != null:
return $default(_that.contentType,_that.codecType,_that.sampleRate,_that.bitDepth,_that.channels,_that.outputFormatStr,_that.bitRate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantAudioFormat.contentTypeKey_)  MusicAssistantContentType contentType, @JsonKey(name: MusicAssistantAudioFormat.codecTypeKey_)  MusicAssistantContentType codecType, @JsonKey(name: MusicAssistantAudioFormat.sampleRateKey_)  int sampleRate, @JsonKey(name: MusicAssistantAudioFormat.bitDepthKey_)  int bitDepth, @JsonKey(name: MusicAssistantAudioFormat.channelsKey_)  int channels, @JsonKey(name: MusicAssistantAudioFormat.outputFormatStrKey_)  String outputFormatStr, @JsonKey(name: MusicAssistantAudioFormat.bitRateKey_)  int? bitRate)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantAudioFormat():
return $default(_that.contentType,_that.codecType,_that.sampleRate,_that.bitDepth,_that.channels,_that.outputFormatStr,_that.bitRate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantAudioFormat.contentTypeKey_)  MusicAssistantContentType contentType, @JsonKey(name: MusicAssistantAudioFormat.codecTypeKey_)  MusicAssistantContentType codecType, @JsonKey(name: MusicAssistantAudioFormat.sampleRateKey_)  int sampleRate, @JsonKey(name: MusicAssistantAudioFormat.bitDepthKey_)  int bitDepth, @JsonKey(name: MusicAssistantAudioFormat.channelsKey_)  int channels, @JsonKey(name: MusicAssistantAudioFormat.outputFormatStrKey_)  String outputFormatStr, @JsonKey(name: MusicAssistantAudioFormat.bitRateKey_)  int? bitRate)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantAudioFormat() when $default != null:
return $default(_that.contentType,_that.codecType,_that.sampleRate,_that.bitDepth,_that.channels,_that.outputFormatStr,_that.bitRate);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantAudioFormat extends MusicAssistantAudioFormat {
  const _MusicAssistantAudioFormat({@JsonKey(name: MusicAssistantAudioFormat.contentTypeKey_) this.contentType = MusicAssistantContentType.value61, @JsonKey(name: MusicAssistantAudioFormat.codecTypeKey_) this.codecType = MusicAssistantContentType.value61, @JsonKey(name: MusicAssistantAudioFormat.sampleRateKey_) this.sampleRate = 44100, @JsonKey(name: MusicAssistantAudioFormat.bitDepthKey_) this.bitDepth = 16, @JsonKey(name: MusicAssistantAudioFormat.channelsKey_) this.channels = 2, @JsonKey(name: MusicAssistantAudioFormat.outputFormatStrKey_) this.outputFormatStr = '', @JsonKey(name: MusicAssistantAudioFormat.bitRateKey_) this.bitRate}): super._();
  factory _MusicAssistantAudioFormat.fromJson(Map<String, dynamic> json) => _$MusicAssistantAudioFormatFromJson(json);

/// contentType
@override@JsonKey(name: MusicAssistantAudioFormat.contentTypeKey_) final  MusicAssistantContentType contentType;
/// codecType
@override@JsonKey(name: MusicAssistantAudioFormat.codecTypeKey_) final  MusicAssistantContentType codecType;
/// sampleRate
@override@JsonKey(name: MusicAssistantAudioFormat.sampleRateKey_) final  int sampleRate;
/// bitDepth
@override@JsonKey(name: MusicAssistantAudioFormat.bitDepthKey_) final  int bitDepth;
/// channels
@override@JsonKey(name: MusicAssistantAudioFormat.channelsKey_) final  int channels;
/// outputFormatStr
@override@JsonKey(name: MusicAssistantAudioFormat.outputFormatStrKey_) final  String outputFormatStr;
/// bitRate
@override@JsonKey(name: MusicAssistantAudioFormat.bitRateKey_) final  int? bitRate;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantAudioFormat&&(identical(other.contentType, contentType) || other.contentType == contentType)&&(identical(other.codecType, codecType) || other.codecType == codecType)&&(identical(other.sampleRate, sampleRate) || other.sampleRate == sampleRate)&&(identical(other.bitDepth, bitDepth) || other.bitDepth == bitDepth)&&(identical(other.channels, channels) || other.channels == channels)&&(identical(other.outputFormatStr, outputFormatStr) || other.outputFormatStr == outputFormatStr)&&(identical(other.bitRate, bitRate) || other.bitRate == bitRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,contentType,codecType,sampleRate,bitDepth,channels,outputFormatStr,bitRate);

@override
String toString() {
  return 'MusicAssistantAudioFormat(contentType: $contentType, codecType: $codecType, sampleRate: $sampleRate, bitDepth: $bitDepth, channels: $channels, outputFormatStr: $outputFormatStr, bitRate: $bitRate)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantAudioFormatCopyWith<$Res> implements $MusicAssistantAudioFormatCopyWith<$Res> {
  factory _$MusicAssistantAudioFormatCopyWith(_MusicAssistantAudioFormat value, $Res Function(_MusicAssistantAudioFormat) _then) = __$MusicAssistantAudioFormatCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantAudioFormat.contentTypeKey_) MusicAssistantContentType contentType,@JsonKey(name: MusicAssistantAudioFormat.codecTypeKey_) MusicAssistantContentType codecType,@JsonKey(name: MusicAssistantAudioFormat.sampleRateKey_) int sampleRate,@JsonKey(name: MusicAssistantAudioFormat.bitDepthKey_) int bitDepth,@JsonKey(name: MusicAssistantAudioFormat.channelsKey_) int channels,@JsonKey(name: MusicAssistantAudioFormat.outputFormatStrKey_) String outputFormatStr,@JsonKey(name: MusicAssistantAudioFormat.bitRateKey_) int? bitRate
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
@override @pragma('vm:prefer-inline') $Res call({Object? contentType = null,Object? codecType = null,Object? sampleRate = null,Object? bitDepth = null,Object? channels = null,Object? outputFormatStr = null,Object? bitRate = freezed,}) {
  return _then(_MusicAssistantAudioFormat(
contentType: null == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as MusicAssistantContentType,codecType: null == codecType ? _self.codecType : codecType // ignore: cast_nullable_to_non_nullable
as MusicAssistantContentType,sampleRate: null == sampleRate ? _self.sampleRate : sampleRate // ignore: cast_nullable_to_non_nullable
as int,bitDepth: null == bitDepth ? _self.bitDepth : bitDepth // ignore: cast_nullable_to_non_nullable
as int,channels: null == channels ? _self.channels : channels // ignore: cast_nullable_to_non_nullable
as int,outputFormatStr: null == outputFormatStr ? _self.outputFormatStr : outputFormatStr // ignore: cast_nullable_to_non_nullable
as String,bitRate: freezed == bitRate ? _self.bitRate : bitRate // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
