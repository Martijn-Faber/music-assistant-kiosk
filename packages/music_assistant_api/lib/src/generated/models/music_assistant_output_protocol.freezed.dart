// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_output_protocol.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantOutputProtocol {

/// outputProtocolId
@JsonKey(name: MusicAssistantOutputProtocol.outputProtocolIdKey_) String get outputProtocolId;/// name
@JsonKey(name: MusicAssistantOutputProtocol.nameKey_) String get name;/// protocolDomain
@JsonKey(name: MusicAssistantOutputProtocol.protocolDomainKey_) String get protocolDomain;/// isNative
@JsonKey(name: MusicAssistantOutputProtocol.isNativeKey_) bool get isNative;/// priority
@JsonKey(name: MusicAssistantOutputProtocol.priorityKey_) int get priority;/// available
@JsonKey(name: MusicAssistantOutputProtocol.availableKey_) bool get available;/// derivedFrom
@JsonKey(name: MusicAssistantOutputProtocol.derivedFromKey_) String? get derivedFrom;
/// Create a copy of MusicAssistantOutputProtocol
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantOutputProtocolCopyWith<MusicAssistantOutputProtocol> get copyWith => _$MusicAssistantOutputProtocolCopyWithImpl<MusicAssistantOutputProtocol>(this as MusicAssistantOutputProtocol, _$identity);

  /// Serializes this MusicAssistantOutputProtocol to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantOutputProtocol&&(identical(other.outputProtocolId, outputProtocolId) || other.outputProtocolId == outputProtocolId)&&(identical(other.name, name) || other.name == name)&&(identical(other.protocolDomain, protocolDomain) || other.protocolDomain == protocolDomain)&&(identical(other.isNative, isNative) || other.isNative == isNative)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.available, available) || other.available == available)&&(identical(other.derivedFrom, derivedFrom) || other.derivedFrom == derivedFrom));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,outputProtocolId,name,protocolDomain,isNative,priority,available,derivedFrom);

@override
String toString() {
  return 'MusicAssistantOutputProtocol(outputProtocolId: $outputProtocolId, name: $name, protocolDomain: $protocolDomain, isNative: $isNative, priority: $priority, available: $available, derivedFrom: $derivedFrom)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantOutputProtocolCopyWith<$Res>  {
  factory $MusicAssistantOutputProtocolCopyWith(MusicAssistantOutputProtocol value, $Res Function(MusicAssistantOutputProtocol) _then) = _$MusicAssistantOutputProtocolCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantOutputProtocol.outputProtocolIdKey_) String outputProtocolId,@JsonKey(name: MusicAssistantOutputProtocol.nameKey_) String name,@JsonKey(name: MusicAssistantOutputProtocol.protocolDomainKey_) String protocolDomain,@JsonKey(name: MusicAssistantOutputProtocol.isNativeKey_) bool isNative,@JsonKey(name: MusicAssistantOutputProtocol.priorityKey_) int priority,@JsonKey(name: MusicAssistantOutputProtocol.availableKey_) bool available,@JsonKey(name: MusicAssistantOutputProtocol.derivedFromKey_) String? derivedFrom
});




}
/// @nodoc
class _$MusicAssistantOutputProtocolCopyWithImpl<$Res>
    implements $MusicAssistantOutputProtocolCopyWith<$Res> {
  _$MusicAssistantOutputProtocolCopyWithImpl(this._self, this._then);

  final MusicAssistantOutputProtocol _self;
  final $Res Function(MusicAssistantOutputProtocol) _then;

/// Create a copy of MusicAssistantOutputProtocol
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? outputProtocolId = null,Object? name = null,Object? protocolDomain = null,Object? isNative = null,Object? priority = null,Object? available = null,Object? derivedFrom = freezed,}) {
  return _then(_self.copyWith(
outputProtocolId: null == outputProtocolId ? _self.outputProtocolId : outputProtocolId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,protocolDomain: null == protocolDomain ? _self.protocolDomain : protocolDomain // ignore: cast_nullable_to_non_nullable
as String,isNative: null == isNative ? _self.isNative : isNative // ignore: cast_nullable_to_non_nullable
as bool,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as int,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as bool,derivedFrom: freezed == derivedFrom ? _self.derivedFrom : derivedFrom // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MusicAssistantOutputProtocol].
extension MusicAssistantOutputProtocolPatterns on MusicAssistantOutputProtocol {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantOutputProtocol value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantOutputProtocol() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantOutputProtocol value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantOutputProtocol():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantOutputProtocol value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantOutputProtocol() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantOutputProtocol.outputProtocolIdKey_)  String outputProtocolId, @JsonKey(name: MusicAssistantOutputProtocol.nameKey_)  String name, @JsonKey(name: MusicAssistantOutputProtocol.protocolDomainKey_)  String protocolDomain, @JsonKey(name: MusicAssistantOutputProtocol.isNativeKey_)  bool isNative, @JsonKey(name: MusicAssistantOutputProtocol.priorityKey_)  int priority, @JsonKey(name: MusicAssistantOutputProtocol.availableKey_)  bool available, @JsonKey(name: MusicAssistantOutputProtocol.derivedFromKey_)  String? derivedFrom)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantOutputProtocol() when $default != null:
return $default(_that.outputProtocolId,_that.name,_that.protocolDomain,_that.isNative,_that.priority,_that.available,_that.derivedFrom);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantOutputProtocol.outputProtocolIdKey_)  String outputProtocolId, @JsonKey(name: MusicAssistantOutputProtocol.nameKey_)  String name, @JsonKey(name: MusicAssistantOutputProtocol.protocolDomainKey_)  String protocolDomain, @JsonKey(name: MusicAssistantOutputProtocol.isNativeKey_)  bool isNative, @JsonKey(name: MusicAssistantOutputProtocol.priorityKey_)  int priority, @JsonKey(name: MusicAssistantOutputProtocol.availableKey_)  bool available, @JsonKey(name: MusicAssistantOutputProtocol.derivedFromKey_)  String? derivedFrom)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantOutputProtocol():
return $default(_that.outputProtocolId,_that.name,_that.protocolDomain,_that.isNative,_that.priority,_that.available,_that.derivedFrom);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantOutputProtocol.outputProtocolIdKey_)  String outputProtocolId, @JsonKey(name: MusicAssistantOutputProtocol.nameKey_)  String name, @JsonKey(name: MusicAssistantOutputProtocol.protocolDomainKey_)  String protocolDomain, @JsonKey(name: MusicAssistantOutputProtocol.isNativeKey_)  bool isNative, @JsonKey(name: MusicAssistantOutputProtocol.priorityKey_)  int priority, @JsonKey(name: MusicAssistantOutputProtocol.availableKey_)  bool available, @JsonKey(name: MusicAssistantOutputProtocol.derivedFromKey_)  String? derivedFrom)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantOutputProtocol() when $default != null:
return $default(_that.outputProtocolId,_that.name,_that.protocolDomain,_that.isNative,_that.priority,_that.available,_that.derivedFrom);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantOutputProtocol extends MusicAssistantOutputProtocol {
  const _MusicAssistantOutputProtocol({@JsonKey(name: MusicAssistantOutputProtocol.outputProtocolIdKey_) required this.outputProtocolId, @JsonKey(name: MusicAssistantOutputProtocol.nameKey_) required this.name, @JsonKey(name: MusicAssistantOutputProtocol.protocolDomainKey_) required this.protocolDomain, @JsonKey(name: MusicAssistantOutputProtocol.isNativeKey_) this.isNative = false, @JsonKey(name: MusicAssistantOutputProtocol.priorityKey_) this.priority = 100, @JsonKey(name: MusicAssistantOutputProtocol.availableKey_) this.available = true, @JsonKey(name: MusicAssistantOutputProtocol.derivedFromKey_) this.derivedFrom}): super._();
  factory _MusicAssistantOutputProtocol.fromJson(Map<String, dynamic> json) => _$MusicAssistantOutputProtocolFromJson(json);

/// outputProtocolId
@override@JsonKey(name: MusicAssistantOutputProtocol.outputProtocolIdKey_) final  String outputProtocolId;
/// name
@override@JsonKey(name: MusicAssistantOutputProtocol.nameKey_) final  String name;
/// protocolDomain
@override@JsonKey(name: MusicAssistantOutputProtocol.protocolDomainKey_) final  String protocolDomain;
/// isNative
@override@JsonKey(name: MusicAssistantOutputProtocol.isNativeKey_) final  bool isNative;
/// priority
@override@JsonKey(name: MusicAssistantOutputProtocol.priorityKey_) final  int priority;
/// available
@override@JsonKey(name: MusicAssistantOutputProtocol.availableKey_) final  bool available;
/// derivedFrom
@override@JsonKey(name: MusicAssistantOutputProtocol.derivedFromKey_) final  String? derivedFrom;

/// Create a copy of MusicAssistantOutputProtocol
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantOutputProtocolCopyWith<_MusicAssistantOutputProtocol> get copyWith => __$MusicAssistantOutputProtocolCopyWithImpl<_MusicAssistantOutputProtocol>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantOutputProtocolToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantOutputProtocol&&(identical(other.outputProtocolId, outputProtocolId) || other.outputProtocolId == outputProtocolId)&&(identical(other.name, name) || other.name == name)&&(identical(other.protocolDomain, protocolDomain) || other.protocolDomain == protocolDomain)&&(identical(other.isNative, isNative) || other.isNative == isNative)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.available, available) || other.available == available)&&(identical(other.derivedFrom, derivedFrom) || other.derivedFrom == derivedFrom));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,outputProtocolId,name,protocolDomain,isNative,priority,available,derivedFrom);

@override
String toString() {
  return 'MusicAssistantOutputProtocol(outputProtocolId: $outputProtocolId, name: $name, protocolDomain: $protocolDomain, isNative: $isNative, priority: $priority, available: $available, derivedFrom: $derivedFrom)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantOutputProtocolCopyWith<$Res> implements $MusicAssistantOutputProtocolCopyWith<$Res> {
  factory _$MusicAssistantOutputProtocolCopyWith(_MusicAssistantOutputProtocol value, $Res Function(_MusicAssistantOutputProtocol) _then) = __$MusicAssistantOutputProtocolCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantOutputProtocol.outputProtocolIdKey_) String outputProtocolId,@JsonKey(name: MusicAssistantOutputProtocol.nameKey_) String name,@JsonKey(name: MusicAssistantOutputProtocol.protocolDomainKey_) String protocolDomain,@JsonKey(name: MusicAssistantOutputProtocol.isNativeKey_) bool isNative,@JsonKey(name: MusicAssistantOutputProtocol.priorityKey_) int priority,@JsonKey(name: MusicAssistantOutputProtocol.availableKey_) bool available,@JsonKey(name: MusicAssistantOutputProtocol.derivedFromKey_) String? derivedFrom
});




}
/// @nodoc
class __$MusicAssistantOutputProtocolCopyWithImpl<$Res>
    implements _$MusicAssistantOutputProtocolCopyWith<$Res> {
  __$MusicAssistantOutputProtocolCopyWithImpl(this._self, this._then);

  final _MusicAssistantOutputProtocol _self;
  final $Res Function(_MusicAssistantOutputProtocol) _then;

/// Create a copy of MusicAssistantOutputProtocol
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? outputProtocolId = null,Object? name = null,Object? protocolDomain = null,Object? isNative = null,Object? priority = null,Object? available = null,Object? derivedFrom = freezed,}) {
  return _then(_MusicAssistantOutputProtocol(
outputProtocolId: null == outputProtocolId ? _self.outputProtocolId : outputProtocolId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,protocolDomain: null == protocolDomain ? _self.protocolDomain : protocolDomain // ignore: cast_nullable_to_non_nullable
as String,isNative: null == isNative ? _self.isNative : isNative // ignore: cast_nullable_to_non_nullable
as bool,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as int,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as bool,derivedFrom: freezed == derivedFrom ? _self.derivedFrom : derivedFrom // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
