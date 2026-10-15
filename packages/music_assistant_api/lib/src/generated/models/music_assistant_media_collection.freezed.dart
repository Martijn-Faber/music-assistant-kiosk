// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_media_collection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantMediaCollection {

/// itemId
@JsonKey(name: MusicAssistantMediaCollection.itemIdKey_) String get itemId;/// provider
@JsonKey(name: MusicAssistantMediaCollection.providerKey_) String get provider;/// name
@JsonKey(name: MusicAssistantMediaCollection.nameKey_) String get name;/// version
@JsonKey(name: MusicAssistantMediaCollection.versionKey_) String get version;/// sortName
@JsonKey(name: MusicAssistantMediaCollection.sortNameKey_) String? get sortName;/// uri
@JsonKey(name: MusicAssistantMediaCollection.uriKey_) String? get uri;/// externalIds
@JsonKey(name: MusicAssistantMediaCollection.externalIdsKey_) List<List<MusicAssistantExternalID>>? get externalIds;/// isPlayable
@JsonKey(name: MusicAssistantMediaCollection.isPlayableKey_) bool get isPlayable;/// mediaType
@JsonKey(name: MusicAssistantMediaCollection.mediaTypeKey_) MusicAssistantMediaType get mediaType;/// providerMappings
@JsonKey(name: MusicAssistantMediaCollection.providerMappingsKey_) List<MusicAssistantProviderMapping> get providerMappings;/// metadata
@JsonKey(name: MusicAssistantMediaCollection.metadataKey_) MusicAssistantMediaItemMetadata? get metadata;/// favorite
@JsonKey(name: MusicAssistantMediaCollection.favoriteKey_) bool get favorite;/// position
@JsonKey(name: MusicAssistantMediaCollection.positionKey_) int? get position;/// dateAdded
@JsonKey(name: MusicAssistantMediaCollection.dateAddedKey_) DateTime? get dateAdded;/// items
@JsonKey(name: MusicAssistantMediaCollection.itemsKey_) List<Map<String, dynamic>>? get items;
/// Create a copy of MusicAssistantMediaCollection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantMediaCollectionCopyWith<MusicAssistantMediaCollection> get copyWith => _$MusicAssistantMediaCollectionCopyWithImpl<MusicAssistantMediaCollection>(this as MusicAssistantMediaCollection, _$identity);

  /// Serializes this MusicAssistantMediaCollection to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantMediaCollection&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.name, name) || other.name == name)&&(identical(other.version, version) || other.version == version)&&(identical(other.sortName, sortName) || other.sortName == sortName)&&(identical(other.uri, uri) || other.uri == uri)&&const DeepCollectionEquality().equals(other.externalIds, externalIds)&&(identical(other.isPlayable, isPlayable) || other.isPlayable == isPlayable)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&const DeepCollectionEquality().equals(other.providerMappings, providerMappings)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.favorite, favorite) || other.favorite == favorite)&&(identical(other.position, position) || other.position == position)&&(identical(other.dateAdded, dateAdded) || other.dateAdded == dateAdded)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,provider,name,version,sortName,uri,const DeepCollectionEquality().hash(externalIds),isPlayable,mediaType,const DeepCollectionEquality().hash(providerMappings),metadata,favorite,position,dateAdded,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'MusicAssistantMediaCollection(itemId: $itemId, provider: $provider, name: $name, version: $version, sortName: $sortName, uri: $uri, externalIds: $externalIds, isPlayable: $isPlayable, mediaType: $mediaType, providerMappings: $providerMappings, metadata: $metadata, favorite: $favorite, position: $position, dateAdded: $dateAdded, items: $items)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantMediaCollectionCopyWith<$Res>  {
  factory $MusicAssistantMediaCollectionCopyWith(MusicAssistantMediaCollection value, $Res Function(MusicAssistantMediaCollection) _then) = _$MusicAssistantMediaCollectionCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantMediaCollection.itemIdKey_) String itemId,@JsonKey(name: MusicAssistantMediaCollection.providerKey_) String provider,@JsonKey(name: MusicAssistantMediaCollection.nameKey_) String name,@JsonKey(name: MusicAssistantMediaCollection.versionKey_) String version,@JsonKey(name: MusicAssistantMediaCollection.sortNameKey_) String? sortName,@JsonKey(name: MusicAssistantMediaCollection.uriKey_) String? uri,@JsonKey(name: MusicAssistantMediaCollection.externalIdsKey_) List<List<MusicAssistantExternalID>>? externalIds,@JsonKey(name: MusicAssistantMediaCollection.isPlayableKey_) bool isPlayable,@JsonKey(name: MusicAssistantMediaCollection.mediaTypeKey_) MusicAssistantMediaType mediaType,@JsonKey(name: MusicAssistantMediaCollection.providerMappingsKey_) List<MusicAssistantProviderMapping> providerMappings,@JsonKey(name: MusicAssistantMediaCollection.metadataKey_) MusicAssistantMediaItemMetadata? metadata,@JsonKey(name: MusicAssistantMediaCollection.favoriteKey_) bool favorite,@JsonKey(name: MusicAssistantMediaCollection.positionKey_) int? position,@JsonKey(name: MusicAssistantMediaCollection.dateAddedKey_) DateTime? dateAdded,@JsonKey(name: MusicAssistantMediaCollection.itemsKey_) List<Map<String, dynamic>>? items
});


$MusicAssistantMediaItemMetadataCopyWith<$Res>? get metadata;

}
/// @nodoc
class _$MusicAssistantMediaCollectionCopyWithImpl<$Res>
    implements $MusicAssistantMediaCollectionCopyWith<$Res> {
  _$MusicAssistantMediaCollectionCopyWithImpl(this._self, this._then);

  final MusicAssistantMediaCollection _self;
  final $Res Function(MusicAssistantMediaCollection) _then;

/// Create a copy of MusicAssistantMediaCollection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itemId = null,Object? provider = null,Object? name = null,Object? version = null,Object? sortName = freezed,Object? uri = freezed,Object? externalIds = freezed,Object? isPlayable = null,Object? mediaType = null,Object? providerMappings = null,Object? metadata = freezed,Object? favorite = null,Object? position = freezed,Object? dateAdded = freezed,Object? items = freezed,}) {
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
as DateTime?,items: freezed == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>?,
  ));
}
/// Create a copy of MusicAssistantMediaCollection
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


/// Adds pattern-matching-related methods to [MusicAssistantMediaCollection].
extension MusicAssistantMediaCollectionPatterns on MusicAssistantMediaCollection {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantMediaCollection value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantMediaCollection() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantMediaCollection value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantMediaCollection():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantMediaCollection value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantMediaCollection() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantMediaCollection.itemIdKey_)  String itemId, @JsonKey(name: MusicAssistantMediaCollection.providerKey_)  String provider, @JsonKey(name: MusicAssistantMediaCollection.nameKey_)  String name, @JsonKey(name: MusicAssistantMediaCollection.versionKey_)  String version, @JsonKey(name: MusicAssistantMediaCollection.sortNameKey_)  String? sortName, @JsonKey(name: MusicAssistantMediaCollection.uriKey_)  String? uri, @JsonKey(name: MusicAssistantMediaCollection.externalIdsKey_)  List<List<MusicAssistantExternalID>>? externalIds, @JsonKey(name: MusicAssistantMediaCollection.isPlayableKey_)  bool isPlayable, @JsonKey(name: MusicAssistantMediaCollection.mediaTypeKey_)  MusicAssistantMediaType mediaType, @JsonKey(name: MusicAssistantMediaCollection.providerMappingsKey_)  List<MusicAssistantProviderMapping> providerMappings, @JsonKey(name: MusicAssistantMediaCollection.metadataKey_)  MusicAssistantMediaItemMetadata? metadata, @JsonKey(name: MusicAssistantMediaCollection.favoriteKey_)  bool favorite, @JsonKey(name: MusicAssistantMediaCollection.positionKey_)  int? position, @JsonKey(name: MusicAssistantMediaCollection.dateAddedKey_)  DateTime? dateAdded, @JsonKey(name: MusicAssistantMediaCollection.itemsKey_)  List<Map<String, dynamic>>? items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantMediaCollection() when $default != null:
return $default(_that.itemId,_that.provider,_that.name,_that.version,_that.sortName,_that.uri,_that.externalIds,_that.isPlayable,_that.mediaType,_that.providerMappings,_that.metadata,_that.favorite,_that.position,_that.dateAdded,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantMediaCollection.itemIdKey_)  String itemId, @JsonKey(name: MusicAssistantMediaCollection.providerKey_)  String provider, @JsonKey(name: MusicAssistantMediaCollection.nameKey_)  String name, @JsonKey(name: MusicAssistantMediaCollection.versionKey_)  String version, @JsonKey(name: MusicAssistantMediaCollection.sortNameKey_)  String? sortName, @JsonKey(name: MusicAssistantMediaCollection.uriKey_)  String? uri, @JsonKey(name: MusicAssistantMediaCollection.externalIdsKey_)  List<List<MusicAssistantExternalID>>? externalIds, @JsonKey(name: MusicAssistantMediaCollection.isPlayableKey_)  bool isPlayable, @JsonKey(name: MusicAssistantMediaCollection.mediaTypeKey_)  MusicAssistantMediaType mediaType, @JsonKey(name: MusicAssistantMediaCollection.providerMappingsKey_)  List<MusicAssistantProviderMapping> providerMappings, @JsonKey(name: MusicAssistantMediaCollection.metadataKey_)  MusicAssistantMediaItemMetadata? metadata, @JsonKey(name: MusicAssistantMediaCollection.favoriteKey_)  bool favorite, @JsonKey(name: MusicAssistantMediaCollection.positionKey_)  int? position, @JsonKey(name: MusicAssistantMediaCollection.dateAddedKey_)  DateTime? dateAdded, @JsonKey(name: MusicAssistantMediaCollection.itemsKey_)  List<Map<String, dynamic>>? items)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantMediaCollection():
return $default(_that.itemId,_that.provider,_that.name,_that.version,_that.sortName,_that.uri,_that.externalIds,_that.isPlayable,_that.mediaType,_that.providerMappings,_that.metadata,_that.favorite,_that.position,_that.dateAdded,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantMediaCollection.itemIdKey_)  String itemId, @JsonKey(name: MusicAssistantMediaCollection.providerKey_)  String provider, @JsonKey(name: MusicAssistantMediaCollection.nameKey_)  String name, @JsonKey(name: MusicAssistantMediaCollection.versionKey_)  String version, @JsonKey(name: MusicAssistantMediaCollection.sortNameKey_)  String? sortName, @JsonKey(name: MusicAssistantMediaCollection.uriKey_)  String? uri, @JsonKey(name: MusicAssistantMediaCollection.externalIdsKey_)  List<List<MusicAssistantExternalID>>? externalIds, @JsonKey(name: MusicAssistantMediaCollection.isPlayableKey_)  bool isPlayable, @JsonKey(name: MusicAssistantMediaCollection.mediaTypeKey_)  MusicAssistantMediaType mediaType, @JsonKey(name: MusicAssistantMediaCollection.providerMappingsKey_)  List<MusicAssistantProviderMapping> providerMappings, @JsonKey(name: MusicAssistantMediaCollection.metadataKey_)  MusicAssistantMediaItemMetadata? metadata, @JsonKey(name: MusicAssistantMediaCollection.favoriteKey_)  bool favorite, @JsonKey(name: MusicAssistantMediaCollection.positionKey_)  int? position, @JsonKey(name: MusicAssistantMediaCollection.dateAddedKey_)  DateTime? dateAdded, @JsonKey(name: MusicAssistantMediaCollection.itemsKey_)  List<Map<String, dynamic>>? items)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantMediaCollection() when $default != null:
return $default(_that.itemId,_that.provider,_that.name,_that.version,_that.sortName,_that.uri,_that.externalIds,_that.isPlayable,_that.mediaType,_that.providerMappings,_that.metadata,_that.favorite,_that.position,_that.dateAdded,_that.items);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantMediaCollection extends MusicAssistantMediaCollection {
  const _MusicAssistantMediaCollection({@JsonKey(name: MusicAssistantMediaCollection.itemIdKey_) required this.itemId, @JsonKey(name: MusicAssistantMediaCollection.providerKey_) required this.provider, @JsonKey(name: MusicAssistantMediaCollection.nameKey_) required this.name, @JsonKey(name: MusicAssistantMediaCollection.versionKey_) this.version = '', @JsonKey(name: MusicAssistantMediaCollection.sortNameKey_) this.sortName, @JsonKey(name: MusicAssistantMediaCollection.uriKey_) this.uri, @JsonKey(name: MusicAssistantMediaCollection.externalIdsKey_) final  List<List<MusicAssistantExternalID>>? externalIds, @JsonKey(name: MusicAssistantMediaCollection.isPlayableKey_) this.isPlayable = true, @JsonKey(name: MusicAssistantMediaCollection.mediaTypeKey_) this.mediaType = MusicAssistantMediaType.collection, @JsonKey(name: MusicAssistantMediaCollection.providerMappingsKey_) required final  List<MusicAssistantProviderMapping> providerMappings, @JsonKey(name: MusicAssistantMediaCollection.metadataKey_) this.metadata, @JsonKey(name: MusicAssistantMediaCollection.favoriteKey_) this.favorite = false, @JsonKey(name: MusicAssistantMediaCollection.positionKey_) this.position, @JsonKey(name: MusicAssistantMediaCollection.dateAddedKey_) this.dateAdded, @JsonKey(name: MusicAssistantMediaCollection.itemsKey_) final  List<Map<String, dynamic>>? items}): _externalIds = externalIds,_providerMappings = providerMappings,_items = items,super._();
  factory _MusicAssistantMediaCollection.fromJson(Map<String, dynamic> json) => _$MusicAssistantMediaCollectionFromJson(json);

/// itemId
@override@JsonKey(name: MusicAssistantMediaCollection.itemIdKey_) final  String itemId;
/// provider
@override@JsonKey(name: MusicAssistantMediaCollection.providerKey_) final  String provider;
/// name
@override@JsonKey(name: MusicAssistantMediaCollection.nameKey_) final  String name;
/// version
@override@JsonKey(name: MusicAssistantMediaCollection.versionKey_) final  String version;
/// sortName
@override@JsonKey(name: MusicAssistantMediaCollection.sortNameKey_) final  String? sortName;
/// uri
@override@JsonKey(name: MusicAssistantMediaCollection.uriKey_) final  String? uri;
/// externalIds
 final  List<List<MusicAssistantExternalID>>? _externalIds;
/// externalIds
@override@JsonKey(name: MusicAssistantMediaCollection.externalIdsKey_) List<List<MusicAssistantExternalID>>? get externalIds {
  final value = _externalIds;
  if (value == null) return null;
  if (_externalIds is EqualUnmodifiableListView) return _externalIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// isPlayable
@override@JsonKey(name: MusicAssistantMediaCollection.isPlayableKey_) final  bool isPlayable;
/// mediaType
@override@JsonKey(name: MusicAssistantMediaCollection.mediaTypeKey_) final  MusicAssistantMediaType mediaType;
/// providerMappings
 final  List<MusicAssistantProviderMapping> _providerMappings;
/// providerMappings
@override@JsonKey(name: MusicAssistantMediaCollection.providerMappingsKey_) List<MusicAssistantProviderMapping> get providerMappings {
  if (_providerMappings is EqualUnmodifiableListView) return _providerMappings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_providerMappings);
}

/// metadata
@override@JsonKey(name: MusicAssistantMediaCollection.metadataKey_) final  MusicAssistantMediaItemMetadata? metadata;
/// favorite
@override@JsonKey(name: MusicAssistantMediaCollection.favoriteKey_) final  bool favorite;
/// position
@override@JsonKey(name: MusicAssistantMediaCollection.positionKey_) final  int? position;
/// dateAdded
@override@JsonKey(name: MusicAssistantMediaCollection.dateAddedKey_) final  DateTime? dateAdded;
/// items
 final  List<Map<String, dynamic>>? _items;
/// items
@override@JsonKey(name: MusicAssistantMediaCollection.itemsKey_) List<Map<String, dynamic>>? get items {
  final value = _items;
  if (value == null) return null;
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of MusicAssistantMediaCollection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantMediaCollectionCopyWith<_MusicAssistantMediaCollection> get copyWith => __$MusicAssistantMediaCollectionCopyWithImpl<_MusicAssistantMediaCollection>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantMediaCollectionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantMediaCollection&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.name, name) || other.name == name)&&(identical(other.version, version) || other.version == version)&&(identical(other.sortName, sortName) || other.sortName == sortName)&&(identical(other.uri, uri) || other.uri == uri)&&const DeepCollectionEquality().equals(other._externalIds, _externalIds)&&(identical(other.isPlayable, isPlayable) || other.isPlayable == isPlayable)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&const DeepCollectionEquality().equals(other._providerMappings, _providerMappings)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.favorite, favorite) || other.favorite == favorite)&&(identical(other.position, position) || other.position == position)&&(identical(other.dateAdded, dateAdded) || other.dateAdded == dateAdded)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,provider,name,version,sortName,uri,const DeepCollectionEquality().hash(_externalIds),isPlayable,mediaType,const DeepCollectionEquality().hash(_providerMappings),metadata,favorite,position,dateAdded,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'MusicAssistantMediaCollection(itemId: $itemId, provider: $provider, name: $name, version: $version, sortName: $sortName, uri: $uri, externalIds: $externalIds, isPlayable: $isPlayable, mediaType: $mediaType, providerMappings: $providerMappings, metadata: $metadata, favorite: $favorite, position: $position, dateAdded: $dateAdded, items: $items)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantMediaCollectionCopyWith<$Res> implements $MusicAssistantMediaCollectionCopyWith<$Res> {
  factory _$MusicAssistantMediaCollectionCopyWith(_MusicAssistantMediaCollection value, $Res Function(_MusicAssistantMediaCollection) _then) = __$MusicAssistantMediaCollectionCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantMediaCollection.itemIdKey_) String itemId,@JsonKey(name: MusicAssistantMediaCollection.providerKey_) String provider,@JsonKey(name: MusicAssistantMediaCollection.nameKey_) String name,@JsonKey(name: MusicAssistantMediaCollection.versionKey_) String version,@JsonKey(name: MusicAssistantMediaCollection.sortNameKey_) String? sortName,@JsonKey(name: MusicAssistantMediaCollection.uriKey_) String? uri,@JsonKey(name: MusicAssistantMediaCollection.externalIdsKey_) List<List<MusicAssistantExternalID>>? externalIds,@JsonKey(name: MusicAssistantMediaCollection.isPlayableKey_) bool isPlayable,@JsonKey(name: MusicAssistantMediaCollection.mediaTypeKey_) MusicAssistantMediaType mediaType,@JsonKey(name: MusicAssistantMediaCollection.providerMappingsKey_) List<MusicAssistantProviderMapping> providerMappings,@JsonKey(name: MusicAssistantMediaCollection.metadataKey_) MusicAssistantMediaItemMetadata? metadata,@JsonKey(name: MusicAssistantMediaCollection.favoriteKey_) bool favorite,@JsonKey(name: MusicAssistantMediaCollection.positionKey_) int? position,@JsonKey(name: MusicAssistantMediaCollection.dateAddedKey_) DateTime? dateAdded,@JsonKey(name: MusicAssistantMediaCollection.itemsKey_) List<Map<String, dynamic>>? items
});


@override $MusicAssistantMediaItemMetadataCopyWith<$Res>? get metadata;

}
/// @nodoc
class __$MusicAssistantMediaCollectionCopyWithImpl<$Res>
    implements _$MusicAssistantMediaCollectionCopyWith<$Res> {
  __$MusicAssistantMediaCollectionCopyWithImpl(this._self, this._then);

  final _MusicAssistantMediaCollection _self;
  final $Res Function(_MusicAssistantMediaCollection) _then;

/// Create a copy of MusicAssistantMediaCollection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itemId = null,Object? provider = null,Object? name = null,Object? version = null,Object? sortName = freezed,Object? uri = freezed,Object? externalIds = freezed,Object? isPlayable = null,Object? mediaType = null,Object? providerMappings = null,Object? metadata = freezed,Object? favorite = null,Object? position = freezed,Object? dateAdded = freezed,Object? items = freezed,}) {
  return _then(_MusicAssistantMediaCollection(
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
as DateTime?,items: freezed == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>?,
  ));
}

/// Create a copy of MusicAssistantMediaCollection
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
