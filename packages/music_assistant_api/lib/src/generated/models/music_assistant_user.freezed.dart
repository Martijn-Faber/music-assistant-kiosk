// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantUser {

/// userId
@JsonKey(name: MusicAssistantUser.userIdKey_) String get userId;/// username
@JsonKey(name: MusicAssistantUser.usernameKey_) String get username;/// role
@JsonKey(name: MusicAssistantUser.roleKey_) String get role;/// enabled
@JsonKey(name: MusicAssistantUser.enabledKey_) bool get enabled;/// createdAt
@JsonKey(name: MusicAssistantUser.createdAtKey_) DateTime? get createdAt;/// displayName
@JsonKey(name: MusicAssistantUser.displayNameKey_) String? get displayName;/// avatarUrl
@JsonKey(name: MusicAssistantUser.avatarUrlKey_) String? get avatarUrl;/// preferences
@JsonKey(name: MusicAssistantUser.preferencesKey_) Map<String, dynamic>? get preferences;/// providerFilter
@JsonKey(name: MusicAssistantUser.providerFilterKey_) List<String>? get providerFilter;/// playerFilter
@JsonKey(name: MusicAssistantUser.playerFilterKey_) List<String>? get playerFilter;
/// Create a copy of MusicAssistantUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantUserCopyWith<MusicAssistantUser> get copyWith => _$MusicAssistantUserCopyWithImpl<MusicAssistantUser>(this as MusicAssistantUser, _$identity);

  /// Serializes this MusicAssistantUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantUser&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.username, username) || other.username == username)&&(identical(other.role, role) || other.role == role)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&const DeepCollectionEquality().equals(other.preferences, preferences)&&const DeepCollectionEquality().equals(other.providerFilter, providerFilter)&&const DeepCollectionEquality().equals(other.playerFilter, playerFilter));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,username,role,enabled,createdAt,displayName,avatarUrl,const DeepCollectionEquality().hash(preferences),const DeepCollectionEquality().hash(providerFilter),const DeepCollectionEquality().hash(playerFilter));

@override
String toString() {
  return 'MusicAssistantUser(userId: $userId, username: $username, role: $role, enabled: $enabled, createdAt: $createdAt, displayName: $displayName, avatarUrl: $avatarUrl, preferences: $preferences, providerFilter: $providerFilter, playerFilter: $playerFilter)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantUserCopyWith<$Res>  {
  factory $MusicAssistantUserCopyWith(MusicAssistantUser value, $Res Function(MusicAssistantUser) _then) = _$MusicAssistantUserCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantUser.userIdKey_) String userId,@JsonKey(name: MusicAssistantUser.usernameKey_) String username,@JsonKey(name: MusicAssistantUser.roleKey_) String role,@JsonKey(name: MusicAssistantUser.enabledKey_) bool enabled,@JsonKey(name: MusicAssistantUser.createdAtKey_) DateTime? createdAt,@JsonKey(name: MusicAssistantUser.displayNameKey_) String? displayName,@JsonKey(name: MusicAssistantUser.avatarUrlKey_) String? avatarUrl,@JsonKey(name: MusicAssistantUser.preferencesKey_) Map<String, dynamic>? preferences,@JsonKey(name: MusicAssistantUser.providerFilterKey_) List<String>? providerFilter,@JsonKey(name: MusicAssistantUser.playerFilterKey_) List<String>? playerFilter
});




}
/// @nodoc
class _$MusicAssistantUserCopyWithImpl<$Res>
    implements $MusicAssistantUserCopyWith<$Res> {
  _$MusicAssistantUserCopyWithImpl(this._self, this._then);

  final MusicAssistantUser _self;
  final $Res Function(MusicAssistantUser) _then;

/// Create a copy of MusicAssistantUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? username = null,Object? role = null,Object? enabled = null,Object? createdAt = freezed,Object? displayName = freezed,Object? avatarUrl = freezed,Object? preferences = freezed,Object? providerFilter = freezed,Object? playerFilter = freezed,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,preferences: freezed == preferences ? _self.preferences : preferences // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,providerFilter: freezed == providerFilter ? _self.providerFilter : providerFilter // ignore: cast_nullable_to_non_nullable
as List<String>?,playerFilter: freezed == playerFilter ? _self.playerFilter : playerFilter // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [MusicAssistantUser].
extension MusicAssistantUserPatterns on MusicAssistantUser {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantUser() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantUser value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantUser():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantUser value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantUser() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantUser.userIdKey_)  String userId, @JsonKey(name: MusicAssistantUser.usernameKey_)  String username, @JsonKey(name: MusicAssistantUser.roleKey_)  String role, @JsonKey(name: MusicAssistantUser.enabledKey_)  bool enabled, @JsonKey(name: MusicAssistantUser.createdAtKey_)  DateTime? createdAt, @JsonKey(name: MusicAssistantUser.displayNameKey_)  String? displayName, @JsonKey(name: MusicAssistantUser.avatarUrlKey_)  String? avatarUrl, @JsonKey(name: MusicAssistantUser.preferencesKey_)  Map<String, dynamic>? preferences, @JsonKey(name: MusicAssistantUser.providerFilterKey_)  List<String>? providerFilter, @JsonKey(name: MusicAssistantUser.playerFilterKey_)  List<String>? playerFilter)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantUser() when $default != null:
return $default(_that.userId,_that.username,_that.role,_that.enabled,_that.createdAt,_that.displayName,_that.avatarUrl,_that.preferences,_that.providerFilter,_that.playerFilter);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantUser.userIdKey_)  String userId, @JsonKey(name: MusicAssistantUser.usernameKey_)  String username, @JsonKey(name: MusicAssistantUser.roleKey_)  String role, @JsonKey(name: MusicAssistantUser.enabledKey_)  bool enabled, @JsonKey(name: MusicAssistantUser.createdAtKey_)  DateTime? createdAt, @JsonKey(name: MusicAssistantUser.displayNameKey_)  String? displayName, @JsonKey(name: MusicAssistantUser.avatarUrlKey_)  String? avatarUrl, @JsonKey(name: MusicAssistantUser.preferencesKey_)  Map<String, dynamic>? preferences, @JsonKey(name: MusicAssistantUser.providerFilterKey_)  List<String>? providerFilter, @JsonKey(name: MusicAssistantUser.playerFilterKey_)  List<String>? playerFilter)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantUser():
return $default(_that.userId,_that.username,_that.role,_that.enabled,_that.createdAt,_that.displayName,_that.avatarUrl,_that.preferences,_that.providerFilter,_that.playerFilter);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantUser.userIdKey_)  String userId, @JsonKey(name: MusicAssistantUser.usernameKey_)  String username, @JsonKey(name: MusicAssistantUser.roleKey_)  String role, @JsonKey(name: MusicAssistantUser.enabledKey_)  bool enabled, @JsonKey(name: MusicAssistantUser.createdAtKey_)  DateTime? createdAt, @JsonKey(name: MusicAssistantUser.displayNameKey_)  String? displayName, @JsonKey(name: MusicAssistantUser.avatarUrlKey_)  String? avatarUrl, @JsonKey(name: MusicAssistantUser.preferencesKey_)  Map<String, dynamic>? preferences, @JsonKey(name: MusicAssistantUser.providerFilterKey_)  List<String>? providerFilter, @JsonKey(name: MusicAssistantUser.playerFilterKey_)  List<String>? playerFilter)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantUser() when $default != null:
return $default(_that.userId,_that.username,_that.role,_that.enabled,_that.createdAt,_that.displayName,_that.avatarUrl,_that.preferences,_that.providerFilter,_that.playerFilter);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantUser extends MusicAssistantUser {
  const _MusicAssistantUser({@JsonKey(name: MusicAssistantUser.userIdKey_) required this.userId, @JsonKey(name: MusicAssistantUser.usernameKey_) required this.username, @JsonKey(name: MusicAssistantUser.roleKey_) required this.role, @JsonKey(name: MusicAssistantUser.enabledKey_) this.enabled = true, @JsonKey(name: MusicAssistantUser.createdAtKey_) this.createdAt, @JsonKey(name: MusicAssistantUser.displayNameKey_) this.displayName, @JsonKey(name: MusicAssistantUser.avatarUrlKey_) this.avatarUrl, @JsonKey(name: MusicAssistantUser.preferencesKey_) final  Map<String, dynamic>? preferences, @JsonKey(name: MusicAssistantUser.providerFilterKey_) final  List<String>? providerFilter, @JsonKey(name: MusicAssistantUser.playerFilterKey_) final  List<String>? playerFilter}): _preferences = preferences,_providerFilter = providerFilter,_playerFilter = playerFilter,super._();
  factory _MusicAssistantUser.fromJson(Map<String, dynamic> json) => _$MusicAssistantUserFromJson(json);

/// userId
@override@JsonKey(name: MusicAssistantUser.userIdKey_) final  String userId;
/// username
@override@JsonKey(name: MusicAssistantUser.usernameKey_) final  String username;
/// role
@override@JsonKey(name: MusicAssistantUser.roleKey_) final  String role;
/// enabled
@override@JsonKey(name: MusicAssistantUser.enabledKey_) final  bool enabled;
/// createdAt
@override@JsonKey(name: MusicAssistantUser.createdAtKey_) final  DateTime? createdAt;
/// displayName
@override@JsonKey(name: MusicAssistantUser.displayNameKey_) final  String? displayName;
/// avatarUrl
@override@JsonKey(name: MusicAssistantUser.avatarUrlKey_) final  String? avatarUrl;
/// preferences
 final  Map<String, dynamic>? _preferences;
/// preferences
@override@JsonKey(name: MusicAssistantUser.preferencesKey_) Map<String, dynamic>? get preferences {
  final value = _preferences;
  if (value == null) return null;
  if (_preferences is EqualUnmodifiableMapView) return _preferences;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

/// providerFilter
 final  List<String>? _providerFilter;
/// providerFilter
@override@JsonKey(name: MusicAssistantUser.providerFilterKey_) List<String>? get providerFilter {
  final value = _providerFilter;
  if (value == null) return null;
  if (_providerFilter is EqualUnmodifiableListView) return _providerFilter;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// playerFilter
 final  List<String>? _playerFilter;
/// playerFilter
@override@JsonKey(name: MusicAssistantUser.playerFilterKey_) List<String>? get playerFilter {
  final value = _playerFilter;
  if (value == null) return null;
  if (_playerFilter is EqualUnmodifiableListView) return _playerFilter;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of MusicAssistantUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantUserCopyWith<_MusicAssistantUser> get copyWith => __$MusicAssistantUserCopyWithImpl<_MusicAssistantUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantUser&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.username, username) || other.username == username)&&(identical(other.role, role) || other.role == role)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&const DeepCollectionEquality().equals(other._preferences, _preferences)&&const DeepCollectionEquality().equals(other._providerFilter, _providerFilter)&&const DeepCollectionEquality().equals(other._playerFilter, _playerFilter));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,username,role,enabled,createdAt,displayName,avatarUrl,const DeepCollectionEquality().hash(_preferences),const DeepCollectionEquality().hash(_providerFilter),const DeepCollectionEquality().hash(_playerFilter));

@override
String toString() {
  return 'MusicAssistantUser(userId: $userId, username: $username, role: $role, enabled: $enabled, createdAt: $createdAt, displayName: $displayName, avatarUrl: $avatarUrl, preferences: $preferences, providerFilter: $providerFilter, playerFilter: $playerFilter)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantUserCopyWith<$Res> implements $MusicAssistantUserCopyWith<$Res> {
  factory _$MusicAssistantUserCopyWith(_MusicAssistantUser value, $Res Function(_MusicAssistantUser) _then) = __$MusicAssistantUserCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantUser.userIdKey_) String userId,@JsonKey(name: MusicAssistantUser.usernameKey_) String username,@JsonKey(name: MusicAssistantUser.roleKey_) String role,@JsonKey(name: MusicAssistantUser.enabledKey_) bool enabled,@JsonKey(name: MusicAssistantUser.createdAtKey_) DateTime? createdAt,@JsonKey(name: MusicAssistantUser.displayNameKey_) String? displayName,@JsonKey(name: MusicAssistantUser.avatarUrlKey_) String? avatarUrl,@JsonKey(name: MusicAssistantUser.preferencesKey_) Map<String, dynamic>? preferences,@JsonKey(name: MusicAssistantUser.providerFilterKey_) List<String>? providerFilter,@JsonKey(name: MusicAssistantUser.playerFilterKey_) List<String>? playerFilter
});




}
/// @nodoc
class __$MusicAssistantUserCopyWithImpl<$Res>
    implements _$MusicAssistantUserCopyWith<$Res> {
  __$MusicAssistantUserCopyWithImpl(this._self, this._then);

  final _MusicAssistantUser _self;
  final $Res Function(_MusicAssistantUser) _then;

/// Create a copy of MusicAssistantUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? username = null,Object? role = null,Object? enabled = null,Object? createdAt = freezed,Object? displayName = freezed,Object? avatarUrl = freezed,Object? preferences = freezed,Object? providerFilter = freezed,Object? playerFilter = freezed,}) {
  return _then(_MusicAssistantUser(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,preferences: freezed == preferences ? _self._preferences : preferences // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,providerFilter: freezed == providerFilter ? _self._providerFilter : providerFilter // ignore: cast_nullable_to_non_nullable
as List<String>?,playerFilter: freezed == playerFilter ? _self._playerFilter : playerFilter // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

// dart format on
