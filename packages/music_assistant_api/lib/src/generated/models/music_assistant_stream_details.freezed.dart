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
@JsonKey(name: MusicAssistantStreamDetails.providerKey_) String get provider;/// itemId
@JsonKey(name: MusicAssistantStreamDetails.itemIdKey_) String get itemId;/// audioFormat
@JsonKey(name: MusicAssistantStreamDetails.audioFormatKey_) MusicAssistantAudioFormat get audioFormat;/// mediaType
@JsonKey(name: MusicAssistantStreamDetails.mediaTypeKey_) MusicAssistantMediaType get mediaType;/// streamType
@JsonKey(name: MusicAssistantStreamDetails.streamTypeKey_) MusicAssistantStreamType get streamType;/// duration
@JsonKey(name: MusicAssistantStreamDetails.durationKey_) int? get duration;/// size
@JsonKey(name: MusicAssistantStreamDetails.sizeKey_) int? get size;/// streamMetadata
@JsonKey(name: MusicAssistantStreamDetails.streamMetadataKey_) MusicAssistantStreamMetadata? get streamMetadata;/// audioProcessing
@JsonKey(name: MusicAssistantStreamDetails.audioProcessingKey_) MusicAssistantAudioProcessingChain? get audioProcessing;/// loudness
@JsonKey(name: MusicAssistantStreamDetails.loudnessKey_) double? get loudness;/// loudnessAlbum
@JsonKey(name: MusicAssistantStreamDetails.loudnessAlbumKey_) double? get loudnessAlbum;/// preferAlbumLoudness
@JsonKey(name: MusicAssistantStreamDetails.preferAlbumLoudnessKey_) bool get preferAlbumLoudness;/// volumeNormalizationMode
@JsonKey(name: MusicAssistantStreamDetails.volumeNormalizationModeKey_) MusicAssistantVolumeNormalizationMode? get volumeNormalizationMode;/// volumeNormalizationGainCorrect
@JsonKey(name: MusicAssistantStreamDetails.volumeNormalizationGainCorrectKey_) double? get volumeNormalizationGainCorrect;/// targetLoudness
@JsonKey(name: MusicAssistantStreamDetails.targetLoudnessKey_) double? get targetLoudness;
/// Create a copy of MusicAssistantStreamDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantStreamDetailsCopyWith<MusicAssistantStreamDetails> get copyWith => _$MusicAssistantStreamDetailsCopyWithImpl<MusicAssistantStreamDetails>(this as MusicAssistantStreamDetails, _$identity);

  /// Serializes this MusicAssistantStreamDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantStreamDetails&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.audioFormat, audioFormat) || other.audioFormat == audioFormat)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.streamType, streamType) || other.streamType == streamType)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.size, size) || other.size == size)&&(identical(other.streamMetadata, streamMetadata) || other.streamMetadata == streamMetadata)&&(identical(other.audioProcessing, audioProcessing) || other.audioProcessing == audioProcessing)&&(identical(other.loudness, loudness) || other.loudness == loudness)&&(identical(other.loudnessAlbum, loudnessAlbum) || other.loudnessAlbum == loudnessAlbum)&&(identical(other.preferAlbumLoudness, preferAlbumLoudness) || other.preferAlbumLoudness == preferAlbumLoudness)&&(identical(other.volumeNormalizationMode, volumeNormalizationMode) || other.volumeNormalizationMode == volumeNormalizationMode)&&(identical(other.volumeNormalizationGainCorrect, volumeNormalizationGainCorrect) || other.volumeNormalizationGainCorrect == volumeNormalizationGainCorrect)&&(identical(other.targetLoudness, targetLoudness) || other.targetLoudness == targetLoudness));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,provider,itemId,audioFormat,mediaType,streamType,duration,size,streamMetadata,audioProcessing,loudness,loudnessAlbum,preferAlbumLoudness,volumeNormalizationMode,volumeNormalizationGainCorrect,targetLoudness);

@override
String toString() {
  return 'MusicAssistantStreamDetails(provider: $provider, itemId: $itemId, audioFormat: $audioFormat, mediaType: $mediaType, streamType: $streamType, duration: $duration, size: $size, streamMetadata: $streamMetadata, audioProcessing: $audioProcessing, loudness: $loudness, loudnessAlbum: $loudnessAlbum, preferAlbumLoudness: $preferAlbumLoudness, volumeNormalizationMode: $volumeNormalizationMode, volumeNormalizationGainCorrect: $volumeNormalizationGainCorrect, targetLoudness: $targetLoudness)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantStreamDetailsCopyWith<$Res>  {
  factory $MusicAssistantStreamDetailsCopyWith(MusicAssistantStreamDetails value, $Res Function(MusicAssistantStreamDetails) _then) = _$MusicAssistantStreamDetailsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantStreamDetails.providerKey_) String provider,@JsonKey(name: MusicAssistantStreamDetails.itemIdKey_) String itemId,@JsonKey(name: MusicAssistantStreamDetails.audioFormatKey_) MusicAssistantAudioFormat audioFormat,@JsonKey(name: MusicAssistantStreamDetails.mediaTypeKey_) MusicAssistantMediaType mediaType,@JsonKey(name: MusicAssistantStreamDetails.streamTypeKey_) MusicAssistantStreamType streamType,@JsonKey(name: MusicAssistantStreamDetails.durationKey_) int? duration,@JsonKey(name: MusicAssistantStreamDetails.sizeKey_) int? size,@JsonKey(name: MusicAssistantStreamDetails.streamMetadataKey_) MusicAssistantStreamMetadata? streamMetadata,@JsonKey(name: MusicAssistantStreamDetails.audioProcessingKey_) MusicAssistantAudioProcessingChain? audioProcessing,@JsonKey(name: MusicAssistantStreamDetails.loudnessKey_) double? loudness,@JsonKey(name: MusicAssistantStreamDetails.loudnessAlbumKey_) double? loudnessAlbum,@JsonKey(name: MusicAssistantStreamDetails.preferAlbumLoudnessKey_) bool preferAlbumLoudness,@JsonKey(name: MusicAssistantStreamDetails.volumeNormalizationModeKey_) MusicAssistantVolumeNormalizationMode? volumeNormalizationMode,@JsonKey(name: MusicAssistantStreamDetails.volumeNormalizationGainCorrectKey_) double? volumeNormalizationGainCorrect,@JsonKey(name: MusicAssistantStreamDetails.targetLoudnessKey_) double? targetLoudness
});


$MusicAssistantAudioFormatCopyWith<$Res> get audioFormat;$MusicAssistantStreamMetadataCopyWith<$Res>? get streamMetadata;$MusicAssistantAudioProcessingChainCopyWith<$Res>? get audioProcessing;

}
/// @nodoc
class _$MusicAssistantStreamDetailsCopyWithImpl<$Res>
    implements $MusicAssistantStreamDetailsCopyWith<$Res> {
  _$MusicAssistantStreamDetailsCopyWithImpl(this._self, this._then);

  final MusicAssistantStreamDetails _self;
  final $Res Function(MusicAssistantStreamDetails) _then;

/// Create a copy of MusicAssistantStreamDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? provider = null,Object? itemId = null,Object? audioFormat = null,Object? mediaType = null,Object? streamType = null,Object? duration = freezed,Object? size = freezed,Object? streamMetadata = freezed,Object? audioProcessing = freezed,Object? loudness = freezed,Object? loudnessAlbum = freezed,Object? preferAlbumLoudness = null,Object? volumeNormalizationMode = freezed,Object? volumeNormalizationGainCorrect = freezed,Object? targetLoudness = freezed,}) {
  return _then(_self.copyWith(
provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,audioFormat: null == audioFormat ? _self.audioFormat : audioFormat // ignore: cast_nullable_to_non_nullable
as MusicAssistantAudioFormat,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as MusicAssistantMediaType,streamType: null == streamType ? _self.streamType : streamType // ignore: cast_nullable_to_non_nullable
as MusicAssistantStreamType,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int?,streamMetadata: freezed == streamMetadata ? _self.streamMetadata : streamMetadata // ignore: cast_nullable_to_non_nullable
as MusicAssistantStreamMetadata?,audioProcessing: freezed == audioProcessing ? _self.audioProcessing : audioProcessing // ignore: cast_nullable_to_non_nullable
as MusicAssistantAudioProcessingChain?,loudness: freezed == loudness ? _self.loudness : loudness // ignore: cast_nullable_to_non_nullable
as double?,loudnessAlbum: freezed == loudnessAlbum ? _self.loudnessAlbum : loudnessAlbum // ignore: cast_nullable_to_non_nullable
as double?,preferAlbumLoudness: null == preferAlbumLoudness ? _self.preferAlbumLoudness : preferAlbumLoudness // ignore: cast_nullable_to_non_nullable
as bool,volumeNormalizationMode: freezed == volumeNormalizationMode ? _self.volumeNormalizationMode : volumeNormalizationMode // ignore: cast_nullable_to_non_nullable
as MusicAssistantVolumeNormalizationMode?,volumeNormalizationGainCorrect: freezed == volumeNormalizationGainCorrect ? _self.volumeNormalizationGainCorrect : volumeNormalizationGainCorrect // ignore: cast_nullable_to_non_nullable
as double?,targetLoudness: freezed == targetLoudness ? _self.targetLoudness : targetLoudness // ignore: cast_nullable_to_non_nullable
as double?,
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
}/// Create a copy of MusicAssistantStreamDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantStreamMetadataCopyWith<$Res>? get streamMetadata {
    if (_self.streamMetadata == null) {
    return null;
  }

  return $MusicAssistantStreamMetadataCopyWith<$Res>(_self.streamMetadata!, (value) {
    return _then(_self.copyWith(streamMetadata: value));
  });
}/// Create a copy of MusicAssistantStreamDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantAudioProcessingChainCopyWith<$Res>? get audioProcessing {
    if (_self.audioProcessing == null) {
    return null;
  }

  return $MusicAssistantAudioProcessingChainCopyWith<$Res>(_self.audioProcessing!, (value) {
    return _then(_self.copyWith(audioProcessing: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantStreamDetails.providerKey_)  String provider, @JsonKey(name: MusicAssistantStreamDetails.itemIdKey_)  String itemId, @JsonKey(name: MusicAssistantStreamDetails.audioFormatKey_)  MusicAssistantAudioFormat audioFormat, @JsonKey(name: MusicAssistantStreamDetails.mediaTypeKey_)  MusicAssistantMediaType mediaType, @JsonKey(name: MusicAssistantStreamDetails.streamTypeKey_)  MusicAssistantStreamType streamType, @JsonKey(name: MusicAssistantStreamDetails.durationKey_)  int? duration, @JsonKey(name: MusicAssistantStreamDetails.sizeKey_)  int? size, @JsonKey(name: MusicAssistantStreamDetails.streamMetadataKey_)  MusicAssistantStreamMetadata? streamMetadata, @JsonKey(name: MusicAssistantStreamDetails.audioProcessingKey_)  MusicAssistantAudioProcessingChain? audioProcessing, @JsonKey(name: MusicAssistantStreamDetails.loudnessKey_)  double? loudness, @JsonKey(name: MusicAssistantStreamDetails.loudnessAlbumKey_)  double? loudnessAlbum, @JsonKey(name: MusicAssistantStreamDetails.preferAlbumLoudnessKey_)  bool preferAlbumLoudness, @JsonKey(name: MusicAssistantStreamDetails.volumeNormalizationModeKey_)  MusicAssistantVolumeNormalizationMode? volumeNormalizationMode, @JsonKey(name: MusicAssistantStreamDetails.volumeNormalizationGainCorrectKey_)  double? volumeNormalizationGainCorrect, @JsonKey(name: MusicAssistantStreamDetails.targetLoudnessKey_)  double? targetLoudness)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantStreamDetails() when $default != null:
return $default(_that.provider,_that.itemId,_that.audioFormat,_that.mediaType,_that.streamType,_that.duration,_that.size,_that.streamMetadata,_that.audioProcessing,_that.loudness,_that.loudnessAlbum,_that.preferAlbumLoudness,_that.volumeNormalizationMode,_that.volumeNormalizationGainCorrect,_that.targetLoudness);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantStreamDetails.providerKey_)  String provider, @JsonKey(name: MusicAssistantStreamDetails.itemIdKey_)  String itemId, @JsonKey(name: MusicAssistantStreamDetails.audioFormatKey_)  MusicAssistantAudioFormat audioFormat, @JsonKey(name: MusicAssistantStreamDetails.mediaTypeKey_)  MusicAssistantMediaType mediaType, @JsonKey(name: MusicAssistantStreamDetails.streamTypeKey_)  MusicAssistantStreamType streamType, @JsonKey(name: MusicAssistantStreamDetails.durationKey_)  int? duration, @JsonKey(name: MusicAssistantStreamDetails.sizeKey_)  int? size, @JsonKey(name: MusicAssistantStreamDetails.streamMetadataKey_)  MusicAssistantStreamMetadata? streamMetadata, @JsonKey(name: MusicAssistantStreamDetails.audioProcessingKey_)  MusicAssistantAudioProcessingChain? audioProcessing, @JsonKey(name: MusicAssistantStreamDetails.loudnessKey_)  double? loudness, @JsonKey(name: MusicAssistantStreamDetails.loudnessAlbumKey_)  double? loudnessAlbum, @JsonKey(name: MusicAssistantStreamDetails.preferAlbumLoudnessKey_)  bool preferAlbumLoudness, @JsonKey(name: MusicAssistantStreamDetails.volumeNormalizationModeKey_)  MusicAssistantVolumeNormalizationMode? volumeNormalizationMode, @JsonKey(name: MusicAssistantStreamDetails.volumeNormalizationGainCorrectKey_)  double? volumeNormalizationGainCorrect, @JsonKey(name: MusicAssistantStreamDetails.targetLoudnessKey_)  double? targetLoudness)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantStreamDetails():
return $default(_that.provider,_that.itemId,_that.audioFormat,_that.mediaType,_that.streamType,_that.duration,_that.size,_that.streamMetadata,_that.audioProcessing,_that.loudness,_that.loudnessAlbum,_that.preferAlbumLoudness,_that.volumeNormalizationMode,_that.volumeNormalizationGainCorrect,_that.targetLoudness);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantStreamDetails.providerKey_)  String provider, @JsonKey(name: MusicAssistantStreamDetails.itemIdKey_)  String itemId, @JsonKey(name: MusicAssistantStreamDetails.audioFormatKey_)  MusicAssistantAudioFormat audioFormat, @JsonKey(name: MusicAssistantStreamDetails.mediaTypeKey_)  MusicAssistantMediaType mediaType, @JsonKey(name: MusicAssistantStreamDetails.streamTypeKey_)  MusicAssistantStreamType streamType, @JsonKey(name: MusicAssistantStreamDetails.durationKey_)  int? duration, @JsonKey(name: MusicAssistantStreamDetails.sizeKey_)  int? size, @JsonKey(name: MusicAssistantStreamDetails.streamMetadataKey_)  MusicAssistantStreamMetadata? streamMetadata, @JsonKey(name: MusicAssistantStreamDetails.audioProcessingKey_)  MusicAssistantAudioProcessingChain? audioProcessing, @JsonKey(name: MusicAssistantStreamDetails.loudnessKey_)  double? loudness, @JsonKey(name: MusicAssistantStreamDetails.loudnessAlbumKey_)  double? loudnessAlbum, @JsonKey(name: MusicAssistantStreamDetails.preferAlbumLoudnessKey_)  bool preferAlbumLoudness, @JsonKey(name: MusicAssistantStreamDetails.volumeNormalizationModeKey_)  MusicAssistantVolumeNormalizationMode? volumeNormalizationMode, @JsonKey(name: MusicAssistantStreamDetails.volumeNormalizationGainCorrectKey_)  double? volumeNormalizationGainCorrect, @JsonKey(name: MusicAssistantStreamDetails.targetLoudnessKey_)  double? targetLoudness)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantStreamDetails() when $default != null:
return $default(_that.provider,_that.itemId,_that.audioFormat,_that.mediaType,_that.streamType,_that.duration,_that.size,_that.streamMetadata,_that.audioProcessing,_that.loudness,_that.loudnessAlbum,_that.preferAlbumLoudness,_that.volumeNormalizationMode,_that.volumeNormalizationGainCorrect,_that.targetLoudness);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantStreamDetails extends MusicAssistantStreamDetails {
  const _MusicAssistantStreamDetails({@JsonKey(name: MusicAssistantStreamDetails.providerKey_) required this.provider, @JsonKey(name: MusicAssistantStreamDetails.itemIdKey_) required this.itemId, @JsonKey(name: MusicAssistantStreamDetails.audioFormatKey_) required this.audioFormat, @JsonKey(name: MusicAssistantStreamDetails.mediaTypeKey_) this.mediaType = MusicAssistantMediaType.track, @JsonKey(name: MusicAssistantStreamDetails.streamTypeKey_) this.streamType = MusicAssistantStreamType.custom, @JsonKey(name: MusicAssistantStreamDetails.durationKey_) this.duration, @JsonKey(name: MusicAssistantStreamDetails.sizeKey_) this.size, @JsonKey(name: MusicAssistantStreamDetails.streamMetadataKey_) this.streamMetadata, @JsonKey(name: MusicAssistantStreamDetails.audioProcessingKey_) this.audioProcessing, @JsonKey(name: MusicAssistantStreamDetails.loudnessKey_) this.loudness, @JsonKey(name: MusicAssistantStreamDetails.loudnessAlbumKey_) this.loudnessAlbum, @JsonKey(name: MusicAssistantStreamDetails.preferAlbumLoudnessKey_) this.preferAlbumLoudness = false, @JsonKey(name: MusicAssistantStreamDetails.volumeNormalizationModeKey_) this.volumeNormalizationMode, @JsonKey(name: MusicAssistantStreamDetails.volumeNormalizationGainCorrectKey_) this.volumeNormalizationGainCorrect, @JsonKey(name: MusicAssistantStreamDetails.targetLoudnessKey_) this.targetLoudness}): super._();
  factory _MusicAssistantStreamDetails.fromJson(Map<String, dynamic> json) => _$MusicAssistantStreamDetailsFromJson(json);

/// provider
@override@JsonKey(name: MusicAssistantStreamDetails.providerKey_) final  String provider;
/// itemId
@override@JsonKey(name: MusicAssistantStreamDetails.itemIdKey_) final  String itemId;
/// audioFormat
@override@JsonKey(name: MusicAssistantStreamDetails.audioFormatKey_) final  MusicAssistantAudioFormat audioFormat;
/// mediaType
@override@JsonKey(name: MusicAssistantStreamDetails.mediaTypeKey_) final  MusicAssistantMediaType mediaType;
/// streamType
@override@JsonKey(name: MusicAssistantStreamDetails.streamTypeKey_) final  MusicAssistantStreamType streamType;
/// duration
@override@JsonKey(name: MusicAssistantStreamDetails.durationKey_) final  int? duration;
/// size
@override@JsonKey(name: MusicAssistantStreamDetails.sizeKey_) final  int? size;
/// streamMetadata
@override@JsonKey(name: MusicAssistantStreamDetails.streamMetadataKey_) final  MusicAssistantStreamMetadata? streamMetadata;
/// audioProcessing
@override@JsonKey(name: MusicAssistantStreamDetails.audioProcessingKey_) final  MusicAssistantAudioProcessingChain? audioProcessing;
/// loudness
@override@JsonKey(name: MusicAssistantStreamDetails.loudnessKey_) final  double? loudness;
/// loudnessAlbum
@override@JsonKey(name: MusicAssistantStreamDetails.loudnessAlbumKey_) final  double? loudnessAlbum;
/// preferAlbumLoudness
@override@JsonKey(name: MusicAssistantStreamDetails.preferAlbumLoudnessKey_) final  bool preferAlbumLoudness;
/// volumeNormalizationMode
@override@JsonKey(name: MusicAssistantStreamDetails.volumeNormalizationModeKey_) final  MusicAssistantVolumeNormalizationMode? volumeNormalizationMode;
/// volumeNormalizationGainCorrect
@override@JsonKey(name: MusicAssistantStreamDetails.volumeNormalizationGainCorrectKey_) final  double? volumeNormalizationGainCorrect;
/// targetLoudness
@override@JsonKey(name: MusicAssistantStreamDetails.targetLoudnessKey_) final  double? targetLoudness;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantStreamDetails&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.audioFormat, audioFormat) || other.audioFormat == audioFormat)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.streamType, streamType) || other.streamType == streamType)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.size, size) || other.size == size)&&(identical(other.streamMetadata, streamMetadata) || other.streamMetadata == streamMetadata)&&(identical(other.audioProcessing, audioProcessing) || other.audioProcessing == audioProcessing)&&(identical(other.loudness, loudness) || other.loudness == loudness)&&(identical(other.loudnessAlbum, loudnessAlbum) || other.loudnessAlbum == loudnessAlbum)&&(identical(other.preferAlbumLoudness, preferAlbumLoudness) || other.preferAlbumLoudness == preferAlbumLoudness)&&(identical(other.volumeNormalizationMode, volumeNormalizationMode) || other.volumeNormalizationMode == volumeNormalizationMode)&&(identical(other.volumeNormalizationGainCorrect, volumeNormalizationGainCorrect) || other.volumeNormalizationGainCorrect == volumeNormalizationGainCorrect)&&(identical(other.targetLoudness, targetLoudness) || other.targetLoudness == targetLoudness));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,provider,itemId,audioFormat,mediaType,streamType,duration,size,streamMetadata,audioProcessing,loudness,loudnessAlbum,preferAlbumLoudness,volumeNormalizationMode,volumeNormalizationGainCorrect,targetLoudness);

@override
String toString() {
  return 'MusicAssistantStreamDetails(provider: $provider, itemId: $itemId, audioFormat: $audioFormat, mediaType: $mediaType, streamType: $streamType, duration: $duration, size: $size, streamMetadata: $streamMetadata, audioProcessing: $audioProcessing, loudness: $loudness, loudnessAlbum: $loudnessAlbum, preferAlbumLoudness: $preferAlbumLoudness, volumeNormalizationMode: $volumeNormalizationMode, volumeNormalizationGainCorrect: $volumeNormalizationGainCorrect, targetLoudness: $targetLoudness)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantStreamDetailsCopyWith<$Res> implements $MusicAssistantStreamDetailsCopyWith<$Res> {
  factory _$MusicAssistantStreamDetailsCopyWith(_MusicAssistantStreamDetails value, $Res Function(_MusicAssistantStreamDetails) _then) = __$MusicAssistantStreamDetailsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantStreamDetails.providerKey_) String provider,@JsonKey(name: MusicAssistantStreamDetails.itemIdKey_) String itemId,@JsonKey(name: MusicAssistantStreamDetails.audioFormatKey_) MusicAssistantAudioFormat audioFormat,@JsonKey(name: MusicAssistantStreamDetails.mediaTypeKey_) MusicAssistantMediaType mediaType,@JsonKey(name: MusicAssistantStreamDetails.streamTypeKey_) MusicAssistantStreamType streamType,@JsonKey(name: MusicAssistantStreamDetails.durationKey_) int? duration,@JsonKey(name: MusicAssistantStreamDetails.sizeKey_) int? size,@JsonKey(name: MusicAssistantStreamDetails.streamMetadataKey_) MusicAssistantStreamMetadata? streamMetadata,@JsonKey(name: MusicAssistantStreamDetails.audioProcessingKey_) MusicAssistantAudioProcessingChain? audioProcessing,@JsonKey(name: MusicAssistantStreamDetails.loudnessKey_) double? loudness,@JsonKey(name: MusicAssistantStreamDetails.loudnessAlbumKey_) double? loudnessAlbum,@JsonKey(name: MusicAssistantStreamDetails.preferAlbumLoudnessKey_) bool preferAlbumLoudness,@JsonKey(name: MusicAssistantStreamDetails.volumeNormalizationModeKey_) MusicAssistantVolumeNormalizationMode? volumeNormalizationMode,@JsonKey(name: MusicAssistantStreamDetails.volumeNormalizationGainCorrectKey_) double? volumeNormalizationGainCorrect,@JsonKey(name: MusicAssistantStreamDetails.targetLoudnessKey_) double? targetLoudness
});


@override $MusicAssistantAudioFormatCopyWith<$Res> get audioFormat;@override $MusicAssistantStreamMetadataCopyWith<$Res>? get streamMetadata;@override $MusicAssistantAudioProcessingChainCopyWith<$Res>? get audioProcessing;

}
/// @nodoc
class __$MusicAssistantStreamDetailsCopyWithImpl<$Res>
    implements _$MusicAssistantStreamDetailsCopyWith<$Res> {
  __$MusicAssistantStreamDetailsCopyWithImpl(this._self, this._then);

  final _MusicAssistantStreamDetails _self;
  final $Res Function(_MusicAssistantStreamDetails) _then;

/// Create a copy of MusicAssistantStreamDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? provider = null,Object? itemId = null,Object? audioFormat = null,Object? mediaType = null,Object? streamType = null,Object? duration = freezed,Object? size = freezed,Object? streamMetadata = freezed,Object? audioProcessing = freezed,Object? loudness = freezed,Object? loudnessAlbum = freezed,Object? preferAlbumLoudness = null,Object? volumeNormalizationMode = freezed,Object? volumeNormalizationGainCorrect = freezed,Object? targetLoudness = freezed,}) {
  return _then(_MusicAssistantStreamDetails(
provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,audioFormat: null == audioFormat ? _self.audioFormat : audioFormat // ignore: cast_nullable_to_non_nullable
as MusicAssistantAudioFormat,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as MusicAssistantMediaType,streamType: null == streamType ? _self.streamType : streamType // ignore: cast_nullable_to_non_nullable
as MusicAssistantStreamType,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int?,streamMetadata: freezed == streamMetadata ? _self.streamMetadata : streamMetadata // ignore: cast_nullable_to_non_nullable
as MusicAssistantStreamMetadata?,audioProcessing: freezed == audioProcessing ? _self.audioProcessing : audioProcessing // ignore: cast_nullable_to_non_nullable
as MusicAssistantAudioProcessingChain?,loudness: freezed == loudness ? _self.loudness : loudness // ignore: cast_nullable_to_non_nullable
as double?,loudnessAlbum: freezed == loudnessAlbum ? _self.loudnessAlbum : loudnessAlbum // ignore: cast_nullable_to_non_nullable
as double?,preferAlbumLoudness: null == preferAlbumLoudness ? _self.preferAlbumLoudness : preferAlbumLoudness // ignore: cast_nullable_to_non_nullable
as bool,volumeNormalizationMode: freezed == volumeNormalizationMode ? _self.volumeNormalizationMode : volumeNormalizationMode // ignore: cast_nullable_to_non_nullable
as MusicAssistantVolumeNormalizationMode?,volumeNormalizationGainCorrect: freezed == volumeNormalizationGainCorrect ? _self.volumeNormalizationGainCorrect : volumeNormalizationGainCorrect // ignore: cast_nullable_to_non_nullable
as double?,targetLoudness: freezed == targetLoudness ? _self.targetLoudness : targetLoudness // ignore: cast_nullable_to_non_nullable
as double?,
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
}/// Create a copy of MusicAssistantStreamDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantStreamMetadataCopyWith<$Res>? get streamMetadata {
    if (_self.streamMetadata == null) {
    return null;
  }

  return $MusicAssistantStreamMetadataCopyWith<$Res>(_self.streamMetadata!, (value) {
    return _then(_self.copyWith(streamMetadata: value));
  });
}/// Create a copy of MusicAssistantStreamDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantAudioProcessingChainCopyWith<$Res>? get audioProcessing {
    if (_self.audioProcessing == null) {
    return null;
  }

  return $MusicAssistantAudioProcessingChainCopyWith<$Res>(_self.audioProcessing!, (value) {
    return _then(_self.copyWith(audioProcessing: value));
  });
}
}

// dart format on
