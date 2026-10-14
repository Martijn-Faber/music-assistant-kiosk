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

/// favorite
@JsonKey(name: MusicAssistantRadio.favoriteKey_) bool get favorite;/// metadata
@JsonKey(name: MusicAssistantRadio.metadataKey_) MusicAssistantMediaItemMetadata? get metadata;/// itemId
@JsonKey(name: MusicAssistantRadio.itemIdKey_) String get itemId;/// provider
@JsonKey(name: MusicAssistantRadio.providerKey_) String get provider;/// name
@JsonKey(name: MusicAssistantRadio.nameKey_) String get name;/// providerMappings
@JsonKey(name: MusicAssistantRadio.providerMappingsKey_) List<MusicAssistantRadioProviderMappingsItem>? get providerMappings;/// uri
@JsonKey(name: MusicAssistantRadio.uriKey_) String? get uri;/// mediaType
@JsonKey(name: MusicAssistantRadio.mediaTypeKey_) MusicAssistantMediaType get mediaType;
/// Create a copy of MusicAssistantRadio
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantRadioCopyWith<MusicAssistantRadio> get copyWith => _$MusicAssistantRadioCopyWithImpl<MusicAssistantRadio>(this as MusicAssistantRadio, _$identity);

  /// Serializes this MusicAssistantRadio to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantRadio&&(identical(other.favorite, favorite) || other.favorite == favorite)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.providerMappings, providerMappings)&&(identical(other.uri, uri) || other.uri == uri)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,favorite,metadata,itemId,provider,name,const DeepCollectionEquality().hash(providerMappings),uri,mediaType);

@override
String toString() {
  return 'MusicAssistantRadio(favorite: $favorite, metadata: $metadata, itemId: $itemId, provider: $provider, name: $name, providerMappings: $providerMappings, uri: $uri, mediaType: $mediaType)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantRadioCopyWith<$Res>  {
  factory $MusicAssistantRadioCopyWith(MusicAssistantRadio value, $Res Function(MusicAssistantRadio) _then) = _$MusicAssistantRadioCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantRadio.favoriteKey_) bool favorite,@JsonKey(name: MusicAssistantRadio.metadataKey_) MusicAssistantMediaItemMetadata? metadata,@JsonKey(name: MusicAssistantRadio.itemIdKey_) String itemId,@JsonKey(name: MusicAssistantRadio.providerKey_) String provider,@JsonKey(name: MusicAssistantRadio.nameKey_) String name,@JsonKey(name: MusicAssistantRadio.providerMappingsKey_) List<MusicAssistantRadioProviderMappingsItem>? providerMappings,@JsonKey(name: MusicAssistantRadio.uriKey_) String? uri,@JsonKey(name: MusicAssistantRadio.mediaTypeKey_) MusicAssistantMediaType mediaType
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
@pragma('vm:prefer-inline') @override $Res call({Object? favorite = null,Object? metadata = freezed,Object? itemId = null,Object? provider = null,Object? name = null,Object? providerMappings = freezed,Object? uri = freezed,Object? mediaType = null,}) {
  return _then(_self.copyWith(
favorite: null == favorite ? _self.favorite : favorite // ignore: cast_nullable_to_non_nullable
as bool,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as MusicAssistantMediaItemMetadata?,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,providerMappings: freezed == providerMappings ? _self.providerMappings : providerMappings // ignore: cast_nullable_to_non_nullable
as List<MusicAssistantRadioProviderMappingsItem>?,uri: freezed == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as String?,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as MusicAssistantMediaType,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantRadio.favoriteKey_)  bool favorite, @JsonKey(name: MusicAssistantRadio.metadataKey_)  MusicAssistantMediaItemMetadata? metadata, @JsonKey(name: MusicAssistantRadio.itemIdKey_)  String itemId, @JsonKey(name: MusicAssistantRadio.providerKey_)  String provider, @JsonKey(name: MusicAssistantRadio.nameKey_)  String name, @JsonKey(name: MusicAssistantRadio.providerMappingsKey_)  List<MusicAssistantRadioProviderMappingsItem>? providerMappings, @JsonKey(name: MusicAssistantRadio.uriKey_)  String? uri, @JsonKey(name: MusicAssistantRadio.mediaTypeKey_)  MusicAssistantMediaType mediaType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantRadio() when $default != null:
return $default(_that.favorite,_that.metadata,_that.itemId,_that.provider,_that.name,_that.providerMappings,_that.uri,_that.mediaType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantRadio.favoriteKey_)  bool favorite, @JsonKey(name: MusicAssistantRadio.metadataKey_)  MusicAssistantMediaItemMetadata? metadata, @JsonKey(name: MusicAssistantRadio.itemIdKey_)  String itemId, @JsonKey(name: MusicAssistantRadio.providerKey_)  String provider, @JsonKey(name: MusicAssistantRadio.nameKey_)  String name, @JsonKey(name: MusicAssistantRadio.providerMappingsKey_)  List<MusicAssistantRadioProviderMappingsItem>? providerMappings, @JsonKey(name: MusicAssistantRadio.uriKey_)  String? uri, @JsonKey(name: MusicAssistantRadio.mediaTypeKey_)  MusicAssistantMediaType mediaType)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantRadio():
return $default(_that.favorite,_that.metadata,_that.itemId,_that.provider,_that.name,_that.providerMappings,_that.uri,_that.mediaType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantRadio.favoriteKey_)  bool favorite, @JsonKey(name: MusicAssistantRadio.metadataKey_)  MusicAssistantMediaItemMetadata? metadata, @JsonKey(name: MusicAssistantRadio.itemIdKey_)  String itemId, @JsonKey(name: MusicAssistantRadio.providerKey_)  String provider, @JsonKey(name: MusicAssistantRadio.nameKey_)  String name, @JsonKey(name: MusicAssistantRadio.providerMappingsKey_)  List<MusicAssistantRadioProviderMappingsItem>? providerMappings, @JsonKey(name: MusicAssistantRadio.uriKey_)  String? uri, @JsonKey(name: MusicAssistantRadio.mediaTypeKey_)  MusicAssistantMediaType mediaType)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantRadio() when $default != null:
return $default(_that.favorite,_that.metadata,_that.itemId,_that.provider,_that.name,_that.providerMappings,_that.uri,_that.mediaType);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantRadio extends MusicAssistantRadio {
  const _MusicAssistantRadio({@JsonKey(name: MusicAssistantRadio.favoriteKey_) this.favorite = false, @JsonKey(name: MusicAssistantRadio.metadataKey_) this.metadata, @JsonKey(name: MusicAssistantRadio.itemIdKey_) required this.itemId, @JsonKey(name: MusicAssistantRadio.providerKey_) required this.provider, @JsonKey(name: MusicAssistantRadio.nameKey_) required this.name, @JsonKey(name: MusicAssistantRadio.providerMappingsKey_) final  List<MusicAssistantRadioProviderMappingsItem>? providerMappings, @JsonKey(name: MusicAssistantRadio.uriKey_) this.uri, @JsonKey(name: MusicAssistantRadio.mediaTypeKey_) this.mediaType = MusicAssistantMediaType.radio}): _providerMappings = providerMappings,super._();
  factory _MusicAssistantRadio.fromJson(Map<String, dynamic> json) => _$MusicAssistantRadioFromJson(json);

/// favorite
@override@JsonKey(name: MusicAssistantRadio.favoriteKey_) final  bool favorite;
/// metadata
@override@JsonKey(name: MusicAssistantRadio.metadataKey_) final  MusicAssistantMediaItemMetadata? metadata;
/// itemId
@override@JsonKey(name: MusicAssistantRadio.itemIdKey_) final  String itemId;
/// provider
@override@JsonKey(name: MusicAssistantRadio.providerKey_) final  String provider;
/// name
@override@JsonKey(name: MusicAssistantRadio.nameKey_) final  String name;
/// providerMappings
 final  List<MusicAssistantRadioProviderMappingsItem>? _providerMappings;
/// providerMappings
@override@JsonKey(name: MusicAssistantRadio.providerMappingsKey_) List<MusicAssistantRadioProviderMappingsItem>? get providerMappings {
  final value = _providerMappings;
  if (value == null) return null;
  if (_providerMappings is EqualUnmodifiableListView) return _providerMappings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// uri
@override@JsonKey(name: MusicAssistantRadio.uriKey_) final  String? uri;
/// mediaType
@override@JsonKey(name: MusicAssistantRadio.mediaTypeKey_) final  MusicAssistantMediaType mediaType;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantRadio&&(identical(other.favorite, favorite) || other.favorite == favorite)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._providerMappings, _providerMappings)&&(identical(other.uri, uri) || other.uri == uri)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,favorite,metadata,itemId,provider,name,const DeepCollectionEquality().hash(_providerMappings),uri,mediaType);

@override
String toString() {
  return 'MusicAssistantRadio(favorite: $favorite, metadata: $metadata, itemId: $itemId, provider: $provider, name: $name, providerMappings: $providerMappings, uri: $uri, mediaType: $mediaType)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantRadioCopyWith<$Res> implements $MusicAssistantRadioCopyWith<$Res> {
  factory _$MusicAssistantRadioCopyWith(_MusicAssistantRadio value, $Res Function(_MusicAssistantRadio) _then) = __$MusicAssistantRadioCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantRadio.favoriteKey_) bool favorite,@JsonKey(name: MusicAssistantRadio.metadataKey_) MusicAssistantMediaItemMetadata? metadata,@JsonKey(name: MusicAssistantRadio.itemIdKey_) String itemId,@JsonKey(name: MusicAssistantRadio.providerKey_) String provider,@JsonKey(name: MusicAssistantRadio.nameKey_) String name,@JsonKey(name: MusicAssistantRadio.providerMappingsKey_) List<MusicAssistantRadioProviderMappingsItem>? providerMappings,@JsonKey(name: MusicAssistantRadio.uriKey_) String? uri,@JsonKey(name: MusicAssistantRadio.mediaTypeKey_) MusicAssistantMediaType mediaType
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
@override @pragma('vm:prefer-inline') $Res call({Object? favorite = null,Object? metadata = freezed,Object? itemId = null,Object? provider = null,Object? name = null,Object? providerMappings = freezed,Object? uri = freezed,Object? mediaType = null,}) {
  return _then(_MusicAssistantRadio(
favorite: null == favorite ? _self.favorite : favorite // ignore: cast_nullable_to_non_nullable
as bool,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as MusicAssistantMediaItemMetadata?,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,providerMappings: freezed == providerMappings ? _self._providerMappings : providerMappings // ignore: cast_nullable_to_non_nullable
as List<MusicAssistantRadioProviderMappingsItem>?,uri: freezed == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as String?,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as MusicAssistantMediaType,
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
