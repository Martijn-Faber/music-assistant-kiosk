// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_album.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantAlbum {

/// itemId
@JsonKey(name: MusicAssistantAlbum.itemIdKey_) String get itemId;/// provider
@JsonKey(name: MusicAssistantAlbum.providerKey_) String get provider;/// name
@JsonKey(name: MusicAssistantAlbum.nameKey_) String get name;/// version
@JsonKey(name: MusicAssistantAlbum.versionKey_) String get version;/// sortName
@JsonKey(name: MusicAssistantAlbum.sortNameKey_) String? get sortName;/// uri
@JsonKey(name: MusicAssistantAlbum.uriKey_) String? get uri;/// externalIds
@JsonKey(name: MusicAssistantAlbum.externalIdsKey_) List<List<MusicAssistantExternalID>>? get externalIds;/// isPlayable
@JsonKey(name: MusicAssistantAlbum.isPlayableKey_) bool get isPlayable;/// mediaType
@JsonKey(name: MusicAssistantAlbum.mediaTypeKey_) MusicAssistantMediaType get mediaType;/// providerMappings
@JsonKey(name: MusicAssistantAlbum.providerMappingsKey_) List<MusicAssistantProviderMapping> get providerMappings;/// metadata
@JsonKey(name: MusicAssistantAlbum.metadataKey_) MusicAssistantMediaItemMetadata? get metadata;/// favorite
@JsonKey(name: MusicAssistantAlbum.favoriteKey_) bool get favorite;/// position
@JsonKey(name: MusicAssistantAlbum.positionKey_) int? get position;/// dateAdded
@JsonKey(name: MusicAssistantAlbum.dateAddedKey_) DateTime? get dateAdded;/// year
@JsonKey(name: MusicAssistantAlbum.yearKey_) int? get year;/// artists
@JsonKey(name: MusicAssistantAlbum.artistsKey_) List<MusicAssistantArtistOrItemMappingUnion>? get artists;/// albumType
@JsonKey(name: MusicAssistantAlbum.albumTypeKey_) MusicAssistantAlbumType get albumType;
/// Create a copy of MusicAssistantAlbum
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantAlbumCopyWith<MusicAssistantAlbum> get copyWith => _$MusicAssistantAlbumCopyWithImpl<MusicAssistantAlbum>(this as MusicAssistantAlbum, _$identity);

  /// Serializes this MusicAssistantAlbum to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantAlbum&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.name, name) || other.name == name)&&(identical(other.version, version) || other.version == version)&&(identical(other.sortName, sortName) || other.sortName == sortName)&&(identical(other.uri, uri) || other.uri == uri)&&const DeepCollectionEquality().equals(other.externalIds, externalIds)&&(identical(other.isPlayable, isPlayable) || other.isPlayable == isPlayable)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&const DeepCollectionEquality().equals(other.providerMappings, providerMappings)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.favorite, favorite) || other.favorite == favorite)&&(identical(other.position, position) || other.position == position)&&(identical(other.dateAdded, dateAdded) || other.dateAdded == dateAdded)&&(identical(other.year, year) || other.year == year)&&const DeepCollectionEquality().equals(other.artists, artists)&&(identical(other.albumType, albumType) || other.albumType == albumType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,provider,name,version,sortName,uri,const DeepCollectionEquality().hash(externalIds),isPlayable,mediaType,const DeepCollectionEquality().hash(providerMappings),metadata,favorite,position,dateAdded,year,const DeepCollectionEquality().hash(artists),albumType);

@override
String toString() {
  return 'MusicAssistantAlbum(itemId: $itemId, provider: $provider, name: $name, version: $version, sortName: $sortName, uri: $uri, externalIds: $externalIds, isPlayable: $isPlayable, mediaType: $mediaType, providerMappings: $providerMappings, metadata: $metadata, favorite: $favorite, position: $position, dateAdded: $dateAdded, year: $year, artists: $artists, albumType: $albumType)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantAlbumCopyWith<$Res>  {
  factory $MusicAssistantAlbumCopyWith(MusicAssistantAlbum value, $Res Function(MusicAssistantAlbum) _then) = _$MusicAssistantAlbumCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantAlbum.itemIdKey_) String itemId,@JsonKey(name: MusicAssistantAlbum.providerKey_) String provider,@JsonKey(name: MusicAssistantAlbum.nameKey_) String name,@JsonKey(name: MusicAssistantAlbum.versionKey_) String version,@JsonKey(name: MusicAssistantAlbum.sortNameKey_) String? sortName,@JsonKey(name: MusicAssistantAlbum.uriKey_) String? uri,@JsonKey(name: MusicAssistantAlbum.externalIdsKey_) List<List<MusicAssistantExternalID>>? externalIds,@JsonKey(name: MusicAssistantAlbum.isPlayableKey_) bool isPlayable,@JsonKey(name: MusicAssistantAlbum.mediaTypeKey_) MusicAssistantMediaType mediaType,@JsonKey(name: MusicAssistantAlbum.providerMappingsKey_) List<MusicAssistantProviderMapping> providerMappings,@JsonKey(name: MusicAssistantAlbum.metadataKey_) MusicAssistantMediaItemMetadata? metadata,@JsonKey(name: MusicAssistantAlbum.favoriteKey_) bool favorite,@JsonKey(name: MusicAssistantAlbum.positionKey_) int? position,@JsonKey(name: MusicAssistantAlbum.dateAddedKey_) DateTime? dateAdded,@JsonKey(name: MusicAssistantAlbum.yearKey_) int? year,@JsonKey(name: MusicAssistantAlbum.artistsKey_) List<MusicAssistantArtistOrItemMappingUnion>? artists,@JsonKey(name: MusicAssistantAlbum.albumTypeKey_) MusicAssistantAlbumType albumType
});


$MusicAssistantMediaItemMetadataCopyWith<$Res>? get metadata;

}
/// @nodoc
class _$MusicAssistantAlbumCopyWithImpl<$Res>
    implements $MusicAssistantAlbumCopyWith<$Res> {
  _$MusicAssistantAlbumCopyWithImpl(this._self, this._then);

  final MusicAssistantAlbum _self;
  final $Res Function(MusicAssistantAlbum) _then;

/// Create a copy of MusicAssistantAlbum
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itemId = null,Object? provider = null,Object? name = null,Object? version = null,Object? sortName = freezed,Object? uri = freezed,Object? externalIds = freezed,Object? isPlayable = null,Object? mediaType = null,Object? providerMappings = null,Object? metadata = freezed,Object? favorite = null,Object? position = freezed,Object? dateAdded = freezed,Object? year = freezed,Object? artists = freezed,Object? albumType = null,}) {
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
as DateTime?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int?,artists: freezed == artists ? _self.artists : artists // ignore: cast_nullable_to_non_nullable
as List<MusicAssistantArtistOrItemMappingUnion>?,albumType: null == albumType ? _self.albumType : albumType // ignore: cast_nullable_to_non_nullable
as MusicAssistantAlbumType,
  ));
}
/// Create a copy of MusicAssistantAlbum
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
}
}


/// Adds pattern-matching-related methods to [MusicAssistantAlbum].
extension MusicAssistantAlbumPatterns on MusicAssistantAlbum {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantAlbum value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantAlbum() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantAlbum value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantAlbum():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantAlbum value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantAlbum() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantAlbum.itemIdKey_)  String itemId, @JsonKey(name: MusicAssistantAlbum.providerKey_)  String provider, @JsonKey(name: MusicAssistantAlbum.nameKey_)  String name, @JsonKey(name: MusicAssistantAlbum.versionKey_)  String version, @JsonKey(name: MusicAssistantAlbum.sortNameKey_)  String? sortName, @JsonKey(name: MusicAssistantAlbum.uriKey_)  String? uri, @JsonKey(name: MusicAssistantAlbum.externalIdsKey_)  List<List<MusicAssistantExternalID>>? externalIds, @JsonKey(name: MusicAssistantAlbum.isPlayableKey_)  bool isPlayable, @JsonKey(name: MusicAssistantAlbum.mediaTypeKey_)  MusicAssistantMediaType mediaType, @JsonKey(name: MusicAssistantAlbum.providerMappingsKey_)  List<MusicAssistantProviderMapping> providerMappings, @JsonKey(name: MusicAssistantAlbum.metadataKey_)  MusicAssistantMediaItemMetadata? metadata, @JsonKey(name: MusicAssistantAlbum.favoriteKey_)  bool favorite, @JsonKey(name: MusicAssistantAlbum.positionKey_)  int? position, @JsonKey(name: MusicAssistantAlbum.dateAddedKey_)  DateTime? dateAdded, @JsonKey(name: MusicAssistantAlbum.yearKey_)  int? year, @JsonKey(name: MusicAssistantAlbum.artistsKey_)  List<MusicAssistantArtistOrItemMappingUnion>? artists, @JsonKey(name: MusicAssistantAlbum.albumTypeKey_)  MusicAssistantAlbumType albumType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantAlbum() when $default != null:
return $default(_that.itemId,_that.provider,_that.name,_that.version,_that.sortName,_that.uri,_that.externalIds,_that.isPlayable,_that.mediaType,_that.providerMappings,_that.metadata,_that.favorite,_that.position,_that.dateAdded,_that.year,_that.artists,_that.albumType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantAlbum.itemIdKey_)  String itemId, @JsonKey(name: MusicAssistantAlbum.providerKey_)  String provider, @JsonKey(name: MusicAssistantAlbum.nameKey_)  String name, @JsonKey(name: MusicAssistantAlbum.versionKey_)  String version, @JsonKey(name: MusicAssistantAlbum.sortNameKey_)  String? sortName, @JsonKey(name: MusicAssistantAlbum.uriKey_)  String? uri, @JsonKey(name: MusicAssistantAlbum.externalIdsKey_)  List<List<MusicAssistantExternalID>>? externalIds, @JsonKey(name: MusicAssistantAlbum.isPlayableKey_)  bool isPlayable, @JsonKey(name: MusicAssistantAlbum.mediaTypeKey_)  MusicAssistantMediaType mediaType, @JsonKey(name: MusicAssistantAlbum.providerMappingsKey_)  List<MusicAssistantProviderMapping> providerMappings, @JsonKey(name: MusicAssistantAlbum.metadataKey_)  MusicAssistantMediaItemMetadata? metadata, @JsonKey(name: MusicAssistantAlbum.favoriteKey_)  bool favorite, @JsonKey(name: MusicAssistantAlbum.positionKey_)  int? position, @JsonKey(name: MusicAssistantAlbum.dateAddedKey_)  DateTime? dateAdded, @JsonKey(name: MusicAssistantAlbum.yearKey_)  int? year, @JsonKey(name: MusicAssistantAlbum.artistsKey_)  List<MusicAssistantArtistOrItemMappingUnion>? artists, @JsonKey(name: MusicAssistantAlbum.albumTypeKey_)  MusicAssistantAlbumType albumType)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantAlbum():
return $default(_that.itemId,_that.provider,_that.name,_that.version,_that.sortName,_that.uri,_that.externalIds,_that.isPlayable,_that.mediaType,_that.providerMappings,_that.metadata,_that.favorite,_that.position,_that.dateAdded,_that.year,_that.artists,_that.albumType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantAlbum.itemIdKey_)  String itemId, @JsonKey(name: MusicAssistantAlbum.providerKey_)  String provider, @JsonKey(name: MusicAssistantAlbum.nameKey_)  String name, @JsonKey(name: MusicAssistantAlbum.versionKey_)  String version, @JsonKey(name: MusicAssistantAlbum.sortNameKey_)  String? sortName, @JsonKey(name: MusicAssistantAlbum.uriKey_)  String? uri, @JsonKey(name: MusicAssistantAlbum.externalIdsKey_)  List<List<MusicAssistantExternalID>>? externalIds, @JsonKey(name: MusicAssistantAlbum.isPlayableKey_)  bool isPlayable, @JsonKey(name: MusicAssistantAlbum.mediaTypeKey_)  MusicAssistantMediaType mediaType, @JsonKey(name: MusicAssistantAlbum.providerMappingsKey_)  List<MusicAssistantProviderMapping> providerMappings, @JsonKey(name: MusicAssistantAlbum.metadataKey_)  MusicAssistantMediaItemMetadata? metadata, @JsonKey(name: MusicAssistantAlbum.favoriteKey_)  bool favorite, @JsonKey(name: MusicAssistantAlbum.positionKey_)  int? position, @JsonKey(name: MusicAssistantAlbum.dateAddedKey_)  DateTime? dateAdded, @JsonKey(name: MusicAssistantAlbum.yearKey_)  int? year, @JsonKey(name: MusicAssistantAlbum.artistsKey_)  List<MusicAssistantArtistOrItemMappingUnion>? artists, @JsonKey(name: MusicAssistantAlbum.albumTypeKey_)  MusicAssistantAlbumType albumType)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantAlbum() when $default != null:
return $default(_that.itemId,_that.provider,_that.name,_that.version,_that.sortName,_that.uri,_that.externalIds,_that.isPlayable,_that.mediaType,_that.providerMappings,_that.metadata,_that.favorite,_that.position,_that.dateAdded,_that.year,_that.artists,_that.albumType);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantAlbum extends MusicAssistantAlbum {
  const _MusicAssistantAlbum({@JsonKey(name: MusicAssistantAlbum.itemIdKey_) required this.itemId, @JsonKey(name: MusicAssistantAlbum.providerKey_) required this.provider, @JsonKey(name: MusicAssistantAlbum.nameKey_) required this.name, @JsonKey(name: MusicAssistantAlbum.versionKey_) this.version = '', @JsonKey(name: MusicAssistantAlbum.sortNameKey_) this.sortName, @JsonKey(name: MusicAssistantAlbum.uriKey_) this.uri, @JsonKey(name: MusicAssistantAlbum.externalIdsKey_) final  List<List<MusicAssistantExternalID>>? externalIds, @JsonKey(name: MusicAssistantAlbum.isPlayableKey_) this.isPlayable = true, @JsonKey(name: MusicAssistantAlbum.mediaTypeKey_) this.mediaType = MusicAssistantMediaType.album, @JsonKey(name: MusicAssistantAlbum.providerMappingsKey_) required final  List<MusicAssistantProviderMapping> providerMappings, @JsonKey(name: MusicAssistantAlbum.metadataKey_) this.metadata, @JsonKey(name: MusicAssistantAlbum.favoriteKey_) this.favorite = false, @JsonKey(name: MusicAssistantAlbum.positionKey_) this.position, @JsonKey(name: MusicAssistantAlbum.dateAddedKey_) this.dateAdded, @JsonKey(name: MusicAssistantAlbum.yearKey_) this.year, @JsonKey(name: MusicAssistantAlbum.artistsKey_) final  List<MusicAssistantArtistOrItemMappingUnion>? artists, @JsonKey(name: MusicAssistantAlbum.albumTypeKey_) this.albumType = MusicAssistantAlbumType.unknown}): _externalIds = externalIds,_providerMappings = providerMappings,_artists = artists,super._();
  factory _MusicAssistantAlbum.fromJson(Map<String, dynamic> json) => _$MusicAssistantAlbumFromJson(json);

/// itemId
@override@JsonKey(name: MusicAssistantAlbum.itemIdKey_) final  String itemId;
/// provider
@override@JsonKey(name: MusicAssistantAlbum.providerKey_) final  String provider;
/// name
@override@JsonKey(name: MusicAssistantAlbum.nameKey_) final  String name;
/// version
@override@JsonKey(name: MusicAssistantAlbum.versionKey_) final  String version;
/// sortName
@override@JsonKey(name: MusicAssistantAlbum.sortNameKey_) final  String? sortName;
/// uri
@override@JsonKey(name: MusicAssistantAlbum.uriKey_) final  String? uri;
/// externalIds
 final  List<List<MusicAssistantExternalID>>? _externalIds;
/// externalIds
@override@JsonKey(name: MusicAssistantAlbum.externalIdsKey_) List<List<MusicAssistantExternalID>>? get externalIds {
  final value = _externalIds;
  if (value == null) return null;
  if (_externalIds is EqualUnmodifiableListView) return _externalIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// isPlayable
@override@JsonKey(name: MusicAssistantAlbum.isPlayableKey_) final  bool isPlayable;
/// mediaType
@override@JsonKey(name: MusicAssistantAlbum.mediaTypeKey_) final  MusicAssistantMediaType mediaType;
/// providerMappings
 final  List<MusicAssistantProviderMapping> _providerMappings;
/// providerMappings
@override@JsonKey(name: MusicAssistantAlbum.providerMappingsKey_) List<MusicAssistantProviderMapping> get providerMappings {
  if (_providerMappings is EqualUnmodifiableListView) return _providerMappings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_providerMappings);
}

/// metadata
@override@JsonKey(name: MusicAssistantAlbum.metadataKey_) final  MusicAssistantMediaItemMetadata? metadata;
/// favorite
@override@JsonKey(name: MusicAssistantAlbum.favoriteKey_) final  bool favorite;
/// position
@override@JsonKey(name: MusicAssistantAlbum.positionKey_) final  int? position;
/// dateAdded
@override@JsonKey(name: MusicAssistantAlbum.dateAddedKey_) final  DateTime? dateAdded;
/// year
@override@JsonKey(name: MusicAssistantAlbum.yearKey_) final  int? year;
/// artists
 final  List<MusicAssistantArtistOrItemMappingUnion>? _artists;
/// artists
@override@JsonKey(name: MusicAssistantAlbum.artistsKey_) List<MusicAssistantArtistOrItemMappingUnion>? get artists {
  final value = _artists;
  if (value == null) return null;
  if (_artists is EqualUnmodifiableListView) return _artists;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// albumType
@override@JsonKey(name: MusicAssistantAlbum.albumTypeKey_) final  MusicAssistantAlbumType albumType;

/// Create a copy of MusicAssistantAlbum
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantAlbumCopyWith<_MusicAssistantAlbum> get copyWith => __$MusicAssistantAlbumCopyWithImpl<_MusicAssistantAlbum>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantAlbumToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantAlbum&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.name, name) || other.name == name)&&(identical(other.version, version) || other.version == version)&&(identical(other.sortName, sortName) || other.sortName == sortName)&&(identical(other.uri, uri) || other.uri == uri)&&const DeepCollectionEquality().equals(other._externalIds, _externalIds)&&(identical(other.isPlayable, isPlayable) || other.isPlayable == isPlayable)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&const DeepCollectionEquality().equals(other._providerMappings, _providerMappings)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.favorite, favorite) || other.favorite == favorite)&&(identical(other.position, position) || other.position == position)&&(identical(other.dateAdded, dateAdded) || other.dateAdded == dateAdded)&&(identical(other.year, year) || other.year == year)&&const DeepCollectionEquality().equals(other._artists, _artists)&&(identical(other.albumType, albumType) || other.albumType == albumType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,provider,name,version,sortName,uri,const DeepCollectionEquality().hash(_externalIds),isPlayable,mediaType,const DeepCollectionEquality().hash(_providerMappings),metadata,favorite,position,dateAdded,year,const DeepCollectionEquality().hash(_artists),albumType);

@override
String toString() {
  return 'MusicAssistantAlbum(itemId: $itemId, provider: $provider, name: $name, version: $version, sortName: $sortName, uri: $uri, externalIds: $externalIds, isPlayable: $isPlayable, mediaType: $mediaType, providerMappings: $providerMappings, metadata: $metadata, favorite: $favorite, position: $position, dateAdded: $dateAdded, year: $year, artists: $artists, albumType: $albumType)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantAlbumCopyWith<$Res> implements $MusicAssistantAlbumCopyWith<$Res> {
  factory _$MusicAssistantAlbumCopyWith(_MusicAssistantAlbum value, $Res Function(_MusicAssistantAlbum) _then) = __$MusicAssistantAlbumCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantAlbum.itemIdKey_) String itemId,@JsonKey(name: MusicAssistantAlbum.providerKey_) String provider,@JsonKey(name: MusicAssistantAlbum.nameKey_) String name,@JsonKey(name: MusicAssistantAlbum.versionKey_) String version,@JsonKey(name: MusicAssistantAlbum.sortNameKey_) String? sortName,@JsonKey(name: MusicAssistantAlbum.uriKey_) String? uri,@JsonKey(name: MusicAssistantAlbum.externalIdsKey_) List<List<MusicAssistantExternalID>>? externalIds,@JsonKey(name: MusicAssistantAlbum.isPlayableKey_) bool isPlayable,@JsonKey(name: MusicAssistantAlbum.mediaTypeKey_) MusicAssistantMediaType mediaType,@JsonKey(name: MusicAssistantAlbum.providerMappingsKey_) List<MusicAssistantProviderMapping> providerMappings,@JsonKey(name: MusicAssistantAlbum.metadataKey_) MusicAssistantMediaItemMetadata? metadata,@JsonKey(name: MusicAssistantAlbum.favoriteKey_) bool favorite,@JsonKey(name: MusicAssistantAlbum.positionKey_) int? position,@JsonKey(name: MusicAssistantAlbum.dateAddedKey_) DateTime? dateAdded,@JsonKey(name: MusicAssistantAlbum.yearKey_) int? year,@JsonKey(name: MusicAssistantAlbum.artistsKey_) List<MusicAssistantArtistOrItemMappingUnion>? artists,@JsonKey(name: MusicAssistantAlbum.albumTypeKey_) MusicAssistantAlbumType albumType
});


@override $MusicAssistantMediaItemMetadataCopyWith<$Res>? get metadata;

}
/// @nodoc
class __$MusicAssistantAlbumCopyWithImpl<$Res>
    implements _$MusicAssistantAlbumCopyWith<$Res> {
  __$MusicAssistantAlbumCopyWithImpl(this._self, this._then);

  final _MusicAssistantAlbum _self;
  final $Res Function(_MusicAssistantAlbum) _then;

/// Create a copy of MusicAssistantAlbum
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itemId = null,Object? provider = null,Object? name = null,Object? version = null,Object? sortName = freezed,Object? uri = freezed,Object? externalIds = freezed,Object? isPlayable = null,Object? mediaType = null,Object? providerMappings = null,Object? metadata = freezed,Object? favorite = null,Object? position = freezed,Object? dateAdded = freezed,Object? year = freezed,Object? artists = freezed,Object? albumType = null,}) {
  return _then(_MusicAssistantAlbum(
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
as DateTime?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int?,artists: freezed == artists ? _self._artists : artists // ignore: cast_nullable_to_non_nullable
as List<MusicAssistantArtistOrItemMappingUnion>?,albumType: null == albumType ? _self.albumType : albumType // ignore: cast_nullable_to_non_nullable
as MusicAssistantAlbumType,
  ));
}

/// Create a copy of MusicAssistantAlbum
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
}
}

// dart format on
