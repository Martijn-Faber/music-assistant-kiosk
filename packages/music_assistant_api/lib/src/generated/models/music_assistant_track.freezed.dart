// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_track.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantTrack {

/// itemId
@JsonKey(name: MusicAssistantTrack.itemIdKey_) String get itemId;/// provider
@JsonKey(name: MusicAssistantTrack.providerKey_) String get provider;/// name
@JsonKey(name: MusicAssistantTrack.nameKey_) String get name;/// version
@JsonKey(name: MusicAssistantTrack.versionKey_) String get version;/// sortName
@JsonKey(name: MusicAssistantTrack.sortNameKey_) String? get sortName;/// uri
@JsonKey(name: MusicAssistantTrack.uriKey_) String? get uri;/// externalIds
@JsonKey(name: MusicAssistantTrack.externalIdsKey_) List<List<MusicAssistantExternalID>>? get externalIds;/// isPlayable
@JsonKey(name: MusicAssistantTrack.isPlayableKey_) bool get isPlayable;/// mediaType
@JsonKey(name: MusicAssistantTrack.mediaTypeKey_) MusicAssistantMediaType get mediaType;/// providerMappings
@JsonKey(name: MusicAssistantTrack.providerMappingsKey_) List<MusicAssistantProviderMapping> get providerMappings;/// metadata
@JsonKey(name: MusicAssistantTrack.metadataKey_) MusicAssistantMediaItemMetadata? get metadata;/// favorite
@JsonKey(name: MusicAssistantTrack.favoriteKey_) bool get favorite;/// position
@JsonKey(name: MusicAssistantTrack.positionKey_) int? get position;/// dateAdded
@JsonKey(name: MusicAssistantTrack.dateAddedKey_) DateTime? get dateAdded;/// duration
@JsonKey(name: MusicAssistantTrack.durationKey_) int get duration;/// artists
@JsonKey(name: MusicAssistantTrack.artistsKey_) List<MusicAssistantArtistOrItemMappingUnion>? get artists;/// lastPlayed
@JsonKey(name: MusicAssistantTrack.lastPlayedKey_) int get lastPlayed;/// album
@JsonKey(name: MusicAssistantTrack.albumKey_) MusicAssistantAlbum? get album;/// discNumber
@JsonKey(name: MusicAssistantTrack.discNumberKey_) int get discNumber;/// trackNumber
@JsonKey(name: MusicAssistantTrack.trackNumberKey_) int get trackNumber;/// audioMetadata
@JsonKey(name: MusicAssistantTrack.audioMetadataKey_) MusicAssistantAudioMetadata? get audioMetadata;
/// Create a copy of MusicAssistantTrack
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantTrackCopyWith<MusicAssistantTrack> get copyWith => _$MusicAssistantTrackCopyWithImpl<MusicAssistantTrack>(this as MusicAssistantTrack, _$identity);

  /// Serializes this MusicAssistantTrack to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantTrack&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.name, name) || other.name == name)&&(identical(other.version, version) || other.version == version)&&(identical(other.sortName, sortName) || other.sortName == sortName)&&(identical(other.uri, uri) || other.uri == uri)&&const DeepCollectionEquality().equals(other.externalIds, externalIds)&&(identical(other.isPlayable, isPlayable) || other.isPlayable == isPlayable)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&const DeepCollectionEquality().equals(other.providerMappings, providerMappings)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.favorite, favorite) || other.favorite == favorite)&&(identical(other.position, position) || other.position == position)&&(identical(other.dateAdded, dateAdded) || other.dateAdded == dateAdded)&&(identical(other.duration, duration) || other.duration == duration)&&const DeepCollectionEquality().equals(other.artists, artists)&&(identical(other.lastPlayed, lastPlayed) || other.lastPlayed == lastPlayed)&&(identical(other.album, album) || other.album == album)&&(identical(other.discNumber, discNumber) || other.discNumber == discNumber)&&(identical(other.trackNumber, trackNumber) || other.trackNumber == trackNumber)&&(identical(other.audioMetadata, audioMetadata) || other.audioMetadata == audioMetadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,itemId,provider,name,version,sortName,uri,const DeepCollectionEquality().hash(externalIds),isPlayable,mediaType,const DeepCollectionEquality().hash(providerMappings),metadata,favorite,position,dateAdded,duration,const DeepCollectionEquality().hash(artists),lastPlayed,album,discNumber,trackNumber,audioMetadata]);

@override
String toString() {
  return 'MusicAssistantTrack(itemId: $itemId, provider: $provider, name: $name, version: $version, sortName: $sortName, uri: $uri, externalIds: $externalIds, isPlayable: $isPlayable, mediaType: $mediaType, providerMappings: $providerMappings, metadata: $metadata, favorite: $favorite, position: $position, dateAdded: $dateAdded, duration: $duration, artists: $artists, lastPlayed: $lastPlayed, album: $album, discNumber: $discNumber, trackNumber: $trackNumber, audioMetadata: $audioMetadata)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantTrackCopyWith<$Res>  {
  factory $MusicAssistantTrackCopyWith(MusicAssistantTrack value, $Res Function(MusicAssistantTrack) _then) = _$MusicAssistantTrackCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantTrack.itemIdKey_) String itemId,@JsonKey(name: MusicAssistantTrack.providerKey_) String provider,@JsonKey(name: MusicAssistantTrack.nameKey_) String name,@JsonKey(name: MusicAssistantTrack.versionKey_) String version,@JsonKey(name: MusicAssistantTrack.sortNameKey_) String? sortName,@JsonKey(name: MusicAssistantTrack.uriKey_) String? uri,@JsonKey(name: MusicAssistantTrack.externalIdsKey_) List<List<MusicAssistantExternalID>>? externalIds,@JsonKey(name: MusicAssistantTrack.isPlayableKey_) bool isPlayable,@JsonKey(name: MusicAssistantTrack.mediaTypeKey_) MusicAssistantMediaType mediaType,@JsonKey(name: MusicAssistantTrack.providerMappingsKey_) List<MusicAssistantProviderMapping> providerMappings,@JsonKey(name: MusicAssistantTrack.metadataKey_) MusicAssistantMediaItemMetadata? metadata,@JsonKey(name: MusicAssistantTrack.favoriteKey_) bool favorite,@JsonKey(name: MusicAssistantTrack.positionKey_) int? position,@JsonKey(name: MusicAssistantTrack.dateAddedKey_) DateTime? dateAdded,@JsonKey(name: MusicAssistantTrack.durationKey_) int duration,@JsonKey(name: MusicAssistantTrack.artistsKey_) List<MusicAssistantArtistOrItemMappingUnion>? artists,@JsonKey(name: MusicAssistantTrack.lastPlayedKey_) int lastPlayed,@JsonKey(name: MusicAssistantTrack.albumKey_) MusicAssistantAlbum? album,@JsonKey(name: MusicAssistantTrack.discNumberKey_) int discNumber,@JsonKey(name: MusicAssistantTrack.trackNumberKey_) int trackNumber,@JsonKey(name: MusicAssistantTrack.audioMetadataKey_) MusicAssistantAudioMetadata? audioMetadata
});


$MusicAssistantMediaItemMetadataCopyWith<$Res>? get metadata;$MusicAssistantAlbumCopyWith<$Res>? get album;$MusicAssistantAudioMetadataCopyWith<$Res>? get audioMetadata;

}
/// @nodoc
class _$MusicAssistantTrackCopyWithImpl<$Res>
    implements $MusicAssistantTrackCopyWith<$Res> {
  _$MusicAssistantTrackCopyWithImpl(this._self, this._then);

  final MusicAssistantTrack _self;
  final $Res Function(MusicAssistantTrack) _then;

/// Create a copy of MusicAssistantTrack
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itemId = null,Object? provider = null,Object? name = null,Object? version = null,Object? sortName = freezed,Object? uri = freezed,Object? externalIds = freezed,Object? isPlayable = null,Object? mediaType = null,Object? providerMappings = null,Object? metadata = freezed,Object? favorite = null,Object? position = freezed,Object? dateAdded = freezed,Object? duration = null,Object? artists = freezed,Object? lastPlayed = null,Object? album = freezed,Object? discNumber = null,Object? trackNumber = null,Object? audioMetadata = freezed,}) {
  return _then(_self.copyWith(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,sortName: freezed == sortName ? _self.sortName : sortName // ignore: cast_nullable_to_non_nullable
as String?,uri: freezed == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as String?,externalIds: freezed == externalIds ? _self.externalIds : externalIds // ignore: cast_nullable_to_non_nullable
as List<List<MusicAssistantExternalID>>?,isPlayable: null == isPlayable ? _self.isPlayable : isPlayable // ignore: cast_nullable_to_non_nullable
as bool,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as MusicAssistantMediaType,providerMappings: null == providerMappings ? _self.providerMappings : providerMappings // ignore: cast_nullable_to_non_nullable
as List<MusicAssistantProviderMapping>,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as MusicAssistantMediaItemMetadata?,favorite: null == favorite ? _self.favorite : favorite // ignore: cast_nullable_to_non_nullable
as bool,position: freezed == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int?,dateAdded: freezed == dateAdded ? _self.dateAdded : dateAdded // ignore: cast_nullable_to_non_nullable
as DateTime?,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,artists: freezed == artists ? _self.artists : artists // ignore: cast_nullable_to_non_nullable
as List<MusicAssistantArtistOrItemMappingUnion>?,lastPlayed: null == lastPlayed ? _self.lastPlayed : lastPlayed // ignore: cast_nullable_to_non_nullable
as int,album: freezed == album ? _self.album : album // ignore: cast_nullable_to_non_nullable
as MusicAssistantAlbum?,discNumber: null == discNumber ? _self.discNumber : discNumber // ignore: cast_nullable_to_non_nullable
as int,trackNumber: null == trackNumber ? _self.trackNumber : trackNumber // ignore: cast_nullable_to_non_nullable
as int,audioMetadata: freezed == audioMetadata ? _self.audioMetadata : audioMetadata // ignore: cast_nullable_to_non_nullable
as MusicAssistantAudioMetadata?,
  ));
}
/// Create a copy of MusicAssistantTrack
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantMediaItemMetadataCopyWith<$Res>? get metadata {
    if (_self.metadata == null) {
    return null;
  }

  return $MusicAssistantMediaItemMetadataCopyWith<$Res>(_self.metadata!, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}/// Create a copy of MusicAssistantTrack
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantAlbumCopyWith<$Res>? get album {
    if (_self.album == null) {
    return null;
  }

  return $MusicAssistantAlbumCopyWith<$Res>(_self.album!, (value) {
    return _then(_self.copyWith(album: value));
  });
}/// Create a copy of MusicAssistantTrack
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantAudioMetadataCopyWith<$Res>? get audioMetadata {
    if (_self.audioMetadata == null) {
    return null;
  }

  return $MusicAssistantAudioMetadataCopyWith<$Res>(_self.audioMetadata!, (value) {
    return _then(_self.copyWith(audioMetadata: value));
  });
}
}


/// Adds pattern-matching-related methods to [MusicAssistantTrack].
extension MusicAssistantTrackPatterns on MusicAssistantTrack {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantTrack value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantTrack() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantTrack value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantTrack():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantTrack value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantTrack() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantTrack.itemIdKey_)  String itemId, @JsonKey(name: MusicAssistantTrack.providerKey_)  String provider, @JsonKey(name: MusicAssistantTrack.nameKey_)  String name, @JsonKey(name: MusicAssistantTrack.versionKey_)  String version, @JsonKey(name: MusicAssistantTrack.sortNameKey_)  String? sortName, @JsonKey(name: MusicAssistantTrack.uriKey_)  String? uri, @JsonKey(name: MusicAssistantTrack.externalIdsKey_)  List<List<MusicAssistantExternalID>>? externalIds, @JsonKey(name: MusicAssistantTrack.isPlayableKey_)  bool isPlayable, @JsonKey(name: MusicAssistantTrack.mediaTypeKey_)  MusicAssistantMediaType mediaType, @JsonKey(name: MusicAssistantTrack.providerMappingsKey_)  List<MusicAssistantProviderMapping> providerMappings, @JsonKey(name: MusicAssistantTrack.metadataKey_)  MusicAssistantMediaItemMetadata? metadata, @JsonKey(name: MusicAssistantTrack.favoriteKey_)  bool favorite, @JsonKey(name: MusicAssistantTrack.positionKey_)  int? position, @JsonKey(name: MusicAssistantTrack.dateAddedKey_)  DateTime? dateAdded, @JsonKey(name: MusicAssistantTrack.durationKey_)  int duration, @JsonKey(name: MusicAssistantTrack.artistsKey_)  List<MusicAssistantArtistOrItemMappingUnion>? artists, @JsonKey(name: MusicAssistantTrack.lastPlayedKey_)  int lastPlayed, @JsonKey(name: MusicAssistantTrack.albumKey_)  MusicAssistantAlbum? album, @JsonKey(name: MusicAssistantTrack.discNumberKey_)  int discNumber, @JsonKey(name: MusicAssistantTrack.trackNumberKey_)  int trackNumber, @JsonKey(name: MusicAssistantTrack.audioMetadataKey_)  MusicAssistantAudioMetadata? audioMetadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantTrack() when $default != null:
return $default(_that.itemId,_that.provider,_that.name,_that.version,_that.sortName,_that.uri,_that.externalIds,_that.isPlayable,_that.mediaType,_that.providerMappings,_that.metadata,_that.favorite,_that.position,_that.dateAdded,_that.duration,_that.artists,_that.lastPlayed,_that.album,_that.discNumber,_that.trackNumber,_that.audioMetadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantTrack.itemIdKey_)  String itemId, @JsonKey(name: MusicAssistantTrack.providerKey_)  String provider, @JsonKey(name: MusicAssistantTrack.nameKey_)  String name, @JsonKey(name: MusicAssistantTrack.versionKey_)  String version, @JsonKey(name: MusicAssistantTrack.sortNameKey_)  String? sortName, @JsonKey(name: MusicAssistantTrack.uriKey_)  String? uri, @JsonKey(name: MusicAssistantTrack.externalIdsKey_)  List<List<MusicAssistantExternalID>>? externalIds, @JsonKey(name: MusicAssistantTrack.isPlayableKey_)  bool isPlayable, @JsonKey(name: MusicAssistantTrack.mediaTypeKey_)  MusicAssistantMediaType mediaType, @JsonKey(name: MusicAssistantTrack.providerMappingsKey_)  List<MusicAssistantProviderMapping> providerMappings, @JsonKey(name: MusicAssistantTrack.metadataKey_)  MusicAssistantMediaItemMetadata? metadata, @JsonKey(name: MusicAssistantTrack.favoriteKey_)  bool favorite, @JsonKey(name: MusicAssistantTrack.positionKey_)  int? position, @JsonKey(name: MusicAssistantTrack.dateAddedKey_)  DateTime? dateAdded, @JsonKey(name: MusicAssistantTrack.durationKey_)  int duration, @JsonKey(name: MusicAssistantTrack.artistsKey_)  List<MusicAssistantArtistOrItemMappingUnion>? artists, @JsonKey(name: MusicAssistantTrack.lastPlayedKey_)  int lastPlayed, @JsonKey(name: MusicAssistantTrack.albumKey_)  MusicAssistantAlbum? album, @JsonKey(name: MusicAssistantTrack.discNumberKey_)  int discNumber, @JsonKey(name: MusicAssistantTrack.trackNumberKey_)  int trackNumber, @JsonKey(name: MusicAssistantTrack.audioMetadataKey_)  MusicAssistantAudioMetadata? audioMetadata)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantTrack():
return $default(_that.itemId,_that.provider,_that.name,_that.version,_that.sortName,_that.uri,_that.externalIds,_that.isPlayable,_that.mediaType,_that.providerMappings,_that.metadata,_that.favorite,_that.position,_that.dateAdded,_that.duration,_that.artists,_that.lastPlayed,_that.album,_that.discNumber,_that.trackNumber,_that.audioMetadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantTrack.itemIdKey_)  String itemId, @JsonKey(name: MusicAssistantTrack.providerKey_)  String provider, @JsonKey(name: MusicAssistantTrack.nameKey_)  String name, @JsonKey(name: MusicAssistantTrack.versionKey_)  String version, @JsonKey(name: MusicAssistantTrack.sortNameKey_)  String? sortName, @JsonKey(name: MusicAssistantTrack.uriKey_)  String? uri, @JsonKey(name: MusicAssistantTrack.externalIdsKey_)  List<List<MusicAssistantExternalID>>? externalIds, @JsonKey(name: MusicAssistantTrack.isPlayableKey_)  bool isPlayable, @JsonKey(name: MusicAssistantTrack.mediaTypeKey_)  MusicAssistantMediaType mediaType, @JsonKey(name: MusicAssistantTrack.providerMappingsKey_)  List<MusicAssistantProviderMapping> providerMappings, @JsonKey(name: MusicAssistantTrack.metadataKey_)  MusicAssistantMediaItemMetadata? metadata, @JsonKey(name: MusicAssistantTrack.favoriteKey_)  bool favorite, @JsonKey(name: MusicAssistantTrack.positionKey_)  int? position, @JsonKey(name: MusicAssistantTrack.dateAddedKey_)  DateTime? dateAdded, @JsonKey(name: MusicAssistantTrack.durationKey_)  int duration, @JsonKey(name: MusicAssistantTrack.artistsKey_)  List<MusicAssistantArtistOrItemMappingUnion>? artists, @JsonKey(name: MusicAssistantTrack.lastPlayedKey_)  int lastPlayed, @JsonKey(name: MusicAssistantTrack.albumKey_)  MusicAssistantAlbum? album, @JsonKey(name: MusicAssistantTrack.discNumberKey_)  int discNumber, @JsonKey(name: MusicAssistantTrack.trackNumberKey_)  int trackNumber, @JsonKey(name: MusicAssistantTrack.audioMetadataKey_)  MusicAssistantAudioMetadata? audioMetadata)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantTrack() when $default != null:
return $default(_that.itemId,_that.provider,_that.name,_that.version,_that.sortName,_that.uri,_that.externalIds,_that.isPlayable,_that.mediaType,_that.providerMappings,_that.metadata,_that.favorite,_that.position,_that.dateAdded,_that.duration,_that.artists,_that.lastPlayed,_that.album,_that.discNumber,_that.trackNumber,_that.audioMetadata);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantTrack extends MusicAssistantTrack {
  const _MusicAssistantTrack({@JsonKey(name: MusicAssistantTrack.itemIdKey_) required this.itemId, @JsonKey(name: MusicAssistantTrack.providerKey_) required this.provider, @JsonKey(name: MusicAssistantTrack.nameKey_) required this.name, @JsonKey(name: MusicAssistantTrack.versionKey_) this.version = '', @JsonKey(name: MusicAssistantTrack.sortNameKey_) this.sortName, @JsonKey(name: MusicAssistantTrack.uriKey_) this.uri, @JsonKey(name: MusicAssistantTrack.externalIdsKey_) final  List<List<MusicAssistantExternalID>>? externalIds, @JsonKey(name: MusicAssistantTrack.isPlayableKey_) this.isPlayable = true, @JsonKey(name: MusicAssistantTrack.mediaTypeKey_) this.mediaType = MusicAssistantMediaType.track, @JsonKey(name: MusicAssistantTrack.providerMappingsKey_) required final  List<MusicAssistantProviderMapping> providerMappings, @JsonKey(name: MusicAssistantTrack.metadataKey_) this.metadata, @JsonKey(name: MusicAssistantTrack.favoriteKey_) this.favorite = false, @JsonKey(name: MusicAssistantTrack.positionKey_) this.position, @JsonKey(name: MusicAssistantTrack.dateAddedKey_) this.dateAdded, @JsonKey(name: MusicAssistantTrack.durationKey_) this.duration = 0, @JsonKey(name: MusicAssistantTrack.artistsKey_) final  List<MusicAssistantArtistOrItemMappingUnion>? artists, @JsonKey(name: MusicAssistantTrack.lastPlayedKey_) this.lastPlayed = 0, @JsonKey(name: MusicAssistantTrack.albumKey_) this.album, @JsonKey(name: MusicAssistantTrack.discNumberKey_) this.discNumber = 0, @JsonKey(name: MusicAssistantTrack.trackNumberKey_) this.trackNumber = 0, @JsonKey(name: MusicAssistantTrack.audioMetadataKey_) this.audioMetadata}): _externalIds = externalIds,_providerMappings = providerMappings,_artists = artists,super._();
  factory _MusicAssistantTrack.fromJson(Map<String, dynamic> json) => _$MusicAssistantTrackFromJson(json);

/// itemId
@override@JsonKey(name: MusicAssistantTrack.itemIdKey_) final  String itemId;
/// provider
@override@JsonKey(name: MusicAssistantTrack.providerKey_) final  String provider;
/// name
@override@JsonKey(name: MusicAssistantTrack.nameKey_) final  String name;
/// version
@override@JsonKey(name: MusicAssistantTrack.versionKey_) final  String version;
/// sortName
@override@JsonKey(name: MusicAssistantTrack.sortNameKey_) final  String? sortName;
/// uri
@override@JsonKey(name: MusicAssistantTrack.uriKey_) final  String? uri;
/// externalIds
 final  List<List<MusicAssistantExternalID>>? _externalIds;
/// externalIds
@override@JsonKey(name: MusicAssistantTrack.externalIdsKey_) List<List<MusicAssistantExternalID>>? get externalIds {
  final value = _externalIds;
  if (value == null) return null;
  if (_externalIds is EqualUnmodifiableListView) return _externalIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// isPlayable
@override@JsonKey(name: MusicAssistantTrack.isPlayableKey_) final  bool isPlayable;
/// mediaType
@override@JsonKey(name: MusicAssistantTrack.mediaTypeKey_) final  MusicAssistantMediaType mediaType;
/// providerMappings
 final  List<MusicAssistantProviderMapping> _providerMappings;
/// providerMappings
@override@JsonKey(name: MusicAssistantTrack.providerMappingsKey_) List<MusicAssistantProviderMapping> get providerMappings {
  if (_providerMappings is EqualUnmodifiableListView) return _providerMappings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_providerMappings);
}

/// metadata
@override@JsonKey(name: MusicAssistantTrack.metadataKey_) final  MusicAssistantMediaItemMetadata? metadata;
/// favorite
@override@JsonKey(name: MusicAssistantTrack.favoriteKey_) final  bool favorite;
/// position
@override@JsonKey(name: MusicAssistantTrack.positionKey_) final  int? position;
/// dateAdded
@override@JsonKey(name: MusicAssistantTrack.dateAddedKey_) final  DateTime? dateAdded;
/// duration
@override@JsonKey(name: MusicAssistantTrack.durationKey_) final  int duration;
/// artists
 final  List<MusicAssistantArtistOrItemMappingUnion>? _artists;
/// artists
@override@JsonKey(name: MusicAssistantTrack.artistsKey_) List<MusicAssistantArtistOrItemMappingUnion>? get artists {
  final value = _artists;
  if (value == null) return null;
  if (_artists is EqualUnmodifiableListView) return _artists;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// lastPlayed
@override@JsonKey(name: MusicAssistantTrack.lastPlayedKey_) final  int lastPlayed;
/// album
@override@JsonKey(name: MusicAssistantTrack.albumKey_) final  MusicAssistantAlbum? album;
/// discNumber
@override@JsonKey(name: MusicAssistantTrack.discNumberKey_) final  int discNumber;
/// trackNumber
@override@JsonKey(name: MusicAssistantTrack.trackNumberKey_) final  int trackNumber;
/// audioMetadata
@override@JsonKey(name: MusicAssistantTrack.audioMetadataKey_) final  MusicAssistantAudioMetadata? audioMetadata;

/// Create a copy of MusicAssistantTrack
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantTrackCopyWith<_MusicAssistantTrack> get copyWith => __$MusicAssistantTrackCopyWithImpl<_MusicAssistantTrack>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantTrackToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantTrack&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.name, name) || other.name == name)&&(identical(other.version, version) || other.version == version)&&(identical(other.sortName, sortName) || other.sortName == sortName)&&(identical(other.uri, uri) || other.uri == uri)&&const DeepCollectionEquality().equals(other._externalIds, _externalIds)&&(identical(other.isPlayable, isPlayable) || other.isPlayable == isPlayable)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&const DeepCollectionEquality().equals(other._providerMappings, _providerMappings)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.favorite, favorite) || other.favorite == favorite)&&(identical(other.position, position) || other.position == position)&&(identical(other.dateAdded, dateAdded) || other.dateAdded == dateAdded)&&(identical(other.duration, duration) || other.duration == duration)&&const DeepCollectionEquality().equals(other._artists, _artists)&&(identical(other.lastPlayed, lastPlayed) || other.lastPlayed == lastPlayed)&&(identical(other.album, album) || other.album == album)&&(identical(other.discNumber, discNumber) || other.discNumber == discNumber)&&(identical(other.trackNumber, trackNumber) || other.trackNumber == trackNumber)&&(identical(other.audioMetadata, audioMetadata) || other.audioMetadata == audioMetadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,itemId,provider,name,version,sortName,uri,const DeepCollectionEquality().hash(_externalIds),isPlayable,mediaType,const DeepCollectionEquality().hash(_providerMappings),metadata,favorite,position,dateAdded,duration,const DeepCollectionEquality().hash(_artists),lastPlayed,album,discNumber,trackNumber,audioMetadata]);

@override
String toString() {
  return 'MusicAssistantTrack(itemId: $itemId, provider: $provider, name: $name, version: $version, sortName: $sortName, uri: $uri, externalIds: $externalIds, isPlayable: $isPlayable, mediaType: $mediaType, providerMappings: $providerMappings, metadata: $metadata, favorite: $favorite, position: $position, dateAdded: $dateAdded, duration: $duration, artists: $artists, lastPlayed: $lastPlayed, album: $album, discNumber: $discNumber, trackNumber: $trackNumber, audioMetadata: $audioMetadata)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantTrackCopyWith<$Res> implements $MusicAssistantTrackCopyWith<$Res> {
  factory _$MusicAssistantTrackCopyWith(_MusicAssistantTrack value, $Res Function(_MusicAssistantTrack) _then) = __$MusicAssistantTrackCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantTrack.itemIdKey_) String itemId,@JsonKey(name: MusicAssistantTrack.providerKey_) String provider,@JsonKey(name: MusicAssistantTrack.nameKey_) String name,@JsonKey(name: MusicAssistantTrack.versionKey_) String version,@JsonKey(name: MusicAssistantTrack.sortNameKey_) String? sortName,@JsonKey(name: MusicAssistantTrack.uriKey_) String? uri,@JsonKey(name: MusicAssistantTrack.externalIdsKey_) List<List<MusicAssistantExternalID>>? externalIds,@JsonKey(name: MusicAssistantTrack.isPlayableKey_) bool isPlayable,@JsonKey(name: MusicAssistantTrack.mediaTypeKey_) MusicAssistantMediaType mediaType,@JsonKey(name: MusicAssistantTrack.providerMappingsKey_) List<MusicAssistantProviderMapping> providerMappings,@JsonKey(name: MusicAssistantTrack.metadataKey_) MusicAssistantMediaItemMetadata? metadata,@JsonKey(name: MusicAssistantTrack.favoriteKey_) bool favorite,@JsonKey(name: MusicAssistantTrack.positionKey_) int? position,@JsonKey(name: MusicAssistantTrack.dateAddedKey_) DateTime? dateAdded,@JsonKey(name: MusicAssistantTrack.durationKey_) int duration,@JsonKey(name: MusicAssistantTrack.artistsKey_) List<MusicAssistantArtistOrItemMappingUnion>? artists,@JsonKey(name: MusicAssistantTrack.lastPlayedKey_) int lastPlayed,@JsonKey(name: MusicAssistantTrack.albumKey_) MusicAssistantAlbum? album,@JsonKey(name: MusicAssistantTrack.discNumberKey_) int discNumber,@JsonKey(name: MusicAssistantTrack.trackNumberKey_) int trackNumber,@JsonKey(name: MusicAssistantTrack.audioMetadataKey_) MusicAssistantAudioMetadata? audioMetadata
});


@override $MusicAssistantMediaItemMetadataCopyWith<$Res>? get metadata;@override $MusicAssistantAlbumCopyWith<$Res>? get album;@override $MusicAssistantAudioMetadataCopyWith<$Res>? get audioMetadata;

}
/// @nodoc
class __$MusicAssistantTrackCopyWithImpl<$Res>
    implements _$MusicAssistantTrackCopyWith<$Res> {
  __$MusicAssistantTrackCopyWithImpl(this._self, this._then);

  final _MusicAssistantTrack _self;
  final $Res Function(_MusicAssistantTrack) _then;

/// Create a copy of MusicAssistantTrack
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itemId = null,Object? provider = null,Object? name = null,Object? version = null,Object? sortName = freezed,Object? uri = freezed,Object? externalIds = freezed,Object? isPlayable = null,Object? mediaType = null,Object? providerMappings = null,Object? metadata = freezed,Object? favorite = null,Object? position = freezed,Object? dateAdded = freezed,Object? duration = null,Object? artists = freezed,Object? lastPlayed = null,Object? album = freezed,Object? discNumber = null,Object? trackNumber = null,Object? audioMetadata = freezed,}) {
  return _then(_MusicAssistantTrack(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,sortName: freezed == sortName ? _self.sortName : sortName // ignore: cast_nullable_to_non_nullable
as String?,uri: freezed == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as String?,externalIds: freezed == externalIds ? _self._externalIds : externalIds // ignore: cast_nullable_to_non_nullable
as List<List<MusicAssistantExternalID>>?,isPlayable: null == isPlayable ? _self.isPlayable : isPlayable // ignore: cast_nullable_to_non_nullable
as bool,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as MusicAssistantMediaType,providerMappings: null == providerMappings ? _self._providerMappings : providerMappings // ignore: cast_nullable_to_non_nullable
as List<MusicAssistantProviderMapping>,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as MusicAssistantMediaItemMetadata?,favorite: null == favorite ? _self.favorite : favorite // ignore: cast_nullable_to_non_nullable
as bool,position: freezed == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int?,dateAdded: freezed == dateAdded ? _self.dateAdded : dateAdded // ignore: cast_nullable_to_non_nullable
as DateTime?,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,artists: freezed == artists ? _self._artists : artists // ignore: cast_nullable_to_non_nullable
as List<MusicAssistantArtistOrItemMappingUnion>?,lastPlayed: null == lastPlayed ? _self.lastPlayed : lastPlayed // ignore: cast_nullable_to_non_nullable
as int,album: freezed == album ? _self.album : album // ignore: cast_nullable_to_non_nullable
as MusicAssistantAlbum?,discNumber: null == discNumber ? _self.discNumber : discNumber // ignore: cast_nullable_to_non_nullable
as int,trackNumber: null == trackNumber ? _self.trackNumber : trackNumber // ignore: cast_nullable_to_non_nullable
as int,audioMetadata: freezed == audioMetadata ? _self.audioMetadata : audioMetadata // ignore: cast_nullable_to_non_nullable
as MusicAssistantAudioMetadata?,
  ));
}

/// Create a copy of MusicAssistantTrack
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantMediaItemMetadataCopyWith<$Res>? get metadata {
    if (_self.metadata == null) {
    return null;
  }

  return $MusicAssistantMediaItemMetadataCopyWith<$Res>(_self.metadata!, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}/// Create a copy of MusicAssistantTrack
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantAlbumCopyWith<$Res>? get album {
    if (_self.album == null) {
    return null;
  }

  return $MusicAssistantAlbumCopyWith<$Res>(_self.album!, (value) {
    return _then(_self.copyWith(album: value));
  });
}/// Create a copy of MusicAssistantTrack
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantAudioMetadataCopyWith<$Res>? get audioMetadata {
    if (_self.audioMetadata == null) {
    return null;
  }

  return $MusicAssistantAudioMetadataCopyWith<$Res>(_self.audioMetadata!, (value) {
    return _then(_self.copyWith(audioMetadata: value));
  });
}
}

// dart format on
