// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_stream_metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantStreamMetadata {

/// title
@JsonKey(name: MusicAssistantStreamMetadata.titleKey_) String get title;/// artist
@JsonKey(name: MusicAssistantStreamMetadata.artistKey_) String? get artist;/// album
@JsonKey(name: MusicAssistantStreamMetadata.albumKey_) String? get album;/// imageUrl
@JsonKey(name: MusicAssistantStreamMetadata.imageUrlKey_) String? get imageUrl;/// duration
@JsonKey(name: MusicAssistantStreamMetadata.durationKey_) int? get duration;/// description
@JsonKey(name: MusicAssistantStreamMetadata.descriptionKey_) String? get description;/// uri
@JsonKey(name: MusicAssistantStreamMetadata.uriKey_) String? get uri;/// elapsedTime
@JsonKey(name: MusicAssistantStreamMetadata.elapsedTimeKey_) int? get elapsedTime;/// elapsedTimeLastUpdated
@JsonKey(name: MusicAssistantStreamMetadata.elapsedTimeLastUpdatedKey_) double? get elapsedTimeLastUpdated;
/// Create a copy of MusicAssistantStreamMetadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantStreamMetadataCopyWith<MusicAssistantStreamMetadata> get copyWith => _$MusicAssistantStreamMetadataCopyWithImpl<MusicAssistantStreamMetadata>(this as MusicAssistantStreamMetadata, _$identity);

  /// Serializes this MusicAssistantStreamMetadata to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantStreamMetadata&&(identical(other.title, title) || other.title == title)&&(identical(other.artist, artist) || other.artist == artist)&&(identical(other.album, album) || other.album == album)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.description, description) || other.description == description)&&(identical(other.uri, uri) || other.uri == uri)&&(identical(other.elapsedTime, elapsedTime) || other.elapsedTime == elapsedTime)&&(identical(other.elapsedTimeLastUpdated, elapsedTimeLastUpdated) || other.elapsedTimeLastUpdated == elapsedTimeLastUpdated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,artist,album,imageUrl,duration,description,uri,elapsedTime,elapsedTimeLastUpdated);

@override
String toString() {
  return 'MusicAssistantStreamMetadata(title: $title, artist: $artist, album: $album, imageUrl: $imageUrl, duration: $duration, description: $description, uri: $uri, elapsedTime: $elapsedTime, elapsedTimeLastUpdated: $elapsedTimeLastUpdated)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantStreamMetadataCopyWith<$Res>  {
  factory $MusicAssistantStreamMetadataCopyWith(MusicAssistantStreamMetadata value, $Res Function(MusicAssistantStreamMetadata) _then) = _$MusicAssistantStreamMetadataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantStreamMetadata.titleKey_) String title,@JsonKey(name: MusicAssistantStreamMetadata.artistKey_) String? artist,@JsonKey(name: MusicAssistantStreamMetadata.albumKey_) String? album,@JsonKey(name: MusicAssistantStreamMetadata.imageUrlKey_) String? imageUrl,@JsonKey(name: MusicAssistantStreamMetadata.durationKey_) int? duration,@JsonKey(name: MusicAssistantStreamMetadata.descriptionKey_) String? description,@JsonKey(name: MusicAssistantStreamMetadata.uriKey_) String? uri,@JsonKey(name: MusicAssistantStreamMetadata.elapsedTimeKey_) int? elapsedTime,@JsonKey(name: MusicAssistantStreamMetadata.elapsedTimeLastUpdatedKey_) double? elapsedTimeLastUpdated
});




}
/// @nodoc
class _$MusicAssistantStreamMetadataCopyWithImpl<$Res>
    implements $MusicAssistantStreamMetadataCopyWith<$Res> {
  _$MusicAssistantStreamMetadataCopyWithImpl(this._self, this._then);

  final MusicAssistantStreamMetadata _self;
  final $Res Function(MusicAssistantStreamMetadata) _then;

/// Create a copy of MusicAssistantStreamMetadata
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? artist = freezed,Object? album = freezed,Object? imageUrl = freezed,Object? duration = freezed,Object? description = freezed,Object? uri = freezed,Object? elapsedTime = freezed,Object? elapsedTimeLastUpdated = freezed,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,artist: freezed == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as String?,album: freezed == album ? _self.album : album // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,uri: freezed == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as String?,elapsedTime: freezed == elapsedTime ? _self.elapsedTime : elapsedTime // ignore: cast_nullable_to_non_nullable
as int?,elapsedTimeLastUpdated: freezed == elapsedTimeLastUpdated ? _self.elapsedTimeLastUpdated : elapsedTimeLastUpdated // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [MusicAssistantStreamMetadata].
extension MusicAssistantStreamMetadataPatterns on MusicAssistantStreamMetadata {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantStreamMetadata value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantStreamMetadata() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantStreamMetadata value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantStreamMetadata():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantStreamMetadata value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantStreamMetadata() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantStreamMetadata.titleKey_)  String title, @JsonKey(name: MusicAssistantStreamMetadata.artistKey_)  String? artist, @JsonKey(name: MusicAssistantStreamMetadata.albumKey_)  String? album, @JsonKey(name: MusicAssistantStreamMetadata.imageUrlKey_)  String? imageUrl, @JsonKey(name: MusicAssistantStreamMetadata.durationKey_)  int? duration, @JsonKey(name: MusicAssistantStreamMetadata.descriptionKey_)  String? description, @JsonKey(name: MusicAssistantStreamMetadata.uriKey_)  String? uri, @JsonKey(name: MusicAssistantStreamMetadata.elapsedTimeKey_)  int? elapsedTime, @JsonKey(name: MusicAssistantStreamMetadata.elapsedTimeLastUpdatedKey_)  double? elapsedTimeLastUpdated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantStreamMetadata() when $default != null:
return $default(_that.title,_that.artist,_that.album,_that.imageUrl,_that.duration,_that.description,_that.uri,_that.elapsedTime,_that.elapsedTimeLastUpdated);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantStreamMetadata.titleKey_)  String title, @JsonKey(name: MusicAssistantStreamMetadata.artistKey_)  String? artist, @JsonKey(name: MusicAssistantStreamMetadata.albumKey_)  String? album, @JsonKey(name: MusicAssistantStreamMetadata.imageUrlKey_)  String? imageUrl, @JsonKey(name: MusicAssistantStreamMetadata.durationKey_)  int? duration, @JsonKey(name: MusicAssistantStreamMetadata.descriptionKey_)  String? description, @JsonKey(name: MusicAssistantStreamMetadata.uriKey_)  String? uri, @JsonKey(name: MusicAssistantStreamMetadata.elapsedTimeKey_)  int? elapsedTime, @JsonKey(name: MusicAssistantStreamMetadata.elapsedTimeLastUpdatedKey_)  double? elapsedTimeLastUpdated)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantStreamMetadata():
return $default(_that.title,_that.artist,_that.album,_that.imageUrl,_that.duration,_that.description,_that.uri,_that.elapsedTime,_that.elapsedTimeLastUpdated);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantStreamMetadata.titleKey_)  String title, @JsonKey(name: MusicAssistantStreamMetadata.artistKey_)  String? artist, @JsonKey(name: MusicAssistantStreamMetadata.albumKey_)  String? album, @JsonKey(name: MusicAssistantStreamMetadata.imageUrlKey_)  String? imageUrl, @JsonKey(name: MusicAssistantStreamMetadata.durationKey_)  int? duration, @JsonKey(name: MusicAssistantStreamMetadata.descriptionKey_)  String? description, @JsonKey(name: MusicAssistantStreamMetadata.uriKey_)  String? uri, @JsonKey(name: MusicAssistantStreamMetadata.elapsedTimeKey_)  int? elapsedTime, @JsonKey(name: MusicAssistantStreamMetadata.elapsedTimeLastUpdatedKey_)  double? elapsedTimeLastUpdated)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantStreamMetadata() when $default != null:
return $default(_that.title,_that.artist,_that.album,_that.imageUrl,_that.duration,_that.description,_that.uri,_that.elapsedTime,_that.elapsedTimeLastUpdated);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantStreamMetadata extends MusicAssistantStreamMetadata {
  const _MusicAssistantStreamMetadata({@JsonKey(name: MusicAssistantStreamMetadata.titleKey_) required this.title, @JsonKey(name: MusicAssistantStreamMetadata.artistKey_) this.artist, @JsonKey(name: MusicAssistantStreamMetadata.albumKey_) this.album, @JsonKey(name: MusicAssistantStreamMetadata.imageUrlKey_) this.imageUrl, @JsonKey(name: MusicAssistantStreamMetadata.durationKey_) this.duration, @JsonKey(name: MusicAssistantStreamMetadata.descriptionKey_) this.description, @JsonKey(name: MusicAssistantStreamMetadata.uriKey_) this.uri, @JsonKey(name: MusicAssistantStreamMetadata.elapsedTimeKey_) this.elapsedTime, @JsonKey(name: MusicAssistantStreamMetadata.elapsedTimeLastUpdatedKey_) this.elapsedTimeLastUpdated}): super._();
  factory _MusicAssistantStreamMetadata.fromJson(Map<String, dynamic> json) => _$MusicAssistantStreamMetadataFromJson(json);

/// title
@override@JsonKey(name: MusicAssistantStreamMetadata.titleKey_) final  String title;
/// artist
@override@JsonKey(name: MusicAssistantStreamMetadata.artistKey_) final  String? artist;
/// album
@override@JsonKey(name: MusicAssistantStreamMetadata.albumKey_) final  String? album;
/// imageUrl
@override@JsonKey(name: MusicAssistantStreamMetadata.imageUrlKey_) final  String? imageUrl;
/// duration
@override@JsonKey(name: MusicAssistantStreamMetadata.durationKey_) final  int? duration;
/// description
@override@JsonKey(name: MusicAssistantStreamMetadata.descriptionKey_) final  String? description;
/// uri
@override@JsonKey(name: MusicAssistantStreamMetadata.uriKey_) final  String? uri;
/// elapsedTime
@override@JsonKey(name: MusicAssistantStreamMetadata.elapsedTimeKey_) final  int? elapsedTime;
/// elapsedTimeLastUpdated
@override@JsonKey(name: MusicAssistantStreamMetadata.elapsedTimeLastUpdatedKey_) final  double? elapsedTimeLastUpdated;

/// Create a copy of MusicAssistantStreamMetadata
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantStreamMetadataCopyWith<_MusicAssistantStreamMetadata> get copyWith => __$MusicAssistantStreamMetadataCopyWithImpl<_MusicAssistantStreamMetadata>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantStreamMetadataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantStreamMetadata&&(identical(other.title, title) || other.title == title)&&(identical(other.artist, artist) || other.artist == artist)&&(identical(other.album, album) || other.album == album)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.description, description) || other.description == description)&&(identical(other.uri, uri) || other.uri == uri)&&(identical(other.elapsedTime, elapsedTime) || other.elapsedTime == elapsedTime)&&(identical(other.elapsedTimeLastUpdated, elapsedTimeLastUpdated) || other.elapsedTimeLastUpdated == elapsedTimeLastUpdated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,artist,album,imageUrl,duration,description,uri,elapsedTime,elapsedTimeLastUpdated);

@override
String toString() {
  return 'MusicAssistantStreamMetadata(title: $title, artist: $artist, album: $album, imageUrl: $imageUrl, duration: $duration, description: $description, uri: $uri, elapsedTime: $elapsedTime, elapsedTimeLastUpdated: $elapsedTimeLastUpdated)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantStreamMetadataCopyWith<$Res> implements $MusicAssistantStreamMetadataCopyWith<$Res> {
  factory _$MusicAssistantStreamMetadataCopyWith(_MusicAssistantStreamMetadata value, $Res Function(_MusicAssistantStreamMetadata) _then) = __$MusicAssistantStreamMetadataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantStreamMetadata.titleKey_) String title,@JsonKey(name: MusicAssistantStreamMetadata.artistKey_) String? artist,@JsonKey(name: MusicAssistantStreamMetadata.albumKey_) String? album,@JsonKey(name: MusicAssistantStreamMetadata.imageUrlKey_) String? imageUrl,@JsonKey(name: MusicAssistantStreamMetadata.durationKey_) int? duration,@JsonKey(name: MusicAssistantStreamMetadata.descriptionKey_) String? description,@JsonKey(name: MusicAssistantStreamMetadata.uriKey_) String? uri,@JsonKey(name: MusicAssistantStreamMetadata.elapsedTimeKey_) int? elapsedTime,@JsonKey(name: MusicAssistantStreamMetadata.elapsedTimeLastUpdatedKey_) double? elapsedTimeLastUpdated
});




}
/// @nodoc
class __$MusicAssistantStreamMetadataCopyWithImpl<$Res>
    implements _$MusicAssistantStreamMetadataCopyWith<$Res> {
  __$MusicAssistantStreamMetadataCopyWithImpl(this._self, this._then);

  final _MusicAssistantStreamMetadata _self;
  final $Res Function(_MusicAssistantStreamMetadata) _then;

/// Create a copy of MusicAssistantStreamMetadata
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? artist = freezed,Object? album = freezed,Object? imageUrl = freezed,Object? duration = freezed,Object? description = freezed,Object? uri = freezed,Object? elapsedTime = freezed,Object? elapsedTimeLastUpdated = freezed,}) {
  return _then(_MusicAssistantStreamMetadata(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,artist: freezed == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as String?,album: freezed == album ? _self.album : album // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,uri: freezed == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as String?,elapsedTime: freezed == elapsedTime ? _self.elapsedTime : elapsedTime // ignore: cast_nullable_to_non_nullable
as int?,elapsedTimeLastUpdated: freezed == elapsedTimeLastUpdated ? _self.elapsedTimeLastUpdated : elapsedTimeLastUpdated // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
