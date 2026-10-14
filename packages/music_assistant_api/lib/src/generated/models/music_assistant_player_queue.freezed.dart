// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_player_queue.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantPlayerQueue {

/// queueId
@JsonKey(name: MusicAssistantPlayerQueue.queueIdKey_) String get queueId;/// displayName
@JsonKey(name: MusicAssistantPlayerQueue.displayNameKey_) String get displayName;/// currentIndex
@JsonKey(name: MusicAssistantPlayerQueue.currentIndexKey_) int? get currentIndex;/// autoplayEnabled
@JsonKey(name: MusicAssistantPlayerQueue.autoplayEnabledKey_) bool get autoplayEnabled;/// currentItem
@JsonKey(name: MusicAssistantPlayerQueue.currentItemKey_) MusicAssistantQueueItem? get currentItem;
/// Create a copy of MusicAssistantPlayerQueue
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantPlayerQueueCopyWith<MusicAssistantPlayerQueue> get copyWith => _$MusicAssistantPlayerQueueCopyWithImpl<MusicAssistantPlayerQueue>(this as MusicAssistantPlayerQueue, _$identity);

  /// Serializes this MusicAssistantPlayerQueue to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantPlayerQueue&&(identical(other.queueId, queueId) || other.queueId == queueId)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.currentIndex, currentIndex) || other.currentIndex == currentIndex)&&(identical(other.autoplayEnabled, autoplayEnabled) || other.autoplayEnabled == autoplayEnabled)&&(identical(other.currentItem, currentItem) || other.currentItem == currentItem));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,queueId,displayName,currentIndex,autoplayEnabled,currentItem);

@override
String toString() {
  return 'MusicAssistantPlayerQueue(queueId: $queueId, displayName: $displayName, currentIndex: $currentIndex, autoplayEnabled: $autoplayEnabled, currentItem: $currentItem)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantPlayerQueueCopyWith<$Res>  {
  factory $MusicAssistantPlayerQueueCopyWith(MusicAssistantPlayerQueue value, $Res Function(MusicAssistantPlayerQueue) _then) = _$MusicAssistantPlayerQueueCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantPlayerQueue.queueIdKey_) String queueId,@JsonKey(name: MusicAssistantPlayerQueue.displayNameKey_) String displayName,@JsonKey(name: MusicAssistantPlayerQueue.currentIndexKey_) int? currentIndex,@JsonKey(name: MusicAssistantPlayerQueue.autoplayEnabledKey_) bool autoplayEnabled,@JsonKey(name: MusicAssistantPlayerQueue.currentItemKey_) MusicAssistantQueueItem? currentItem
});


$MusicAssistantQueueItemCopyWith<$Res>? get currentItem;

}
/// @nodoc
class _$MusicAssistantPlayerQueueCopyWithImpl<$Res>
    implements $MusicAssistantPlayerQueueCopyWith<$Res> {
  _$MusicAssistantPlayerQueueCopyWithImpl(this._self, this._then);

  final MusicAssistantPlayerQueue _self;
  final $Res Function(MusicAssistantPlayerQueue) _then;

/// Create a copy of MusicAssistantPlayerQueue
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? queueId = null,Object? displayName = null,Object? currentIndex = freezed,Object? autoplayEnabled = null,Object? currentItem = freezed,}) {
  return _then(_self.copyWith(
queueId: null == queueId ? _self.queueId : queueId // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,currentIndex: freezed == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int?,autoplayEnabled: null == autoplayEnabled ? _self.autoplayEnabled : autoplayEnabled // ignore: cast_nullable_to_non_nullable
as bool,currentItem: freezed == currentItem ? _self.currentItem : currentItem // ignore: cast_nullable_to_non_nullable
as MusicAssistantQueueItem?,
  ));
}
/// Create a copy of MusicAssistantPlayerQueue
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantQueueItemCopyWith<$Res>? get currentItem {
    if (_self.currentItem == null) {
    return null;
  }

  return $MusicAssistantQueueItemCopyWith<$Res>(_self.currentItem!, (value) {
    return _then(_self.copyWith(currentItem: value));
  });
}
}


/// Adds pattern-matching-related methods to [MusicAssistantPlayerQueue].
extension MusicAssistantPlayerQueuePatterns on MusicAssistantPlayerQueue {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantPlayerQueue value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantPlayerQueue() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantPlayerQueue value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantPlayerQueue():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantPlayerQueue value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantPlayerQueue() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantPlayerQueue.queueIdKey_)  String queueId, @JsonKey(name: MusicAssistantPlayerQueue.displayNameKey_)  String displayName, @JsonKey(name: MusicAssistantPlayerQueue.currentIndexKey_)  int? currentIndex, @JsonKey(name: MusicAssistantPlayerQueue.autoplayEnabledKey_)  bool autoplayEnabled, @JsonKey(name: MusicAssistantPlayerQueue.currentItemKey_)  MusicAssistantQueueItem? currentItem)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantPlayerQueue() when $default != null:
return $default(_that.queueId,_that.displayName,_that.currentIndex,_that.autoplayEnabled,_that.currentItem);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantPlayerQueue.queueIdKey_)  String queueId, @JsonKey(name: MusicAssistantPlayerQueue.displayNameKey_)  String displayName, @JsonKey(name: MusicAssistantPlayerQueue.currentIndexKey_)  int? currentIndex, @JsonKey(name: MusicAssistantPlayerQueue.autoplayEnabledKey_)  bool autoplayEnabled, @JsonKey(name: MusicAssistantPlayerQueue.currentItemKey_)  MusicAssistantQueueItem? currentItem)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantPlayerQueue():
return $default(_that.queueId,_that.displayName,_that.currentIndex,_that.autoplayEnabled,_that.currentItem);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantPlayerQueue.queueIdKey_)  String queueId, @JsonKey(name: MusicAssistantPlayerQueue.displayNameKey_)  String displayName, @JsonKey(name: MusicAssistantPlayerQueue.currentIndexKey_)  int? currentIndex, @JsonKey(name: MusicAssistantPlayerQueue.autoplayEnabledKey_)  bool autoplayEnabled, @JsonKey(name: MusicAssistantPlayerQueue.currentItemKey_)  MusicAssistantQueueItem? currentItem)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantPlayerQueue() when $default != null:
return $default(_that.queueId,_that.displayName,_that.currentIndex,_that.autoplayEnabled,_that.currentItem);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantPlayerQueue extends MusicAssistantPlayerQueue {
  const _MusicAssistantPlayerQueue({@JsonKey(name: MusicAssistantPlayerQueue.queueIdKey_) required this.queueId, @JsonKey(name: MusicAssistantPlayerQueue.displayNameKey_) required this.displayName, @JsonKey(name: MusicAssistantPlayerQueue.currentIndexKey_) required this.currentIndex, @JsonKey(name: MusicAssistantPlayerQueue.autoplayEnabledKey_) this.autoplayEnabled = false, @JsonKey(name: MusicAssistantPlayerQueue.currentItemKey_) this.currentItem}): super._();
  factory _MusicAssistantPlayerQueue.fromJson(Map<String, dynamic> json) => _$MusicAssistantPlayerQueueFromJson(json);

/// queueId
@override@JsonKey(name: MusicAssistantPlayerQueue.queueIdKey_) final  String queueId;
/// displayName
@override@JsonKey(name: MusicAssistantPlayerQueue.displayNameKey_) final  String displayName;
/// currentIndex
@override@JsonKey(name: MusicAssistantPlayerQueue.currentIndexKey_) final  int? currentIndex;
/// autoplayEnabled
@override@JsonKey(name: MusicAssistantPlayerQueue.autoplayEnabledKey_) final  bool autoplayEnabled;
/// currentItem
@override@JsonKey(name: MusicAssistantPlayerQueue.currentItemKey_) final  MusicAssistantQueueItem? currentItem;

/// Create a copy of MusicAssistantPlayerQueue
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantPlayerQueueCopyWith<_MusicAssistantPlayerQueue> get copyWith => __$MusicAssistantPlayerQueueCopyWithImpl<_MusicAssistantPlayerQueue>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantPlayerQueueToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantPlayerQueue&&(identical(other.queueId, queueId) || other.queueId == queueId)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.currentIndex, currentIndex) || other.currentIndex == currentIndex)&&(identical(other.autoplayEnabled, autoplayEnabled) || other.autoplayEnabled == autoplayEnabled)&&(identical(other.currentItem, currentItem) || other.currentItem == currentItem));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,queueId,displayName,currentIndex,autoplayEnabled,currentItem);

@override
String toString() {
  return 'MusicAssistantPlayerQueue(queueId: $queueId, displayName: $displayName, currentIndex: $currentIndex, autoplayEnabled: $autoplayEnabled, currentItem: $currentItem)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantPlayerQueueCopyWith<$Res> implements $MusicAssistantPlayerQueueCopyWith<$Res> {
  factory _$MusicAssistantPlayerQueueCopyWith(_MusicAssistantPlayerQueue value, $Res Function(_MusicAssistantPlayerQueue) _then) = __$MusicAssistantPlayerQueueCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantPlayerQueue.queueIdKey_) String queueId,@JsonKey(name: MusicAssistantPlayerQueue.displayNameKey_) String displayName,@JsonKey(name: MusicAssistantPlayerQueue.currentIndexKey_) int? currentIndex,@JsonKey(name: MusicAssistantPlayerQueue.autoplayEnabledKey_) bool autoplayEnabled,@JsonKey(name: MusicAssistantPlayerQueue.currentItemKey_) MusicAssistantQueueItem? currentItem
});


@override $MusicAssistantQueueItemCopyWith<$Res>? get currentItem;

}
/// @nodoc
class __$MusicAssistantPlayerQueueCopyWithImpl<$Res>
    implements _$MusicAssistantPlayerQueueCopyWith<$Res> {
  __$MusicAssistantPlayerQueueCopyWithImpl(this._self, this._then);

  final _MusicAssistantPlayerQueue _self;
  final $Res Function(_MusicAssistantPlayerQueue) _then;

/// Create a copy of MusicAssistantPlayerQueue
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? queueId = null,Object? displayName = null,Object? currentIndex = freezed,Object? autoplayEnabled = null,Object? currentItem = freezed,}) {
  return _then(_MusicAssistantPlayerQueue(
queueId: null == queueId ? _self.queueId : queueId // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,currentIndex: freezed == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int?,autoplayEnabled: null == autoplayEnabled ? _self.autoplayEnabled : autoplayEnabled // ignore: cast_nullable_to_non_nullable
as bool,currentItem: freezed == currentItem ? _self.currentItem : currentItem // ignore: cast_nullable_to_non_nullable
as MusicAssistantQueueItem?,
  ));
}

/// Create a copy of MusicAssistantPlayerQueue
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantQueueItemCopyWith<$Res>? get currentItem {
    if (_self.currentItem == null) {
    return null;
  }

  return $MusicAssistantQueueItemCopyWith<$Res>(_self.currentItem!, (value) {
    return _then(_self.copyWith(currentItem: value));
  });
}
}

// dart format on
