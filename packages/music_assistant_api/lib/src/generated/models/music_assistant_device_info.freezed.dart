// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_device_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantDeviceInfo {

/// model
@JsonKey(name: MusicAssistantDeviceInfo.modelKey_) String get model;/// manufacturer
@JsonKey(name: MusicAssistantDeviceInfo.manufacturerKey_) String get manufacturer;/// softwareVersion
@JsonKey(name: MusicAssistantDeviceInfo.softwareVersionKey_) String? get softwareVersion;/// modelId
@JsonKey(name: MusicAssistantDeviceInfo.modelIdKey_) String? get modelId;/// manufacturerId
@JsonKey(name: MusicAssistantDeviceInfo.manufacturerIdKey_) String? get manufacturerId;/// identifiers
@JsonKey(name: MusicAssistantDeviceInfo.identifiersKey_) Map<String, String>? get identifiers;
/// Create a copy of MusicAssistantDeviceInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantDeviceInfoCopyWith<MusicAssistantDeviceInfo> get copyWith => _$MusicAssistantDeviceInfoCopyWithImpl<MusicAssistantDeviceInfo>(this as MusicAssistantDeviceInfo, _$identity);

  /// Serializes this MusicAssistantDeviceInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantDeviceInfo&&(identical(other.model, model) || other.model == model)&&(identical(other.manufacturer, manufacturer) || other.manufacturer == manufacturer)&&(identical(other.softwareVersion, softwareVersion) || other.softwareVersion == softwareVersion)&&(identical(other.modelId, modelId) || other.modelId == modelId)&&(identical(other.manufacturerId, manufacturerId) || other.manufacturerId == manufacturerId)&&const DeepCollectionEquality().equals(other.identifiers, identifiers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,model,manufacturer,softwareVersion,modelId,manufacturerId,const DeepCollectionEquality().hash(identifiers));

@override
String toString() {
  return 'MusicAssistantDeviceInfo(model: $model, manufacturer: $manufacturer, softwareVersion: $softwareVersion, modelId: $modelId, manufacturerId: $manufacturerId, identifiers: $identifiers)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantDeviceInfoCopyWith<$Res>  {
  factory $MusicAssistantDeviceInfoCopyWith(MusicAssistantDeviceInfo value, $Res Function(MusicAssistantDeviceInfo) _then) = _$MusicAssistantDeviceInfoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantDeviceInfo.modelKey_) String model,@JsonKey(name: MusicAssistantDeviceInfo.manufacturerKey_) String manufacturer,@JsonKey(name: MusicAssistantDeviceInfo.softwareVersionKey_) String? softwareVersion,@JsonKey(name: MusicAssistantDeviceInfo.modelIdKey_) String? modelId,@JsonKey(name: MusicAssistantDeviceInfo.manufacturerIdKey_) String? manufacturerId,@JsonKey(name: MusicAssistantDeviceInfo.identifiersKey_) Map<String, String>? identifiers
});




}
/// @nodoc
class _$MusicAssistantDeviceInfoCopyWithImpl<$Res>
    implements $MusicAssistantDeviceInfoCopyWith<$Res> {
  _$MusicAssistantDeviceInfoCopyWithImpl(this._self, this._then);

  final MusicAssistantDeviceInfo _self;
  final $Res Function(MusicAssistantDeviceInfo) _then;

/// Create a copy of MusicAssistantDeviceInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? model = null,Object? manufacturer = null,Object? softwareVersion = freezed,Object? modelId = freezed,Object? manufacturerId = freezed,Object? identifiers = freezed,}) {
  return _then(_self.copyWith(
model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,manufacturer: null == manufacturer ? _self.manufacturer : manufacturer // ignore: cast_nullable_to_non_nullable
as String,softwareVersion: freezed == softwareVersion ? _self.softwareVersion : softwareVersion // ignore: cast_nullable_to_non_nullable
as String?,modelId: freezed == modelId ? _self.modelId : modelId // ignore: cast_nullable_to_non_nullable
as String?,manufacturerId: freezed == manufacturerId ? _self.manufacturerId : manufacturerId // ignore: cast_nullable_to_non_nullable
as String?,identifiers: freezed == identifiers ? _self.identifiers : identifiers // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [MusicAssistantDeviceInfo].
extension MusicAssistantDeviceInfoPatterns on MusicAssistantDeviceInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantDeviceInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantDeviceInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantDeviceInfo value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantDeviceInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantDeviceInfo value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantDeviceInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantDeviceInfo.modelKey_)  String model, @JsonKey(name: MusicAssistantDeviceInfo.manufacturerKey_)  String manufacturer, @JsonKey(name: MusicAssistantDeviceInfo.softwareVersionKey_)  String? softwareVersion, @JsonKey(name: MusicAssistantDeviceInfo.modelIdKey_)  String? modelId, @JsonKey(name: MusicAssistantDeviceInfo.manufacturerIdKey_)  String? manufacturerId, @JsonKey(name: MusicAssistantDeviceInfo.identifiersKey_)  Map<String, String>? identifiers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantDeviceInfo() when $default != null:
return $default(_that.model,_that.manufacturer,_that.softwareVersion,_that.modelId,_that.manufacturerId,_that.identifiers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantDeviceInfo.modelKey_)  String model, @JsonKey(name: MusicAssistantDeviceInfo.manufacturerKey_)  String manufacturer, @JsonKey(name: MusicAssistantDeviceInfo.softwareVersionKey_)  String? softwareVersion, @JsonKey(name: MusicAssistantDeviceInfo.modelIdKey_)  String? modelId, @JsonKey(name: MusicAssistantDeviceInfo.manufacturerIdKey_)  String? manufacturerId, @JsonKey(name: MusicAssistantDeviceInfo.identifiersKey_)  Map<String, String>? identifiers)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantDeviceInfo():
return $default(_that.model,_that.manufacturer,_that.softwareVersion,_that.modelId,_that.manufacturerId,_that.identifiers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantDeviceInfo.modelKey_)  String model, @JsonKey(name: MusicAssistantDeviceInfo.manufacturerKey_)  String manufacturer, @JsonKey(name: MusicAssistantDeviceInfo.softwareVersionKey_)  String? softwareVersion, @JsonKey(name: MusicAssistantDeviceInfo.modelIdKey_)  String? modelId, @JsonKey(name: MusicAssistantDeviceInfo.manufacturerIdKey_)  String? manufacturerId, @JsonKey(name: MusicAssistantDeviceInfo.identifiersKey_)  Map<String, String>? identifiers)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantDeviceInfo() when $default != null:
return $default(_that.model,_that.manufacturer,_that.softwareVersion,_that.modelId,_that.manufacturerId,_that.identifiers);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantDeviceInfo extends MusicAssistantDeviceInfo {
  const _MusicAssistantDeviceInfo({@JsonKey(name: MusicAssistantDeviceInfo.modelKey_) this.model = 'Unknown model', @JsonKey(name: MusicAssistantDeviceInfo.manufacturerKey_) this.manufacturer = 'Unknown Manufacturer', @JsonKey(name: MusicAssistantDeviceInfo.softwareVersionKey_) this.softwareVersion, @JsonKey(name: MusicAssistantDeviceInfo.modelIdKey_) this.modelId, @JsonKey(name: MusicAssistantDeviceInfo.manufacturerIdKey_) this.manufacturerId, @JsonKey(name: MusicAssistantDeviceInfo.identifiersKey_) final  Map<String, String>? identifiers}): _identifiers = identifiers,super._();
  factory _MusicAssistantDeviceInfo.fromJson(Map<String, dynamic> json) => _$MusicAssistantDeviceInfoFromJson(json);

/// model
@override@JsonKey(name: MusicAssistantDeviceInfo.modelKey_) final  String model;
/// manufacturer
@override@JsonKey(name: MusicAssistantDeviceInfo.manufacturerKey_) final  String manufacturer;
/// softwareVersion
@override@JsonKey(name: MusicAssistantDeviceInfo.softwareVersionKey_) final  String? softwareVersion;
/// modelId
@override@JsonKey(name: MusicAssistantDeviceInfo.modelIdKey_) final  String? modelId;
/// manufacturerId
@override@JsonKey(name: MusicAssistantDeviceInfo.manufacturerIdKey_) final  String? manufacturerId;
/// identifiers
 final  Map<String, String>? _identifiers;
/// identifiers
@override@JsonKey(name: MusicAssistantDeviceInfo.identifiersKey_) Map<String, String>? get identifiers {
  final value = _identifiers;
  if (value == null) return null;
  if (_identifiers is EqualUnmodifiableMapView) return _identifiers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of MusicAssistantDeviceInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantDeviceInfoCopyWith<_MusicAssistantDeviceInfo> get copyWith => __$MusicAssistantDeviceInfoCopyWithImpl<_MusicAssistantDeviceInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantDeviceInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantDeviceInfo&&(identical(other.model, model) || other.model == model)&&(identical(other.manufacturer, manufacturer) || other.manufacturer == manufacturer)&&(identical(other.softwareVersion, softwareVersion) || other.softwareVersion == softwareVersion)&&(identical(other.modelId, modelId) || other.modelId == modelId)&&(identical(other.manufacturerId, manufacturerId) || other.manufacturerId == manufacturerId)&&const DeepCollectionEquality().equals(other._identifiers, _identifiers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,model,manufacturer,softwareVersion,modelId,manufacturerId,const DeepCollectionEquality().hash(_identifiers));

@override
String toString() {
  return 'MusicAssistantDeviceInfo(model: $model, manufacturer: $manufacturer, softwareVersion: $softwareVersion, modelId: $modelId, manufacturerId: $manufacturerId, identifiers: $identifiers)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantDeviceInfoCopyWith<$Res> implements $MusicAssistantDeviceInfoCopyWith<$Res> {
  factory _$MusicAssistantDeviceInfoCopyWith(_MusicAssistantDeviceInfo value, $Res Function(_MusicAssistantDeviceInfo) _then) = __$MusicAssistantDeviceInfoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantDeviceInfo.modelKey_) String model,@JsonKey(name: MusicAssistantDeviceInfo.manufacturerKey_) String manufacturer,@JsonKey(name: MusicAssistantDeviceInfo.softwareVersionKey_) String? softwareVersion,@JsonKey(name: MusicAssistantDeviceInfo.modelIdKey_) String? modelId,@JsonKey(name: MusicAssistantDeviceInfo.manufacturerIdKey_) String? manufacturerId,@JsonKey(name: MusicAssistantDeviceInfo.identifiersKey_) Map<String, String>? identifiers
});




}
/// @nodoc
class __$MusicAssistantDeviceInfoCopyWithImpl<$Res>
    implements _$MusicAssistantDeviceInfoCopyWith<$Res> {
  __$MusicAssistantDeviceInfoCopyWithImpl(this._self, this._then);

  final _MusicAssistantDeviceInfo _self;
  final $Res Function(_MusicAssistantDeviceInfo) _then;

/// Create a copy of MusicAssistantDeviceInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? model = null,Object? manufacturer = null,Object? softwareVersion = freezed,Object? modelId = freezed,Object? manufacturerId = freezed,Object? identifiers = freezed,}) {
  return _then(_MusicAssistantDeviceInfo(
model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,manufacturer: null == manufacturer ? _self.manufacturer : manufacturer // ignore: cast_nullable_to_non_nullable
as String,softwareVersion: freezed == softwareVersion ? _self.softwareVersion : softwareVersion // ignore: cast_nullable_to_non_nullable
as String?,modelId: freezed == modelId ? _self.modelId : modelId // ignore: cast_nullable_to_non_nullable
as String?,manufacturerId: freezed == manufacturerId ? _self.manufacturerId : manufacturerId // ignore: cast_nullable_to_non_nullable
as String?,identifiers: freezed == identifiers ? _self._identifiers : identifiers // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,
  ));
}


}

// dart format on
