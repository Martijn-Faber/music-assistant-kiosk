// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_item_mapping.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantItemMapping {

/// itemId
@JsonKey(name: MusicAssistantItemMapping.itemIdKey_) String get itemId;/// provider
@JsonKey(name: MusicAssistantItemMapping.providerKey_) String get provider;/// name
@JsonKey(name: MusicAssistantItemMapping.nameKey_) String get name;/// version
@JsonKey(name: MusicAssistantItemMapping.versionKey_) String get version;/// sortName
@JsonKey(name: MusicAssistantItemMapping.sortNameKey_) String? get sortName;/// uri
@JsonKey(name: MusicAssistantItemMapping.uriKey_) String? get uri;/// externalIds
@JsonKey(name: MusicAssistantItemMapping.externalIdsKey_) List<List<MusicAssistantExternalID>>? get externalIds;/// isPlayable
@JsonKey(name: MusicAssistantItemMapping.isPlayableKey_) bool get isPlayable;/// mediaType
@JsonKey(name: MusicAssistantItemMapping.mediaTypeKey_) MusicAssistantMediaType get mediaType;/// translationKey
@JsonKey(name: MusicAssistantItemMapping.translationKeyKey_) String? get translationKey;/// available
@JsonKey(name: MusicAssistantItemMapping.availableKey_) bool get available;/// image
@JsonKey(name: MusicAssistantItemMapping.imageKey_) MusicAssistantMediaItemImage? get image;/// year
@JsonKey(name: MusicAssistantItemMapping.yearKey_) int? get year;
/// Create a copy of MusicAssistantItemMapping
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantItemMappingCopyWith<MusicAssistantItemMapping> get copyWith => _$MusicAssistantItemMappingCopyWithImpl<MusicAssistantItemMapping>(this as MusicAssistantItemMapping, _$identity);

  /// Serializes this MusicAssistantItemMapping to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantItemMapping&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.name, name) || other.name == name)&&(identical(other.version, version) || other.version == version)&&(identical(other.sortName, sortName) || other.sortName == sortName)&&(identical(other.uri, uri) || other.uri == uri)&&const DeepCollectionEquality().equals(other.externalIds, externalIds)&&(identical(other.isPlayable, isPlayable) || other.isPlayable == isPlayable)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.translationKey, translationKey) || other.translationKey == translationKey)&&(identical(other.available, available) || other.available == available)&&(identical(other.image, image) || other.image == image)&&(identical(other.year, year) || other.year == year));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,provider,name,version,sortName,uri,const DeepCollectionEquality().hash(externalIds),isPlayable,mediaType,translationKey,available,image,year);

@override
String toString() {
  return 'MusicAssistantItemMapping(itemId: $itemId, provider: $provider, name: $name, version: $version, sortName: $sortName, uri: $uri, externalIds: $externalIds, isPlayable: $isPlayable, mediaType: $mediaType, translationKey: $translationKey, available: $available, image: $image, year: $year)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantItemMappingCopyWith<$Res>  {
  factory $MusicAssistantItemMappingCopyWith(MusicAssistantItemMapping value, $Res Function(MusicAssistantItemMapping) _then) = _$MusicAssistantItemMappingCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantItemMapping.itemIdKey_) String itemId,@JsonKey(name: MusicAssistantItemMapping.providerKey_) String provider,@JsonKey(name: MusicAssistantItemMapping.nameKey_) String name,@JsonKey(name: MusicAssistantItemMapping.versionKey_) String version,@JsonKey(name: MusicAssistantItemMapping.sortNameKey_) String? sortName,@JsonKey(name: MusicAssistantItemMapping.uriKey_) String? uri,@JsonKey(name: MusicAssistantItemMapping.externalIdsKey_) List<List<MusicAssistantExternalID>>? externalIds,@JsonKey(name: MusicAssistantItemMapping.isPlayableKey_) bool isPlayable,@JsonKey(name: MusicAssistantItemMapping.mediaTypeKey_) MusicAssistantMediaType mediaType,@JsonKey(name: MusicAssistantItemMapping.translationKeyKey_) String? translationKey,@JsonKey(name: MusicAssistantItemMapping.availableKey_) bool available,@JsonKey(name: MusicAssistantItemMapping.imageKey_) MusicAssistantMediaItemImage? image,@JsonKey(name: MusicAssistantItemMapping.yearKey_) int? year
});


$MusicAssistantMediaItemImageCopyWith<$Res>? get image;

}
/// @nodoc
class _$MusicAssistantItemMappingCopyWithImpl<$Res>
    implements $MusicAssistantItemMappingCopyWith<$Res> {
  _$MusicAssistantItemMappingCopyWithImpl(this._self, this._then);

  final MusicAssistantItemMapping _self;
  final $Res Function(MusicAssistantItemMapping) _then;

/// Create a copy of MusicAssistantItemMapping
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itemId = null,Object? provider = null,Object? name = null,Object? version = null,Object? sortName = freezed,Object? uri = freezed,Object? externalIds = freezed,Object? isPlayable = null,Object? mediaType = null,Object? translationKey = freezed,Object? available = null,Object? image = freezed,Object? year = freezed,}) {
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
as MusicAssistantMediaType,translationKey: freezed == translationKey ? _self.translationKey : translationKey // ignore: cast_nullable_to_non_nullable
as String?,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as bool,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as MusicAssistantMediaItemImage?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of MusicAssistantItemMapping
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantMediaItemImageCopyWith<$Res>? get image {
    if (_self.image == null) {
    return null;
  }

  return $MusicAssistantMediaItemImageCopyWith<$Res>(_self.image!, (value) {
    return _then(_self.copyWith(image: value));
  });
}
}


/// Adds pattern-matching-related methods to [MusicAssistantItemMapping].
extension MusicAssistantItemMappingPatterns on MusicAssistantItemMapping {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantItemMapping value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantItemMapping() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantItemMapping value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantItemMapping():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantItemMapping value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantItemMapping() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantItemMapping.itemIdKey_)  String itemId, @JsonKey(name: MusicAssistantItemMapping.providerKey_)  String provider, @JsonKey(name: MusicAssistantItemMapping.nameKey_)  String name, @JsonKey(name: MusicAssistantItemMapping.versionKey_)  String version, @JsonKey(name: MusicAssistantItemMapping.sortNameKey_)  String? sortName, @JsonKey(name: MusicAssistantItemMapping.uriKey_)  String? uri, @JsonKey(name: MusicAssistantItemMapping.externalIdsKey_)  List<List<MusicAssistantExternalID>>? externalIds, @JsonKey(name: MusicAssistantItemMapping.isPlayableKey_)  bool isPlayable, @JsonKey(name: MusicAssistantItemMapping.mediaTypeKey_)  MusicAssistantMediaType mediaType, @JsonKey(name: MusicAssistantItemMapping.translationKeyKey_)  String? translationKey, @JsonKey(name: MusicAssistantItemMapping.availableKey_)  bool available, @JsonKey(name: MusicAssistantItemMapping.imageKey_)  MusicAssistantMediaItemImage? image, @JsonKey(name: MusicAssistantItemMapping.yearKey_)  int? year)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantItemMapping() when $default != null:
return $default(_that.itemId,_that.provider,_that.name,_that.version,_that.sortName,_that.uri,_that.externalIds,_that.isPlayable,_that.mediaType,_that.translationKey,_that.available,_that.image,_that.year);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantItemMapping.itemIdKey_)  String itemId, @JsonKey(name: MusicAssistantItemMapping.providerKey_)  String provider, @JsonKey(name: MusicAssistantItemMapping.nameKey_)  String name, @JsonKey(name: MusicAssistantItemMapping.versionKey_)  String version, @JsonKey(name: MusicAssistantItemMapping.sortNameKey_)  String? sortName, @JsonKey(name: MusicAssistantItemMapping.uriKey_)  String? uri, @JsonKey(name: MusicAssistantItemMapping.externalIdsKey_)  List<List<MusicAssistantExternalID>>? externalIds, @JsonKey(name: MusicAssistantItemMapping.isPlayableKey_)  bool isPlayable, @JsonKey(name: MusicAssistantItemMapping.mediaTypeKey_)  MusicAssistantMediaType mediaType, @JsonKey(name: MusicAssistantItemMapping.translationKeyKey_)  String? translationKey, @JsonKey(name: MusicAssistantItemMapping.availableKey_)  bool available, @JsonKey(name: MusicAssistantItemMapping.imageKey_)  MusicAssistantMediaItemImage? image, @JsonKey(name: MusicAssistantItemMapping.yearKey_)  int? year)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantItemMapping():
return $default(_that.itemId,_that.provider,_that.name,_that.version,_that.sortName,_that.uri,_that.externalIds,_that.isPlayable,_that.mediaType,_that.translationKey,_that.available,_that.image,_that.year);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantItemMapping.itemIdKey_)  String itemId, @JsonKey(name: MusicAssistantItemMapping.providerKey_)  String provider, @JsonKey(name: MusicAssistantItemMapping.nameKey_)  String name, @JsonKey(name: MusicAssistantItemMapping.versionKey_)  String version, @JsonKey(name: MusicAssistantItemMapping.sortNameKey_)  String? sortName, @JsonKey(name: MusicAssistantItemMapping.uriKey_)  String? uri, @JsonKey(name: MusicAssistantItemMapping.externalIdsKey_)  List<List<MusicAssistantExternalID>>? externalIds, @JsonKey(name: MusicAssistantItemMapping.isPlayableKey_)  bool isPlayable, @JsonKey(name: MusicAssistantItemMapping.mediaTypeKey_)  MusicAssistantMediaType mediaType, @JsonKey(name: MusicAssistantItemMapping.translationKeyKey_)  String? translationKey, @JsonKey(name: MusicAssistantItemMapping.availableKey_)  bool available, @JsonKey(name: MusicAssistantItemMapping.imageKey_)  MusicAssistantMediaItemImage? image, @JsonKey(name: MusicAssistantItemMapping.yearKey_)  int? year)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantItemMapping() when $default != null:
return $default(_that.itemId,_that.provider,_that.name,_that.version,_that.sortName,_that.uri,_that.externalIds,_that.isPlayable,_that.mediaType,_that.translationKey,_that.available,_that.image,_that.year);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantItemMapping extends MusicAssistantItemMapping {
  const _MusicAssistantItemMapping({@JsonKey(name: MusicAssistantItemMapping.itemIdKey_) required this.itemId, @JsonKey(name: MusicAssistantItemMapping.providerKey_) required this.provider, @JsonKey(name: MusicAssistantItemMapping.nameKey_) required this.name, @JsonKey(name: MusicAssistantItemMapping.versionKey_) this.version = '', @JsonKey(name: MusicAssistantItemMapping.sortNameKey_) this.sortName, @JsonKey(name: MusicAssistantItemMapping.uriKey_) this.uri, @JsonKey(name: MusicAssistantItemMapping.externalIdsKey_) final  List<List<MusicAssistantExternalID>>? externalIds, @JsonKey(name: MusicAssistantItemMapping.isPlayableKey_) this.isPlayable = true, @JsonKey(name: MusicAssistantItemMapping.mediaTypeKey_) this.mediaType = MusicAssistantMediaType.unknown, @JsonKey(name: MusicAssistantItemMapping.translationKeyKey_) this.translationKey, @JsonKey(name: MusicAssistantItemMapping.availableKey_) this.available = true, @JsonKey(name: MusicAssistantItemMapping.imageKey_) this.image, @JsonKey(name: MusicAssistantItemMapping.yearKey_) this.year}): _externalIds = externalIds,super._();
  factory _MusicAssistantItemMapping.fromJson(Map<String, dynamic> json) => _$MusicAssistantItemMappingFromJson(json);

/// itemId
@override@JsonKey(name: MusicAssistantItemMapping.itemIdKey_) final  String itemId;
/// provider
@override@JsonKey(name: MusicAssistantItemMapping.providerKey_) final  String provider;
/// name
@override@JsonKey(name: MusicAssistantItemMapping.nameKey_) final  String name;
/// version
@override@JsonKey(name: MusicAssistantItemMapping.versionKey_) final  String version;
/// sortName
@override@JsonKey(name: MusicAssistantItemMapping.sortNameKey_) final  String? sortName;
/// uri
@override@JsonKey(name: MusicAssistantItemMapping.uriKey_) final  String? uri;
/// externalIds
 final  List<List<MusicAssistantExternalID>>? _externalIds;
/// externalIds
@override@JsonKey(name: MusicAssistantItemMapping.externalIdsKey_) List<List<MusicAssistantExternalID>>? get externalIds {
  final value = _externalIds;
  if (value == null) return null;
  if (_externalIds is EqualUnmodifiableListView) return _externalIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// isPlayable
@override@JsonKey(name: MusicAssistantItemMapping.isPlayableKey_) final  bool isPlayable;
/// mediaType
@override@JsonKey(name: MusicAssistantItemMapping.mediaTypeKey_) final  MusicAssistantMediaType mediaType;
/// translationKey
@override@JsonKey(name: MusicAssistantItemMapping.translationKeyKey_) final  String? translationKey;
/// available
@override@JsonKey(name: MusicAssistantItemMapping.availableKey_) final  bool available;
/// image
@override@JsonKey(name: MusicAssistantItemMapping.imageKey_) final  MusicAssistantMediaItemImage? image;
/// year
@override@JsonKey(name: MusicAssistantItemMapping.yearKey_) final  int? year;

/// Create a copy of MusicAssistantItemMapping
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantItemMappingCopyWith<_MusicAssistantItemMapping> get copyWith => __$MusicAssistantItemMappingCopyWithImpl<_MusicAssistantItemMapping>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantItemMappingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantItemMapping&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.name, name) || other.name == name)&&(identical(other.version, version) || other.version == version)&&(identical(other.sortName, sortName) || other.sortName == sortName)&&(identical(other.uri, uri) || other.uri == uri)&&const DeepCollectionEquality().equals(other._externalIds, _externalIds)&&(identical(other.isPlayable, isPlayable) || other.isPlayable == isPlayable)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.translationKey, translationKey) || other.translationKey == translationKey)&&(identical(other.available, available) || other.available == available)&&(identical(other.image, image) || other.image == image)&&(identical(other.year, year) || other.year == year));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,provider,name,version,sortName,uri,const DeepCollectionEquality().hash(_externalIds),isPlayable,mediaType,translationKey,available,image,year);

@override
String toString() {
  return 'MusicAssistantItemMapping(itemId: $itemId, provider: $provider, name: $name, version: $version, sortName: $sortName, uri: $uri, externalIds: $externalIds, isPlayable: $isPlayable, mediaType: $mediaType, translationKey: $translationKey, available: $available, image: $image, year: $year)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantItemMappingCopyWith<$Res> implements $MusicAssistantItemMappingCopyWith<$Res> {
  factory _$MusicAssistantItemMappingCopyWith(_MusicAssistantItemMapping value, $Res Function(_MusicAssistantItemMapping) _then) = __$MusicAssistantItemMappingCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantItemMapping.itemIdKey_) String itemId,@JsonKey(name: MusicAssistantItemMapping.providerKey_) String provider,@JsonKey(name: MusicAssistantItemMapping.nameKey_) String name,@JsonKey(name: MusicAssistantItemMapping.versionKey_) String version,@JsonKey(name: MusicAssistantItemMapping.sortNameKey_) String? sortName,@JsonKey(name: MusicAssistantItemMapping.uriKey_) String? uri,@JsonKey(name: MusicAssistantItemMapping.externalIdsKey_) List<List<MusicAssistantExternalID>>? externalIds,@JsonKey(name: MusicAssistantItemMapping.isPlayableKey_) bool isPlayable,@JsonKey(name: MusicAssistantItemMapping.mediaTypeKey_) MusicAssistantMediaType mediaType,@JsonKey(name: MusicAssistantItemMapping.translationKeyKey_) String? translationKey,@JsonKey(name: MusicAssistantItemMapping.availableKey_) bool available,@JsonKey(name: MusicAssistantItemMapping.imageKey_) MusicAssistantMediaItemImage? image,@JsonKey(name: MusicAssistantItemMapping.yearKey_) int? year
});


@override $MusicAssistantMediaItemImageCopyWith<$Res>? get image;

}
/// @nodoc
class __$MusicAssistantItemMappingCopyWithImpl<$Res>
    implements _$MusicAssistantItemMappingCopyWith<$Res> {
  __$MusicAssistantItemMappingCopyWithImpl(this._self, this._then);

  final _MusicAssistantItemMapping _self;
  final $Res Function(_MusicAssistantItemMapping) _then;

/// Create a copy of MusicAssistantItemMapping
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itemId = null,Object? provider = null,Object? name = null,Object? version = null,Object? sortName = freezed,Object? uri = freezed,Object? externalIds = freezed,Object? isPlayable = null,Object? mediaType = null,Object? translationKey = freezed,Object? available = null,Object? image = freezed,Object? year = freezed,}) {
  return _then(_MusicAssistantItemMapping(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,sortName: freezed == sortName ? _self.sortName : sortName // ignore: cast_nullable_to_non_nullable
as String?,uri: freezed == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as String?,externalIds: freezed == externalIds ? _self._externalIds : externalIds // ignore: cast_nullable_to_non_nullable
as List<List<MusicAssistantExternalID>>?,isPlayable: null == isPlayable ? _self.isPlayable : isPlayable // ignore: cast_nullable_to_non_nullable
as bool,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as MusicAssistantMediaType,translationKey: freezed == translationKey ? _self.translationKey : translationKey // ignore: cast_nullable_to_non_nullable
as String?,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as bool,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as MusicAssistantMediaItemImage?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of MusicAssistantItemMapping
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantMediaItemImageCopyWith<$Res>? get image {
    if (_self.image == null) {
    return null;
  }

  return $MusicAssistantMediaItemImageCopyWith<$Res>(_self.image!, (value) {
    return _then(_self.copyWith(image: value));
  });
}
}

// dart format on
