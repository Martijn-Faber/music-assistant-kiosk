// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_server_info_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantServerInfoMessage {

/// name
@JsonKey(name: MusicAssistantServerInfoMessage.nameKey_) String? get name;/// minSupportedSchemaVersion
@JsonKey(name: MusicAssistantServerInfoMessage.minSupportedSchemaVersionKey_) int get minSupportedSchemaVersion;/// serverVersion
@JsonKey(name: MusicAssistantServerInfoMessage.serverVersionKey_) String get serverVersion;/// serverId
@JsonKey(name: MusicAssistantServerInfoMessage.serverIdKey_) String get serverId;/// status
@JsonKey(name: MusicAssistantServerInfoMessage.statusKey_) String get status;/// schemaVersion
@JsonKey(name: MusicAssistantServerInfoMessage.schemaVersionKey_) int get schemaVersion;
/// Create a copy of MusicAssistantServerInfoMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantServerInfoMessageCopyWith<MusicAssistantServerInfoMessage> get copyWith => _$MusicAssistantServerInfoMessageCopyWithImpl<MusicAssistantServerInfoMessage>(this as MusicAssistantServerInfoMessage, _$identity);

  /// Serializes this MusicAssistantServerInfoMessage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantServerInfoMessage&&(identical(other.name, name) || other.name == name)&&(identical(other.minSupportedSchemaVersion, minSupportedSchemaVersion) || other.minSupportedSchemaVersion == minSupportedSchemaVersion)&&(identical(other.serverVersion, serverVersion) || other.serverVersion == serverVersion)&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.status, status) || other.status == status)&&(identical(other.schemaVersion, schemaVersion) || other.schemaVersion == schemaVersion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,minSupportedSchemaVersion,serverVersion,serverId,status,schemaVersion);

@override
String toString() {
  return 'MusicAssistantServerInfoMessage(name: $name, minSupportedSchemaVersion: $minSupportedSchemaVersion, serverVersion: $serverVersion, serverId: $serverId, status: $status, schemaVersion: $schemaVersion)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantServerInfoMessageCopyWith<$Res>  {
  factory $MusicAssistantServerInfoMessageCopyWith(MusicAssistantServerInfoMessage value, $Res Function(MusicAssistantServerInfoMessage) _then) = _$MusicAssistantServerInfoMessageCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantServerInfoMessage.nameKey_) String? name,@JsonKey(name: MusicAssistantServerInfoMessage.minSupportedSchemaVersionKey_) int minSupportedSchemaVersion,@JsonKey(name: MusicAssistantServerInfoMessage.serverVersionKey_) String serverVersion,@JsonKey(name: MusicAssistantServerInfoMessage.serverIdKey_) String serverId,@JsonKey(name: MusicAssistantServerInfoMessage.statusKey_) String status,@JsonKey(name: MusicAssistantServerInfoMessage.schemaVersionKey_) int schemaVersion
});




}
/// @nodoc
class _$MusicAssistantServerInfoMessageCopyWithImpl<$Res>
    implements $MusicAssistantServerInfoMessageCopyWith<$Res> {
  _$MusicAssistantServerInfoMessageCopyWithImpl(this._self, this._then);

  final MusicAssistantServerInfoMessage _self;
  final $Res Function(MusicAssistantServerInfoMessage) _then;

/// Create a copy of MusicAssistantServerInfoMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? minSupportedSchemaVersion = null,Object? serverVersion = null,Object? serverId = null,Object? status = null,Object? schemaVersion = null,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,minSupportedSchemaVersion: null == minSupportedSchemaVersion ? _self.minSupportedSchemaVersion : minSupportedSchemaVersion // ignore: cast_nullable_to_non_nullable
as int,serverVersion: null == serverVersion ? _self.serverVersion : serverVersion // ignore: cast_nullable_to_non_nullable
as String,serverId: null == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,schemaVersion: null == schemaVersion ? _self.schemaVersion : schemaVersion // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MusicAssistantServerInfoMessage].
extension MusicAssistantServerInfoMessagePatterns on MusicAssistantServerInfoMessage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantServerInfoMessage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantServerInfoMessage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantServerInfoMessage value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantServerInfoMessage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantServerInfoMessage value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantServerInfoMessage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantServerInfoMessage.nameKey_)  String? name, @JsonKey(name: MusicAssistantServerInfoMessage.minSupportedSchemaVersionKey_)  int minSupportedSchemaVersion, @JsonKey(name: MusicAssistantServerInfoMessage.serverVersionKey_)  String serverVersion, @JsonKey(name: MusicAssistantServerInfoMessage.serverIdKey_)  String serverId, @JsonKey(name: MusicAssistantServerInfoMessage.statusKey_)  String status, @JsonKey(name: MusicAssistantServerInfoMessage.schemaVersionKey_)  int schemaVersion)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantServerInfoMessage() when $default != null:
return $default(_that.name,_that.minSupportedSchemaVersion,_that.serverVersion,_that.serverId,_that.status,_that.schemaVersion);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantServerInfoMessage.nameKey_)  String? name, @JsonKey(name: MusicAssistantServerInfoMessage.minSupportedSchemaVersionKey_)  int minSupportedSchemaVersion, @JsonKey(name: MusicAssistantServerInfoMessage.serverVersionKey_)  String serverVersion, @JsonKey(name: MusicAssistantServerInfoMessage.serverIdKey_)  String serverId, @JsonKey(name: MusicAssistantServerInfoMessage.statusKey_)  String status, @JsonKey(name: MusicAssistantServerInfoMessage.schemaVersionKey_)  int schemaVersion)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantServerInfoMessage():
return $default(_that.name,_that.minSupportedSchemaVersion,_that.serverVersion,_that.serverId,_that.status,_that.schemaVersion);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantServerInfoMessage.nameKey_)  String? name, @JsonKey(name: MusicAssistantServerInfoMessage.minSupportedSchemaVersionKey_)  int minSupportedSchemaVersion, @JsonKey(name: MusicAssistantServerInfoMessage.serverVersionKey_)  String serverVersion, @JsonKey(name: MusicAssistantServerInfoMessage.serverIdKey_)  String serverId, @JsonKey(name: MusicAssistantServerInfoMessage.statusKey_)  String status, @JsonKey(name: MusicAssistantServerInfoMessage.schemaVersionKey_)  int schemaVersion)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantServerInfoMessage() when $default != null:
return $default(_that.name,_that.minSupportedSchemaVersion,_that.serverVersion,_that.serverId,_that.status,_that.schemaVersion);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantServerInfoMessage extends MusicAssistantServerInfoMessage {
  const _MusicAssistantServerInfoMessage({@JsonKey(name: MusicAssistantServerInfoMessage.nameKey_) this.name, @JsonKey(name: MusicAssistantServerInfoMessage.minSupportedSchemaVersionKey_) required this.minSupportedSchemaVersion, @JsonKey(name: MusicAssistantServerInfoMessage.serverVersionKey_) required this.serverVersion, @JsonKey(name: MusicAssistantServerInfoMessage.serverIdKey_) required this.serverId, @JsonKey(name: MusicAssistantServerInfoMessage.statusKey_) this.status = 'running', @JsonKey(name: MusicAssistantServerInfoMessage.schemaVersionKey_) required this.schemaVersion}): super._();
  factory _MusicAssistantServerInfoMessage.fromJson(Map<String, dynamic> json) => _$MusicAssistantServerInfoMessageFromJson(json);

/// name
@override@JsonKey(name: MusicAssistantServerInfoMessage.nameKey_) final  String? name;
/// minSupportedSchemaVersion
@override@JsonKey(name: MusicAssistantServerInfoMessage.minSupportedSchemaVersionKey_) final  int minSupportedSchemaVersion;
/// serverVersion
@override@JsonKey(name: MusicAssistantServerInfoMessage.serverVersionKey_) final  String serverVersion;
/// serverId
@override@JsonKey(name: MusicAssistantServerInfoMessage.serverIdKey_) final  String serverId;
/// status
@override@JsonKey(name: MusicAssistantServerInfoMessage.statusKey_) final  String status;
/// schemaVersion
@override@JsonKey(name: MusicAssistantServerInfoMessage.schemaVersionKey_) final  int schemaVersion;

/// Create a copy of MusicAssistantServerInfoMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantServerInfoMessageCopyWith<_MusicAssistantServerInfoMessage> get copyWith => __$MusicAssistantServerInfoMessageCopyWithImpl<_MusicAssistantServerInfoMessage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantServerInfoMessageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantServerInfoMessage&&(identical(other.name, name) || other.name == name)&&(identical(other.minSupportedSchemaVersion, minSupportedSchemaVersion) || other.minSupportedSchemaVersion == minSupportedSchemaVersion)&&(identical(other.serverVersion, serverVersion) || other.serverVersion == serverVersion)&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.status, status) || other.status == status)&&(identical(other.schemaVersion, schemaVersion) || other.schemaVersion == schemaVersion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,minSupportedSchemaVersion,serverVersion,serverId,status,schemaVersion);

@override
String toString() {
  return 'MusicAssistantServerInfoMessage(name: $name, minSupportedSchemaVersion: $minSupportedSchemaVersion, serverVersion: $serverVersion, serverId: $serverId, status: $status, schemaVersion: $schemaVersion)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantServerInfoMessageCopyWith<$Res> implements $MusicAssistantServerInfoMessageCopyWith<$Res> {
  factory _$MusicAssistantServerInfoMessageCopyWith(_MusicAssistantServerInfoMessage value, $Res Function(_MusicAssistantServerInfoMessage) _then) = __$MusicAssistantServerInfoMessageCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantServerInfoMessage.nameKey_) String? name,@JsonKey(name: MusicAssistantServerInfoMessage.minSupportedSchemaVersionKey_) int minSupportedSchemaVersion,@JsonKey(name: MusicAssistantServerInfoMessage.serverVersionKey_) String serverVersion,@JsonKey(name: MusicAssistantServerInfoMessage.serverIdKey_) String serverId,@JsonKey(name: MusicAssistantServerInfoMessage.statusKey_) String status,@JsonKey(name: MusicAssistantServerInfoMessage.schemaVersionKey_) int schemaVersion
});




}
/// @nodoc
class __$MusicAssistantServerInfoMessageCopyWithImpl<$Res>
    implements _$MusicAssistantServerInfoMessageCopyWith<$Res> {
  __$MusicAssistantServerInfoMessageCopyWithImpl(this._self, this._then);

  final _MusicAssistantServerInfoMessage _self;
  final $Res Function(_MusicAssistantServerInfoMessage) _then;

/// Create a copy of MusicAssistantServerInfoMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? minSupportedSchemaVersion = null,Object? serverVersion = null,Object? serverId = null,Object? status = null,Object? schemaVersion = null,}) {
  return _then(_MusicAssistantServerInfoMessage(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,minSupportedSchemaVersion: null == minSupportedSchemaVersion ? _self.minSupportedSchemaVersion : minSupportedSchemaVersion // ignore: cast_nullable_to_non_nullable
as int,serverVersion: null == serverVersion ? _self.serverVersion : serverVersion // ignore: cast_nullable_to_non_nullable
as String,serverId: null == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,schemaVersion: null == schemaVersion ? _self.schemaVersion : schemaVersion // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
