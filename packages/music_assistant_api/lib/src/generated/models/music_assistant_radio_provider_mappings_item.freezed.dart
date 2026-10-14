// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_radio_provider_mappings_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantRadioProviderMappingsItem {

/// providerInstance
@JsonKey(name: MusicAssistantRadioProviderMappingsItem.providerInstanceKey_) String? get providerInstance;/// providerDomain
@JsonKey(name: MusicAssistantRadioProviderMappingsItem.providerDomainKey_) String? get providerDomain;
/// Create a copy of MusicAssistantRadioProviderMappingsItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantRadioProviderMappingsItemCopyWith<MusicAssistantRadioProviderMappingsItem> get copyWith => _$MusicAssistantRadioProviderMappingsItemCopyWithImpl<MusicAssistantRadioProviderMappingsItem>(this as MusicAssistantRadioProviderMappingsItem, _$identity);

  /// Serializes this MusicAssistantRadioProviderMappingsItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantRadioProviderMappingsItem&&(identical(other.providerInstance, providerInstance) || other.providerInstance == providerInstance)&&(identical(other.providerDomain, providerDomain) || other.providerDomain == providerDomain));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,providerInstance,providerDomain);

@override
String toString() {
  return 'MusicAssistantRadioProviderMappingsItem(providerInstance: $providerInstance, providerDomain: $providerDomain)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantRadioProviderMappingsItemCopyWith<$Res>  {
  factory $MusicAssistantRadioProviderMappingsItemCopyWith(MusicAssistantRadioProviderMappingsItem value, $Res Function(MusicAssistantRadioProviderMappingsItem) _then) = _$MusicAssistantRadioProviderMappingsItemCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantRadioProviderMappingsItem.providerInstanceKey_) String? providerInstance,@JsonKey(name: MusicAssistantRadioProviderMappingsItem.providerDomainKey_) String? providerDomain
});




}
/// @nodoc
class _$MusicAssistantRadioProviderMappingsItemCopyWithImpl<$Res>
    implements $MusicAssistantRadioProviderMappingsItemCopyWith<$Res> {
  _$MusicAssistantRadioProviderMappingsItemCopyWithImpl(this._self, this._then);

  final MusicAssistantRadioProviderMappingsItem _self;
  final $Res Function(MusicAssistantRadioProviderMappingsItem) _then;

/// Create a copy of MusicAssistantRadioProviderMappingsItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? providerInstance = freezed,Object? providerDomain = freezed,}) {
  return _then(_self.copyWith(
providerInstance: freezed == providerInstance ? _self.providerInstance : providerInstance // ignore: cast_nullable_to_non_nullable
as String?,providerDomain: freezed == providerDomain ? _self.providerDomain : providerDomain // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MusicAssistantRadioProviderMappingsItem].
extension MusicAssistantRadioProviderMappingsItemPatterns on MusicAssistantRadioProviderMappingsItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantRadioProviderMappingsItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantRadioProviderMappingsItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantRadioProviderMappingsItem value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantRadioProviderMappingsItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantRadioProviderMappingsItem value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantRadioProviderMappingsItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantRadioProviderMappingsItem.providerInstanceKey_)  String? providerInstance, @JsonKey(name: MusicAssistantRadioProviderMappingsItem.providerDomainKey_)  String? providerDomain)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantRadioProviderMappingsItem() when $default != null:
return $default(_that.providerInstance,_that.providerDomain);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantRadioProviderMappingsItem.providerInstanceKey_)  String? providerInstance, @JsonKey(name: MusicAssistantRadioProviderMappingsItem.providerDomainKey_)  String? providerDomain)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantRadioProviderMappingsItem():
return $default(_that.providerInstance,_that.providerDomain);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantRadioProviderMappingsItem.providerInstanceKey_)  String? providerInstance, @JsonKey(name: MusicAssistantRadioProviderMappingsItem.providerDomainKey_)  String? providerDomain)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantRadioProviderMappingsItem() when $default != null:
return $default(_that.providerInstance,_that.providerDomain);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantRadioProviderMappingsItem extends MusicAssistantRadioProviderMappingsItem {
  const _MusicAssistantRadioProviderMappingsItem({@JsonKey(name: MusicAssistantRadioProviderMappingsItem.providerInstanceKey_) this.providerInstance, @JsonKey(name: MusicAssistantRadioProviderMappingsItem.providerDomainKey_) this.providerDomain}): super._();
  factory _MusicAssistantRadioProviderMappingsItem.fromJson(Map<String, dynamic> json) => _$MusicAssistantRadioProviderMappingsItemFromJson(json);

/// providerInstance
@override@JsonKey(name: MusicAssistantRadioProviderMappingsItem.providerInstanceKey_) final  String? providerInstance;
/// providerDomain
@override@JsonKey(name: MusicAssistantRadioProviderMappingsItem.providerDomainKey_) final  String? providerDomain;

/// Create a copy of MusicAssistantRadioProviderMappingsItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantRadioProviderMappingsItemCopyWith<_MusicAssistantRadioProviderMappingsItem> get copyWith => __$MusicAssistantRadioProviderMappingsItemCopyWithImpl<_MusicAssistantRadioProviderMappingsItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantRadioProviderMappingsItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantRadioProviderMappingsItem&&(identical(other.providerInstance, providerInstance) || other.providerInstance == providerInstance)&&(identical(other.providerDomain, providerDomain) || other.providerDomain == providerDomain));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,providerInstance,providerDomain);

@override
String toString() {
  return 'MusicAssistantRadioProviderMappingsItem(providerInstance: $providerInstance, providerDomain: $providerDomain)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantRadioProviderMappingsItemCopyWith<$Res> implements $MusicAssistantRadioProviderMappingsItemCopyWith<$Res> {
  factory _$MusicAssistantRadioProviderMappingsItemCopyWith(_MusicAssistantRadioProviderMappingsItem value, $Res Function(_MusicAssistantRadioProviderMappingsItem) _then) = __$MusicAssistantRadioProviderMappingsItemCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantRadioProviderMappingsItem.providerInstanceKey_) String? providerInstance,@JsonKey(name: MusicAssistantRadioProviderMappingsItem.providerDomainKey_) String? providerDomain
});




}
/// @nodoc
class __$MusicAssistantRadioProviderMappingsItemCopyWithImpl<$Res>
    implements _$MusicAssistantRadioProviderMappingsItemCopyWith<$Res> {
  __$MusicAssistantRadioProviderMappingsItemCopyWithImpl(this._self, this._then);

  final _MusicAssistantRadioProviderMappingsItem _self;
  final $Res Function(_MusicAssistantRadioProviderMappingsItem) _then;

/// Create a copy of MusicAssistantRadioProviderMappingsItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? providerInstance = freezed,Object? providerDomain = freezed,}) {
  return _then(_MusicAssistantRadioProviderMappingsItem(
providerInstance: freezed == providerInstance ? _self.providerInstance : providerInstance // ignore: cast_nullable_to_non_nullable
as String?,providerDomain: freezed == providerDomain ? _self.providerDomain : providerDomain // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
