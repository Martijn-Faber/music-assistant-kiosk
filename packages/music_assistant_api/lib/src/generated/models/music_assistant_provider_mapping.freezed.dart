// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_provider_mapping.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantProviderMapping {

/// itemId
@JsonKey(name: MusicAssistantProviderMapping.itemIdKey_) String get itemId;/// providerDomain
@JsonKey(name: MusicAssistantProviderMapping.providerDomainKey_) String get providerDomain;/// providerInstance
@JsonKey(name: MusicAssistantProviderMapping.providerInstanceKey_) String get providerInstance;/// available
@JsonKey(name: MusicAssistantProviderMapping.availableKey_) bool get available;/// inLibrary
@JsonKey(name: MusicAssistantProviderMapping.inLibraryKey_) bool? get inLibrary;/// isUnique
@JsonKey(name: MusicAssistantProviderMapping.isUniqueKey_) bool? get isUnique;/// audioFormat
@JsonKey(name: MusicAssistantProviderMapping.audioFormatKey_) MusicAssistantAudioFormat? get audioFormat;/// url
@JsonKey(name: MusicAssistantProviderMapping.urlKey_) String? get url;/// details
@JsonKey(name: MusicAssistantProviderMapping.detailsKey_) String? get details;
/// Create a copy of MusicAssistantProviderMapping
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantProviderMappingCopyWith<MusicAssistantProviderMapping> get copyWith => _$MusicAssistantProviderMappingCopyWithImpl<MusicAssistantProviderMapping>(this as MusicAssistantProviderMapping, _$identity);

  /// Serializes this MusicAssistantProviderMapping to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantProviderMapping&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.providerDomain, providerDomain) || other.providerDomain == providerDomain)&&(identical(other.providerInstance, providerInstance) || other.providerInstance == providerInstance)&&(identical(other.available, available) || other.available == available)&&(identical(other.inLibrary, inLibrary) || other.inLibrary == inLibrary)&&(identical(other.isUnique, isUnique) || other.isUnique == isUnique)&&(identical(other.audioFormat, audioFormat) || other.audioFormat == audioFormat)&&(identical(other.url, url) || other.url == url)&&(identical(other.details, details) || other.details == details));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,providerDomain,providerInstance,available,inLibrary,isUnique,audioFormat,url,details);

@override
String toString() {
  return 'MusicAssistantProviderMapping(itemId: $itemId, providerDomain: $providerDomain, providerInstance: $providerInstance, available: $available, inLibrary: $inLibrary, isUnique: $isUnique, audioFormat: $audioFormat, url: $url, details: $details)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantProviderMappingCopyWith<$Res>  {
  factory $MusicAssistantProviderMappingCopyWith(MusicAssistantProviderMapping value, $Res Function(MusicAssistantProviderMapping) _then) = _$MusicAssistantProviderMappingCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantProviderMapping.itemIdKey_) String itemId,@JsonKey(name: MusicAssistantProviderMapping.providerDomainKey_) String providerDomain,@JsonKey(name: MusicAssistantProviderMapping.providerInstanceKey_) String providerInstance,@JsonKey(name: MusicAssistantProviderMapping.availableKey_) bool available,@JsonKey(name: MusicAssistantProviderMapping.inLibraryKey_) bool? inLibrary,@JsonKey(name: MusicAssistantProviderMapping.isUniqueKey_) bool? isUnique,@JsonKey(name: MusicAssistantProviderMapping.audioFormatKey_) MusicAssistantAudioFormat? audioFormat,@JsonKey(name: MusicAssistantProviderMapping.urlKey_) String? url,@JsonKey(name: MusicAssistantProviderMapping.detailsKey_) String? details
});


$MusicAssistantAudioFormatCopyWith<$Res>? get audioFormat;

}
/// @nodoc
class _$MusicAssistantProviderMappingCopyWithImpl<$Res>
    implements $MusicAssistantProviderMappingCopyWith<$Res> {
  _$MusicAssistantProviderMappingCopyWithImpl(this._self, this._then);

  final MusicAssistantProviderMapping _self;
  final $Res Function(MusicAssistantProviderMapping) _then;

/// Create a copy of MusicAssistantProviderMapping
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itemId = null,Object? providerDomain = null,Object? providerInstance = null,Object? available = null,Object? inLibrary = freezed,Object? isUnique = freezed,Object? audioFormat = freezed,Object? url = freezed,Object? details = freezed,}) {
  return _then(_self.copyWith(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,providerDomain: null == providerDomain ? _self.providerDomain : providerDomain // ignore: cast_nullable_to_non_nullable
as String,providerInstance: null == providerInstance ? _self.providerInstance : providerInstance // ignore: cast_nullable_to_non_nullable
as String,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as bool,inLibrary: freezed == inLibrary ? _self.inLibrary : inLibrary // ignore: cast_nullable_to_non_nullable
as bool?,isUnique: freezed == isUnique ? _self.isUnique : isUnique // ignore: cast_nullable_to_non_nullable
as bool?,audioFormat: freezed == audioFormat ? _self.audioFormat : audioFormat // ignore: cast_nullable_to_non_nullable
as MusicAssistantAudioFormat?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,details: freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of MusicAssistantProviderMapping
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantAudioFormatCopyWith<$Res>? get audioFormat {
    if (_self.audioFormat == null) {
    return null;
  }

  return $MusicAssistantAudioFormatCopyWith<$Res>(_self.audioFormat!, (value) {
    return _then(_self.copyWith(audioFormat: value));
  });
}
}


/// Adds pattern-matching-related methods to [MusicAssistantProviderMapping].
extension MusicAssistantProviderMappingPatterns on MusicAssistantProviderMapping {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantProviderMapping value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantProviderMapping() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantProviderMapping value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantProviderMapping():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantProviderMapping value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantProviderMapping() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantProviderMapping.itemIdKey_)  String itemId, @JsonKey(name: MusicAssistantProviderMapping.providerDomainKey_)  String providerDomain, @JsonKey(name: MusicAssistantProviderMapping.providerInstanceKey_)  String providerInstance, @JsonKey(name: MusicAssistantProviderMapping.availableKey_)  bool available, @JsonKey(name: MusicAssistantProviderMapping.inLibraryKey_)  bool? inLibrary, @JsonKey(name: MusicAssistantProviderMapping.isUniqueKey_)  bool? isUnique, @JsonKey(name: MusicAssistantProviderMapping.audioFormatKey_)  MusicAssistantAudioFormat? audioFormat, @JsonKey(name: MusicAssistantProviderMapping.urlKey_)  String? url, @JsonKey(name: MusicAssistantProviderMapping.detailsKey_)  String? details)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantProviderMapping() when $default != null:
return $default(_that.itemId,_that.providerDomain,_that.providerInstance,_that.available,_that.inLibrary,_that.isUnique,_that.audioFormat,_that.url,_that.details);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantProviderMapping.itemIdKey_)  String itemId, @JsonKey(name: MusicAssistantProviderMapping.providerDomainKey_)  String providerDomain, @JsonKey(name: MusicAssistantProviderMapping.providerInstanceKey_)  String providerInstance, @JsonKey(name: MusicAssistantProviderMapping.availableKey_)  bool available, @JsonKey(name: MusicAssistantProviderMapping.inLibraryKey_)  bool? inLibrary, @JsonKey(name: MusicAssistantProviderMapping.isUniqueKey_)  bool? isUnique, @JsonKey(name: MusicAssistantProviderMapping.audioFormatKey_)  MusicAssistantAudioFormat? audioFormat, @JsonKey(name: MusicAssistantProviderMapping.urlKey_)  String? url, @JsonKey(name: MusicAssistantProviderMapping.detailsKey_)  String? details)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantProviderMapping():
return $default(_that.itemId,_that.providerDomain,_that.providerInstance,_that.available,_that.inLibrary,_that.isUnique,_that.audioFormat,_that.url,_that.details);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantProviderMapping.itemIdKey_)  String itemId, @JsonKey(name: MusicAssistantProviderMapping.providerDomainKey_)  String providerDomain, @JsonKey(name: MusicAssistantProviderMapping.providerInstanceKey_)  String providerInstance, @JsonKey(name: MusicAssistantProviderMapping.availableKey_)  bool available, @JsonKey(name: MusicAssistantProviderMapping.inLibraryKey_)  bool? inLibrary, @JsonKey(name: MusicAssistantProviderMapping.isUniqueKey_)  bool? isUnique, @JsonKey(name: MusicAssistantProviderMapping.audioFormatKey_)  MusicAssistantAudioFormat? audioFormat, @JsonKey(name: MusicAssistantProviderMapping.urlKey_)  String? url, @JsonKey(name: MusicAssistantProviderMapping.detailsKey_)  String? details)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantProviderMapping() when $default != null:
return $default(_that.itemId,_that.providerDomain,_that.providerInstance,_that.available,_that.inLibrary,_that.isUnique,_that.audioFormat,_that.url,_that.details);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantProviderMapping extends MusicAssistantProviderMapping {
  const _MusicAssistantProviderMapping({@JsonKey(name: MusicAssistantProviderMapping.itemIdKey_) required this.itemId, @JsonKey(name: MusicAssistantProviderMapping.providerDomainKey_) required this.providerDomain, @JsonKey(name: MusicAssistantProviderMapping.providerInstanceKey_) required this.providerInstance, @JsonKey(name: MusicAssistantProviderMapping.availableKey_) this.available = true, @JsonKey(name: MusicAssistantProviderMapping.inLibraryKey_) this.inLibrary, @JsonKey(name: MusicAssistantProviderMapping.isUniqueKey_) this.isUnique, @JsonKey(name: MusicAssistantProviderMapping.audioFormatKey_) this.audioFormat, @JsonKey(name: MusicAssistantProviderMapping.urlKey_) this.url, @JsonKey(name: MusicAssistantProviderMapping.detailsKey_) this.details}): super._();
  factory _MusicAssistantProviderMapping.fromJson(Map<String, dynamic> json) => _$MusicAssistantProviderMappingFromJson(json);

/// itemId
@override@JsonKey(name: MusicAssistantProviderMapping.itemIdKey_) final  String itemId;
/// providerDomain
@override@JsonKey(name: MusicAssistantProviderMapping.providerDomainKey_) final  String providerDomain;
/// providerInstance
@override@JsonKey(name: MusicAssistantProviderMapping.providerInstanceKey_) final  String providerInstance;
/// available
@override@JsonKey(name: MusicAssistantProviderMapping.availableKey_) final  bool available;
/// inLibrary
@override@JsonKey(name: MusicAssistantProviderMapping.inLibraryKey_) final  bool? inLibrary;
/// isUnique
@override@JsonKey(name: MusicAssistantProviderMapping.isUniqueKey_) final  bool? isUnique;
/// audioFormat
@override@JsonKey(name: MusicAssistantProviderMapping.audioFormatKey_) final  MusicAssistantAudioFormat? audioFormat;
/// url
@override@JsonKey(name: MusicAssistantProviderMapping.urlKey_) final  String? url;
/// details
@override@JsonKey(name: MusicAssistantProviderMapping.detailsKey_) final  String? details;

/// Create a copy of MusicAssistantProviderMapping
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantProviderMappingCopyWith<_MusicAssistantProviderMapping> get copyWith => __$MusicAssistantProviderMappingCopyWithImpl<_MusicAssistantProviderMapping>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantProviderMappingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantProviderMapping&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.providerDomain, providerDomain) || other.providerDomain == providerDomain)&&(identical(other.providerInstance, providerInstance) || other.providerInstance == providerInstance)&&(identical(other.available, available) || other.available == available)&&(identical(other.inLibrary, inLibrary) || other.inLibrary == inLibrary)&&(identical(other.isUnique, isUnique) || other.isUnique == isUnique)&&(identical(other.audioFormat, audioFormat) || other.audioFormat == audioFormat)&&(identical(other.url, url) || other.url == url)&&(identical(other.details, details) || other.details == details));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,providerDomain,providerInstance,available,inLibrary,isUnique,audioFormat,url,details);

@override
String toString() {
  return 'MusicAssistantProviderMapping(itemId: $itemId, providerDomain: $providerDomain, providerInstance: $providerInstance, available: $available, inLibrary: $inLibrary, isUnique: $isUnique, audioFormat: $audioFormat, url: $url, details: $details)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantProviderMappingCopyWith<$Res> implements $MusicAssistantProviderMappingCopyWith<$Res> {
  factory _$MusicAssistantProviderMappingCopyWith(_MusicAssistantProviderMapping value, $Res Function(_MusicAssistantProviderMapping) _then) = __$MusicAssistantProviderMappingCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantProviderMapping.itemIdKey_) String itemId,@JsonKey(name: MusicAssistantProviderMapping.providerDomainKey_) String providerDomain,@JsonKey(name: MusicAssistantProviderMapping.providerInstanceKey_) String providerInstance,@JsonKey(name: MusicAssistantProviderMapping.availableKey_) bool available,@JsonKey(name: MusicAssistantProviderMapping.inLibraryKey_) bool? inLibrary,@JsonKey(name: MusicAssistantProviderMapping.isUniqueKey_) bool? isUnique,@JsonKey(name: MusicAssistantProviderMapping.audioFormatKey_) MusicAssistantAudioFormat? audioFormat,@JsonKey(name: MusicAssistantProviderMapping.urlKey_) String? url,@JsonKey(name: MusicAssistantProviderMapping.detailsKey_) String? details
});


@override $MusicAssistantAudioFormatCopyWith<$Res>? get audioFormat;

}
/// @nodoc
class __$MusicAssistantProviderMappingCopyWithImpl<$Res>
    implements _$MusicAssistantProviderMappingCopyWith<$Res> {
  __$MusicAssistantProviderMappingCopyWithImpl(this._self, this._then);

  final _MusicAssistantProviderMapping _self;
  final $Res Function(_MusicAssistantProviderMapping) _then;

/// Create a copy of MusicAssistantProviderMapping
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itemId = null,Object? providerDomain = null,Object? providerInstance = null,Object? available = null,Object? inLibrary = freezed,Object? isUnique = freezed,Object? audioFormat = freezed,Object? url = freezed,Object? details = freezed,}) {
  return _then(_MusicAssistantProviderMapping(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,providerDomain: null == providerDomain ? _self.providerDomain : providerDomain // ignore: cast_nullable_to_non_nullable
as String,providerInstance: null == providerInstance ? _self.providerInstance : providerInstance // ignore: cast_nullable_to_non_nullable
as String,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as bool,inLibrary: freezed == inLibrary ? _self.inLibrary : inLibrary // ignore: cast_nullable_to_non_nullable
as bool?,isUnique: freezed == isUnique ? _self.isUnique : isUnique // ignore: cast_nullable_to_non_nullable
as bool?,audioFormat: freezed == audioFormat ? _self.audioFormat : audioFormat // ignore: cast_nullable_to_non_nullable
as MusicAssistantAudioFormat?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,details: freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of MusicAssistantProviderMapping
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantAudioFormatCopyWith<$Res>? get audioFormat {
    if (_self.audioFormat == null) {
    return null;
  }

  return $MusicAssistantAudioFormatCopyWith<$Res>(_self.audioFormat!, (value) {
    return _then(_self.copyWith(audioFormat: value));
  });
}
}

// dart format on
