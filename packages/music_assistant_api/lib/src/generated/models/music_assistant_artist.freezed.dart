// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_artist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantArtist {

/// itemId
@JsonKey(name: MusicAssistantArtist.itemIdKey_) String get itemId;/// provider
@JsonKey(name: MusicAssistantArtist.providerKey_) String get provider;/// name
@JsonKey(name: MusicAssistantArtist.nameKey_) String get name;/// version
@JsonKey(name: MusicAssistantArtist.versionKey_) String get version;/// sortName
@JsonKey(name: MusicAssistantArtist.sortNameKey_) String? get sortName;/// uri
@JsonKey(name: MusicAssistantArtist.uriKey_) String? get uri;/// externalIds
@JsonKey(name: MusicAssistantArtist.externalIdsKey_) List<List<MusicAssistantExternalID>>? get externalIds;/// isPlayable
@JsonKey(name: MusicAssistantArtist.isPlayableKey_) bool get isPlayable;/// mediaType
@JsonKey(name: MusicAssistantArtist.mediaTypeKey_) MusicAssistantMediaType get mediaType;/// providerMappings
@JsonKey(name: MusicAssistantArtist.providerMappingsKey_) List<MusicAssistantProviderMapping> get providerMappings;/// metadata
@JsonKey(name: MusicAssistantArtist.metadataKey_) MusicAssistantMediaItemMetadata? get metadata;/// favorite
@JsonKey(name: MusicAssistantArtist.favoriteKey_) bool get favorite;/// position
@JsonKey(name: MusicAssistantArtist.positionKey_) int? get position;/// dateAdded
@JsonKey(name: MusicAssistantArtist.dateAddedKey_) DateTime? get dateAdded;/// artistType
@JsonKey(name: MusicAssistantArtist.artistTypeKey_) MusicAssistantArtistType get artistType;
/// Create a copy of MusicAssistantArtist
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantArtistCopyWith<MusicAssistantArtist> get copyWith => _$MusicAssistantArtistCopyWithImpl<MusicAssistantArtist>(this as MusicAssistantArtist, _$identity);

  /// Serializes this MusicAssistantArtist to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantArtist&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.name, name) || other.name == name)&&(identical(other.version, version) || other.version == version)&&(identical(other.sortName, sortName) || other.sortName == sortName)&&(identical(other.uri, uri) || other.uri == uri)&&const DeepCollectionEquality().equals(other.externalIds, externalIds)&&(identical(other.isPlayable, isPlayable) || other.isPlayable == isPlayable)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&const DeepCollectionEquality().equals(other.providerMappings, providerMappings)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.favorite, favorite) || other.favorite == favorite)&&(identical(other.position, position) || other.position == position)&&(identical(other.dateAdded, dateAdded) || other.dateAdded == dateAdded)&&(identical(other.artistType, artistType) || other.artistType == artistType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,provider,name,version,sortName,uri,const DeepCollectionEquality().hash(externalIds),isPlayable,mediaType,const DeepCollectionEquality().hash(providerMappings),metadata,favorite,position,dateAdded,artistType);

@override
String toString() {
  return 'MusicAssistantArtist(itemId: $itemId, provider: $provider, name: $name, version: $version, sortName: $sortName, uri: $uri, externalIds: $externalIds, isPlayable: $isPlayable, mediaType: $mediaType, providerMappings: $providerMappings, metadata: $metadata, favorite: $favorite, position: $position, dateAdded: $dateAdded, artistType: $artistType)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantArtistCopyWith<$Res>  {
  factory $MusicAssistantArtistCopyWith(MusicAssistantArtist value, $Res Function(MusicAssistantArtist) _then) = _$MusicAssistantArtistCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantArtist.itemIdKey_) String itemId,@JsonKey(name: MusicAssistantArtist.providerKey_) String provider,@JsonKey(name: MusicAssistantArtist.nameKey_) String name,@JsonKey(name: MusicAssistantArtist.versionKey_) String version,@JsonKey(name: MusicAssistantArtist.sortNameKey_) String? sortName,@JsonKey(name: MusicAssistantArtist.uriKey_) String? uri,@JsonKey(name: MusicAssistantArtist.externalIdsKey_) List<List<MusicAssistantExternalID>>? externalIds,@JsonKey(name: MusicAssistantArtist.isPlayableKey_) bool isPlayable,@JsonKey(name: MusicAssistantArtist.mediaTypeKey_) MusicAssistantMediaType mediaType,@JsonKey(name: MusicAssistantArtist.providerMappingsKey_) List<MusicAssistantProviderMapping> providerMappings,@JsonKey(name: MusicAssistantArtist.metadataKey_) MusicAssistantMediaItemMetadata? metadata,@JsonKey(name: MusicAssistantArtist.favoriteKey_) bool favorite,@JsonKey(name: MusicAssistantArtist.positionKey_) int? position,@JsonKey(name: MusicAssistantArtist.dateAddedKey_) DateTime? dateAdded,@JsonKey(name: MusicAssistantArtist.artistTypeKey_) MusicAssistantArtistType artistType
});


$MusicAssistantMediaItemMetadataCopyWith<$Res>? get metadata;

}
/// @nodoc
class _$MusicAssistantArtistCopyWithImpl<$Res>
    implements $MusicAssistantArtistCopyWith<$Res> {
  _$MusicAssistantArtistCopyWithImpl(this._self, this._then);

  final MusicAssistantArtist _self;
  final $Res Function(MusicAssistantArtist) _then;

/// Create a copy of MusicAssistantArtist
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itemId = null,Object? provider = null,Object? name = null,Object? version = null,Object? sortName = freezed,Object? uri = freezed,Object? externalIds = freezed,Object? isPlayable = null,Object? mediaType = null,Object? providerMappings = null,Object? metadata = freezed,Object? favorite = null,Object? position = freezed,Object? dateAdded = freezed,Object? artistType = null,}) {
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
as DateTime?,artistType: null == artistType ? _self.artistType : artistType // ignore: cast_nullable_to_non_nullable
as MusicAssistantArtistType,
  ));
}
/// Create a copy of MusicAssistantArtist
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


/// Adds pattern-matching-related methods to [MusicAssistantArtist].
extension MusicAssistantArtistPatterns on MusicAssistantArtist {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantArtist value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantArtist() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantArtist value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantArtist():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantArtist value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantArtist() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantArtist.itemIdKey_)  String itemId, @JsonKey(name: MusicAssistantArtist.providerKey_)  String provider, @JsonKey(name: MusicAssistantArtist.nameKey_)  String name, @JsonKey(name: MusicAssistantArtist.versionKey_)  String version, @JsonKey(name: MusicAssistantArtist.sortNameKey_)  String? sortName, @JsonKey(name: MusicAssistantArtist.uriKey_)  String? uri, @JsonKey(name: MusicAssistantArtist.externalIdsKey_)  List<List<MusicAssistantExternalID>>? externalIds, @JsonKey(name: MusicAssistantArtist.isPlayableKey_)  bool isPlayable, @JsonKey(name: MusicAssistantArtist.mediaTypeKey_)  MusicAssistantMediaType mediaType, @JsonKey(name: MusicAssistantArtist.providerMappingsKey_)  List<MusicAssistantProviderMapping> providerMappings, @JsonKey(name: MusicAssistantArtist.metadataKey_)  MusicAssistantMediaItemMetadata? metadata, @JsonKey(name: MusicAssistantArtist.favoriteKey_)  bool favorite, @JsonKey(name: MusicAssistantArtist.positionKey_)  int? position, @JsonKey(name: MusicAssistantArtist.dateAddedKey_)  DateTime? dateAdded, @JsonKey(name: MusicAssistantArtist.artistTypeKey_)  MusicAssistantArtistType artistType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantArtist() when $default != null:
return $default(_that.itemId,_that.provider,_that.name,_that.version,_that.sortName,_that.uri,_that.externalIds,_that.isPlayable,_that.mediaType,_that.providerMappings,_that.metadata,_that.favorite,_that.position,_that.dateAdded,_that.artistType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantArtist.itemIdKey_)  String itemId, @JsonKey(name: MusicAssistantArtist.providerKey_)  String provider, @JsonKey(name: MusicAssistantArtist.nameKey_)  String name, @JsonKey(name: MusicAssistantArtist.versionKey_)  String version, @JsonKey(name: MusicAssistantArtist.sortNameKey_)  String? sortName, @JsonKey(name: MusicAssistantArtist.uriKey_)  String? uri, @JsonKey(name: MusicAssistantArtist.externalIdsKey_)  List<List<MusicAssistantExternalID>>? externalIds, @JsonKey(name: MusicAssistantArtist.isPlayableKey_)  bool isPlayable, @JsonKey(name: MusicAssistantArtist.mediaTypeKey_)  MusicAssistantMediaType mediaType, @JsonKey(name: MusicAssistantArtist.providerMappingsKey_)  List<MusicAssistantProviderMapping> providerMappings, @JsonKey(name: MusicAssistantArtist.metadataKey_)  MusicAssistantMediaItemMetadata? metadata, @JsonKey(name: MusicAssistantArtist.favoriteKey_)  bool favorite, @JsonKey(name: MusicAssistantArtist.positionKey_)  int? position, @JsonKey(name: MusicAssistantArtist.dateAddedKey_)  DateTime? dateAdded, @JsonKey(name: MusicAssistantArtist.artistTypeKey_)  MusicAssistantArtistType artistType)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantArtist():
return $default(_that.itemId,_that.provider,_that.name,_that.version,_that.sortName,_that.uri,_that.externalIds,_that.isPlayable,_that.mediaType,_that.providerMappings,_that.metadata,_that.favorite,_that.position,_that.dateAdded,_that.artistType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantArtist.itemIdKey_)  String itemId, @JsonKey(name: MusicAssistantArtist.providerKey_)  String provider, @JsonKey(name: MusicAssistantArtist.nameKey_)  String name, @JsonKey(name: MusicAssistantArtist.versionKey_)  String version, @JsonKey(name: MusicAssistantArtist.sortNameKey_)  String? sortName, @JsonKey(name: MusicAssistantArtist.uriKey_)  String? uri, @JsonKey(name: MusicAssistantArtist.externalIdsKey_)  List<List<MusicAssistantExternalID>>? externalIds, @JsonKey(name: MusicAssistantArtist.isPlayableKey_)  bool isPlayable, @JsonKey(name: MusicAssistantArtist.mediaTypeKey_)  MusicAssistantMediaType mediaType, @JsonKey(name: MusicAssistantArtist.providerMappingsKey_)  List<MusicAssistantProviderMapping> providerMappings, @JsonKey(name: MusicAssistantArtist.metadataKey_)  MusicAssistantMediaItemMetadata? metadata, @JsonKey(name: MusicAssistantArtist.favoriteKey_)  bool favorite, @JsonKey(name: MusicAssistantArtist.positionKey_)  int? position, @JsonKey(name: MusicAssistantArtist.dateAddedKey_)  DateTime? dateAdded, @JsonKey(name: MusicAssistantArtist.artistTypeKey_)  MusicAssistantArtistType artistType)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantArtist() when $default != null:
return $default(_that.itemId,_that.provider,_that.name,_that.version,_that.sortName,_that.uri,_that.externalIds,_that.isPlayable,_that.mediaType,_that.providerMappings,_that.metadata,_that.favorite,_that.position,_that.dateAdded,_that.artistType);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantArtist extends MusicAssistantArtist {
  const _MusicAssistantArtist({@JsonKey(name: MusicAssistantArtist.itemIdKey_) required this.itemId, @JsonKey(name: MusicAssistantArtist.providerKey_) required this.provider, @JsonKey(name: MusicAssistantArtist.nameKey_) required this.name, @JsonKey(name: MusicAssistantArtist.versionKey_) this.version = '', @JsonKey(name: MusicAssistantArtist.sortNameKey_) this.sortName, @JsonKey(name: MusicAssistantArtist.uriKey_) this.uri, @JsonKey(name: MusicAssistantArtist.externalIdsKey_) final  List<List<MusicAssistantExternalID>>? externalIds, @JsonKey(name: MusicAssistantArtist.isPlayableKey_) this.isPlayable = true, @JsonKey(name: MusicAssistantArtist.mediaTypeKey_) this.mediaType = MusicAssistantMediaType.artist, @JsonKey(name: MusicAssistantArtist.providerMappingsKey_) required final  List<MusicAssistantProviderMapping> providerMappings, @JsonKey(name: MusicAssistantArtist.metadataKey_) this.metadata, @JsonKey(name: MusicAssistantArtist.favoriteKey_) this.favorite = false, @JsonKey(name: MusicAssistantArtist.positionKey_) this.position, @JsonKey(name: MusicAssistantArtist.dateAddedKey_) this.dateAdded, @JsonKey(name: MusicAssistantArtist.artistTypeKey_) this.artistType = MusicAssistantArtistType.singer}): _externalIds = externalIds,_providerMappings = providerMappings,super._();
  factory _MusicAssistantArtist.fromJson(Map<String, dynamic> json) => _$MusicAssistantArtistFromJson(json);

/// itemId
@override@JsonKey(name: MusicAssistantArtist.itemIdKey_) final  String itemId;
/// provider
@override@JsonKey(name: MusicAssistantArtist.providerKey_) final  String provider;
/// name
@override@JsonKey(name: MusicAssistantArtist.nameKey_) final  String name;
/// version
@override@JsonKey(name: MusicAssistantArtist.versionKey_) final  String version;
/// sortName
@override@JsonKey(name: MusicAssistantArtist.sortNameKey_) final  String? sortName;
/// uri
@override@JsonKey(name: MusicAssistantArtist.uriKey_) final  String? uri;
/// externalIds
 final  List<List<MusicAssistantExternalID>>? _externalIds;
/// externalIds
@override@JsonKey(name: MusicAssistantArtist.externalIdsKey_) List<List<MusicAssistantExternalID>>? get externalIds {
  final value = _externalIds;
  if (value == null) return null;
  if (_externalIds is EqualUnmodifiableListView) return _externalIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// isPlayable
@override@JsonKey(name: MusicAssistantArtist.isPlayableKey_) final  bool isPlayable;
/// mediaType
@override@JsonKey(name: MusicAssistantArtist.mediaTypeKey_) final  MusicAssistantMediaType mediaType;
/// providerMappings
 final  List<MusicAssistantProviderMapping> _providerMappings;
/// providerMappings
@override@JsonKey(name: MusicAssistantArtist.providerMappingsKey_) List<MusicAssistantProviderMapping> get providerMappings {
  if (_providerMappings is EqualUnmodifiableListView) return _providerMappings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_providerMappings);
}

/// metadata
@override@JsonKey(name: MusicAssistantArtist.metadataKey_) final  MusicAssistantMediaItemMetadata? metadata;
/// favorite
@override@JsonKey(name: MusicAssistantArtist.favoriteKey_) final  bool favorite;
/// position
@override@JsonKey(name: MusicAssistantArtist.positionKey_) final  int? position;
/// dateAdded
@override@JsonKey(name: MusicAssistantArtist.dateAddedKey_) final  DateTime? dateAdded;
/// artistType
@override@JsonKey(name: MusicAssistantArtist.artistTypeKey_) final  MusicAssistantArtistType artistType;

/// Create a copy of MusicAssistantArtist
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantArtistCopyWith<_MusicAssistantArtist> get copyWith => __$MusicAssistantArtistCopyWithImpl<_MusicAssistantArtist>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantArtistToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantArtist&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.name, name) || other.name == name)&&(identical(other.version, version) || other.version == version)&&(identical(other.sortName, sortName) || other.sortName == sortName)&&(identical(other.uri, uri) || other.uri == uri)&&const DeepCollectionEquality().equals(other._externalIds, _externalIds)&&(identical(other.isPlayable, isPlayable) || other.isPlayable == isPlayable)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&const DeepCollectionEquality().equals(other._providerMappings, _providerMappings)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.favorite, favorite) || other.favorite == favorite)&&(identical(other.position, position) || other.position == position)&&(identical(other.dateAdded, dateAdded) || other.dateAdded == dateAdded)&&(identical(other.artistType, artistType) || other.artistType == artistType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,provider,name,version,sortName,uri,const DeepCollectionEquality().hash(_externalIds),isPlayable,mediaType,const DeepCollectionEquality().hash(_providerMappings),metadata,favorite,position,dateAdded,artistType);

@override
String toString() {
  return 'MusicAssistantArtist(itemId: $itemId, provider: $provider, name: $name, version: $version, sortName: $sortName, uri: $uri, externalIds: $externalIds, isPlayable: $isPlayable, mediaType: $mediaType, providerMappings: $providerMappings, metadata: $metadata, favorite: $favorite, position: $position, dateAdded: $dateAdded, artistType: $artistType)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantArtistCopyWith<$Res> implements $MusicAssistantArtistCopyWith<$Res> {
  factory _$MusicAssistantArtistCopyWith(_MusicAssistantArtist value, $Res Function(_MusicAssistantArtist) _then) = __$MusicAssistantArtistCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantArtist.itemIdKey_) String itemId,@JsonKey(name: MusicAssistantArtist.providerKey_) String provider,@JsonKey(name: MusicAssistantArtist.nameKey_) String name,@JsonKey(name: MusicAssistantArtist.versionKey_) String version,@JsonKey(name: MusicAssistantArtist.sortNameKey_) String? sortName,@JsonKey(name: MusicAssistantArtist.uriKey_) String? uri,@JsonKey(name: MusicAssistantArtist.externalIdsKey_) List<List<MusicAssistantExternalID>>? externalIds,@JsonKey(name: MusicAssistantArtist.isPlayableKey_) bool isPlayable,@JsonKey(name: MusicAssistantArtist.mediaTypeKey_) MusicAssistantMediaType mediaType,@JsonKey(name: MusicAssistantArtist.providerMappingsKey_) List<MusicAssistantProviderMapping> providerMappings,@JsonKey(name: MusicAssistantArtist.metadataKey_) MusicAssistantMediaItemMetadata? metadata,@JsonKey(name: MusicAssistantArtist.favoriteKey_) bool favorite,@JsonKey(name: MusicAssistantArtist.positionKey_) int? position,@JsonKey(name: MusicAssistantArtist.dateAddedKey_) DateTime? dateAdded,@JsonKey(name: MusicAssistantArtist.artistTypeKey_) MusicAssistantArtistType artistType
});


@override $MusicAssistantMediaItemMetadataCopyWith<$Res>? get metadata;

}
/// @nodoc
class __$MusicAssistantArtistCopyWithImpl<$Res>
    implements _$MusicAssistantArtistCopyWith<$Res> {
  __$MusicAssistantArtistCopyWithImpl(this._self, this._then);

  final _MusicAssistantArtist _self;
  final $Res Function(_MusicAssistantArtist) _then;

/// Create a copy of MusicAssistantArtist
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itemId = null,Object? provider = null,Object? name = null,Object? version = null,Object? sortName = freezed,Object? uri = freezed,Object? externalIds = freezed,Object? isPlayable = null,Object? mediaType = null,Object? providerMappings = null,Object? metadata = freezed,Object? favorite = null,Object? position = freezed,Object? dateAdded = freezed,Object? artistType = null,}) {
  return _then(_MusicAssistantArtist(
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
as DateTime?,artistType: null == artistType ? _self.artistType : artistType // ignore: cast_nullable_to_non_nullable
as MusicAssistantArtistType,
  ));
}

/// Create a copy of MusicAssistantArtist
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
