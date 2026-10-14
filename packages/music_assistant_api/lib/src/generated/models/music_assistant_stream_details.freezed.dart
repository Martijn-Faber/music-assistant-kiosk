// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_stream_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantStreamDetails {

/// provider
@JsonKey(name: MusicAssistantStreamDetails.providerKey_) String get provider;/// mediaType
@JsonKey(name: MusicAssistantStreamDetails.mediaTypeKey_) MusicAssistantMediaType get mediaType;/// streamType
@JsonKey(name: MusicAssistantStreamDetails.streamTypeKey_) MusicAssistantStreamType get streamType;/// audioFormat
@JsonKey(name: MusicAssistantStreamDetails.audioFormatKey_) MusicAssistantAudioFormat get audioFormat;/// itemId
@JsonKey(name: MusicAssistantStreamDetails.itemIdKey_) String get itemId;
/// Create a copy of MusicAssistantStreamDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantStreamDetailsCopyWith<MusicAssistantStreamDetails> get copyWith => _$MusicAssistantStreamDetailsCopyWithImpl<MusicAssistantStreamDetails>(this as MusicAssistantStreamDetails, _$identity);

  /// Serializes this MusicAssistantStreamDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantStreamDetails&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.streamType, streamType) || other.streamType == streamType)&&(identical(other.audioFormat, audioFormat) || other.audioFormat == audioFormat)&&(identical(other.itemId, itemId) || other.itemId == itemId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,provider,mediaType,streamType,audioFormat,itemId);

@override
String toString() {
  return 'MusicAssistantStreamDetails(provider: $provider, mediaType: $mediaType, streamType: $streamType, audioFormat: $audioFormat, itemId: $itemId)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantStreamDetailsCopyWith<$Res>  {
  factory $MusicAssistantStreamDetailsCopyWith(MusicAssistantStreamDetails value, $Res Function(MusicAssistantStreamDetails) _then) = _$MusicAssistantStreamDetailsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantStreamDetails.providerKey_) String provider,@JsonKey(name: MusicAssistantStreamDetails.mediaTypeKey_) MusicAssistantMediaType mediaType,@JsonKey(name: MusicAssistantStreamDetails.streamTypeKey_) MusicAssistantStreamType streamType,@JsonKey(name: MusicAssistantStreamDetails.audioFormatKey_) MusicAssistantAudioFormat audioFormat,@JsonKey(name: MusicAssistantStreamDetails.itemIdKey_) String itemId
});


$MusicAssistantAudioFormatCopyWith<$Res> get audioFormat;

}
/// @nodoc
class _$MusicAssistantStreamDetailsCopyWithImpl<$Res>
    implements $MusicAssistantStreamDetailsCopyWith<$Res> {
  _$MusicAssistantStreamDetailsCopyWithImpl(this._self, this._then);

  final MusicAssistantStreamDetails _self;
  final $Res Function(MusicAssistantStreamDetails) _then;

/// Create a copy of MusicAssistantStreamDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? provider = null,Object? mediaType = null,Object? streamType = null,Object? audioFormat = null,Object? itemId = null,}) {
  return _then(_self.copyWith(
provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as MusicAssistantMediaType,streamType: null == streamType ? _self.streamType : streamType // ignore: cast_nullable_to_non_nullable
as MusicAssistantStreamType,audioFormat: null == audioFormat ? _self.audioFormat : audioFormat // ignore: cast_nullable_to_non_nullable
as MusicAssistantAudioFormat,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of MusicAssistantStreamDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantAudioFormatCopyWith<$Res> get audioFormat {
  
  return $MusicAssistantAudioFormatCopyWith<$Res>(_self.audioFormat, (value) {
    return _then(_self.copyWith(audioFormat: value));
  });
}
}


/// Adds pattern-matching-related methods to [MusicAssistantStreamDetails].
extension MusicAssistantStreamDetailsPatterns on MusicAssistantStreamDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantStreamDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantStreamDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantStreamDetails value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantStreamDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantStreamDetails value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantStreamDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantStreamDetails.providerKey_)  String provider, @JsonKey(name: MusicAssistantStreamDetails.mediaTypeKey_)  MusicAssistantMediaType mediaType, @JsonKey(name: MusicAssistantStreamDetails.streamTypeKey_)  MusicAssistantStreamType streamType, @JsonKey(name: MusicAssistantStreamDetails.audioFormatKey_)  MusicAssistantAudioFormat audioFormat, @JsonKey(name: MusicAssistantStreamDetails.itemIdKey_)  String itemId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantStreamDetails() when $default != null:
return $default(_that.provider,_that.mediaType,_that.streamType,_that.audioFormat,_that.itemId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantStreamDetails.providerKey_)  String provider, @JsonKey(name: MusicAssistantStreamDetails.mediaTypeKey_)  MusicAssistantMediaType mediaType, @JsonKey(name: MusicAssistantStreamDetails.streamTypeKey_)  MusicAssistantStreamType streamType, @JsonKey(name: MusicAssistantStreamDetails.audioFormatKey_)  MusicAssistantAudioFormat audioFormat, @JsonKey(name: MusicAssistantStreamDetails.itemIdKey_)  String itemId)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantStreamDetails():
return $default(_that.provider,_that.mediaType,_that.streamType,_that.audioFormat,_that.itemId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantStreamDetails.providerKey_)  String provider, @JsonKey(name: MusicAssistantStreamDetails.mediaTypeKey_)  MusicAssistantMediaType mediaType, @JsonKey(name: MusicAssistantStreamDetails.streamTypeKey_)  MusicAssistantStreamType streamType, @JsonKey(name: MusicAssistantStreamDetails.audioFormatKey_)  MusicAssistantAudioFormat audioFormat, @JsonKey(name: MusicAssistantStreamDetails.itemIdKey_)  String itemId)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantStreamDetails() when $default != null:
return $default(_that.provider,_that.mediaType,_that.streamType,_that.audioFormat,_that.itemId);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantStreamDetails extends MusicAssistantStreamDetails {
  const _MusicAssistantStreamDetails({@JsonKey(name: MusicAssistantStreamDetails.providerKey_) required this.provider, @JsonKey(name: MusicAssistantStreamDetails.mediaTypeKey_) this.mediaType = MusicAssistantMediaType.track, @JsonKey(name: MusicAssistantStreamDetails.streamTypeKey_) this.streamType = MusicAssistantStreamType.custom, @JsonKey(name: MusicAssistantStreamDetails.audioFormatKey_) required this.audioFormat, @JsonKey(name: MusicAssistantStreamDetails.itemIdKey_) required this.itemId}): super._();
  factory _MusicAssistantStreamDetails.fromJson(Map<String, dynamic> json) => _$MusicAssistantStreamDetailsFromJson(json);

/// provider
@override@JsonKey(name: MusicAssistantStreamDetails.providerKey_) final  String provider;
/// mediaType
@override@JsonKey(name: MusicAssistantStreamDetails.mediaTypeKey_) final  MusicAssistantMediaType mediaType;
/// streamType
@override@JsonKey(name: MusicAssistantStreamDetails.streamTypeKey_) final  MusicAssistantStreamType streamType;
/// audioFormat
@override@JsonKey(name: MusicAssistantStreamDetails.audioFormatKey_) final  MusicAssistantAudioFormat audioFormat;
/// itemId
@override@JsonKey(name: MusicAssistantStreamDetails.itemIdKey_) final  String itemId;

/// Create a copy of MusicAssistantStreamDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantStreamDetailsCopyWith<_MusicAssistantStreamDetails> get copyWith => __$MusicAssistantStreamDetailsCopyWithImpl<_MusicAssistantStreamDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantStreamDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantStreamDetails&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.streamType, streamType) || other.streamType == streamType)&&(identical(other.audioFormat, audioFormat) || other.audioFormat == audioFormat)&&(identical(other.itemId, itemId) || other.itemId == itemId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,provider,mediaType,streamType,audioFormat,itemId);

@override
String toString() {
  return 'MusicAssistantStreamDetails(provider: $provider, mediaType: $mediaType, streamType: $streamType, audioFormat: $audioFormat, itemId: $itemId)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantStreamDetailsCopyWith<$Res> implements $MusicAssistantStreamDetailsCopyWith<$Res> {
  factory _$MusicAssistantStreamDetailsCopyWith(_MusicAssistantStreamDetails value, $Res Function(_MusicAssistantStreamDetails) _then) = __$MusicAssistantStreamDetailsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantStreamDetails.providerKey_) String provider,@JsonKey(name: MusicAssistantStreamDetails.mediaTypeKey_) MusicAssistantMediaType mediaType,@JsonKey(name: MusicAssistantStreamDetails.streamTypeKey_) MusicAssistantStreamType streamType,@JsonKey(name: MusicAssistantStreamDetails.audioFormatKey_) MusicAssistantAudioFormat audioFormat,@JsonKey(name: MusicAssistantStreamDetails.itemIdKey_) String itemId
});


@override $MusicAssistantAudioFormatCopyWith<$Res> get audioFormat;

}
/// @nodoc
class __$MusicAssistantStreamDetailsCopyWithImpl<$Res>
    implements _$MusicAssistantStreamDetailsCopyWith<$Res> {
  __$MusicAssistantStreamDetailsCopyWithImpl(this._self, this._then);

  final _MusicAssistantStreamDetails _self;
  final $Res Function(_MusicAssistantStreamDetails) _then;

/// Create a copy of MusicAssistantStreamDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? provider = null,Object? mediaType = null,Object? streamType = null,Object? audioFormat = null,Object? itemId = null,}) {
  return _then(_MusicAssistantStreamDetails(
provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as MusicAssistantMediaType,streamType: null == streamType ? _self.streamType : streamType // ignore: cast_nullable_to_non_nullable
as MusicAssistantStreamType,audioFormat: null == audioFormat ? _self.audioFormat : audioFormat // ignore: cast_nullable_to_non_nullable
as MusicAssistantAudioFormat,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of MusicAssistantStreamDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantAudioFormatCopyWith<$Res> get audioFormat {
  
  return $MusicAssistantAudioFormatCopyWith<$Res>(_self.audioFormat, (value) {
    return _then(_self.copyWith(audioFormat: value));
  });
}
}

// dart format on
