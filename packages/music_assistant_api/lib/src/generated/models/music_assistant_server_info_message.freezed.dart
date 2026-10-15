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

/// serverId
@JsonKey(name: MusicAssistantServerInfoMessage.serverIdKey_) String get serverId;/// serverVersion
@JsonKey(name: MusicAssistantServerInfoMessage.serverVersionKey_) String get serverVersion;/// schemaVersion
@JsonKey(name: MusicAssistantServerInfoMessage.schemaVersionKey_) int get schemaVersion;/// minSupportedSchemaVersion
@JsonKey(name: MusicAssistantServerInfoMessage.minSupportedSchemaVersionKey_) int get minSupportedSchemaVersion;/// baseUrl
@JsonKey(name: MusicAssistantServerInfoMessage.baseUrlKey_) String? get baseUrl;/// homeassistantAddon
@JsonKey(name: MusicAssistantServerInfoMessage.homeassistantAddonKey_) bool get homeassistantAddon;/// onboardDone
@JsonKey(name: MusicAssistantServerInfoMessage.onboardDoneKey_) bool get onboardDone;/// name
@JsonKey(name: MusicAssistantServerInfoMessage.nameKey_) String? get name;/// status
@JsonKey(name: MusicAssistantServerInfoMessage.statusKey_) MusicAssistantCoreState get status;/// internalUrl
@JsonKey(name: MusicAssistantServerInfoMessage.internalUrlKey_) String? get internalUrl;/// externalUrl
@JsonKey(name: MusicAssistantServerInfoMessage.externalUrlKey_) String? get externalUrl;/// hasRemoteAccess
@JsonKey(name: MusicAssistantServerInfoMessage.hasRemoteAccessKey_) bool get hasRemoteAccess;
/// Create a copy of MusicAssistantServerInfoMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantServerInfoMessageCopyWith<MusicAssistantServerInfoMessage> get copyWith => _$MusicAssistantServerInfoMessageCopyWithImpl<MusicAssistantServerInfoMessage>(this as MusicAssistantServerInfoMessage, _$identity);

  /// Serializes this MusicAssistantServerInfoMessage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantServerInfoMessage&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.serverVersion, serverVersion) || other.serverVersion == serverVersion)&&(identical(other.schemaVersion, schemaVersion) || other.schemaVersion == schemaVersion)&&(identical(other.minSupportedSchemaVersion, minSupportedSchemaVersion) || other.minSupportedSchemaVersion == minSupportedSchemaVersion)&&(identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl)&&(identical(other.homeassistantAddon, homeassistantAddon) || other.homeassistantAddon == homeassistantAddon)&&(identical(other.onboardDone, onboardDone) || other.onboardDone == onboardDone)&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.internalUrl, internalUrl) || other.internalUrl == internalUrl)&&(identical(other.externalUrl, externalUrl) || other.externalUrl == externalUrl)&&(identical(other.hasRemoteAccess, hasRemoteAccess) || other.hasRemoteAccess == hasRemoteAccess));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serverId,serverVersion,schemaVersion,minSupportedSchemaVersion,baseUrl,homeassistantAddon,onboardDone,name,status,internalUrl,externalUrl,hasRemoteAccess);

@override
String toString() {
  return 'MusicAssistantServerInfoMessage(serverId: $serverId, serverVersion: $serverVersion, schemaVersion: $schemaVersion, minSupportedSchemaVersion: $minSupportedSchemaVersion, baseUrl: $baseUrl, homeassistantAddon: $homeassistantAddon, onboardDone: $onboardDone, name: $name, status: $status, internalUrl: $internalUrl, externalUrl: $externalUrl, hasRemoteAccess: $hasRemoteAccess)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantServerInfoMessageCopyWith<$Res>  {
  factory $MusicAssistantServerInfoMessageCopyWith(MusicAssistantServerInfoMessage value, $Res Function(MusicAssistantServerInfoMessage) _then) = _$MusicAssistantServerInfoMessageCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantServerInfoMessage.serverIdKey_) String serverId,@JsonKey(name: MusicAssistantServerInfoMessage.serverVersionKey_) String serverVersion,@JsonKey(name: MusicAssistantServerInfoMessage.schemaVersionKey_) int schemaVersion,@JsonKey(name: MusicAssistantServerInfoMessage.minSupportedSchemaVersionKey_) int minSupportedSchemaVersion,@JsonKey(name: MusicAssistantServerInfoMessage.baseUrlKey_) String? baseUrl,@JsonKey(name: MusicAssistantServerInfoMessage.homeassistantAddonKey_) bool homeassistantAddon,@JsonKey(name: MusicAssistantServerInfoMessage.onboardDoneKey_) bool onboardDone,@JsonKey(name: MusicAssistantServerInfoMessage.nameKey_) String? name,@JsonKey(name: MusicAssistantServerInfoMessage.statusKey_) MusicAssistantCoreState status,@JsonKey(name: MusicAssistantServerInfoMessage.internalUrlKey_) String? internalUrl,@JsonKey(name: MusicAssistantServerInfoMessage.externalUrlKey_) String? externalUrl,@JsonKey(name: MusicAssistantServerInfoMessage.hasRemoteAccessKey_) bool hasRemoteAccess
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
@pragma('vm:prefer-inline') @override $Res call({Object? serverId = null,Object? serverVersion = null,Object? schemaVersion = null,Object? minSupportedSchemaVersion = null,Object? baseUrl = freezed,Object? homeassistantAddon = null,Object? onboardDone = null,Object? name = freezed,Object? status = null,Object? internalUrl = freezed,Object? externalUrl = freezed,Object? hasRemoteAccess = null,}) {
  return _then(_self.copyWith(
serverId: null == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as String,serverVersion: null == serverVersion ? _self.serverVersion : serverVersion // ignore: cast_nullable_to_non_nullable
as String,schemaVersion: null == schemaVersion ? _self.schemaVersion : schemaVersion // ignore: cast_nullable_to_non_nullable
as int,minSupportedSchemaVersion: null == minSupportedSchemaVersion ? _self.minSupportedSchemaVersion : minSupportedSchemaVersion // ignore: cast_nullable_to_non_nullable
as int,baseUrl: freezed == baseUrl ? _self.baseUrl : baseUrl // ignore: cast_nullable_to_non_nullable
as String?,homeassistantAddon: null == homeassistantAddon ? _self.homeassistantAddon : homeassistantAddon // ignore: cast_nullable_to_non_nullable
as bool,onboardDone: null == onboardDone ? _self.onboardDone : onboardDone // ignore: cast_nullable_to_non_nullable
as bool,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MusicAssistantCoreState,internalUrl: freezed == internalUrl ? _self.internalUrl : internalUrl // ignore: cast_nullable_to_non_nullable
as String?,externalUrl: freezed == externalUrl ? _self.externalUrl : externalUrl // ignore: cast_nullable_to_non_nullable
as String?,hasRemoteAccess: null == hasRemoteAccess ? _self.hasRemoteAccess : hasRemoteAccess // ignore: cast_nullable_to_non_nullable
as bool,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantServerInfoMessage.serverIdKey_)  String serverId, @JsonKey(name: MusicAssistantServerInfoMessage.serverVersionKey_)  String serverVersion, @JsonKey(name: MusicAssistantServerInfoMessage.schemaVersionKey_)  int schemaVersion, @JsonKey(name: MusicAssistantServerInfoMessage.minSupportedSchemaVersionKey_)  int minSupportedSchemaVersion, @JsonKey(name: MusicAssistantServerInfoMessage.baseUrlKey_)  String? baseUrl, @JsonKey(name: MusicAssistantServerInfoMessage.homeassistantAddonKey_)  bool homeassistantAddon, @JsonKey(name: MusicAssistantServerInfoMessage.onboardDoneKey_)  bool onboardDone, @JsonKey(name: MusicAssistantServerInfoMessage.nameKey_)  String? name, @JsonKey(name: MusicAssistantServerInfoMessage.statusKey_)  MusicAssistantCoreState status, @JsonKey(name: MusicAssistantServerInfoMessage.internalUrlKey_)  String? internalUrl, @JsonKey(name: MusicAssistantServerInfoMessage.externalUrlKey_)  String? externalUrl, @JsonKey(name: MusicAssistantServerInfoMessage.hasRemoteAccessKey_)  bool hasRemoteAccess)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantServerInfoMessage() when $default != null:
return $default(_that.serverId,_that.serverVersion,_that.schemaVersion,_that.minSupportedSchemaVersion,_that.baseUrl,_that.homeassistantAddon,_that.onboardDone,_that.name,_that.status,_that.internalUrl,_that.externalUrl,_that.hasRemoteAccess);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantServerInfoMessage.serverIdKey_)  String serverId, @JsonKey(name: MusicAssistantServerInfoMessage.serverVersionKey_)  String serverVersion, @JsonKey(name: MusicAssistantServerInfoMessage.schemaVersionKey_)  int schemaVersion, @JsonKey(name: MusicAssistantServerInfoMessage.minSupportedSchemaVersionKey_)  int minSupportedSchemaVersion, @JsonKey(name: MusicAssistantServerInfoMessage.baseUrlKey_)  String? baseUrl, @JsonKey(name: MusicAssistantServerInfoMessage.homeassistantAddonKey_)  bool homeassistantAddon, @JsonKey(name: MusicAssistantServerInfoMessage.onboardDoneKey_)  bool onboardDone, @JsonKey(name: MusicAssistantServerInfoMessage.nameKey_)  String? name, @JsonKey(name: MusicAssistantServerInfoMessage.statusKey_)  MusicAssistantCoreState status, @JsonKey(name: MusicAssistantServerInfoMessage.internalUrlKey_)  String? internalUrl, @JsonKey(name: MusicAssistantServerInfoMessage.externalUrlKey_)  String? externalUrl, @JsonKey(name: MusicAssistantServerInfoMessage.hasRemoteAccessKey_)  bool hasRemoteAccess)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantServerInfoMessage():
return $default(_that.serverId,_that.serverVersion,_that.schemaVersion,_that.minSupportedSchemaVersion,_that.baseUrl,_that.homeassistantAddon,_that.onboardDone,_that.name,_that.status,_that.internalUrl,_that.externalUrl,_that.hasRemoteAccess);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantServerInfoMessage.serverIdKey_)  String serverId, @JsonKey(name: MusicAssistantServerInfoMessage.serverVersionKey_)  String serverVersion, @JsonKey(name: MusicAssistantServerInfoMessage.schemaVersionKey_)  int schemaVersion, @JsonKey(name: MusicAssistantServerInfoMessage.minSupportedSchemaVersionKey_)  int minSupportedSchemaVersion, @JsonKey(name: MusicAssistantServerInfoMessage.baseUrlKey_)  String? baseUrl, @JsonKey(name: MusicAssistantServerInfoMessage.homeassistantAddonKey_)  bool homeassistantAddon, @JsonKey(name: MusicAssistantServerInfoMessage.onboardDoneKey_)  bool onboardDone, @JsonKey(name: MusicAssistantServerInfoMessage.nameKey_)  String? name, @JsonKey(name: MusicAssistantServerInfoMessage.statusKey_)  MusicAssistantCoreState status, @JsonKey(name: MusicAssistantServerInfoMessage.internalUrlKey_)  String? internalUrl, @JsonKey(name: MusicAssistantServerInfoMessage.externalUrlKey_)  String? externalUrl, @JsonKey(name: MusicAssistantServerInfoMessage.hasRemoteAccessKey_)  bool hasRemoteAccess)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantServerInfoMessage() when $default != null:
return $default(_that.serverId,_that.serverVersion,_that.schemaVersion,_that.minSupportedSchemaVersion,_that.baseUrl,_that.homeassistantAddon,_that.onboardDone,_that.name,_that.status,_that.internalUrl,_that.externalUrl,_that.hasRemoteAccess);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantServerInfoMessage extends MusicAssistantServerInfoMessage {
  const _MusicAssistantServerInfoMessage({@JsonKey(name: MusicAssistantServerInfoMessage.serverIdKey_) required this.serverId, @JsonKey(name: MusicAssistantServerInfoMessage.serverVersionKey_) required this.serverVersion, @JsonKey(name: MusicAssistantServerInfoMessage.schemaVersionKey_) required this.schemaVersion, @JsonKey(name: MusicAssistantServerInfoMessage.minSupportedSchemaVersionKey_) required this.minSupportedSchemaVersion, @JsonKey(name: MusicAssistantServerInfoMessage.baseUrlKey_) this.baseUrl, @JsonKey(name: MusicAssistantServerInfoMessage.homeassistantAddonKey_) this.homeassistantAddon = false, @JsonKey(name: MusicAssistantServerInfoMessage.onboardDoneKey_) this.onboardDone = false, @JsonKey(name: MusicAssistantServerInfoMessage.nameKey_) this.name, @JsonKey(name: MusicAssistantServerInfoMessage.statusKey_) this.status = MusicAssistantCoreState.running, @JsonKey(name: MusicAssistantServerInfoMessage.internalUrlKey_) this.internalUrl, @JsonKey(name: MusicAssistantServerInfoMessage.externalUrlKey_) this.externalUrl, @JsonKey(name: MusicAssistantServerInfoMessage.hasRemoteAccessKey_) this.hasRemoteAccess = false}): super._();
  factory _MusicAssistantServerInfoMessage.fromJson(Map<String, dynamic> json) => _$MusicAssistantServerInfoMessageFromJson(json);

/// serverId
@override@JsonKey(name: MusicAssistantServerInfoMessage.serverIdKey_) final  String serverId;
/// serverVersion
@override@JsonKey(name: MusicAssistantServerInfoMessage.serverVersionKey_) final  String serverVersion;
/// schemaVersion
@override@JsonKey(name: MusicAssistantServerInfoMessage.schemaVersionKey_) final  int schemaVersion;
/// minSupportedSchemaVersion
@override@JsonKey(name: MusicAssistantServerInfoMessage.minSupportedSchemaVersionKey_) final  int minSupportedSchemaVersion;
/// baseUrl
@override@JsonKey(name: MusicAssistantServerInfoMessage.baseUrlKey_) final  String? baseUrl;
/// homeassistantAddon
@override@JsonKey(name: MusicAssistantServerInfoMessage.homeassistantAddonKey_) final  bool homeassistantAddon;
/// onboardDone
@override@JsonKey(name: MusicAssistantServerInfoMessage.onboardDoneKey_) final  bool onboardDone;
/// name
@override@JsonKey(name: MusicAssistantServerInfoMessage.nameKey_) final  String? name;
/// status
@override@JsonKey(name: MusicAssistantServerInfoMessage.statusKey_) final  MusicAssistantCoreState status;
/// internalUrl
@override@JsonKey(name: MusicAssistantServerInfoMessage.internalUrlKey_) final  String? internalUrl;
/// externalUrl
@override@JsonKey(name: MusicAssistantServerInfoMessage.externalUrlKey_) final  String? externalUrl;
/// hasRemoteAccess
@override@JsonKey(name: MusicAssistantServerInfoMessage.hasRemoteAccessKey_) final  bool hasRemoteAccess;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantServerInfoMessage&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.serverVersion, serverVersion) || other.serverVersion == serverVersion)&&(identical(other.schemaVersion, schemaVersion) || other.schemaVersion == schemaVersion)&&(identical(other.minSupportedSchemaVersion, minSupportedSchemaVersion) || other.minSupportedSchemaVersion == minSupportedSchemaVersion)&&(identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl)&&(identical(other.homeassistantAddon, homeassistantAddon) || other.homeassistantAddon == homeassistantAddon)&&(identical(other.onboardDone, onboardDone) || other.onboardDone == onboardDone)&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.internalUrl, internalUrl) || other.internalUrl == internalUrl)&&(identical(other.externalUrl, externalUrl) || other.externalUrl == externalUrl)&&(identical(other.hasRemoteAccess, hasRemoteAccess) || other.hasRemoteAccess == hasRemoteAccess));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serverId,serverVersion,schemaVersion,minSupportedSchemaVersion,baseUrl,homeassistantAddon,onboardDone,name,status,internalUrl,externalUrl,hasRemoteAccess);

@override
String toString() {
  return 'MusicAssistantServerInfoMessage(serverId: $serverId, serverVersion: $serverVersion, schemaVersion: $schemaVersion, minSupportedSchemaVersion: $minSupportedSchemaVersion, baseUrl: $baseUrl, homeassistantAddon: $homeassistantAddon, onboardDone: $onboardDone, name: $name, status: $status, internalUrl: $internalUrl, externalUrl: $externalUrl, hasRemoteAccess: $hasRemoteAccess)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantServerInfoMessageCopyWith<$Res> implements $MusicAssistantServerInfoMessageCopyWith<$Res> {
  factory _$MusicAssistantServerInfoMessageCopyWith(_MusicAssistantServerInfoMessage value, $Res Function(_MusicAssistantServerInfoMessage) _then) = __$MusicAssistantServerInfoMessageCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantServerInfoMessage.serverIdKey_) String serverId,@JsonKey(name: MusicAssistantServerInfoMessage.serverVersionKey_) String serverVersion,@JsonKey(name: MusicAssistantServerInfoMessage.schemaVersionKey_) int schemaVersion,@JsonKey(name: MusicAssistantServerInfoMessage.minSupportedSchemaVersionKey_) int minSupportedSchemaVersion,@JsonKey(name: MusicAssistantServerInfoMessage.baseUrlKey_) String? baseUrl,@JsonKey(name: MusicAssistantServerInfoMessage.homeassistantAddonKey_) bool homeassistantAddon,@JsonKey(name: MusicAssistantServerInfoMessage.onboardDoneKey_) bool onboardDone,@JsonKey(name: MusicAssistantServerInfoMessage.nameKey_) String? name,@JsonKey(name: MusicAssistantServerInfoMessage.statusKey_) MusicAssistantCoreState status,@JsonKey(name: MusicAssistantServerInfoMessage.internalUrlKey_) String? internalUrl,@JsonKey(name: MusicAssistantServerInfoMessage.externalUrlKey_) String? externalUrl,@JsonKey(name: MusicAssistantServerInfoMessage.hasRemoteAccessKey_) bool hasRemoteAccess
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
@override @pragma('vm:prefer-inline') $Res call({Object? serverId = null,Object? serverVersion = null,Object? schemaVersion = null,Object? minSupportedSchemaVersion = null,Object? baseUrl = freezed,Object? homeassistantAddon = null,Object? onboardDone = null,Object? name = freezed,Object? status = null,Object? internalUrl = freezed,Object? externalUrl = freezed,Object? hasRemoteAccess = null,}) {
  return _then(_MusicAssistantServerInfoMessage(
serverId: null == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as String,serverVersion: null == serverVersion ? _self.serverVersion : serverVersion // ignore: cast_nullable_to_non_nullable
as String,schemaVersion: null == schemaVersion ? _self.schemaVersion : schemaVersion // ignore: cast_nullable_to_non_nullable
as int,minSupportedSchemaVersion: null == minSupportedSchemaVersion ? _self.minSupportedSchemaVersion : minSupportedSchemaVersion // ignore: cast_nullable_to_non_nullable
as int,baseUrl: freezed == baseUrl ? _self.baseUrl : baseUrl // ignore: cast_nullable_to_non_nullable
as String?,homeassistantAddon: null == homeassistantAddon ? _self.homeassistantAddon : homeassistantAddon // ignore: cast_nullable_to_non_nullable
as bool,onboardDone: null == onboardDone ? _self.onboardDone : onboardDone // ignore: cast_nullable_to_non_nullable
as bool,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MusicAssistantCoreState,internalUrl: freezed == internalUrl ? _self.internalUrl : internalUrl // ignore: cast_nullable_to_non_nullable
as String?,externalUrl: freezed == externalUrl ? _self.externalUrl : externalUrl // ignore: cast_nullable_to_non_nullable
as String?,hasRemoteAccess: null == hasRemoteAccess ? _self.hasRemoteAccess : hasRemoteAccess // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
