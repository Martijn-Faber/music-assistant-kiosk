// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_player.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantPlayer {

/// playerId
@JsonKey(name: MusicAssistantPlayer.playerIdKey_) String get playerId;/// playbackState
@JsonKey(name: MusicAssistantPlayer.playbackStateKey_) MusicAssistantPlaybackState get playbackState;/// currentMedia
@JsonKey(name: MusicAssistantPlayer.currentMediaKey_) MusicAssistantPlayerMedia? get currentMedia;/// volumeLevel
@JsonKey(name: MusicAssistantPlayer.volumeLevelKey_) int? get volumeLevel;/// elapsedTimeLastUpdated
@JsonKey(name: MusicAssistantPlayer.elapsedTimeLastUpdatedKey_) double? get elapsedTimeLastUpdated;/// groupMembers
@JsonKey(name: MusicAssistantPlayer.groupMembersKey_) List<String>? get groupMembers;/// available
@JsonKey(name: MusicAssistantPlayer.availableKey_) bool? get available;/// name
@JsonKey(name: MusicAssistantPlayer.nameKey_) String get name;/// elapsedTime
@JsonKey(name: MusicAssistantPlayer.elapsedTimeKey_) double? get elapsedTime;
/// Create a copy of MusicAssistantPlayer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantPlayerCopyWith<MusicAssistantPlayer> get copyWith => _$MusicAssistantPlayerCopyWithImpl<MusicAssistantPlayer>(this as MusicAssistantPlayer, _$identity);

  /// Serializes this MusicAssistantPlayer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantPlayer&&(identical(other.playerId, playerId) || other.playerId == playerId)&&(identical(other.playbackState, playbackState) || other.playbackState == playbackState)&&(identical(other.currentMedia, currentMedia) || other.currentMedia == currentMedia)&&(identical(other.volumeLevel, volumeLevel) || other.volumeLevel == volumeLevel)&&(identical(other.elapsedTimeLastUpdated, elapsedTimeLastUpdated) || other.elapsedTimeLastUpdated == elapsedTimeLastUpdated)&&const DeepCollectionEquality().equals(other.groupMembers, groupMembers)&&(identical(other.available, available) || other.available == available)&&(identical(other.name, name) || other.name == name)&&(identical(other.elapsedTime, elapsedTime) || other.elapsedTime == elapsedTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,playerId,playbackState,currentMedia,volumeLevel,elapsedTimeLastUpdated,const DeepCollectionEquality().hash(groupMembers),available,name,elapsedTime);

@override
String toString() {
  return 'MusicAssistantPlayer(playerId: $playerId, playbackState: $playbackState, currentMedia: $currentMedia, volumeLevel: $volumeLevel, elapsedTimeLastUpdated: $elapsedTimeLastUpdated, groupMembers: $groupMembers, available: $available, name: $name, elapsedTime: $elapsedTime)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantPlayerCopyWith<$Res>  {
  factory $MusicAssistantPlayerCopyWith(MusicAssistantPlayer value, $Res Function(MusicAssistantPlayer) _then) = _$MusicAssistantPlayerCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantPlayer.playerIdKey_) String playerId,@JsonKey(name: MusicAssistantPlayer.playbackStateKey_) MusicAssistantPlaybackState playbackState,@JsonKey(name: MusicAssistantPlayer.currentMediaKey_) MusicAssistantPlayerMedia? currentMedia,@JsonKey(name: MusicAssistantPlayer.volumeLevelKey_) int? volumeLevel,@JsonKey(name: MusicAssistantPlayer.elapsedTimeLastUpdatedKey_) double? elapsedTimeLastUpdated,@JsonKey(name: MusicAssistantPlayer.groupMembersKey_) List<String>? groupMembers,@JsonKey(name: MusicAssistantPlayer.availableKey_) bool? available,@JsonKey(name: MusicAssistantPlayer.nameKey_) String name,@JsonKey(name: MusicAssistantPlayer.elapsedTimeKey_) double? elapsedTime
});


$MusicAssistantPlayerMediaCopyWith<$Res>? get currentMedia;

}
/// @nodoc
class _$MusicAssistantPlayerCopyWithImpl<$Res>
    implements $MusicAssistantPlayerCopyWith<$Res> {
  _$MusicAssistantPlayerCopyWithImpl(this._self, this._then);

  final MusicAssistantPlayer _self;
  final $Res Function(MusicAssistantPlayer) _then;

/// Create a copy of MusicAssistantPlayer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? playerId = null,Object? playbackState = null,Object? currentMedia = freezed,Object? volumeLevel = freezed,Object? elapsedTimeLastUpdated = freezed,Object? groupMembers = freezed,Object? available = freezed,Object? name = null,Object? elapsedTime = freezed,}) {
  return _then(_self.copyWith(
playerId: null == playerId ? _self.playerId : playerId // ignore: cast_nullable_to_non_nullable
as String,playbackState: null == playbackState ? _self.playbackState : playbackState // ignore: cast_nullable_to_non_nullable
as MusicAssistantPlaybackState,currentMedia: freezed == currentMedia ? _self.currentMedia : currentMedia // ignore: cast_nullable_to_non_nullable
as MusicAssistantPlayerMedia?,volumeLevel: freezed == volumeLevel ? _self.volumeLevel : volumeLevel // ignore: cast_nullable_to_non_nullable
as int?,elapsedTimeLastUpdated: freezed == elapsedTimeLastUpdated ? _self.elapsedTimeLastUpdated : elapsedTimeLastUpdated // ignore: cast_nullable_to_non_nullable
as double?,groupMembers: freezed == groupMembers ? _self.groupMembers : groupMembers // ignore: cast_nullable_to_non_nullable
as List<String>?,available: freezed == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as bool?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,elapsedTime: freezed == elapsedTime ? _self.elapsedTime : elapsedTime // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}
/// Create a copy of MusicAssistantPlayer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantPlayerMediaCopyWith<$Res>? get currentMedia {
    if (_self.currentMedia == null) {
    return null;
  }

  return $MusicAssistantPlayerMediaCopyWith<$Res>(_self.currentMedia!, (value) {
    return _then(_self.copyWith(currentMedia: value));
  });
}
}


/// Adds pattern-matching-related methods to [MusicAssistantPlayer].
extension MusicAssistantPlayerPatterns on MusicAssistantPlayer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantPlayer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantPlayer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantPlayer value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantPlayer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantPlayer value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantPlayer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantPlayer.playerIdKey_)  String playerId, @JsonKey(name: MusicAssistantPlayer.playbackStateKey_)  MusicAssistantPlaybackState playbackState, @JsonKey(name: MusicAssistantPlayer.currentMediaKey_)  MusicAssistantPlayerMedia? currentMedia, @JsonKey(name: MusicAssistantPlayer.volumeLevelKey_)  int? volumeLevel, @JsonKey(name: MusicAssistantPlayer.elapsedTimeLastUpdatedKey_)  double? elapsedTimeLastUpdated, @JsonKey(name: MusicAssistantPlayer.groupMembersKey_)  List<String>? groupMembers, @JsonKey(name: MusicAssistantPlayer.availableKey_)  bool? available, @JsonKey(name: MusicAssistantPlayer.nameKey_)  String name, @JsonKey(name: MusicAssistantPlayer.elapsedTimeKey_)  double? elapsedTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantPlayer() when $default != null:
return $default(_that.playerId,_that.playbackState,_that.currentMedia,_that.volumeLevel,_that.elapsedTimeLastUpdated,_that.groupMembers,_that.available,_that.name,_that.elapsedTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantPlayer.playerIdKey_)  String playerId, @JsonKey(name: MusicAssistantPlayer.playbackStateKey_)  MusicAssistantPlaybackState playbackState, @JsonKey(name: MusicAssistantPlayer.currentMediaKey_)  MusicAssistantPlayerMedia? currentMedia, @JsonKey(name: MusicAssistantPlayer.volumeLevelKey_)  int? volumeLevel, @JsonKey(name: MusicAssistantPlayer.elapsedTimeLastUpdatedKey_)  double? elapsedTimeLastUpdated, @JsonKey(name: MusicAssistantPlayer.groupMembersKey_)  List<String>? groupMembers, @JsonKey(name: MusicAssistantPlayer.availableKey_)  bool? available, @JsonKey(name: MusicAssistantPlayer.nameKey_)  String name, @JsonKey(name: MusicAssistantPlayer.elapsedTimeKey_)  double? elapsedTime)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantPlayer():
return $default(_that.playerId,_that.playbackState,_that.currentMedia,_that.volumeLevel,_that.elapsedTimeLastUpdated,_that.groupMembers,_that.available,_that.name,_that.elapsedTime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantPlayer.playerIdKey_)  String playerId, @JsonKey(name: MusicAssistantPlayer.playbackStateKey_)  MusicAssistantPlaybackState playbackState, @JsonKey(name: MusicAssistantPlayer.currentMediaKey_)  MusicAssistantPlayerMedia? currentMedia, @JsonKey(name: MusicAssistantPlayer.volumeLevelKey_)  int? volumeLevel, @JsonKey(name: MusicAssistantPlayer.elapsedTimeLastUpdatedKey_)  double? elapsedTimeLastUpdated, @JsonKey(name: MusicAssistantPlayer.groupMembersKey_)  List<String>? groupMembers, @JsonKey(name: MusicAssistantPlayer.availableKey_)  bool? available, @JsonKey(name: MusicAssistantPlayer.nameKey_)  String name, @JsonKey(name: MusicAssistantPlayer.elapsedTimeKey_)  double? elapsedTime)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantPlayer() when $default != null:
return $default(_that.playerId,_that.playbackState,_that.currentMedia,_that.volumeLevel,_that.elapsedTimeLastUpdated,_that.groupMembers,_that.available,_that.name,_that.elapsedTime);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantPlayer extends MusicAssistantPlayer {
  const _MusicAssistantPlayer({@JsonKey(name: MusicAssistantPlayer.playerIdKey_) required this.playerId, @JsonKey(name: MusicAssistantPlayer.playbackStateKey_) this.playbackState = MusicAssistantPlaybackState.idle, @JsonKey(name: MusicAssistantPlayer.currentMediaKey_) this.currentMedia, @JsonKey(name: MusicAssistantPlayer.volumeLevelKey_) this.volumeLevel, @JsonKey(name: MusicAssistantPlayer.elapsedTimeLastUpdatedKey_) this.elapsedTimeLastUpdated, @JsonKey(name: MusicAssistantPlayer.groupMembersKey_) final  List<String>? groupMembers, @JsonKey(name: MusicAssistantPlayer.availableKey_) this.available, @JsonKey(name: MusicAssistantPlayer.nameKey_) required this.name, @JsonKey(name: MusicAssistantPlayer.elapsedTimeKey_) this.elapsedTime}): _groupMembers = groupMembers,super._();
  factory _MusicAssistantPlayer.fromJson(Map<String, dynamic> json) => _$MusicAssistantPlayerFromJson(json);

/// playerId
@override@JsonKey(name: MusicAssistantPlayer.playerIdKey_) final  String playerId;
/// playbackState
@override@JsonKey(name: MusicAssistantPlayer.playbackStateKey_) final  MusicAssistantPlaybackState playbackState;
/// currentMedia
@override@JsonKey(name: MusicAssistantPlayer.currentMediaKey_) final  MusicAssistantPlayerMedia? currentMedia;
/// volumeLevel
@override@JsonKey(name: MusicAssistantPlayer.volumeLevelKey_) final  int? volumeLevel;
/// elapsedTimeLastUpdated
@override@JsonKey(name: MusicAssistantPlayer.elapsedTimeLastUpdatedKey_) final  double? elapsedTimeLastUpdated;
/// groupMembers
 final  List<String>? _groupMembers;
/// groupMembers
@override@JsonKey(name: MusicAssistantPlayer.groupMembersKey_) List<String>? get groupMembers {
  final value = _groupMembers;
  if (value == null) return null;
  if (_groupMembers is EqualUnmodifiableListView) return _groupMembers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// available
@override@JsonKey(name: MusicAssistantPlayer.availableKey_) final  bool? available;
/// name
@override@JsonKey(name: MusicAssistantPlayer.nameKey_) final  String name;
/// elapsedTime
@override@JsonKey(name: MusicAssistantPlayer.elapsedTimeKey_) final  double? elapsedTime;

/// Create a copy of MusicAssistantPlayer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantPlayerCopyWith<_MusicAssistantPlayer> get copyWith => __$MusicAssistantPlayerCopyWithImpl<_MusicAssistantPlayer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantPlayerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantPlayer&&(identical(other.playerId, playerId) || other.playerId == playerId)&&(identical(other.playbackState, playbackState) || other.playbackState == playbackState)&&(identical(other.currentMedia, currentMedia) || other.currentMedia == currentMedia)&&(identical(other.volumeLevel, volumeLevel) || other.volumeLevel == volumeLevel)&&(identical(other.elapsedTimeLastUpdated, elapsedTimeLastUpdated) || other.elapsedTimeLastUpdated == elapsedTimeLastUpdated)&&const DeepCollectionEquality().equals(other._groupMembers, _groupMembers)&&(identical(other.available, available) || other.available == available)&&(identical(other.name, name) || other.name == name)&&(identical(other.elapsedTime, elapsedTime) || other.elapsedTime == elapsedTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,playerId,playbackState,currentMedia,volumeLevel,elapsedTimeLastUpdated,const DeepCollectionEquality().hash(_groupMembers),available,name,elapsedTime);

@override
String toString() {
  return 'MusicAssistantPlayer(playerId: $playerId, playbackState: $playbackState, currentMedia: $currentMedia, volumeLevel: $volumeLevel, elapsedTimeLastUpdated: $elapsedTimeLastUpdated, groupMembers: $groupMembers, available: $available, name: $name, elapsedTime: $elapsedTime)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantPlayerCopyWith<$Res> implements $MusicAssistantPlayerCopyWith<$Res> {
  factory _$MusicAssistantPlayerCopyWith(_MusicAssistantPlayer value, $Res Function(_MusicAssistantPlayer) _then) = __$MusicAssistantPlayerCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantPlayer.playerIdKey_) String playerId,@JsonKey(name: MusicAssistantPlayer.playbackStateKey_) MusicAssistantPlaybackState playbackState,@JsonKey(name: MusicAssistantPlayer.currentMediaKey_) MusicAssistantPlayerMedia? currentMedia,@JsonKey(name: MusicAssistantPlayer.volumeLevelKey_) int? volumeLevel,@JsonKey(name: MusicAssistantPlayer.elapsedTimeLastUpdatedKey_) double? elapsedTimeLastUpdated,@JsonKey(name: MusicAssistantPlayer.groupMembersKey_) List<String>? groupMembers,@JsonKey(name: MusicAssistantPlayer.availableKey_) bool? available,@JsonKey(name: MusicAssistantPlayer.nameKey_) String name,@JsonKey(name: MusicAssistantPlayer.elapsedTimeKey_) double? elapsedTime
});


@override $MusicAssistantPlayerMediaCopyWith<$Res>? get currentMedia;

}
/// @nodoc
class __$MusicAssistantPlayerCopyWithImpl<$Res>
    implements _$MusicAssistantPlayerCopyWith<$Res> {
  __$MusicAssistantPlayerCopyWithImpl(this._self, this._then);

  final _MusicAssistantPlayer _self;
  final $Res Function(_MusicAssistantPlayer) _then;

/// Create a copy of MusicAssistantPlayer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? playerId = null,Object? playbackState = null,Object? currentMedia = freezed,Object? volumeLevel = freezed,Object? elapsedTimeLastUpdated = freezed,Object? groupMembers = freezed,Object? available = freezed,Object? name = null,Object? elapsedTime = freezed,}) {
  return _then(_MusicAssistantPlayer(
playerId: null == playerId ? _self.playerId : playerId // ignore: cast_nullable_to_non_nullable
as String,playbackState: null == playbackState ? _self.playbackState : playbackState // ignore: cast_nullable_to_non_nullable
as MusicAssistantPlaybackState,currentMedia: freezed == currentMedia ? _self.currentMedia : currentMedia // ignore: cast_nullable_to_non_nullable
as MusicAssistantPlayerMedia?,volumeLevel: freezed == volumeLevel ? _self.volumeLevel : volumeLevel // ignore: cast_nullable_to_non_nullable
as int?,elapsedTimeLastUpdated: freezed == elapsedTimeLastUpdated ? _self.elapsedTimeLastUpdated : elapsedTimeLastUpdated // ignore: cast_nullable_to_non_nullable
as double?,groupMembers: freezed == groupMembers ? _self._groupMembers : groupMembers // ignore: cast_nullable_to_non_nullable
as List<String>?,available: freezed == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as bool?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,elapsedTime: freezed == elapsedTime ? _self.elapsedTime : elapsedTime // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

/// Create a copy of MusicAssistantPlayer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantPlayerMediaCopyWith<$Res>? get currentMedia {
    if (_self.currentMedia == null) {
    return null;
  }

  return $MusicAssistantPlayerMediaCopyWith<$Res>(_self.currentMedia!, (value) {
    return _then(_self.copyWith(currentMedia: value));
  });
}
}

// dart format on
