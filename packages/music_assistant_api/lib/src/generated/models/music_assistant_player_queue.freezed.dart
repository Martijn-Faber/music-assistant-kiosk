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
@JsonKey(name: MusicAssistantPlayerQueue.queueIdKey_) String get queueId;/// active
@JsonKey(name: MusicAssistantPlayerQueue.activeKey_) bool get active;/// displayName
@JsonKey(name: MusicAssistantPlayerQueue.displayNameKey_) String get displayName;/// available
@JsonKey(name: MusicAssistantPlayerQueue.availableKey_) bool get available;/// items
@JsonKey(name: MusicAssistantPlayerQueue.itemsKey_) int get items;/// shuffleEnabled
@JsonKey(name: MusicAssistantPlayerQueue.shuffleEnabledKey_) bool get shuffleEnabled;/// repeatMode
@JsonKey(name: MusicAssistantPlayerQueue.repeatModeKey_) MusicAssistantRepeatMode get repeatMode;/// crossfadeEnabled
@JsonKey(name: MusicAssistantPlayerQueue.crossfadeEnabledKey_) bool get crossfadeEnabled;/// autoplayEnabled
@JsonKey(name: MusicAssistantPlayerQueue.autoplayEnabledKey_) bool get autoplayEnabled;/// overlayEnabled
@JsonKey(name: MusicAssistantPlayerQueue.overlayEnabledKey_) bool get overlayEnabled;/// overlaySource
@JsonKey(name: MusicAssistantPlayerQueue.overlaySourceKey_) MusicAssistantItemMapping? get overlaySource;/// overlayVolume
@JsonKey(name: MusicAssistantPlayerQueue.overlayVolumeKey_) int get overlayVolume;/// smartFadesActive
@JsonKey(name: MusicAssistantPlayerQueue.smartFadesActiveKey_) bool get smartFadesActive;/// smartShuffleActive
@JsonKey(name: MusicAssistantPlayerQueue.smartShuffleActiveKey_) bool get smartShuffleActive;/// currentIndex
@JsonKey(name: MusicAssistantPlayerQueue.currentIndexKey_) int? get currentIndex;/// indexInBuffer
@JsonKey(name: MusicAssistantPlayerQueue.indexInBufferKey_) int? get indexInBuffer;/// ended
@JsonKey(name: MusicAssistantPlayerQueue.endedKey_) bool get ended;/// elapsedTime
@JsonKey(name: MusicAssistantPlayerQueue.elapsedTimeKey_) double get elapsedTime;/// elapsedTimeLastUpdated
@JsonKey(name: MusicAssistantPlayerQueue.elapsedTimeLastUpdatedKey_) double? get elapsedTimeLastUpdated;/// playbackSpeed
@JsonKey(name: MusicAssistantPlayerQueue.playbackSpeedKey_) double get playbackSpeed;/// state
@JsonKey(name: MusicAssistantPlayerQueue.stateKey_) MusicAssistantPlaybackState get state;/// currentItem
@JsonKey(name: MusicAssistantPlayerQueue.currentItemKey_) MusicAssistantQueueItem? get currentItem;/// nextItem
@JsonKey(name: MusicAssistantPlayerQueue.nextItemKey_) MusicAssistantQueueItem? get nextItem;/// sources
@JsonKey(name: MusicAssistantPlayerQueue.sourcesKey_) List<MusicAssistantItemMapping>? get sources;/// flowMode
@JsonKey(name: MusicAssistantPlayerQueue.flowModeKey_) bool get flowMode;/// resumePos
@JsonKey(name: MusicAssistantPlayerQueue.resumePosKey_) int get resumePos;/// isDynamic
@JsonKey(name: MusicAssistantPlayerQueue.isDynamicKey_) bool get isDynamic;/// extraAttributes
@JsonKey(name: MusicAssistantPlayerQueue.extraAttributesKey_) Map<String, String?>? get extraAttributes;
/// Create a copy of MusicAssistantPlayerQueue
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantPlayerQueueCopyWith<MusicAssistantPlayerQueue> get copyWith => _$MusicAssistantPlayerQueueCopyWithImpl<MusicAssistantPlayerQueue>(this as MusicAssistantPlayerQueue, _$identity);

  /// Serializes this MusicAssistantPlayerQueue to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantPlayerQueue&&(identical(other.queueId, queueId) || other.queueId == queueId)&&(identical(other.active, active) || other.active == active)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.available, available) || other.available == available)&&(identical(other.items, items) || other.items == items)&&(identical(other.shuffleEnabled, shuffleEnabled) || other.shuffleEnabled == shuffleEnabled)&&(identical(other.repeatMode, repeatMode) || other.repeatMode == repeatMode)&&(identical(other.crossfadeEnabled, crossfadeEnabled) || other.crossfadeEnabled == crossfadeEnabled)&&(identical(other.autoplayEnabled, autoplayEnabled) || other.autoplayEnabled == autoplayEnabled)&&(identical(other.overlayEnabled, overlayEnabled) || other.overlayEnabled == overlayEnabled)&&(identical(other.overlaySource, overlaySource) || other.overlaySource == overlaySource)&&(identical(other.overlayVolume, overlayVolume) || other.overlayVolume == overlayVolume)&&(identical(other.smartFadesActive, smartFadesActive) || other.smartFadesActive == smartFadesActive)&&(identical(other.smartShuffleActive, smartShuffleActive) || other.smartShuffleActive == smartShuffleActive)&&(identical(other.currentIndex, currentIndex) || other.currentIndex == currentIndex)&&(identical(other.indexInBuffer, indexInBuffer) || other.indexInBuffer == indexInBuffer)&&(identical(other.ended, ended) || other.ended == ended)&&(identical(other.elapsedTime, elapsedTime) || other.elapsedTime == elapsedTime)&&(identical(other.elapsedTimeLastUpdated, elapsedTimeLastUpdated) || other.elapsedTimeLastUpdated == elapsedTimeLastUpdated)&&(identical(other.playbackSpeed, playbackSpeed) || other.playbackSpeed == playbackSpeed)&&(identical(other.state, state) || other.state == state)&&(identical(other.currentItem, currentItem) || other.currentItem == currentItem)&&(identical(other.nextItem, nextItem) || other.nextItem == nextItem)&&const DeepCollectionEquality().equals(other.sources, sources)&&(identical(other.flowMode, flowMode) || other.flowMode == flowMode)&&(identical(other.resumePos, resumePos) || other.resumePos == resumePos)&&(identical(other.isDynamic, isDynamic) || other.isDynamic == isDynamic)&&const DeepCollectionEquality().equals(other.extraAttributes, extraAttributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,queueId,active,displayName,available,items,shuffleEnabled,repeatMode,crossfadeEnabled,autoplayEnabled,overlayEnabled,overlaySource,overlayVolume,smartFadesActive,smartShuffleActive,currentIndex,indexInBuffer,ended,elapsedTime,elapsedTimeLastUpdated,playbackSpeed,state,currentItem,nextItem,const DeepCollectionEquality().hash(sources),flowMode,resumePos,isDynamic,const DeepCollectionEquality().hash(extraAttributes)]);

@override
String toString() {
  return 'MusicAssistantPlayerQueue(queueId: $queueId, active: $active, displayName: $displayName, available: $available, items: $items, shuffleEnabled: $shuffleEnabled, repeatMode: $repeatMode, crossfadeEnabled: $crossfadeEnabled, autoplayEnabled: $autoplayEnabled, overlayEnabled: $overlayEnabled, overlaySource: $overlaySource, overlayVolume: $overlayVolume, smartFadesActive: $smartFadesActive, smartShuffleActive: $smartShuffleActive, currentIndex: $currentIndex, indexInBuffer: $indexInBuffer, ended: $ended, elapsedTime: $elapsedTime, elapsedTimeLastUpdated: $elapsedTimeLastUpdated, playbackSpeed: $playbackSpeed, state: $state, currentItem: $currentItem, nextItem: $nextItem, sources: $sources, flowMode: $flowMode, resumePos: $resumePos, isDynamic: $isDynamic, extraAttributes: $extraAttributes)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantPlayerQueueCopyWith<$Res>  {
  factory $MusicAssistantPlayerQueueCopyWith(MusicAssistantPlayerQueue value, $Res Function(MusicAssistantPlayerQueue) _then) = _$MusicAssistantPlayerQueueCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantPlayerQueue.queueIdKey_) String queueId,@JsonKey(name: MusicAssistantPlayerQueue.activeKey_) bool active,@JsonKey(name: MusicAssistantPlayerQueue.displayNameKey_) String displayName,@JsonKey(name: MusicAssistantPlayerQueue.availableKey_) bool available,@JsonKey(name: MusicAssistantPlayerQueue.itemsKey_) int items,@JsonKey(name: MusicAssistantPlayerQueue.shuffleEnabledKey_) bool shuffleEnabled,@JsonKey(name: MusicAssistantPlayerQueue.repeatModeKey_) MusicAssistantRepeatMode repeatMode,@JsonKey(name: MusicAssistantPlayerQueue.crossfadeEnabledKey_) bool crossfadeEnabled,@JsonKey(name: MusicAssistantPlayerQueue.autoplayEnabledKey_) bool autoplayEnabled,@JsonKey(name: MusicAssistantPlayerQueue.overlayEnabledKey_) bool overlayEnabled,@JsonKey(name: MusicAssistantPlayerQueue.overlaySourceKey_) MusicAssistantItemMapping? overlaySource,@JsonKey(name: MusicAssistantPlayerQueue.overlayVolumeKey_) int overlayVolume,@JsonKey(name: MusicAssistantPlayerQueue.smartFadesActiveKey_) bool smartFadesActive,@JsonKey(name: MusicAssistantPlayerQueue.smartShuffleActiveKey_) bool smartShuffleActive,@JsonKey(name: MusicAssistantPlayerQueue.currentIndexKey_) int? currentIndex,@JsonKey(name: MusicAssistantPlayerQueue.indexInBufferKey_) int? indexInBuffer,@JsonKey(name: MusicAssistantPlayerQueue.endedKey_) bool ended,@JsonKey(name: MusicAssistantPlayerQueue.elapsedTimeKey_) double elapsedTime,@JsonKey(name: MusicAssistantPlayerQueue.elapsedTimeLastUpdatedKey_) double? elapsedTimeLastUpdated,@JsonKey(name: MusicAssistantPlayerQueue.playbackSpeedKey_) double playbackSpeed,@JsonKey(name: MusicAssistantPlayerQueue.stateKey_) MusicAssistantPlaybackState state,@JsonKey(name: MusicAssistantPlayerQueue.currentItemKey_) MusicAssistantQueueItem? currentItem,@JsonKey(name: MusicAssistantPlayerQueue.nextItemKey_) MusicAssistantQueueItem? nextItem,@JsonKey(name: MusicAssistantPlayerQueue.sourcesKey_) List<MusicAssistantItemMapping>? sources,@JsonKey(name: MusicAssistantPlayerQueue.flowModeKey_) bool flowMode,@JsonKey(name: MusicAssistantPlayerQueue.resumePosKey_) int resumePos,@JsonKey(name: MusicAssistantPlayerQueue.isDynamicKey_) bool isDynamic,@JsonKey(name: MusicAssistantPlayerQueue.extraAttributesKey_) Map<String, String?>? extraAttributes
});


$MusicAssistantItemMappingCopyWith<$Res>? get overlaySource;$MusicAssistantQueueItemCopyWith<$Res>? get currentItem;$MusicAssistantQueueItemCopyWith<$Res>? get nextItem;

}
/// @nodoc
class _$MusicAssistantPlayerQueueCopyWithImpl<$Res>
    implements $MusicAssistantPlayerQueueCopyWith<$Res> {
  _$MusicAssistantPlayerQueueCopyWithImpl(this._self, this._then);

  final MusicAssistantPlayerQueue _self;
  final $Res Function(MusicAssistantPlayerQueue) _then;

/// Create a copy of MusicAssistantPlayerQueue
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? queueId = null,Object? active = null,Object? displayName = null,Object? available = null,Object? items = null,Object? shuffleEnabled = null,Object? repeatMode = null,Object? crossfadeEnabled = null,Object? autoplayEnabled = null,Object? overlayEnabled = null,Object? overlaySource = freezed,Object? overlayVolume = null,Object? smartFadesActive = null,Object? smartShuffleActive = null,Object? currentIndex = freezed,Object? indexInBuffer = freezed,Object? ended = null,Object? elapsedTime = null,Object? elapsedTimeLastUpdated = freezed,Object? playbackSpeed = null,Object? state = null,Object? currentItem = freezed,Object? nextItem = freezed,Object? sources = freezed,Object? flowMode = null,Object? resumePos = null,Object? isDynamic = null,Object? extraAttributes = freezed,}) {
  return _then(_self.copyWith(
queueId: null == queueId ? _self.queueId : queueId // ignore: cast_nullable_to_non_nullable
as String,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as bool,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as int,shuffleEnabled: null == shuffleEnabled ? _self.shuffleEnabled : shuffleEnabled // ignore: cast_nullable_to_non_nullable
as bool,repeatMode: null == repeatMode ? _self.repeatMode : repeatMode // ignore: cast_nullable_to_non_nullable
as MusicAssistantRepeatMode,crossfadeEnabled: null == crossfadeEnabled ? _self.crossfadeEnabled : crossfadeEnabled // ignore: cast_nullable_to_non_nullable
as bool,autoplayEnabled: null == autoplayEnabled ? _self.autoplayEnabled : autoplayEnabled // ignore: cast_nullable_to_non_nullable
as bool,overlayEnabled: null == overlayEnabled ? _self.overlayEnabled : overlayEnabled // ignore: cast_nullable_to_non_nullable
as bool,overlaySource: freezed == overlaySource ? _self.overlaySource : overlaySource // ignore: cast_nullable_to_non_nullable
as MusicAssistantItemMapping?,overlayVolume: null == overlayVolume ? _self.overlayVolume : overlayVolume // ignore: cast_nullable_to_non_nullable
as int,smartFadesActive: null == smartFadesActive ? _self.smartFadesActive : smartFadesActive // ignore: cast_nullable_to_non_nullable
as bool,smartShuffleActive: null == smartShuffleActive ? _self.smartShuffleActive : smartShuffleActive // ignore: cast_nullable_to_non_nullable
as bool,currentIndex: freezed == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int?,indexInBuffer: freezed == indexInBuffer ? _self.indexInBuffer : indexInBuffer // ignore: cast_nullable_to_non_nullable
as int?,ended: null == ended ? _self.ended : ended // ignore: cast_nullable_to_non_nullable
as bool,elapsedTime: null == elapsedTime ? _self.elapsedTime : elapsedTime // ignore: cast_nullable_to_non_nullable
as double,elapsedTimeLastUpdated: freezed == elapsedTimeLastUpdated ? _self.elapsedTimeLastUpdated : elapsedTimeLastUpdated // ignore: cast_nullable_to_non_nullable
as double?,playbackSpeed: null == playbackSpeed ? _self.playbackSpeed : playbackSpeed // ignore: cast_nullable_to_non_nullable
as double,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as MusicAssistantPlaybackState,currentItem: freezed == currentItem ? _self.currentItem : currentItem // ignore: cast_nullable_to_non_nullable
as MusicAssistantQueueItem?,nextItem: freezed == nextItem ? _self.nextItem : nextItem // ignore: cast_nullable_to_non_nullable
as MusicAssistantQueueItem?,sources: freezed == sources ? _self.sources : sources // ignore: cast_nullable_to_non_nullable
as List<MusicAssistantItemMapping>?,flowMode: null == flowMode ? _self.flowMode : flowMode // ignore: cast_nullable_to_non_nullable
as bool,resumePos: null == resumePos ? _self.resumePos : resumePos // ignore: cast_nullable_to_non_nullable
as int,isDynamic: null == isDynamic ? _self.isDynamic : isDynamic // ignore: cast_nullable_to_non_nullable
as bool,extraAttributes: freezed == extraAttributes ? _self.extraAttributes : extraAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, String?>?,
  ));
}
/// Create a copy of MusicAssistantPlayerQueue
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantItemMappingCopyWith<$Res>? get overlaySource {
    if (_self.overlaySource == null) {
    return null;
  }

  return $MusicAssistantItemMappingCopyWith<$Res>(_self.overlaySource!, (value) {
    return _then(_self.copyWith(overlaySource: value));
  });
}/// Create a copy of MusicAssistantPlayerQueue
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
}/// Create a copy of MusicAssistantPlayerQueue
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantQueueItemCopyWith<$Res>? get nextItem {
    if (_self.nextItem == null) {
    return null;
  }

  return $MusicAssistantQueueItemCopyWith<$Res>(_self.nextItem!, (value) {
    return _then(_self.copyWith(nextItem: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantPlayerQueue.queueIdKey_)  String queueId, @JsonKey(name: MusicAssistantPlayerQueue.activeKey_)  bool active, @JsonKey(name: MusicAssistantPlayerQueue.displayNameKey_)  String displayName, @JsonKey(name: MusicAssistantPlayerQueue.availableKey_)  bool available, @JsonKey(name: MusicAssistantPlayerQueue.itemsKey_)  int items, @JsonKey(name: MusicAssistantPlayerQueue.shuffleEnabledKey_)  bool shuffleEnabled, @JsonKey(name: MusicAssistantPlayerQueue.repeatModeKey_)  MusicAssistantRepeatMode repeatMode, @JsonKey(name: MusicAssistantPlayerQueue.crossfadeEnabledKey_)  bool crossfadeEnabled, @JsonKey(name: MusicAssistantPlayerQueue.autoplayEnabledKey_)  bool autoplayEnabled, @JsonKey(name: MusicAssistantPlayerQueue.overlayEnabledKey_)  bool overlayEnabled, @JsonKey(name: MusicAssistantPlayerQueue.overlaySourceKey_)  MusicAssistantItemMapping? overlaySource, @JsonKey(name: MusicAssistantPlayerQueue.overlayVolumeKey_)  int overlayVolume, @JsonKey(name: MusicAssistantPlayerQueue.smartFadesActiveKey_)  bool smartFadesActive, @JsonKey(name: MusicAssistantPlayerQueue.smartShuffleActiveKey_)  bool smartShuffleActive, @JsonKey(name: MusicAssistantPlayerQueue.currentIndexKey_)  int? currentIndex, @JsonKey(name: MusicAssistantPlayerQueue.indexInBufferKey_)  int? indexInBuffer, @JsonKey(name: MusicAssistantPlayerQueue.endedKey_)  bool ended, @JsonKey(name: MusicAssistantPlayerQueue.elapsedTimeKey_)  double elapsedTime, @JsonKey(name: MusicAssistantPlayerQueue.elapsedTimeLastUpdatedKey_)  double? elapsedTimeLastUpdated, @JsonKey(name: MusicAssistantPlayerQueue.playbackSpeedKey_)  double playbackSpeed, @JsonKey(name: MusicAssistantPlayerQueue.stateKey_)  MusicAssistantPlaybackState state, @JsonKey(name: MusicAssistantPlayerQueue.currentItemKey_)  MusicAssistantQueueItem? currentItem, @JsonKey(name: MusicAssistantPlayerQueue.nextItemKey_)  MusicAssistantQueueItem? nextItem, @JsonKey(name: MusicAssistantPlayerQueue.sourcesKey_)  List<MusicAssistantItemMapping>? sources, @JsonKey(name: MusicAssistantPlayerQueue.flowModeKey_)  bool flowMode, @JsonKey(name: MusicAssistantPlayerQueue.resumePosKey_)  int resumePos, @JsonKey(name: MusicAssistantPlayerQueue.isDynamicKey_)  bool isDynamic, @JsonKey(name: MusicAssistantPlayerQueue.extraAttributesKey_)  Map<String, String?>? extraAttributes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantPlayerQueue() when $default != null:
return $default(_that.queueId,_that.active,_that.displayName,_that.available,_that.items,_that.shuffleEnabled,_that.repeatMode,_that.crossfadeEnabled,_that.autoplayEnabled,_that.overlayEnabled,_that.overlaySource,_that.overlayVolume,_that.smartFadesActive,_that.smartShuffleActive,_that.currentIndex,_that.indexInBuffer,_that.ended,_that.elapsedTime,_that.elapsedTimeLastUpdated,_that.playbackSpeed,_that.state,_that.currentItem,_that.nextItem,_that.sources,_that.flowMode,_that.resumePos,_that.isDynamic,_that.extraAttributes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantPlayerQueue.queueIdKey_)  String queueId, @JsonKey(name: MusicAssistantPlayerQueue.activeKey_)  bool active, @JsonKey(name: MusicAssistantPlayerQueue.displayNameKey_)  String displayName, @JsonKey(name: MusicAssistantPlayerQueue.availableKey_)  bool available, @JsonKey(name: MusicAssistantPlayerQueue.itemsKey_)  int items, @JsonKey(name: MusicAssistantPlayerQueue.shuffleEnabledKey_)  bool shuffleEnabled, @JsonKey(name: MusicAssistantPlayerQueue.repeatModeKey_)  MusicAssistantRepeatMode repeatMode, @JsonKey(name: MusicAssistantPlayerQueue.crossfadeEnabledKey_)  bool crossfadeEnabled, @JsonKey(name: MusicAssistantPlayerQueue.autoplayEnabledKey_)  bool autoplayEnabled, @JsonKey(name: MusicAssistantPlayerQueue.overlayEnabledKey_)  bool overlayEnabled, @JsonKey(name: MusicAssistantPlayerQueue.overlaySourceKey_)  MusicAssistantItemMapping? overlaySource, @JsonKey(name: MusicAssistantPlayerQueue.overlayVolumeKey_)  int overlayVolume, @JsonKey(name: MusicAssistantPlayerQueue.smartFadesActiveKey_)  bool smartFadesActive, @JsonKey(name: MusicAssistantPlayerQueue.smartShuffleActiveKey_)  bool smartShuffleActive, @JsonKey(name: MusicAssistantPlayerQueue.currentIndexKey_)  int? currentIndex, @JsonKey(name: MusicAssistantPlayerQueue.indexInBufferKey_)  int? indexInBuffer, @JsonKey(name: MusicAssistantPlayerQueue.endedKey_)  bool ended, @JsonKey(name: MusicAssistantPlayerQueue.elapsedTimeKey_)  double elapsedTime, @JsonKey(name: MusicAssistantPlayerQueue.elapsedTimeLastUpdatedKey_)  double? elapsedTimeLastUpdated, @JsonKey(name: MusicAssistantPlayerQueue.playbackSpeedKey_)  double playbackSpeed, @JsonKey(name: MusicAssistantPlayerQueue.stateKey_)  MusicAssistantPlaybackState state, @JsonKey(name: MusicAssistantPlayerQueue.currentItemKey_)  MusicAssistantQueueItem? currentItem, @JsonKey(name: MusicAssistantPlayerQueue.nextItemKey_)  MusicAssistantQueueItem? nextItem, @JsonKey(name: MusicAssistantPlayerQueue.sourcesKey_)  List<MusicAssistantItemMapping>? sources, @JsonKey(name: MusicAssistantPlayerQueue.flowModeKey_)  bool flowMode, @JsonKey(name: MusicAssistantPlayerQueue.resumePosKey_)  int resumePos, @JsonKey(name: MusicAssistantPlayerQueue.isDynamicKey_)  bool isDynamic, @JsonKey(name: MusicAssistantPlayerQueue.extraAttributesKey_)  Map<String, String?>? extraAttributes)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantPlayerQueue():
return $default(_that.queueId,_that.active,_that.displayName,_that.available,_that.items,_that.shuffleEnabled,_that.repeatMode,_that.crossfadeEnabled,_that.autoplayEnabled,_that.overlayEnabled,_that.overlaySource,_that.overlayVolume,_that.smartFadesActive,_that.smartShuffleActive,_that.currentIndex,_that.indexInBuffer,_that.ended,_that.elapsedTime,_that.elapsedTimeLastUpdated,_that.playbackSpeed,_that.state,_that.currentItem,_that.nextItem,_that.sources,_that.flowMode,_that.resumePos,_that.isDynamic,_that.extraAttributes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantPlayerQueue.queueIdKey_)  String queueId, @JsonKey(name: MusicAssistantPlayerQueue.activeKey_)  bool active, @JsonKey(name: MusicAssistantPlayerQueue.displayNameKey_)  String displayName, @JsonKey(name: MusicAssistantPlayerQueue.availableKey_)  bool available, @JsonKey(name: MusicAssistantPlayerQueue.itemsKey_)  int items, @JsonKey(name: MusicAssistantPlayerQueue.shuffleEnabledKey_)  bool shuffleEnabled, @JsonKey(name: MusicAssistantPlayerQueue.repeatModeKey_)  MusicAssistantRepeatMode repeatMode, @JsonKey(name: MusicAssistantPlayerQueue.crossfadeEnabledKey_)  bool crossfadeEnabled, @JsonKey(name: MusicAssistantPlayerQueue.autoplayEnabledKey_)  bool autoplayEnabled, @JsonKey(name: MusicAssistantPlayerQueue.overlayEnabledKey_)  bool overlayEnabled, @JsonKey(name: MusicAssistantPlayerQueue.overlaySourceKey_)  MusicAssistantItemMapping? overlaySource, @JsonKey(name: MusicAssistantPlayerQueue.overlayVolumeKey_)  int overlayVolume, @JsonKey(name: MusicAssistantPlayerQueue.smartFadesActiveKey_)  bool smartFadesActive, @JsonKey(name: MusicAssistantPlayerQueue.smartShuffleActiveKey_)  bool smartShuffleActive, @JsonKey(name: MusicAssistantPlayerQueue.currentIndexKey_)  int? currentIndex, @JsonKey(name: MusicAssistantPlayerQueue.indexInBufferKey_)  int? indexInBuffer, @JsonKey(name: MusicAssistantPlayerQueue.endedKey_)  bool ended, @JsonKey(name: MusicAssistantPlayerQueue.elapsedTimeKey_)  double elapsedTime, @JsonKey(name: MusicAssistantPlayerQueue.elapsedTimeLastUpdatedKey_)  double? elapsedTimeLastUpdated, @JsonKey(name: MusicAssistantPlayerQueue.playbackSpeedKey_)  double playbackSpeed, @JsonKey(name: MusicAssistantPlayerQueue.stateKey_)  MusicAssistantPlaybackState state, @JsonKey(name: MusicAssistantPlayerQueue.currentItemKey_)  MusicAssistantQueueItem? currentItem, @JsonKey(name: MusicAssistantPlayerQueue.nextItemKey_)  MusicAssistantQueueItem? nextItem, @JsonKey(name: MusicAssistantPlayerQueue.sourcesKey_)  List<MusicAssistantItemMapping>? sources, @JsonKey(name: MusicAssistantPlayerQueue.flowModeKey_)  bool flowMode, @JsonKey(name: MusicAssistantPlayerQueue.resumePosKey_)  int resumePos, @JsonKey(name: MusicAssistantPlayerQueue.isDynamicKey_)  bool isDynamic, @JsonKey(name: MusicAssistantPlayerQueue.extraAttributesKey_)  Map<String, String?>? extraAttributes)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantPlayerQueue() when $default != null:
return $default(_that.queueId,_that.active,_that.displayName,_that.available,_that.items,_that.shuffleEnabled,_that.repeatMode,_that.crossfadeEnabled,_that.autoplayEnabled,_that.overlayEnabled,_that.overlaySource,_that.overlayVolume,_that.smartFadesActive,_that.smartShuffleActive,_that.currentIndex,_that.indexInBuffer,_that.ended,_that.elapsedTime,_that.elapsedTimeLastUpdated,_that.playbackSpeed,_that.state,_that.currentItem,_that.nextItem,_that.sources,_that.flowMode,_that.resumePos,_that.isDynamic,_that.extraAttributes);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantPlayerQueue extends MusicAssistantPlayerQueue {
  const _MusicAssistantPlayerQueue({@JsonKey(name: MusicAssistantPlayerQueue.queueIdKey_) required this.queueId, @JsonKey(name: MusicAssistantPlayerQueue.activeKey_) required this.active, @JsonKey(name: MusicAssistantPlayerQueue.displayNameKey_) required this.displayName, @JsonKey(name: MusicAssistantPlayerQueue.availableKey_) required this.available, @JsonKey(name: MusicAssistantPlayerQueue.itemsKey_) required this.items, @JsonKey(name: MusicAssistantPlayerQueue.shuffleEnabledKey_) this.shuffleEnabled = false, @JsonKey(name: MusicAssistantPlayerQueue.repeatModeKey_) this.repeatMode = MusicAssistantRepeatMode.off, @JsonKey(name: MusicAssistantPlayerQueue.crossfadeEnabledKey_) this.crossfadeEnabled = false, @JsonKey(name: MusicAssistantPlayerQueue.autoplayEnabledKey_) this.autoplayEnabled = false, @JsonKey(name: MusicAssistantPlayerQueue.overlayEnabledKey_) this.overlayEnabled = false, @JsonKey(name: MusicAssistantPlayerQueue.overlaySourceKey_) this.overlaySource, @JsonKey(name: MusicAssistantPlayerQueue.overlayVolumeKey_) this.overlayVolume = 100, @JsonKey(name: MusicAssistantPlayerQueue.smartFadesActiveKey_) this.smartFadesActive = false, @JsonKey(name: MusicAssistantPlayerQueue.smartShuffleActiveKey_) this.smartShuffleActive = false, @JsonKey(name: MusicAssistantPlayerQueue.currentIndexKey_) this.currentIndex, @JsonKey(name: MusicAssistantPlayerQueue.indexInBufferKey_) this.indexInBuffer, @JsonKey(name: MusicAssistantPlayerQueue.endedKey_) this.ended = false, @JsonKey(name: MusicAssistantPlayerQueue.elapsedTimeKey_) this.elapsedTime = 0, @JsonKey(name: MusicAssistantPlayerQueue.elapsedTimeLastUpdatedKey_) this.elapsedTimeLastUpdated, @JsonKey(name: MusicAssistantPlayerQueue.playbackSpeedKey_) this.playbackSpeed = 1.0, @JsonKey(name: MusicAssistantPlayerQueue.stateKey_) this.state = MusicAssistantPlaybackState.idle, @JsonKey(name: MusicAssistantPlayerQueue.currentItemKey_) this.currentItem, @JsonKey(name: MusicAssistantPlayerQueue.nextItemKey_) this.nextItem, @JsonKey(name: MusicAssistantPlayerQueue.sourcesKey_) final  List<MusicAssistantItemMapping>? sources, @JsonKey(name: MusicAssistantPlayerQueue.flowModeKey_) this.flowMode = false, @JsonKey(name: MusicAssistantPlayerQueue.resumePosKey_) this.resumePos = 0, @JsonKey(name: MusicAssistantPlayerQueue.isDynamicKey_) this.isDynamic = false, @JsonKey(name: MusicAssistantPlayerQueue.extraAttributesKey_) final  Map<String, String?>? extraAttributes}): _sources = sources,_extraAttributes = extraAttributes,super._();
  factory _MusicAssistantPlayerQueue.fromJson(Map<String, dynamic> json) => _$MusicAssistantPlayerQueueFromJson(json);

/// queueId
@override@JsonKey(name: MusicAssistantPlayerQueue.queueIdKey_) final  String queueId;
/// active
@override@JsonKey(name: MusicAssistantPlayerQueue.activeKey_) final  bool active;
/// displayName
@override@JsonKey(name: MusicAssistantPlayerQueue.displayNameKey_) final  String displayName;
/// available
@override@JsonKey(name: MusicAssistantPlayerQueue.availableKey_) final  bool available;
/// items
@override@JsonKey(name: MusicAssistantPlayerQueue.itemsKey_) final  int items;
/// shuffleEnabled
@override@JsonKey(name: MusicAssistantPlayerQueue.shuffleEnabledKey_) final  bool shuffleEnabled;
/// repeatMode
@override@JsonKey(name: MusicAssistantPlayerQueue.repeatModeKey_) final  MusicAssistantRepeatMode repeatMode;
/// crossfadeEnabled
@override@JsonKey(name: MusicAssistantPlayerQueue.crossfadeEnabledKey_) final  bool crossfadeEnabled;
/// autoplayEnabled
@override@JsonKey(name: MusicAssistantPlayerQueue.autoplayEnabledKey_) final  bool autoplayEnabled;
/// overlayEnabled
@override@JsonKey(name: MusicAssistantPlayerQueue.overlayEnabledKey_) final  bool overlayEnabled;
/// overlaySource
@override@JsonKey(name: MusicAssistantPlayerQueue.overlaySourceKey_) final  MusicAssistantItemMapping? overlaySource;
/// overlayVolume
@override@JsonKey(name: MusicAssistantPlayerQueue.overlayVolumeKey_) final  int overlayVolume;
/// smartFadesActive
@override@JsonKey(name: MusicAssistantPlayerQueue.smartFadesActiveKey_) final  bool smartFadesActive;
/// smartShuffleActive
@override@JsonKey(name: MusicAssistantPlayerQueue.smartShuffleActiveKey_) final  bool smartShuffleActive;
/// currentIndex
@override@JsonKey(name: MusicAssistantPlayerQueue.currentIndexKey_) final  int? currentIndex;
/// indexInBuffer
@override@JsonKey(name: MusicAssistantPlayerQueue.indexInBufferKey_) final  int? indexInBuffer;
/// ended
@override@JsonKey(name: MusicAssistantPlayerQueue.endedKey_) final  bool ended;
/// elapsedTime
@override@JsonKey(name: MusicAssistantPlayerQueue.elapsedTimeKey_) final  double elapsedTime;
/// elapsedTimeLastUpdated
@override@JsonKey(name: MusicAssistantPlayerQueue.elapsedTimeLastUpdatedKey_) final  double? elapsedTimeLastUpdated;
/// playbackSpeed
@override@JsonKey(name: MusicAssistantPlayerQueue.playbackSpeedKey_) final  double playbackSpeed;
/// state
@override@JsonKey(name: MusicAssistantPlayerQueue.stateKey_) final  MusicAssistantPlaybackState state;
/// currentItem
@override@JsonKey(name: MusicAssistantPlayerQueue.currentItemKey_) final  MusicAssistantQueueItem? currentItem;
/// nextItem
@override@JsonKey(name: MusicAssistantPlayerQueue.nextItemKey_) final  MusicAssistantQueueItem? nextItem;
/// sources
 final  List<MusicAssistantItemMapping>? _sources;
/// sources
@override@JsonKey(name: MusicAssistantPlayerQueue.sourcesKey_) List<MusicAssistantItemMapping>? get sources {
  final value = _sources;
  if (value == null) return null;
  if (_sources is EqualUnmodifiableListView) return _sources;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// flowMode
@override@JsonKey(name: MusicAssistantPlayerQueue.flowModeKey_) final  bool flowMode;
/// resumePos
@override@JsonKey(name: MusicAssistantPlayerQueue.resumePosKey_) final  int resumePos;
/// isDynamic
@override@JsonKey(name: MusicAssistantPlayerQueue.isDynamicKey_) final  bool isDynamic;
/// extraAttributes
 final  Map<String, String?>? _extraAttributes;
/// extraAttributes
@override@JsonKey(name: MusicAssistantPlayerQueue.extraAttributesKey_) Map<String, String?>? get extraAttributes {
  final value = _extraAttributes;
  if (value == null) return null;
  if (_extraAttributes is EqualUnmodifiableMapView) return _extraAttributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantPlayerQueue&&(identical(other.queueId, queueId) || other.queueId == queueId)&&(identical(other.active, active) || other.active == active)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.available, available) || other.available == available)&&(identical(other.items, items) || other.items == items)&&(identical(other.shuffleEnabled, shuffleEnabled) || other.shuffleEnabled == shuffleEnabled)&&(identical(other.repeatMode, repeatMode) || other.repeatMode == repeatMode)&&(identical(other.crossfadeEnabled, crossfadeEnabled) || other.crossfadeEnabled == crossfadeEnabled)&&(identical(other.autoplayEnabled, autoplayEnabled) || other.autoplayEnabled == autoplayEnabled)&&(identical(other.overlayEnabled, overlayEnabled) || other.overlayEnabled == overlayEnabled)&&(identical(other.overlaySource, overlaySource) || other.overlaySource == overlaySource)&&(identical(other.overlayVolume, overlayVolume) || other.overlayVolume == overlayVolume)&&(identical(other.smartFadesActive, smartFadesActive) || other.smartFadesActive == smartFadesActive)&&(identical(other.smartShuffleActive, smartShuffleActive) || other.smartShuffleActive == smartShuffleActive)&&(identical(other.currentIndex, currentIndex) || other.currentIndex == currentIndex)&&(identical(other.indexInBuffer, indexInBuffer) || other.indexInBuffer == indexInBuffer)&&(identical(other.ended, ended) || other.ended == ended)&&(identical(other.elapsedTime, elapsedTime) || other.elapsedTime == elapsedTime)&&(identical(other.elapsedTimeLastUpdated, elapsedTimeLastUpdated) || other.elapsedTimeLastUpdated == elapsedTimeLastUpdated)&&(identical(other.playbackSpeed, playbackSpeed) || other.playbackSpeed == playbackSpeed)&&(identical(other.state, state) || other.state == state)&&(identical(other.currentItem, currentItem) || other.currentItem == currentItem)&&(identical(other.nextItem, nextItem) || other.nextItem == nextItem)&&const DeepCollectionEquality().equals(other._sources, _sources)&&(identical(other.flowMode, flowMode) || other.flowMode == flowMode)&&(identical(other.resumePos, resumePos) || other.resumePos == resumePos)&&(identical(other.isDynamic, isDynamic) || other.isDynamic == isDynamic)&&const DeepCollectionEquality().equals(other._extraAttributes, _extraAttributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,queueId,active,displayName,available,items,shuffleEnabled,repeatMode,crossfadeEnabled,autoplayEnabled,overlayEnabled,overlaySource,overlayVolume,smartFadesActive,smartShuffleActive,currentIndex,indexInBuffer,ended,elapsedTime,elapsedTimeLastUpdated,playbackSpeed,state,currentItem,nextItem,const DeepCollectionEquality().hash(_sources),flowMode,resumePos,isDynamic,const DeepCollectionEquality().hash(_extraAttributes)]);

@override
String toString() {
  return 'MusicAssistantPlayerQueue(queueId: $queueId, active: $active, displayName: $displayName, available: $available, items: $items, shuffleEnabled: $shuffleEnabled, repeatMode: $repeatMode, crossfadeEnabled: $crossfadeEnabled, autoplayEnabled: $autoplayEnabled, overlayEnabled: $overlayEnabled, overlaySource: $overlaySource, overlayVolume: $overlayVolume, smartFadesActive: $smartFadesActive, smartShuffleActive: $smartShuffleActive, currentIndex: $currentIndex, indexInBuffer: $indexInBuffer, ended: $ended, elapsedTime: $elapsedTime, elapsedTimeLastUpdated: $elapsedTimeLastUpdated, playbackSpeed: $playbackSpeed, state: $state, currentItem: $currentItem, nextItem: $nextItem, sources: $sources, flowMode: $flowMode, resumePos: $resumePos, isDynamic: $isDynamic, extraAttributes: $extraAttributes)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantPlayerQueueCopyWith<$Res> implements $MusicAssistantPlayerQueueCopyWith<$Res> {
  factory _$MusicAssistantPlayerQueueCopyWith(_MusicAssistantPlayerQueue value, $Res Function(_MusicAssistantPlayerQueue) _then) = __$MusicAssistantPlayerQueueCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantPlayerQueue.queueIdKey_) String queueId,@JsonKey(name: MusicAssistantPlayerQueue.activeKey_) bool active,@JsonKey(name: MusicAssistantPlayerQueue.displayNameKey_) String displayName,@JsonKey(name: MusicAssistantPlayerQueue.availableKey_) bool available,@JsonKey(name: MusicAssistantPlayerQueue.itemsKey_) int items,@JsonKey(name: MusicAssistantPlayerQueue.shuffleEnabledKey_) bool shuffleEnabled,@JsonKey(name: MusicAssistantPlayerQueue.repeatModeKey_) MusicAssistantRepeatMode repeatMode,@JsonKey(name: MusicAssistantPlayerQueue.crossfadeEnabledKey_) bool crossfadeEnabled,@JsonKey(name: MusicAssistantPlayerQueue.autoplayEnabledKey_) bool autoplayEnabled,@JsonKey(name: MusicAssistantPlayerQueue.overlayEnabledKey_) bool overlayEnabled,@JsonKey(name: MusicAssistantPlayerQueue.overlaySourceKey_) MusicAssistantItemMapping? overlaySource,@JsonKey(name: MusicAssistantPlayerQueue.overlayVolumeKey_) int overlayVolume,@JsonKey(name: MusicAssistantPlayerQueue.smartFadesActiveKey_) bool smartFadesActive,@JsonKey(name: MusicAssistantPlayerQueue.smartShuffleActiveKey_) bool smartShuffleActive,@JsonKey(name: MusicAssistantPlayerQueue.currentIndexKey_) int? currentIndex,@JsonKey(name: MusicAssistantPlayerQueue.indexInBufferKey_) int? indexInBuffer,@JsonKey(name: MusicAssistantPlayerQueue.endedKey_) bool ended,@JsonKey(name: MusicAssistantPlayerQueue.elapsedTimeKey_) double elapsedTime,@JsonKey(name: MusicAssistantPlayerQueue.elapsedTimeLastUpdatedKey_) double? elapsedTimeLastUpdated,@JsonKey(name: MusicAssistantPlayerQueue.playbackSpeedKey_) double playbackSpeed,@JsonKey(name: MusicAssistantPlayerQueue.stateKey_) MusicAssistantPlaybackState state,@JsonKey(name: MusicAssistantPlayerQueue.currentItemKey_) MusicAssistantQueueItem? currentItem,@JsonKey(name: MusicAssistantPlayerQueue.nextItemKey_) MusicAssistantQueueItem? nextItem,@JsonKey(name: MusicAssistantPlayerQueue.sourcesKey_) List<MusicAssistantItemMapping>? sources,@JsonKey(name: MusicAssistantPlayerQueue.flowModeKey_) bool flowMode,@JsonKey(name: MusicAssistantPlayerQueue.resumePosKey_) int resumePos,@JsonKey(name: MusicAssistantPlayerQueue.isDynamicKey_) bool isDynamic,@JsonKey(name: MusicAssistantPlayerQueue.extraAttributesKey_) Map<String, String?>? extraAttributes
});


@override $MusicAssistantItemMappingCopyWith<$Res>? get overlaySource;@override $MusicAssistantQueueItemCopyWith<$Res>? get currentItem;@override $MusicAssistantQueueItemCopyWith<$Res>? get nextItem;

}
/// @nodoc
class __$MusicAssistantPlayerQueueCopyWithImpl<$Res>
    implements _$MusicAssistantPlayerQueueCopyWith<$Res> {
  __$MusicAssistantPlayerQueueCopyWithImpl(this._self, this._then);

  final _MusicAssistantPlayerQueue _self;
  final $Res Function(_MusicAssistantPlayerQueue) _then;

/// Create a copy of MusicAssistantPlayerQueue
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? queueId = null,Object? active = null,Object? displayName = null,Object? available = null,Object? items = null,Object? shuffleEnabled = null,Object? repeatMode = null,Object? crossfadeEnabled = null,Object? autoplayEnabled = null,Object? overlayEnabled = null,Object? overlaySource = freezed,Object? overlayVolume = null,Object? smartFadesActive = null,Object? smartShuffleActive = null,Object? currentIndex = freezed,Object? indexInBuffer = freezed,Object? ended = null,Object? elapsedTime = null,Object? elapsedTimeLastUpdated = freezed,Object? playbackSpeed = null,Object? state = null,Object? currentItem = freezed,Object? nextItem = freezed,Object? sources = freezed,Object? flowMode = null,Object? resumePos = null,Object? isDynamic = null,Object? extraAttributes = freezed,}) {
  return _then(_MusicAssistantPlayerQueue(
queueId: null == queueId ? _self.queueId : queueId // ignore: cast_nullable_to_non_nullable
as String,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as bool,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as int,shuffleEnabled: null == shuffleEnabled ? _self.shuffleEnabled : shuffleEnabled // ignore: cast_nullable_to_non_nullable
as bool,repeatMode: null == repeatMode ? _self.repeatMode : repeatMode // ignore: cast_nullable_to_non_nullable
as MusicAssistantRepeatMode,crossfadeEnabled: null == crossfadeEnabled ? _self.crossfadeEnabled : crossfadeEnabled // ignore: cast_nullable_to_non_nullable
as bool,autoplayEnabled: null == autoplayEnabled ? _self.autoplayEnabled : autoplayEnabled // ignore: cast_nullable_to_non_nullable
as bool,overlayEnabled: null == overlayEnabled ? _self.overlayEnabled : overlayEnabled // ignore: cast_nullable_to_non_nullable
as bool,overlaySource: freezed == overlaySource ? _self.overlaySource : overlaySource // ignore: cast_nullable_to_non_nullable
as MusicAssistantItemMapping?,overlayVolume: null == overlayVolume ? _self.overlayVolume : overlayVolume // ignore: cast_nullable_to_non_nullable
as int,smartFadesActive: null == smartFadesActive ? _self.smartFadesActive : smartFadesActive // ignore: cast_nullable_to_non_nullable
as bool,smartShuffleActive: null == smartShuffleActive ? _self.smartShuffleActive : smartShuffleActive // ignore: cast_nullable_to_non_nullable
as bool,currentIndex: freezed == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int?,indexInBuffer: freezed == indexInBuffer ? _self.indexInBuffer : indexInBuffer // ignore: cast_nullable_to_non_nullable
as int?,ended: null == ended ? _self.ended : ended // ignore: cast_nullable_to_non_nullable
as bool,elapsedTime: null == elapsedTime ? _self.elapsedTime : elapsedTime // ignore: cast_nullable_to_non_nullable
as double,elapsedTimeLastUpdated: freezed == elapsedTimeLastUpdated ? _self.elapsedTimeLastUpdated : elapsedTimeLastUpdated // ignore: cast_nullable_to_non_nullable
as double?,playbackSpeed: null == playbackSpeed ? _self.playbackSpeed : playbackSpeed // ignore: cast_nullable_to_non_nullable
as double,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as MusicAssistantPlaybackState,currentItem: freezed == currentItem ? _self.currentItem : currentItem // ignore: cast_nullable_to_non_nullable
as MusicAssistantQueueItem?,nextItem: freezed == nextItem ? _self.nextItem : nextItem // ignore: cast_nullable_to_non_nullable
as MusicAssistantQueueItem?,sources: freezed == sources ? _self._sources : sources // ignore: cast_nullable_to_non_nullable
as List<MusicAssistantItemMapping>?,flowMode: null == flowMode ? _self.flowMode : flowMode // ignore: cast_nullable_to_non_nullable
as bool,resumePos: null == resumePos ? _self.resumePos : resumePos // ignore: cast_nullable_to_non_nullable
as int,isDynamic: null == isDynamic ? _self.isDynamic : isDynamic // ignore: cast_nullable_to_non_nullable
as bool,extraAttributes: freezed == extraAttributes ? _self._extraAttributes : extraAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, String?>?,
  ));
}

/// Create a copy of MusicAssistantPlayerQueue
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantItemMappingCopyWith<$Res>? get overlaySource {
    if (_self.overlaySource == null) {
    return null;
  }

  return $MusicAssistantItemMappingCopyWith<$Res>(_self.overlaySource!, (value) {
    return _then(_self.copyWith(overlaySource: value));
  });
}/// Create a copy of MusicAssistantPlayerQueue
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
}/// Create a copy of MusicAssistantPlayerQueue
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantQueueItemCopyWith<$Res>? get nextItem {
    if (_self.nextItem == null) {
    return null;
  }

  return $MusicAssistantQueueItemCopyWith<$Res>(_self.nextItem!, (value) {
    return _then(_self.copyWith(nextItem: value));
  });
}
}

// dart format on
