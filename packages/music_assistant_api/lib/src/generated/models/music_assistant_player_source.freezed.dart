// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_player_source.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantPlayerSource {

/// id
@JsonKey(name: MusicAssistantPlayerSource.idKey_) String get id;/// name
@JsonKey(name: MusicAssistantPlayerSource.nameKey_) String get name;/// passive
@JsonKey(name: MusicAssistantPlayerSource.passiveKey_) bool get passive;/// canPlayPause
@JsonKey(name: MusicAssistantPlayerSource.canPlayPauseKey_) bool get canPlayPause;/// canSeek
@JsonKey(name: MusicAssistantPlayerSource.canSeekKey_) bool get canSeek;/// canNextPrevious
@JsonKey(name: MusicAssistantPlayerSource.canNextPreviousKey_) bool get canNextPrevious;/// canShuffle
@JsonKey(name: MusicAssistantPlayerSource.canShuffleKey_) bool get canShuffle;/// canRepeat
@JsonKey(name: MusicAssistantPlayerSource.canRepeatKey_) bool get canRepeat;/// shuffleEnabled
@JsonKey(name: MusicAssistantPlayerSource.shuffleEnabledKey_) bool? get shuffleEnabled;/// repeatMode
@JsonKey(name: MusicAssistantPlayerSource.repeatModeKey_) MusicAssistantRepeatMode? get repeatMode;/// accountId
@JsonKey(name: MusicAssistantPlayerSource.accountIdKey_) String? get accountId;
/// Create a copy of MusicAssistantPlayerSource
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantPlayerSourceCopyWith<MusicAssistantPlayerSource> get copyWith => _$MusicAssistantPlayerSourceCopyWithImpl<MusicAssistantPlayerSource>(this as MusicAssistantPlayerSource, _$identity);

  /// Serializes this MusicAssistantPlayerSource to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantPlayerSource&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.passive, passive) || other.passive == passive)&&(identical(other.canPlayPause, canPlayPause) || other.canPlayPause == canPlayPause)&&(identical(other.canSeek, canSeek) || other.canSeek == canSeek)&&(identical(other.canNextPrevious, canNextPrevious) || other.canNextPrevious == canNextPrevious)&&(identical(other.canShuffle, canShuffle) || other.canShuffle == canShuffle)&&(identical(other.canRepeat, canRepeat) || other.canRepeat == canRepeat)&&(identical(other.shuffleEnabled, shuffleEnabled) || other.shuffleEnabled == shuffleEnabled)&&(identical(other.repeatMode, repeatMode) || other.repeatMode == repeatMode)&&(identical(other.accountId, accountId) || other.accountId == accountId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,passive,canPlayPause,canSeek,canNextPrevious,canShuffle,canRepeat,shuffleEnabled,repeatMode,accountId);

@override
String toString() {
  return 'MusicAssistantPlayerSource(id: $id, name: $name, passive: $passive, canPlayPause: $canPlayPause, canSeek: $canSeek, canNextPrevious: $canNextPrevious, canShuffle: $canShuffle, canRepeat: $canRepeat, shuffleEnabled: $shuffleEnabled, repeatMode: $repeatMode, accountId: $accountId)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantPlayerSourceCopyWith<$Res>  {
  factory $MusicAssistantPlayerSourceCopyWith(MusicAssistantPlayerSource value, $Res Function(MusicAssistantPlayerSource) _then) = _$MusicAssistantPlayerSourceCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantPlayerSource.idKey_) String id,@JsonKey(name: MusicAssistantPlayerSource.nameKey_) String name,@JsonKey(name: MusicAssistantPlayerSource.passiveKey_) bool passive,@JsonKey(name: MusicAssistantPlayerSource.canPlayPauseKey_) bool canPlayPause,@JsonKey(name: MusicAssistantPlayerSource.canSeekKey_) bool canSeek,@JsonKey(name: MusicAssistantPlayerSource.canNextPreviousKey_) bool canNextPrevious,@JsonKey(name: MusicAssistantPlayerSource.canShuffleKey_) bool canShuffle,@JsonKey(name: MusicAssistantPlayerSource.canRepeatKey_) bool canRepeat,@JsonKey(name: MusicAssistantPlayerSource.shuffleEnabledKey_) bool? shuffleEnabled,@JsonKey(name: MusicAssistantPlayerSource.repeatModeKey_) MusicAssistantRepeatMode? repeatMode,@JsonKey(name: MusicAssistantPlayerSource.accountIdKey_) String? accountId
});




}
/// @nodoc
class _$MusicAssistantPlayerSourceCopyWithImpl<$Res>
    implements $MusicAssistantPlayerSourceCopyWith<$Res> {
  _$MusicAssistantPlayerSourceCopyWithImpl(this._self, this._then);

  final MusicAssistantPlayerSource _self;
  final $Res Function(MusicAssistantPlayerSource) _then;

/// Create a copy of MusicAssistantPlayerSource
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? passive = null,Object? canPlayPause = null,Object? canSeek = null,Object? canNextPrevious = null,Object? canShuffle = null,Object? canRepeat = null,Object? shuffleEnabled = freezed,Object? repeatMode = freezed,Object? accountId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,passive: null == passive ? _self.passive : passive // ignore: cast_nullable_to_non_nullable
as bool,canPlayPause: null == canPlayPause ? _self.canPlayPause : canPlayPause // ignore: cast_nullable_to_non_nullable
as bool,canSeek: null == canSeek ? _self.canSeek : canSeek // ignore: cast_nullable_to_non_nullable
as bool,canNextPrevious: null == canNextPrevious ? _self.canNextPrevious : canNextPrevious // ignore: cast_nullable_to_non_nullable
as bool,canShuffle: null == canShuffle ? _self.canShuffle : canShuffle // ignore: cast_nullable_to_non_nullable
as bool,canRepeat: null == canRepeat ? _self.canRepeat : canRepeat // ignore: cast_nullable_to_non_nullable
as bool,shuffleEnabled: freezed == shuffleEnabled ? _self.shuffleEnabled : shuffleEnabled // ignore: cast_nullable_to_non_nullable
as bool?,repeatMode: freezed == repeatMode ? _self.repeatMode : repeatMode // ignore: cast_nullable_to_non_nullable
as MusicAssistantRepeatMode?,accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MusicAssistantPlayerSource].
extension MusicAssistantPlayerSourcePatterns on MusicAssistantPlayerSource {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantPlayerSource value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantPlayerSource() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantPlayerSource value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantPlayerSource():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantPlayerSource value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantPlayerSource() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantPlayerSource.idKey_)  String id, @JsonKey(name: MusicAssistantPlayerSource.nameKey_)  String name, @JsonKey(name: MusicAssistantPlayerSource.passiveKey_)  bool passive, @JsonKey(name: MusicAssistantPlayerSource.canPlayPauseKey_)  bool canPlayPause, @JsonKey(name: MusicAssistantPlayerSource.canSeekKey_)  bool canSeek, @JsonKey(name: MusicAssistantPlayerSource.canNextPreviousKey_)  bool canNextPrevious, @JsonKey(name: MusicAssistantPlayerSource.canShuffleKey_)  bool canShuffle, @JsonKey(name: MusicAssistantPlayerSource.canRepeatKey_)  bool canRepeat, @JsonKey(name: MusicAssistantPlayerSource.shuffleEnabledKey_)  bool? shuffleEnabled, @JsonKey(name: MusicAssistantPlayerSource.repeatModeKey_)  MusicAssistantRepeatMode? repeatMode, @JsonKey(name: MusicAssistantPlayerSource.accountIdKey_)  String? accountId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantPlayerSource() when $default != null:
return $default(_that.id,_that.name,_that.passive,_that.canPlayPause,_that.canSeek,_that.canNextPrevious,_that.canShuffle,_that.canRepeat,_that.shuffleEnabled,_that.repeatMode,_that.accountId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantPlayerSource.idKey_)  String id, @JsonKey(name: MusicAssistantPlayerSource.nameKey_)  String name, @JsonKey(name: MusicAssistantPlayerSource.passiveKey_)  bool passive, @JsonKey(name: MusicAssistantPlayerSource.canPlayPauseKey_)  bool canPlayPause, @JsonKey(name: MusicAssistantPlayerSource.canSeekKey_)  bool canSeek, @JsonKey(name: MusicAssistantPlayerSource.canNextPreviousKey_)  bool canNextPrevious, @JsonKey(name: MusicAssistantPlayerSource.canShuffleKey_)  bool canShuffle, @JsonKey(name: MusicAssistantPlayerSource.canRepeatKey_)  bool canRepeat, @JsonKey(name: MusicAssistantPlayerSource.shuffleEnabledKey_)  bool? shuffleEnabled, @JsonKey(name: MusicAssistantPlayerSource.repeatModeKey_)  MusicAssistantRepeatMode? repeatMode, @JsonKey(name: MusicAssistantPlayerSource.accountIdKey_)  String? accountId)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantPlayerSource():
return $default(_that.id,_that.name,_that.passive,_that.canPlayPause,_that.canSeek,_that.canNextPrevious,_that.canShuffle,_that.canRepeat,_that.shuffleEnabled,_that.repeatMode,_that.accountId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantPlayerSource.idKey_)  String id, @JsonKey(name: MusicAssistantPlayerSource.nameKey_)  String name, @JsonKey(name: MusicAssistantPlayerSource.passiveKey_)  bool passive, @JsonKey(name: MusicAssistantPlayerSource.canPlayPauseKey_)  bool canPlayPause, @JsonKey(name: MusicAssistantPlayerSource.canSeekKey_)  bool canSeek, @JsonKey(name: MusicAssistantPlayerSource.canNextPreviousKey_)  bool canNextPrevious, @JsonKey(name: MusicAssistantPlayerSource.canShuffleKey_)  bool canShuffle, @JsonKey(name: MusicAssistantPlayerSource.canRepeatKey_)  bool canRepeat, @JsonKey(name: MusicAssistantPlayerSource.shuffleEnabledKey_)  bool? shuffleEnabled, @JsonKey(name: MusicAssistantPlayerSource.repeatModeKey_)  MusicAssistantRepeatMode? repeatMode, @JsonKey(name: MusicAssistantPlayerSource.accountIdKey_)  String? accountId)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantPlayerSource() when $default != null:
return $default(_that.id,_that.name,_that.passive,_that.canPlayPause,_that.canSeek,_that.canNextPrevious,_that.canShuffle,_that.canRepeat,_that.shuffleEnabled,_that.repeatMode,_that.accountId);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantPlayerSource extends MusicAssistantPlayerSource {
  const _MusicAssistantPlayerSource({@JsonKey(name: MusicAssistantPlayerSource.idKey_) required this.id, @JsonKey(name: MusicAssistantPlayerSource.nameKey_) required this.name, @JsonKey(name: MusicAssistantPlayerSource.passiveKey_) this.passive = false, @JsonKey(name: MusicAssistantPlayerSource.canPlayPauseKey_) this.canPlayPause = false, @JsonKey(name: MusicAssistantPlayerSource.canSeekKey_) this.canSeek = false, @JsonKey(name: MusicAssistantPlayerSource.canNextPreviousKey_) this.canNextPrevious = false, @JsonKey(name: MusicAssistantPlayerSource.canShuffleKey_) this.canShuffle = false, @JsonKey(name: MusicAssistantPlayerSource.canRepeatKey_) this.canRepeat = false, @JsonKey(name: MusicAssistantPlayerSource.shuffleEnabledKey_) this.shuffleEnabled, @JsonKey(name: MusicAssistantPlayerSource.repeatModeKey_) this.repeatMode, @JsonKey(name: MusicAssistantPlayerSource.accountIdKey_) this.accountId}): super._();
  factory _MusicAssistantPlayerSource.fromJson(Map<String, dynamic> json) => _$MusicAssistantPlayerSourceFromJson(json);

/// id
@override@JsonKey(name: MusicAssistantPlayerSource.idKey_) final  String id;
/// name
@override@JsonKey(name: MusicAssistantPlayerSource.nameKey_) final  String name;
/// passive
@override@JsonKey(name: MusicAssistantPlayerSource.passiveKey_) final  bool passive;
/// canPlayPause
@override@JsonKey(name: MusicAssistantPlayerSource.canPlayPauseKey_) final  bool canPlayPause;
/// canSeek
@override@JsonKey(name: MusicAssistantPlayerSource.canSeekKey_) final  bool canSeek;
/// canNextPrevious
@override@JsonKey(name: MusicAssistantPlayerSource.canNextPreviousKey_) final  bool canNextPrevious;
/// canShuffle
@override@JsonKey(name: MusicAssistantPlayerSource.canShuffleKey_) final  bool canShuffle;
/// canRepeat
@override@JsonKey(name: MusicAssistantPlayerSource.canRepeatKey_) final  bool canRepeat;
/// shuffleEnabled
@override@JsonKey(name: MusicAssistantPlayerSource.shuffleEnabledKey_) final  bool? shuffleEnabled;
/// repeatMode
@override@JsonKey(name: MusicAssistantPlayerSource.repeatModeKey_) final  MusicAssistantRepeatMode? repeatMode;
/// accountId
@override@JsonKey(name: MusicAssistantPlayerSource.accountIdKey_) final  String? accountId;

/// Create a copy of MusicAssistantPlayerSource
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantPlayerSourceCopyWith<_MusicAssistantPlayerSource> get copyWith => __$MusicAssistantPlayerSourceCopyWithImpl<_MusicAssistantPlayerSource>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantPlayerSourceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantPlayerSource&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.passive, passive) || other.passive == passive)&&(identical(other.canPlayPause, canPlayPause) || other.canPlayPause == canPlayPause)&&(identical(other.canSeek, canSeek) || other.canSeek == canSeek)&&(identical(other.canNextPrevious, canNextPrevious) || other.canNextPrevious == canNextPrevious)&&(identical(other.canShuffle, canShuffle) || other.canShuffle == canShuffle)&&(identical(other.canRepeat, canRepeat) || other.canRepeat == canRepeat)&&(identical(other.shuffleEnabled, shuffleEnabled) || other.shuffleEnabled == shuffleEnabled)&&(identical(other.repeatMode, repeatMode) || other.repeatMode == repeatMode)&&(identical(other.accountId, accountId) || other.accountId == accountId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,passive,canPlayPause,canSeek,canNextPrevious,canShuffle,canRepeat,shuffleEnabled,repeatMode,accountId);

@override
String toString() {
  return 'MusicAssistantPlayerSource(id: $id, name: $name, passive: $passive, canPlayPause: $canPlayPause, canSeek: $canSeek, canNextPrevious: $canNextPrevious, canShuffle: $canShuffle, canRepeat: $canRepeat, shuffleEnabled: $shuffleEnabled, repeatMode: $repeatMode, accountId: $accountId)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantPlayerSourceCopyWith<$Res> implements $MusicAssistantPlayerSourceCopyWith<$Res> {
  factory _$MusicAssistantPlayerSourceCopyWith(_MusicAssistantPlayerSource value, $Res Function(_MusicAssistantPlayerSource) _then) = __$MusicAssistantPlayerSourceCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantPlayerSource.idKey_) String id,@JsonKey(name: MusicAssistantPlayerSource.nameKey_) String name,@JsonKey(name: MusicAssistantPlayerSource.passiveKey_) bool passive,@JsonKey(name: MusicAssistantPlayerSource.canPlayPauseKey_) bool canPlayPause,@JsonKey(name: MusicAssistantPlayerSource.canSeekKey_) bool canSeek,@JsonKey(name: MusicAssistantPlayerSource.canNextPreviousKey_) bool canNextPrevious,@JsonKey(name: MusicAssistantPlayerSource.canShuffleKey_) bool canShuffle,@JsonKey(name: MusicAssistantPlayerSource.canRepeatKey_) bool canRepeat,@JsonKey(name: MusicAssistantPlayerSource.shuffleEnabledKey_) bool? shuffleEnabled,@JsonKey(name: MusicAssistantPlayerSource.repeatModeKey_) MusicAssistantRepeatMode? repeatMode,@JsonKey(name: MusicAssistantPlayerSource.accountIdKey_) String? accountId
});




}
/// @nodoc
class __$MusicAssistantPlayerSourceCopyWithImpl<$Res>
    implements _$MusicAssistantPlayerSourceCopyWith<$Res> {
  __$MusicAssistantPlayerSourceCopyWithImpl(this._self, this._then);

  final _MusicAssistantPlayerSource _self;
  final $Res Function(_MusicAssistantPlayerSource) _then;

/// Create a copy of MusicAssistantPlayerSource
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? passive = null,Object? canPlayPause = null,Object? canSeek = null,Object? canNextPrevious = null,Object? canShuffle = null,Object? canRepeat = null,Object? shuffleEnabled = freezed,Object? repeatMode = freezed,Object? accountId = freezed,}) {
  return _then(_MusicAssistantPlayerSource(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,passive: null == passive ? _self.passive : passive // ignore: cast_nullable_to_non_nullable
as bool,canPlayPause: null == canPlayPause ? _self.canPlayPause : canPlayPause // ignore: cast_nullable_to_non_nullable
as bool,canSeek: null == canSeek ? _self.canSeek : canSeek // ignore: cast_nullable_to_non_nullable
as bool,canNextPrevious: null == canNextPrevious ? _self.canNextPrevious : canNextPrevious // ignore: cast_nullable_to_non_nullable
as bool,canShuffle: null == canShuffle ? _self.canShuffle : canShuffle // ignore: cast_nullable_to_non_nullable
as bool,canRepeat: null == canRepeat ? _self.canRepeat : canRepeat // ignore: cast_nullable_to_non_nullable
as bool,shuffleEnabled: freezed == shuffleEnabled ? _self.shuffleEnabled : shuffleEnabled // ignore: cast_nullable_to_non_nullable
as bool?,repeatMode: freezed == repeatMode ? _self.repeatMode : repeatMode // ignore: cast_nullable_to_non_nullable
as MusicAssistantRepeatMode?,accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
