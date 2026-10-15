// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_playlist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantPlaylist {

/// itemId
@JsonKey(name: MusicAssistantPlaylist.itemIdKey_) String get itemId;/// provider
@JsonKey(name: MusicAssistantPlaylist.providerKey_) String get provider;/// name
@JsonKey(name: MusicAssistantPlaylist.nameKey_) String get name;/// version
@JsonKey(name: MusicAssistantPlaylist.versionKey_) String get version;/// sortName
@JsonKey(name: MusicAssistantPlaylist.sortNameKey_) String? get sortName;/// uri
@JsonKey(name: MusicAssistantPlaylist.uriKey_) String? get uri;/// externalIds
@JsonKey(name: MusicAssistantPlaylist.externalIdsKey_) List<List<MusicAssistantExternalID>>? get externalIds;/// isPlayable
@JsonKey(name: MusicAssistantPlaylist.isPlayableKey_) bool get isPlayable;/// mediaType
@JsonKey(name: MusicAssistantPlaylist.mediaTypeKey_) MusicAssistantMediaType get mediaType;/// providerMappings
@JsonKey(name: MusicAssistantPlaylist.providerMappingsKey_) List<MusicAssistantProviderMapping> get providerMappings;/// metadata
@JsonKey(name: MusicAssistantPlaylist.metadataKey_) MusicAssistantMediaItemMetadata? get metadata;/// favorite
@JsonKey(name: MusicAssistantPlaylist.favoriteKey_) bool get favorite;/// position
@JsonKey(name: MusicAssistantPlaylist.positionKey_) int? get position;/// dateAdded
@JsonKey(name: MusicAssistantPlaylist.dateAddedKey_) DateTime? get dateAdded;/// translationKey
@JsonKey(name: MusicAssistantPlaylist.translationKeyKey_) String? get translationKey;/// translationParams
@JsonKey(name: MusicAssistantPlaylist.translationParamsKey_) List<String>? get translationParams;/// owner
@JsonKey(name: MusicAssistantPlaylist.ownerKey_) String get owner;/// isEditable
@JsonKey(name: MusicAssistantPlaylist.isEditableKey_) bool get isEditable;/// isDynamic
@JsonKey(name: MusicAssistantPlaylist.isDynamicKey_) bool get isDynamic;/// supportedMediatypes
@JsonKey(name: MusicAssistantPlaylist.supportedMediatypesKey_) List<MusicAssistantMediaType>? get supportedMediatypes;
/// Create a copy of MusicAssistantPlaylist
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantPlaylistCopyWith<MusicAssistantPlaylist> get copyWith => _$MusicAssistantPlaylistCopyWithImpl<MusicAssistantPlaylist>(this as MusicAssistantPlaylist, _$identity);

  /// Serializes this MusicAssistantPlaylist to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantPlaylist&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.name, name) || other.name == name)&&(identical(other.version, version) || other.version == version)&&(identical(other.sortName, sortName) || other.sortName == sortName)&&(identical(other.uri, uri) || other.uri == uri)&&const DeepCollectionEquality().equals(other.externalIds, externalIds)&&(identical(other.isPlayable, isPlayable) || other.isPlayable == isPlayable)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&const DeepCollectionEquality().equals(other.providerMappings, providerMappings)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.favorite, favorite) || other.favorite == favorite)&&(identical(other.position, position) || other.position == position)&&(identical(other.dateAdded, dateAdded) || other.dateAdded == dateAdded)&&(identical(other.translationKey, translationKey) || other.translationKey == translationKey)&&const DeepCollectionEquality().equals(other.translationParams, translationParams)&&(identical(other.owner, owner) || other.owner == owner)&&(identical(other.isEditable, isEditable) || other.isEditable == isEditable)&&(identical(other.isDynamic, isDynamic) || other.isDynamic == isDynamic)&&const DeepCollectionEquality().equals(other.supportedMediatypes, supportedMediatypes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,itemId,provider,name,version,sortName,uri,const DeepCollectionEquality().hash(externalIds),isPlayable,mediaType,const DeepCollectionEquality().hash(providerMappings),metadata,favorite,position,dateAdded,translationKey,const DeepCollectionEquality().hash(translationParams),owner,isEditable,isDynamic,const DeepCollectionEquality().hash(supportedMediatypes)]);

@override
String toString() {
  return 'MusicAssistantPlaylist(itemId: $itemId, provider: $provider, name: $name, version: $version, sortName: $sortName, uri: $uri, externalIds: $externalIds, isPlayable: $isPlayable, mediaType: $mediaType, providerMappings: $providerMappings, metadata: $metadata, favorite: $favorite, position: $position, dateAdded: $dateAdded, translationKey: $translationKey, translationParams: $translationParams, owner: $owner, isEditable: $isEditable, isDynamic: $isDynamic, supportedMediatypes: $supportedMediatypes)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantPlaylistCopyWith<$Res>  {
  factory $MusicAssistantPlaylistCopyWith(MusicAssistantPlaylist value, $Res Function(MusicAssistantPlaylist) _then) = _$MusicAssistantPlaylistCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantPlaylist.itemIdKey_) String itemId,@JsonKey(name: MusicAssistantPlaylist.providerKey_) String provider,@JsonKey(name: MusicAssistantPlaylist.nameKey_) String name,@JsonKey(name: MusicAssistantPlaylist.versionKey_) String version,@JsonKey(name: MusicAssistantPlaylist.sortNameKey_) String? sortName,@JsonKey(name: MusicAssistantPlaylist.uriKey_) String? uri,@JsonKey(name: MusicAssistantPlaylist.externalIdsKey_) List<List<MusicAssistantExternalID>>? externalIds,@JsonKey(name: MusicAssistantPlaylist.isPlayableKey_) bool isPlayable,@JsonKey(name: MusicAssistantPlaylist.mediaTypeKey_) MusicAssistantMediaType mediaType,@JsonKey(name: MusicAssistantPlaylist.providerMappingsKey_) List<MusicAssistantProviderMapping> providerMappings,@JsonKey(name: MusicAssistantPlaylist.metadataKey_) MusicAssistantMediaItemMetadata? metadata,@JsonKey(name: MusicAssistantPlaylist.favoriteKey_) bool favorite,@JsonKey(name: MusicAssistantPlaylist.positionKey_) int? position,@JsonKey(name: MusicAssistantPlaylist.dateAddedKey_) DateTime? dateAdded,@JsonKey(name: MusicAssistantPlaylist.translationKeyKey_) String? translationKey,@JsonKey(name: MusicAssistantPlaylist.translationParamsKey_) List<String>? translationParams,@JsonKey(name: MusicAssistantPlaylist.ownerKey_) String owner,@JsonKey(name: MusicAssistantPlaylist.isEditableKey_) bool isEditable,@JsonKey(name: MusicAssistantPlaylist.isDynamicKey_) bool isDynamic,@JsonKey(name: MusicAssistantPlaylist.supportedMediatypesKey_) List<MusicAssistantMediaType>? supportedMediatypes
});


$MusicAssistantMediaItemMetadataCopyWith<$Res>? get metadata;

}
/// @nodoc
class _$MusicAssistantPlaylistCopyWithImpl<$Res>
    implements $MusicAssistantPlaylistCopyWith<$Res> {
  _$MusicAssistantPlaylistCopyWithImpl(this._self, this._then);

  final MusicAssistantPlaylist _self;
  final $Res Function(MusicAssistantPlaylist) _then;

/// Create a copy of MusicAssistantPlaylist
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itemId = null,Object? provider = null,Object? name = null,Object? version = null,Object? sortName = freezed,Object? uri = freezed,Object? externalIds = freezed,Object? isPlayable = null,Object? mediaType = null,Object? providerMappings = null,Object? metadata = freezed,Object? favorite = null,Object? position = freezed,Object? dateAdded = freezed,Object? translationKey = freezed,Object? translationParams = freezed,Object? owner = null,Object? isEditable = null,Object? isDynamic = null,Object? supportedMediatypes = freezed,}) {
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
as DateTime?,translationKey: freezed == translationKey ? _self.translationKey : translationKey // ignore: cast_nullable_to_non_nullable
as String?,translationParams: freezed == translationParams ? _self.translationParams : translationParams // ignore: cast_nullable_to_non_nullable
as List<String>?,owner: null == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as String,isEditable: null == isEditable ? _self.isEditable : isEditable // ignore: cast_nullable_to_non_nullable
as bool,isDynamic: null == isDynamic ? _self.isDynamic : isDynamic // ignore: cast_nullable_to_non_nullable
as bool,supportedMediatypes: freezed == supportedMediatypes ? _self.supportedMediatypes : supportedMediatypes // ignore: cast_nullable_to_non_nullable
as List<MusicAssistantMediaType>?,
  ));
}
/// Create a copy of MusicAssistantPlaylist
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


/// Adds pattern-matching-related methods to [MusicAssistantPlaylist].
extension MusicAssistantPlaylistPatterns on MusicAssistantPlaylist {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantPlaylist value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantPlaylist() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantPlaylist value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantPlaylist():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantPlaylist value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantPlaylist() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantPlaylist.itemIdKey_)  String itemId, @JsonKey(name: MusicAssistantPlaylist.providerKey_)  String provider, @JsonKey(name: MusicAssistantPlaylist.nameKey_)  String name, @JsonKey(name: MusicAssistantPlaylist.versionKey_)  String version, @JsonKey(name: MusicAssistantPlaylist.sortNameKey_)  String? sortName, @JsonKey(name: MusicAssistantPlaylist.uriKey_)  String? uri, @JsonKey(name: MusicAssistantPlaylist.externalIdsKey_)  List<List<MusicAssistantExternalID>>? externalIds, @JsonKey(name: MusicAssistantPlaylist.isPlayableKey_)  bool isPlayable, @JsonKey(name: MusicAssistantPlaylist.mediaTypeKey_)  MusicAssistantMediaType mediaType, @JsonKey(name: MusicAssistantPlaylist.providerMappingsKey_)  List<MusicAssistantProviderMapping> providerMappings, @JsonKey(name: MusicAssistantPlaylist.metadataKey_)  MusicAssistantMediaItemMetadata? metadata, @JsonKey(name: MusicAssistantPlaylist.favoriteKey_)  bool favorite, @JsonKey(name: MusicAssistantPlaylist.positionKey_)  int? position, @JsonKey(name: MusicAssistantPlaylist.dateAddedKey_)  DateTime? dateAdded, @JsonKey(name: MusicAssistantPlaylist.translationKeyKey_)  String? translationKey, @JsonKey(name: MusicAssistantPlaylist.translationParamsKey_)  List<String>? translationParams, @JsonKey(name: MusicAssistantPlaylist.ownerKey_)  String owner, @JsonKey(name: MusicAssistantPlaylist.isEditableKey_)  bool isEditable, @JsonKey(name: MusicAssistantPlaylist.isDynamicKey_)  bool isDynamic, @JsonKey(name: MusicAssistantPlaylist.supportedMediatypesKey_)  List<MusicAssistantMediaType>? supportedMediatypes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantPlaylist() when $default != null:
return $default(_that.itemId,_that.provider,_that.name,_that.version,_that.sortName,_that.uri,_that.externalIds,_that.isPlayable,_that.mediaType,_that.providerMappings,_that.metadata,_that.favorite,_that.position,_that.dateAdded,_that.translationKey,_that.translationParams,_that.owner,_that.isEditable,_that.isDynamic,_that.supportedMediatypes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantPlaylist.itemIdKey_)  String itemId, @JsonKey(name: MusicAssistantPlaylist.providerKey_)  String provider, @JsonKey(name: MusicAssistantPlaylist.nameKey_)  String name, @JsonKey(name: MusicAssistantPlaylist.versionKey_)  String version, @JsonKey(name: MusicAssistantPlaylist.sortNameKey_)  String? sortName, @JsonKey(name: MusicAssistantPlaylist.uriKey_)  String? uri, @JsonKey(name: MusicAssistantPlaylist.externalIdsKey_)  List<List<MusicAssistantExternalID>>? externalIds, @JsonKey(name: MusicAssistantPlaylist.isPlayableKey_)  bool isPlayable, @JsonKey(name: MusicAssistantPlaylist.mediaTypeKey_)  MusicAssistantMediaType mediaType, @JsonKey(name: MusicAssistantPlaylist.providerMappingsKey_)  List<MusicAssistantProviderMapping> providerMappings, @JsonKey(name: MusicAssistantPlaylist.metadataKey_)  MusicAssistantMediaItemMetadata? metadata, @JsonKey(name: MusicAssistantPlaylist.favoriteKey_)  bool favorite, @JsonKey(name: MusicAssistantPlaylist.positionKey_)  int? position, @JsonKey(name: MusicAssistantPlaylist.dateAddedKey_)  DateTime? dateAdded, @JsonKey(name: MusicAssistantPlaylist.translationKeyKey_)  String? translationKey, @JsonKey(name: MusicAssistantPlaylist.translationParamsKey_)  List<String>? translationParams, @JsonKey(name: MusicAssistantPlaylist.ownerKey_)  String owner, @JsonKey(name: MusicAssistantPlaylist.isEditableKey_)  bool isEditable, @JsonKey(name: MusicAssistantPlaylist.isDynamicKey_)  bool isDynamic, @JsonKey(name: MusicAssistantPlaylist.supportedMediatypesKey_)  List<MusicAssistantMediaType>? supportedMediatypes)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantPlaylist():
return $default(_that.itemId,_that.provider,_that.name,_that.version,_that.sortName,_that.uri,_that.externalIds,_that.isPlayable,_that.mediaType,_that.providerMappings,_that.metadata,_that.favorite,_that.position,_that.dateAdded,_that.translationKey,_that.translationParams,_that.owner,_that.isEditable,_that.isDynamic,_that.supportedMediatypes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantPlaylist.itemIdKey_)  String itemId, @JsonKey(name: MusicAssistantPlaylist.providerKey_)  String provider, @JsonKey(name: MusicAssistantPlaylist.nameKey_)  String name, @JsonKey(name: MusicAssistantPlaylist.versionKey_)  String version, @JsonKey(name: MusicAssistantPlaylist.sortNameKey_)  String? sortName, @JsonKey(name: MusicAssistantPlaylist.uriKey_)  String? uri, @JsonKey(name: MusicAssistantPlaylist.externalIdsKey_)  List<List<MusicAssistantExternalID>>? externalIds, @JsonKey(name: MusicAssistantPlaylist.isPlayableKey_)  bool isPlayable, @JsonKey(name: MusicAssistantPlaylist.mediaTypeKey_)  MusicAssistantMediaType mediaType, @JsonKey(name: MusicAssistantPlaylist.providerMappingsKey_)  List<MusicAssistantProviderMapping> providerMappings, @JsonKey(name: MusicAssistantPlaylist.metadataKey_)  MusicAssistantMediaItemMetadata? metadata, @JsonKey(name: MusicAssistantPlaylist.favoriteKey_)  bool favorite, @JsonKey(name: MusicAssistantPlaylist.positionKey_)  int? position, @JsonKey(name: MusicAssistantPlaylist.dateAddedKey_)  DateTime? dateAdded, @JsonKey(name: MusicAssistantPlaylist.translationKeyKey_)  String? translationKey, @JsonKey(name: MusicAssistantPlaylist.translationParamsKey_)  List<String>? translationParams, @JsonKey(name: MusicAssistantPlaylist.ownerKey_)  String owner, @JsonKey(name: MusicAssistantPlaylist.isEditableKey_)  bool isEditable, @JsonKey(name: MusicAssistantPlaylist.isDynamicKey_)  bool isDynamic, @JsonKey(name: MusicAssistantPlaylist.supportedMediatypesKey_)  List<MusicAssistantMediaType>? supportedMediatypes)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantPlaylist() when $default != null:
return $default(_that.itemId,_that.provider,_that.name,_that.version,_that.sortName,_that.uri,_that.externalIds,_that.isPlayable,_that.mediaType,_that.providerMappings,_that.metadata,_that.favorite,_that.position,_that.dateAdded,_that.translationKey,_that.translationParams,_that.owner,_that.isEditable,_that.isDynamic,_that.supportedMediatypes);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantPlaylist extends MusicAssistantPlaylist {
  const _MusicAssistantPlaylist({@JsonKey(name: MusicAssistantPlaylist.itemIdKey_) required this.itemId, @JsonKey(name: MusicAssistantPlaylist.providerKey_) required this.provider, @JsonKey(name: MusicAssistantPlaylist.nameKey_) required this.name, @JsonKey(name: MusicAssistantPlaylist.versionKey_) this.version = '', @JsonKey(name: MusicAssistantPlaylist.sortNameKey_) this.sortName, @JsonKey(name: MusicAssistantPlaylist.uriKey_) this.uri, @JsonKey(name: MusicAssistantPlaylist.externalIdsKey_) final  List<List<MusicAssistantExternalID>>? externalIds, @JsonKey(name: MusicAssistantPlaylist.isPlayableKey_) this.isPlayable = true, @JsonKey(name: MusicAssistantPlaylist.mediaTypeKey_) this.mediaType = MusicAssistantMediaType.playlist, @JsonKey(name: MusicAssistantPlaylist.providerMappingsKey_) required final  List<MusicAssistantProviderMapping> providerMappings, @JsonKey(name: MusicAssistantPlaylist.metadataKey_) this.metadata, @JsonKey(name: MusicAssistantPlaylist.favoriteKey_) this.favorite = false, @JsonKey(name: MusicAssistantPlaylist.positionKey_) this.position, @JsonKey(name: MusicAssistantPlaylist.dateAddedKey_) this.dateAdded, @JsonKey(name: MusicAssistantPlaylist.translationKeyKey_) this.translationKey, @JsonKey(name: MusicAssistantPlaylist.translationParamsKey_) final  List<String>? translationParams, @JsonKey(name: MusicAssistantPlaylist.ownerKey_) this.owner = '', @JsonKey(name: MusicAssistantPlaylist.isEditableKey_) this.isEditable = false, @JsonKey(name: MusicAssistantPlaylist.isDynamicKey_) this.isDynamic = false, @JsonKey(name: MusicAssistantPlaylist.supportedMediatypesKey_) final  List<MusicAssistantMediaType>? supportedMediatypes}): _externalIds = externalIds,_providerMappings = providerMappings,_translationParams = translationParams,_supportedMediatypes = supportedMediatypes,super._();
  factory _MusicAssistantPlaylist.fromJson(Map<String, dynamic> json) => _$MusicAssistantPlaylistFromJson(json);

/// itemId
@override@JsonKey(name: MusicAssistantPlaylist.itemIdKey_) final  String itemId;
/// provider
@override@JsonKey(name: MusicAssistantPlaylist.providerKey_) final  String provider;
/// name
@override@JsonKey(name: MusicAssistantPlaylist.nameKey_) final  String name;
/// version
@override@JsonKey(name: MusicAssistantPlaylist.versionKey_) final  String version;
/// sortName
@override@JsonKey(name: MusicAssistantPlaylist.sortNameKey_) final  String? sortName;
/// uri
@override@JsonKey(name: MusicAssistantPlaylist.uriKey_) final  String? uri;
/// externalIds
 final  List<List<MusicAssistantExternalID>>? _externalIds;
/// externalIds
@override@JsonKey(name: MusicAssistantPlaylist.externalIdsKey_) List<List<MusicAssistantExternalID>>? get externalIds {
  final value = _externalIds;
  if (value == null) return null;
  if (_externalIds is EqualUnmodifiableListView) return _externalIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// isPlayable
@override@JsonKey(name: MusicAssistantPlaylist.isPlayableKey_) final  bool isPlayable;
/// mediaType
@override@JsonKey(name: MusicAssistantPlaylist.mediaTypeKey_) final  MusicAssistantMediaType mediaType;
/// providerMappings
 final  List<MusicAssistantProviderMapping> _providerMappings;
/// providerMappings
@override@JsonKey(name: MusicAssistantPlaylist.providerMappingsKey_) List<MusicAssistantProviderMapping> get providerMappings {
  if (_providerMappings is EqualUnmodifiableListView) return _providerMappings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_providerMappings);
}

/// metadata
@override@JsonKey(name: MusicAssistantPlaylist.metadataKey_) final  MusicAssistantMediaItemMetadata? metadata;
/// favorite
@override@JsonKey(name: MusicAssistantPlaylist.favoriteKey_) final  bool favorite;
/// position
@override@JsonKey(name: MusicAssistantPlaylist.positionKey_) final  int? position;
/// dateAdded
@override@JsonKey(name: MusicAssistantPlaylist.dateAddedKey_) final  DateTime? dateAdded;
/// translationKey
@override@JsonKey(name: MusicAssistantPlaylist.translationKeyKey_) final  String? translationKey;
/// translationParams
 final  List<String>? _translationParams;
/// translationParams
@override@JsonKey(name: MusicAssistantPlaylist.translationParamsKey_) List<String>? get translationParams {
  final value = _translationParams;
  if (value == null) return null;
  if (_translationParams is EqualUnmodifiableListView) return _translationParams;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// owner
@override@JsonKey(name: MusicAssistantPlaylist.ownerKey_) final  String owner;
/// isEditable
@override@JsonKey(name: MusicAssistantPlaylist.isEditableKey_) final  bool isEditable;
/// isDynamic
@override@JsonKey(name: MusicAssistantPlaylist.isDynamicKey_) final  bool isDynamic;
/// supportedMediatypes
 final  List<MusicAssistantMediaType>? _supportedMediatypes;
/// supportedMediatypes
@override@JsonKey(name: MusicAssistantPlaylist.supportedMediatypesKey_) List<MusicAssistantMediaType>? get supportedMediatypes {
  final value = _supportedMediatypes;
  if (value == null) return null;
  if (_supportedMediatypes is EqualUnmodifiableListView) return _supportedMediatypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of MusicAssistantPlaylist
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantPlaylistCopyWith<_MusicAssistantPlaylist> get copyWith => __$MusicAssistantPlaylistCopyWithImpl<_MusicAssistantPlaylist>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantPlaylistToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantPlaylist&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.name, name) || other.name == name)&&(identical(other.version, version) || other.version == version)&&(identical(other.sortName, sortName) || other.sortName == sortName)&&(identical(other.uri, uri) || other.uri == uri)&&const DeepCollectionEquality().equals(other._externalIds, _externalIds)&&(identical(other.isPlayable, isPlayable) || other.isPlayable == isPlayable)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&const DeepCollectionEquality().equals(other._providerMappings, _providerMappings)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.favorite, favorite) || other.favorite == favorite)&&(identical(other.position, position) || other.position == position)&&(identical(other.dateAdded, dateAdded) || other.dateAdded == dateAdded)&&(identical(other.translationKey, translationKey) || other.translationKey == translationKey)&&const DeepCollectionEquality().equals(other._translationParams, _translationParams)&&(identical(other.owner, owner) || other.owner == owner)&&(identical(other.isEditable, isEditable) || other.isEditable == isEditable)&&(identical(other.isDynamic, isDynamic) || other.isDynamic == isDynamic)&&const DeepCollectionEquality().equals(other._supportedMediatypes, _supportedMediatypes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,itemId,provider,name,version,sortName,uri,const DeepCollectionEquality().hash(_externalIds),isPlayable,mediaType,const DeepCollectionEquality().hash(_providerMappings),metadata,favorite,position,dateAdded,translationKey,const DeepCollectionEquality().hash(_translationParams),owner,isEditable,isDynamic,const DeepCollectionEquality().hash(_supportedMediatypes)]);

@override
String toString() {
  return 'MusicAssistantPlaylist(itemId: $itemId, provider: $provider, name: $name, version: $version, sortName: $sortName, uri: $uri, externalIds: $externalIds, isPlayable: $isPlayable, mediaType: $mediaType, providerMappings: $providerMappings, metadata: $metadata, favorite: $favorite, position: $position, dateAdded: $dateAdded, translationKey: $translationKey, translationParams: $translationParams, owner: $owner, isEditable: $isEditable, isDynamic: $isDynamic, supportedMediatypes: $supportedMediatypes)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantPlaylistCopyWith<$Res> implements $MusicAssistantPlaylistCopyWith<$Res> {
  factory _$MusicAssistantPlaylistCopyWith(_MusicAssistantPlaylist value, $Res Function(_MusicAssistantPlaylist) _then) = __$MusicAssistantPlaylistCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantPlaylist.itemIdKey_) String itemId,@JsonKey(name: MusicAssistantPlaylist.providerKey_) String provider,@JsonKey(name: MusicAssistantPlaylist.nameKey_) String name,@JsonKey(name: MusicAssistantPlaylist.versionKey_) String version,@JsonKey(name: MusicAssistantPlaylist.sortNameKey_) String? sortName,@JsonKey(name: MusicAssistantPlaylist.uriKey_) String? uri,@JsonKey(name: MusicAssistantPlaylist.externalIdsKey_) List<List<MusicAssistantExternalID>>? externalIds,@JsonKey(name: MusicAssistantPlaylist.isPlayableKey_) bool isPlayable,@JsonKey(name: MusicAssistantPlaylist.mediaTypeKey_) MusicAssistantMediaType mediaType,@JsonKey(name: MusicAssistantPlaylist.providerMappingsKey_) List<MusicAssistantProviderMapping> providerMappings,@JsonKey(name: MusicAssistantPlaylist.metadataKey_) MusicAssistantMediaItemMetadata? metadata,@JsonKey(name: MusicAssistantPlaylist.favoriteKey_) bool favorite,@JsonKey(name: MusicAssistantPlaylist.positionKey_) int? position,@JsonKey(name: MusicAssistantPlaylist.dateAddedKey_) DateTime? dateAdded,@JsonKey(name: MusicAssistantPlaylist.translationKeyKey_) String? translationKey,@JsonKey(name: MusicAssistantPlaylist.translationParamsKey_) List<String>? translationParams,@JsonKey(name: MusicAssistantPlaylist.ownerKey_) String owner,@JsonKey(name: MusicAssistantPlaylist.isEditableKey_) bool isEditable,@JsonKey(name: MusicAssistantPlaylist.isDynamicKey_) bool isDynamic,@JsonKey(name: MusicAssistantPlaylist.supportedMediatypesKey_) List<MusicAssistantMediaType>? supportedMediatypes
});


@override $MusicAssistantMediaItemMetadataCopyWith<$Res>? get metadata;

}
/// @nodoc
class __$MusicAssistantPlaylistCopyWithImpl<$Res>
    implements _$MusicAssistantPlaylistCopyWith<$Res> {
  __$MusicAssistantPlaylistCopyWithImpl(this._self, this._then);

  final _MusicAssistantPlaylist _self;
  final $Res Function(_MusicAssistantPlaylist) _then;

/// Create a copy of MusicAssistantPlaylist
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itemId = null,Object? provider = null,Object? name = null,Object? version = null,Object? sortName = freezed,Object? uri = freezed,Object? externalIds = freezed,Object? isPlayable = null,Object? mediaType = null,Object? providerMappings = null,Object? metadata = freezed,Object? favorite = null,Object? position = freezed,Object? dateAdded = freezed,Object? translationKey = freezed,Object? translationParams = freezed,Object? owner = null,Object? isEditable = null,Object? isDynamic = null,Object? supportedMediatypes = freezed,}) {
  return _then(_MusicAssistantPlaylist(
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
as DateTime?,translationKey: freezed == translationKey ? _self.translationKey : translationKey // ignore: cast_nullable_to_non_nullable
as String?,translationParams: freezed == translationParams ? _self._translationParams : translationParams // ignore: cast_nullable_to_non_nullable
as List<String>?,owner: null == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as String,isEditable: null == isEditable ? _self.isEditable : isEditable // ignore: cast_nullable_to_non_nullable
as bool,isDynamic: null == isDynamic ? _self.isDynamic : isDynamic // ignore: cast_nullable_to_non_nullable
as bool,supportedMediatypes: freezed == supportedMediatypes ? _self._supportedMediatypes : supportedMediatypes // ignore: cast_nullable_to_non_nullable
as List<MusicAssistantMediaType>?,
  ));
}

/// Create a copy of MusicAssistantPlaylist
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
