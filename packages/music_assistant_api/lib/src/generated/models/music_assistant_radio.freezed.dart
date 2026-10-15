// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_radio.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantRadio {

/// itemId
@JsonKey(name: MusicAssistantRadio.itemIdKey_) String get itemId;/// provider
@JsonKey(name: MusicAssistantRadio.providerKey_) String get provider;/// name
@JsonKey(name: MusicAssistantRadio.nameKey_) String get name;/// version
@JsonKey(name: MusicAssistantRadio.versionKey_) String get version;/// sortName
@JsonKey(name: MusicAssistantRadio.sortNameKey_) String? get sortName;/// uri
@JsonKey(name: MusicAssistantRadio.uriKey_) String? get uri;/// externalIds
@JsonKey(name: MusicAssistantRadio.externalIdsKey_) List<List<MusicAssistantExternalID>>? get externalIds;/// isPlayable
@JsonKey(name: MusicAssistantRadio.isPlayableKey_) bool get isPlayable;/// mediaType
@JsonKey(name: MusicAssistantRadio.mediaTypeKey_) MusicAssistantMediaType get mediaType;/// providerMappings
@JsonKey(name: MusicAssistantRadio.providerMappingsKey_) List<MusicAssistantProviderMapping> get providerMappings;/// metadata
@JsonKey(name: MusicAssistantRadio.metadataKey_) MusicAssistantMediaItemMetadata? get metadata;/// favorite
@JsonKey(name: MusicAssistantRadio.favoriteKey_) bool get favorite;/// position
@JsonKey(name: MusicAssistantRadio.positionKey_) int? get position;/// dateAdded
@JsonKey(name: MusicAssistantRadio.dateAddedKey_) DateTime? get dateAdded;/// translationKey
@JsonKey(name: MusicAssistantRadio.translationKeyKey_) String? get translationKey;/// translationParams
@JsonKey(name: MusicAssistantRadio.translationParamsKey_) List<String>? get translationParams;/// duration
@JsonKey(name: MusicAssistantRadio.durationKey_) int? get duration;/// isDynamic
@JsonKey(name: MusicAssistantRadio.isDynamicKey_) bool get isDynamic;
/// Create a copy of MusicAssistantRadio
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantRadioCopyWith<MusicAssistantRadio> get copyWith => _$MusicAssistantRadioCopyWithImpl<MusicAssistantRadio>(this as MusicAssistantRadio, _$identity);

  /// Serializes this MusicAssistantRadio to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantRadio&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.name, name) || other.name == name)&&(identical(other.version, version) || other.version == version)&&(identical(other.sortName, sortName) || other.sortName == sortName)&&(identical(other.uri, uri) || other.uri == uri)&&const DeepCollectionEquality().equals(other.externalIds, externalIds)&&(identical(other.isPlayable, isPlayable) || other.isPlayable == isPlayable)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&const DeepCollectionEquality().equals(other.providerMappings, providerMappings)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.favorite, favorite) || other.favorite == favorite)&&(identical(other.position, position) || other.position == position)&&(identical(other.dateAdded, dateAdded) || other.dateAdded == dateAdded)&&(identical(other.translationKey, translationKey) || other.translationKey == translationKey)&&const DeepCollectionEquality().equals(other.translationParams, translationParams)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.isDynamic, isDynamic) || other.isDynamic == isDynamic));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,provider,name,version,sortName,uri,const DeepCollectionEquality().hash(externalIds),isPlayable,mediaType,const DeepCollectionEquality().hash(providerMappings),metadata,favorite,position,dateAdded,translationKey,const DeepCollectionEquality().hash(translationParams),duration,isDynamic);

@override
String toString() {
  return 'MusicAssistantRadio(itemId: $itemId, provider: $provider, name: $name, version: $version, sortName: $sortName, uri: $uri, externalIds: $externalIds, isPlayable: $isPlayable, mediaType: $mediaType, providerMappings: $providerMappings, metadata: $metadata, favorite: $favorite, position: $position, dateAdded: $dateAdded, translationKey: $translationKey, translationParams: $translationParams, duration: $duration, isDynamic: $isDynamic)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantRadioCopyWith<$Res>  {
  factory $MusicAssistantRadioCopyWith(MusicAssistantRadio value, $Res Function(MusicAssistantRadio) _then) = _$MusicAssistantRadioCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantRadio.itemIdKey_) String itemId,@JsonKey(name: MusicAssistantRadio.providerKey_) String provider,@JsonKey(name: MusicAssistantRadio.nameKey_) String name,@JsonKey(name: MusicAssistantRadio.versionKey_) String version,@JsonKey(name: MusicAssistantRadio.sortNameKey_) String? sortName,@JsonKey(name: MusicAssistantRadio.uriKey_) String? uri,@JsonKey(name: MusicAssistantRadio.externalIdsKey_) List<List<MusicAssistantExternalID>>? externalIds,@JsonKey(name: MusicAssistantRadio.isPlayableKey_) bool isPlayable,@JsonKey(name: MusicAssistantRadio.mediaTypeKey_) MusicAssistantMediaType mediaType,@JsonKey(name: MusicAssistantRadio.providerMappingsKey_) List<MusicAssistantProviderMapping> providerMappings,@JsonKey(name: MusicAssistantRadio.metadataKey_) MusicAssistantMediaItemMetadata? metadata,@JsonKey(name: MusicAssistantRadio.favoriteKey_) bool favorite,@JsonKey(name: MusicAssistantRadio.positionKey_) int? position,@JsonKey(name: MusicAssistantRadio.dateAddedKey_) DateTime? dateAdded,@JsonKey(name: MusicAssistantRadio.translationKeyKey_) String? translationKey,@JsonKey(name: MusicAssistantRadio.translationParamsKey_) List<String>? translationParams,@JsonKey(name: MusicAssistantRadio.durationKey_) int? duration,@JsonKey(name: MusicAssistantRadio.isDynamicKey_) bool isDynamic
});


$MusicAssistantMediaItemMetadataCopyWith<$Res>? get metadata;

}
/// @nodoc
class _$MusicAssistantRadioCopyWithImpl<$Res>
    implements $MusicAssistantRadioCopyWith<$Res> {
  _$MusicAssistantRadioCopyWithImpl(this._self, this._then);

  final MusicAssistantRadio _self;
  final $Res Function(MusicAssistantRadio) _then;

/// Create a copy of MusicAssistantRadio
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itemId = null,Object? provider = null,Object? name = null,Object? version = null,Object? sortName = freezed,Object? uri = freezed,Object? externalIds = freezed,Object? isPlayable = null,Object? mediaType = null,Object? providerMappings = null,Object? metadata = freezed,Object? favorite = null,Object? position = freezed,Object? dateAdded = freezed,Object? translationKey = freezed,Object? translationParams = freezed,Object? duration = freezed,Object? isDynamic = null,}) {
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
as List<String>?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int?,isDynamic: null == isDynamic ? _self.isDynamic : isDynamic // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of MusicAssistantRadio
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


/// Adds pattern-matching-related methods to [MusicAssistantRadio].
extension MusicAssistantRadioPatterns on MusicAssistantRadio {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantRadio value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantRadio() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantRadio value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantRadio():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantRadio value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantRadio() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantRadio.itemIdKey_)  String itemId, @JsonKey(name: MusicAssistantRadio.providerKey_)  String provider, @JsonKey(name: MusicAssistantRadio.nameKey_)  String name, @JsonKey(name: MusicAssistantRadio.versionKey_)  String version, @JsonKey(name: MusicAssistantRadio.sortNameKey_)  String? sortName, @JsonKey(name: MusicAssistantRadio.uriKey_)  String? uri, @JsonKey(name: MusicAssistantRadio.externalIdsKey_)  List<List<MusicAssistantExternalID>>? externalIds, @JsonKey(name: MusicAssistantRadio.isPlayableKey_)  bool isPlayable, @JsonKey(name: MusicAssistantRadio.mediaTypeKey_)  MusicAssistantMediaType mediaType, @JsonKey(name: MusicAssistantRadio.providerMappingsKey_)  List<MusicAssistantProviderMapping> providerMappings, @JsonKey(name: MusicAssistantRadio.metadataKey_)  MusicAssistantMediaItemMetadata? metadata, @JsonKey(name: MusicAssistantRadio.favoriteKey_)  bool favorite, @JsonKey(name: MusicAssistantRadio.positionKey_)  int? position, @JsonKey(name: MusicAssistantRadio.dateAddedKey_)  DateTime? dateAdded, @JsonKey(name: MusicAssistantRadio.translationKeyKey_)  String? translationKey, @JsonKey(name: MusicAssistantRadio.translationParamsKey_)  List<String>? translationParams, @JsonKey(name: MusicAssistantRadio.durationKey_)  int? duration, @JsonKey(name: MusicAssistantRadio.isDynamicKey_)  bool isDynamic)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantRadio() when $default != null:
return $default(_that.itemId,_that.provider,_that.name,_that.version,_that.sortName,_that.uri,_that.externalIds,_that.isPlayable,_that.mediaType,_that.providerMappings,_that.metadata,_that.favorite,_that.position,_that.dateAdded,_that.translationKey,_that.translationParams,_that.duration,_that.isDynamic);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantRadio.itemIdKey_)  String itemId, @JsonKey(name: MusicAssistantRadio.providerKey_)  String provider, @JsonKey(name: MusicAssistantRadio.nameKey_)  String name, @JsonKey(name: MusicAssistantRadio.versionKey_)  String version, @JsonKey(name: MusicAssistantRadio.sortNameKey_)  String? sortName, @JsonKey(name: MusicAssistantRadio.uriKey_)  String? uri, @JsonKey(name: MusicAssistantRadio.externalIdsKey_)  List<List<MusicAssistantExternalID>>? externalIds, @JsonKey(name: MusicAssistantRadio.isPlayableKey_)  bool isPlayable, @JsonKey(name: MusicAssistantRadio.mediaTypeKey_)  MusicAssistantMediaType mediaType, @JsonKey(name: MusicAssistantRadio.providerMappingsKey_)  List<MusicAssistantProviderMapping> providerMappings, @JsonKey(name: MusicAssistantRadio.metadataKey_)  MusicAssistantMediaItemMetadata? metadata, @JsonKey(name: MusicAssistantRadio.favoriteKey_)  bool favorite, @JsonKey(name: MusicAssistantRadio.positionKey_)  int? position, @JsonKey(name: MusicAssistantRadio.dateAddedKey_)  DateTime? dateAdded, @JsonKey(name: MusicAssistantRadio.translationKeyKey_)  String? translationKey, @JsonKey(name: MusicAssistantRadio.translationParamsKey_)  List<String>? translationParams, @JsonKey(name: MusicAssistantRadio.durationKey_)  int? duration, @JsonKey(name: MusicAssistantRadio.isDynamicKey_)  bool isDynamic)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantRadio():
return $default(_that.itemId,_that.provider,_that.name,_that.version,_that.sortName,_that.uri,_that.externalIds,_that.isPlayable,_that.mediaType,_that.providerMappings,_that.metadata,_that.favorite,_that.position,_that.dateAdded,_that.translationKey,_that.translationParams,_that.duration,_that.isDynamic);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantRadio.itemIdKey_)  String itemId, @JsonKey(name: MusicAssistantRadio.providerKey_)  String provider, @JsonKey(name: MusicAssistantRadio.nameKey_)  String name, @JsonKey(name: MusicAssistantRadio.versionKey_)  String version, @JsonKey(name: MusicAssistantRadio.sortNameKey_)  String? sortName, @JsonKey(name: MusicAssistantRadio.uriKey_)  String? uri, @JsonKey(name: MusicAssistantRadio.externalIdsKey_)  List<List<MusicAssistantExternalID>>? externalIds, @JsonKey(name: MusicAssistantRadio.isPlayableKey_)  bool isPlayable, @JsonKey(name: MusicAssistantRadio.mediaTypeKey_)  MusicAssistantMediaType mediaType, @JsonKey(name: MusicAssistantRadio.providerMappingsKey_)  List<MusicAssistantProviderMapping> providerMappings, @JsonKey(name: MusicAssistantRadio.metadataKey_)  MusicAssistantMediaItemMetadata? metadata, @JsonKey(name: MusicAssistantRadio.favoriteKey_)  bool favorite, @JsonKey(name: MusicAssistantRadio.positionKey_)  int? position, @JsonKey(name: MusicAssistantRadio.dateAddedKey_)  DateTime? dateAdded, @JsonKey(name: MusicAssistantRadio.translationKeyKey_)  String? translationKey, @JsonKey(name: MusicAssistantRadio.translationParamsKey_)  List<String>? translationParams, @JsonKey(name: MusicAssistantRadio.durationKey_)  int? duration, @JsonKey(name: MusicAssistantRadio.isDynamicKey_)  bool isDynamic)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantRadio() when $default != null:
return $default(_that.itemId,_that.provider,_that.name,_that.version,_that.sortName,_that.uri,_that.externalIds,_that.isPlayable,_that.mediaType,_that.providerMappings,_that.metadata,_that.favorite,_that.position,_that.dateAdded,_that.translationKey,_that.translationParams,_that.duration,_that.isDynamic);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantRadio extends MusicAssistantRadio {
  const _MusicAssistantRadio({@JsonKey(name: MusicAssistantRadio.itemIdKey_) required this.itemId, @JsonKey(name: MusicAssistantRadio.providerKey_) required this.provider, @JsonKey(name: MusicAssistantRadio.nameKey_) required this.name, @JsonKey(name: MusicAssistantRadio.versionKey_) this.version = '', @JsonKey(name: MusicAssistantRadio.sortNameKey_) this.sortName, @JsonKey(name: MusicAssistantRadio.uriKey_) this.uri, @JsonKey(name: MusicAssistantRadio.externalIdsKey_) final  List<List<MusicAssistantExternalID>>? externalIds, @JsonKey(name: MusicAssistantRadio.isPlayableKey_) this.isPlayable = true, @JsonKey(name: MusicAssistantRadio.mediaTypeKey_) this.mediaType = MusicAssistantMediaType.radio, @JsonKey(name: MusicAssistantRadio.providerMappingsKey_) required final  List<MusicAssistantProviderMapping> providerMappings, @JsonKey(name: MusicAssistantRadio.metadataKey_) this.metadata, @JsonKey(name: MusicAssistantRadio.favoriteKey_) this.favorite = false, @JsonKey(name: MusicAssistantRadio.positionKey_) this.position, @JsonKey(name: MusicAssistantRadio.dateAddedKey_) this.dateAdded, @JsonKey(name: MusicAssistantRadio.translationKeyKey_) this.translationKey, @JsonKey(name: MusicAssistantRadio.translationParamsKey_) final  List<String>? translationParams, @JsonKey(name: MusicAssistantRadio.durationKey_) this.duration, @JsonKey(name: MusicAssistantRadio.isDynamicKey_) this.isDynamic = false}): _externalIds = externalIds,_providerMappings = providerMappings,_translationParams = translationParams,super._();
  factory _MusicAssistantRadio.fromJson(Map<String, dynamic> json) => _$MusicAssistantRadioFromJson(json);

/// itemId
@override@JsonKey(name: MusicAssistantRadio.itemIdKey_) final  String itemId;
/// provider
@override@JsonKey(name: MusicAssistantRadio.providerKey_) final  String provider;
/// name
@override@JsonKey(name: MusicAssistantRadio.nameKey_) final  String name;
/// version
@override@JsonKey(name: MusicAssistantRadio.versionKey_) final  String version;
/// sortName
@override@JsonKey(name: MusicAssistantRadio.sortNameKey_) final  String? sortName;
/// uri
@override@JsonKey(name: MusicAssistantRadio.uriKey_) final  String? uri;
/// externalIds
 final  List<List<MusicAssistantExternalID>>? _externalIds;
/// externalIds
@override@JsonKey(name: MusicAssistantRadio.externalIdsKey_) List<List<MusicAssistantExternalID>>? get externalIds {
  final value = _externalIds;
  if (value == null) return null;
  if (_externalIds is EqualUnmodifiableListView) return _externalIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// isPlayable
@override@JsonKey(name: MusicAssistantRadio.isPlayableKey_) final  bool isPlayable;
/// mediaType
@override@JsonKey(name: MusicAssistantRadio.mediaTypeKey_) final  MusicAssistantMediaType mediaType;
/// providerMappings
 final  List<MusicAssistantProviderMapping> _providerMappings;
/// providerMappings
@override@JsonKey(name: MusicAssistantRadio.providerMappingsKey_) List<MusicAssistantProviderMapping> get providerMappings {
  if (_providerMappings is EqualUnmodifiableListView) return _providerMappings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_providerMappings);
}

/// metadata
@override@JsonKey(name: MusicAssistantRadio.metadataKey_) final  MusicAssistantMediaItemMetadata? metadata;
/// favorite
@override@JsonKey(name: MusicAssistantRadio.favoriteKey_) final  bool favorite;
/// position
@override@JsonKey(name: MusicAssistantRadio.positionKey_) final  int? position;
/// dateAdded
@override@JsonKey(name: MusicAssistantRadio.dateAddedKey_) final  DateTime? dateAdded;
/// translationKey
@override@JsonKey(name: MusicAssistantRadio.translationKeyKey_) final  String? translationKey;
/// translationParams
 final  List<String>? _translationParams;
/// translationParams
@override@JsonKey(name: MusicAssistantRadio.translationParamsKey_) List<String>? get translationParams {
  final value = _translationParams;
  if (value == null) return null;
  if (_translationParams is EqualUnmodifiableListView) return _translationParams;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// duration
@override@JsonKey(name: MusicAssistantRadio.durationKey_) final  int? duration;
/// isDynamic
@override@JsonKey(name: MusicAssistantRadio.isDynamicKey_) final  bool isDynamic;

/// Create a copy of MusicAssistantRadio
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantRadioCopyWith<_MusicAssistantRadio> get copyWith => __$MusicAssistantRadioCopyWithImpl<_MusicAssistantRadio>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantRadioToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantRadio&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.name, name) || other.name == name)&&(identical(other.version, version) || other.version == version)&&(identical(other.sortName, sortName) || other.sortName == sortName)&&(identical(other.uri, uri) || other.uri == uri)&&const DeepCollectionEquality().equals(other._externalIds, _externalIds)&&(identical(other.isPlayable, isPlayable) || other.isPlayable == isPlayable)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&const DeepCollectionEquality().equals(other._providerMappings, _providerMappings)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.favorite, favorite) || other.favorite == favorite)&&(identical(other.position, position) || other.position == position)&&(identical(other.dateAdded, dateAdded) || other.dateAdded == dateAdded)&&(identical(other.translationKey, translationKey) || other.translationKey == translationKey)&&const DeepCollectionEquality().equals(other._translationParams, _translationParams)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.isDynamic, isDynamic) || other.isDynamic == isDynamic));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,provider,name,version,sortName,uri,const DeepCollectionEquality().hash(_externalIds),isPlayable,mediaType,const DeepCollectionEquality().hash(_providerMappings),metadata,favorite,position,dateAdded,translationKey,const DeepCollectionEquality().hash(_translationParams),duration,isDynamic);

@override
String toString() {
  return 'MusicAssistantRadio(itemId: $itemId, provider: $provider, name: $name, version: $version, sortName: $sortName, uri: $uri, externalIds: $externalIds, isPlayable: $isPlayable, mediaType: $mediaType, providerMappings: $providerMappings, metadata: $metadata, favorite: $favorite, position: $position, dateAdded: $dateAdded, translationKey: $translationKey, translationParams: $translationParams, duration: $duration, isDynamic: $isDynamic)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantRadioCopyWith<$Res> implements $MusicAssistantRadioCopyWith<$Res> {
  factory _$MusicAssistantRadioCopyWith(_MusicAssistantRadio value, $Res Function(_MusicAssistantRadio) _then) = __$MusicAssistantRadioCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantRadio.itemIdKey_) String itemId,@JsonKey(name: MusicAssistantRadio.providerKey_) String provider,@JsonKey(name: MusicAssistantRadio.nameKey_) String name,@JsonKey(name: MusicAssistantRadio.versionKey_) String version,@JsonKey(name: MusicAssistantRadio.sortNameKey_) String? sortName,@JsonKey(name: MusicAssistantRadio.uriKey_) String? uri,@JsonKey(name: MusicAssistantRadio.externalIdsKey_) List<List<MusicAssistantExternalID>>? externalIds,@JsonKey(name: MusicAssistantRadio.isPlayableKey_) bool isPlayable,@JsonKey(name: MusicAssistantRadio.mediaTypeKey_) MusicAssistantMediaType mediaType,@JsonKey(name: MusicAssistantRadio.providerMappingsKey_) List<MusicAssistantProviderMapping> providerMappings,@JsonKey(name: MusicAssistantRadio.metadataKey_) MusicAssistantMediaItemMetadata? metadata,@JsonKey(name: MusicAssistantRadio.favoriteKey_) bool favorite,@JsonKey(name: MusicAssistantRadio.positionKey_) int? position,@JsonKey(name: MusicAssistantRadio.dateAddedKey_) DateTime? dateAdded,@JsonKey(name: MusicAssistantRadio.translationKeyKey_) String? translationKey,@JsonKey(name: MusicAssistantRadio.translationParamsKey_) List<String>? translationParams,@JsonKey(name: MusicAssistantRadio.durationKey_) int? duration,@JsonKey(name: MusicAssistantRadio.isDynamicKey_) bool isDynamic
});


@override $MusicAssistantMediaItemMetadataCopyWith<$Res>? get metadata;

}
/// @nodoc
class __$MusicAssistantRadioCopyWithImpl<$Res>
    implements _$MusicAssistantRadioCopyWith<$Res> {
  __$MusicAssistantRadioCopyWithImpl(this._self, this._then);

  final _MusicAssistantRadio _self;
  final $Res Function(_MusicAssistantRadio) _then;

/// Create a copy of MusicAssistantRadio
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itemId = null,Object? provider = null,Object? name = null,Object? version = null,Object? sortName = freezed,Object? uri = freezed,Object? externalIds = freezed,Object? isPlayable = null,Object? mediaType = null,Object? providerMappings = null,Object? metadata = freezed,Object? favorite = null,Object? position = freezed,Object? dateAdded = freezed,Object? translationKey = freezed,Object? translationParams = freezed,Object? duration = freezed,Object? isDynamic = null,}) {
  return _then(_MusicAssistantRadio(
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
as List<String>?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int?,isDynamic: null == isDynamic ? _self.isDynamic : isDynamic // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of MusicAssistantRadio
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
