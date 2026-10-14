// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_queue_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantQueueItem {

/// streamdetails
@JsonKey(name: MusicAssistantQueueItem.streamdetailsKey_) MusicAssistantStreamDetails? get streamdetails;/// index
@JsonKey(name: MusicAssistantQueueItem.indexKey_) int get index;/// image
@JsonKey(name: MusicAssistantQueueItem.imageKey_) MusicAssistantMediaItemImage? get image;/// mediaItem
@JsonKey(name: MusicAssistantQueueItem.mediaItemKey_) MusicAssistantTrack? get mediaItem;/// sortIndex
@JsonKey(name: MusicAssistantQueueItem.sortIndexKey_) int get sortIndex;/// name
@JsonKey(name: MusicAssistantQueueItem.nameKey_) String get name;/// duration
@JsonKey(name: MusicAssistantQueueItem.durationKey_) int? get duration;/// queueItemId
@JsonKey(name: MusicAssistantQueueItem.queueItemIdKey_) String get queueItemId;/// queueId
@JsonKey(name: MusicAssistantQueueItem.queueIdKey_) String get queueId;
/// Create a copy of MusicAssistantQueueItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantQueueItemCopyWith<MusicAssistantQueueItem> get copyWith => _$MusicAssistantQueueItemCopyWithImpl<MusicAssistantQueueItem>(this as MusicAssistantQueueItem, _$identity);

  /// Serializes this MusicAssistantQueueItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantQueueItem&&(identical(other.streamdetails, streamdetails) || other.streamdetails == streamdetails)&&(identical(other.index, index) || other.index == index)&&(identical(other.image, image) || other.image == image)&&(identical(other.mediaItem, mediaItem) || other.mediaItem == mediaItem)&&(identical(other.sortIndex, sortIndex) || other.sortIndex == sortIndex)&&(identical(other.name, name) || other.name == name)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.queueItemId, queueItemId) || other.queueItemId == queueItemId)&&(identical(other.queueId, queueId) || other.queueId == queueId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,streamdetails,index,image,mediaItem,sortIndex,name,duration,queueItemId,queueId);

@override
String toString() {
  return 'MusicAssistantQueueItem(streamdetails: $streamdetails, index: $index, image: $image, mediaItem: $mediaItem, sortIndex: $sortIndex, name: $name, duration: $duration, queueItemId: $queueItemId, queueId: $queueId)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantQueueItemCopyWith<$Res>  {
  factory $MusicAssistantQueueItemCopyWith(MusicAssistantQueueItem value, $Res Function(MusicAssistantQueueItem) _then) = _$MusicAssistantQueueItemCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantQueueItem.streamdetailsKey_) MusicAssistantStreamDetails? streamdetails,@JsonKey(name: MusicAssistantQueueItem.indexKey_) int index,@JsonKey(name: MusicAssistantQueueItem.imageKey_) MusicAssistantMediaItemImage? image,@JsonKey(name: MusicAssistantQueueItem.mediaItemKey_) MusicAssistantTrack? mediaItem,@JsonKey(name: MusicAssistantQueueItem.sortIndexKey_) int sortIndex,@JsonKey(name: MusicAssistantQueueItem.nameKey_) String name,@JsonKey(name: MusicAssistantQueueItem.durationKey_) int? duration,@JsonKey(name: MusicAssistantQueueItem.queueItemIdKey_) String queueItemId,@JsonKey(name: MusicAssistantQueueItem.queueIdKey_) String queueId
});


$MusicAssistantStreamDetailsCopyWith<$Res>? get streamdetails;$MusicAssistantMediaItemImageCopyWith<$Res>? get image;$MusicAssistantTrackCopyWith<$Res>? get mediaItem;

}
/// @nodoc
class _$MusicAssistantQueueItemCopyWithImpl<$Res>
    implements $MusicAssistantQueueItemCopyWith<$Res> {
  _$MusicAssistantQueueItemCopyWithImpl(this._self, this._then);

  final MusicAssistantQueueItem _self;
  final $Res Function(MusicAssistantQueueItem) _then;

/// Create a copy of MusicAssistantQueueItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? streamdetails = freezed,Object? index = null,Object? image = freezed,Object? mediaItem = freezed,Object? sortIndex = null,Object? name = null,Object? duration = freezed,Object? queueItemId = null,Object? queueId = null,}) {
  return _then(_self.copyWith(
streamdetails: freezed == streamdetails ? _self.streamdetails : streamdetails // ignore: cast_nullable_to_non_nullable
as MusicAssistantStreamDetails?,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as MusicAssistantMediaItemImage?,mediaItem: freezed == mediaItem ? _self.mediaItem : mediaItem // ignore: cast_nullable_to_non_nullable
as MusicAssistantTrack?,sortIndex: null == sortIndex ? _self.sortIndex : sortIndex // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int?,queueItemId: null == queueItemId ? _self.queueItemId : queueItemId // ignore: cast_nullable_to_non_nullable
as String,queueId: null == queueId ? _self.queueId : queueId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of MusicAssistantQueueItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantStreamDetailsCopyWith<$Res>? get streamdetails {
    if (_self.streamdetails == null) {
    return null;
  }

  return $MusicAssistantStreamDetailsCopyWith<$Res>(_self.streamdetails!, (value) {
    return _then(_self.copyWith(streamdetails: value));
  });
}/// Create a copy of MusicAssistantQueueItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantMediaItemImageCopyWith<$Res>? get image {
    if (_self.image == null) {
    return null;
  }

  return $MusicAssistantMediaItemImageCopyWith<$Res>(_self.image!, (value) {
    return _then(_self.copyWith(image: value));
  });
}/// Create a copy of MusicAssistantQueueItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantTrackCopyWith<$Res>? get mediaItem {
    if (_self.mediaItem == null) {
    return null;
  }

  return $MusicAssistantTrackCopyWith<$Res>(_self.mediaItem!, (value) {
    return _then(_self.copyWith(mediaItem: value));
  });
}
}


/// Adds pattern-matching-related methods to [MusicAssistantQueueItem].
extension MusicAssistantQueueItemPatterns on MusicAssistantQueueItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantQueueItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantQueueItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantQueueItem value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantQueueItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantQueueItem value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantQueueItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantQueueItem.streamdetailsKey_)  MusicAssistantStreamDetails? streamdetails, @JsonKey(name: MusicAssistantQueueItem.indexKey_)  int index, @JsonKey(name: MusicAssistantQueueItem.imageKey_)  MusicAssistantMediaItemImage? image, @JsonKey(name: MusicAssistantQueueItem.mediaItemKey_)  MusicAssistantTrack? mediaItem, @JsonKey(name: MusicAssistantQueueItem.sortIndexKey_)  int sortIndex, @JsonKey(name: MusicAssistantQueueItem.nameKey_)  String name, @JsonKey(name: MusicAssistantQueueItem.durationKey_)  int? duration, @JsonKey(name: MusicAssistantQueueItem.queueItemIdKey_)  String queueItemId, @JsonKey(name: MusicAssistantQueueItem.queueIdKey_)  String queueId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantQueueItem() when $default != null:
return $default(_that.streamdetails,_that.index,_that.image,_that.mediaItem,_that.sortIndex,_that.name,_that.duration,_that.queueItemId,_that.queueId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantQueueItem.streamdetailsKey_)  MusicAssistantStreamDetails? streamdetails, @JsonKey(name: MusicAssistantQueueItem.indexKey_)  int index, @JsonKey(name: MusicAssistantQueueItem.imageKey_)  MusicAssistantMediaItemImage? image, @JsonKey(name: MusicAssistantQueueItem.mediaItemKey_)  MusicAssistantTrack? mediaItem, @JsonKey(name: MusicAssistantQueueItem.sortIndexKey_)  int sortIndex, @JsonKey(name: MusicAssistantQueueItem.nameKey_)  String name, @JsonKey(name: MusicAssistantQueueItem.durationKey_)  int? duration, @JsonKey(name: MusicAssistantQueueItem.queueItemIdKey_)  String queueItemId, @JsonKey(name: MusicAssistantQueueItem.queueIdKey_)  String queueId)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantQueueItem():
return $default(_that.streamdetails,_that.index,_that.image,_that.mediaItem,_that.sortIndex,_that.name,_that.duration,_that.queueItemId,_that.queueId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantQueueItem.streamdetailsKey_)  MusicAssistantStreamDetails? streamdetails, @JsonKey(name: MusicAssistantQueueItem.indexKey_)  int index, @JsonKey(name: MusicAssistantQueueItem.imageKey_)  MusicAssistantMediaItemImage? image, @JsonKey(name: MusicAssistantQueueItem.mediaItemKey_)  MusicAssistantTrack? mediaItem, @JsonKey(name: MusicAssistantQueueItem.sortIndexKey_)  int sortIndex, @JsonKey(name: MusicAssistantQueueItem.nameKey_)  String name, @JsonKey(name: MusicAssistantQueueItem.durationKey_)  int? duration, @JsonKey(name: MusicAssistantQueueItem.queueItemIdKey_)  String queueItemId, @JsonKey(name: MusicAssistantQueueItem.queueIdKey_)  String queueId)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantQueueItem() when $default != null:
return $default(_that.streamdetails,_that.index,_that.image,_that.mediaItem,_that.sortIndex,_that.name,_that.duration,_that.queueItemId,_that.queueId);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantQueueItem extends MusicAssistantQueueItem {
  const _MusicAssistantQueueItem({@JsonKey(name: MusicAssistantQueueItem.streamdetailsKey_) this.streamdetails, @JsonKey(name: MusicAssistantQueueItem.indexKey_) this.index = 0, @JsonKey(name: MusicAssistantQueueItem.imageKey_) this.image, @JsonKey(name: MusicAssistantQueueItem.mediaItemKey_) this.mediaItem, @JsonKey(name: MusicAssistantQueueItem.sortIndexKey_) this.sortIndex = 0, @JsonKey(name: MusicAssistantQueueItem.nameKey_) required this.name, @JsonKey(name: MusicAssistantQueueItem.durationKey_) this.duration, @JsonKey(name: MusicAssistantQueueItem.queueItemIdKey_) required this.queueItemId, @JsonKey(name: MusicAssistantQueueItem.queueIdKey_) required this.queueId}): super._();
  factory _MusicAssistantQueueItem.fromJson(Map<String, dynamic> json) => _$MusicAssistantQueueItemFromJson(json);

/// streamdetails
@override@JsonKey(name: MusicAssistantQueueItem.streamdetailsKey_) final  MusicAssistantStreamDetails? streamdetails;
/// index
@override@JsonKey(name: MusicAssistantQueueItem.indexKey_) final  int index;
/// image
@override@JsonKey(name: MusicAssistantQueueItem.imageKey_) final  MusicAssistantMediaItemImage? image;
/// mediaItem
@override@JsonKey(name: MusicAssistantQueueItem.mediaItemKey_) final  MusicAssistantTrack? mediaItem;
/// sortIndex
@override@JsonKey(name: MusicAssistantQueueItem.sortIndexKey_) final  int sortIndex;
/// name
@override@JsonKey(name: MusicAssistantQueueItem.nameKey_) final  String name;
/// duration
@override@JsonKey(name: MusicAssistantQueueItem.durationKey_) final  int? duration;
/// queueItemId
@override@JsonKey(name: MusicAssistantQueueItem.queueItemIdKey_) final  String queueItemId;
/// queueId
@override@JsonKey(name: MusicAssistantQueueItem.queueIdKey_) final  String queueId;

/// Create a copy of MusicAssistantQueueItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantQueueItemCopyWith<_MusicAssistantQueueItem> get copyWith => __$MusicAssistantQueueItemCopyWithImpl<_MusicAssistantQueueItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantQueueItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantQueueItem&&(identical(other.streamdetails, streamdetails) || other.streamdetails == streamdetails)&&(identical(other.index, index) || other.index == index)&&(identical(other.image, image) || other.image == image)&&(identical(other.mediaItem, mediaItem) || other.mediaItem == mediaItem)&&(identical(other.sortIndex, sortIndex) || other.sortIndex == sortIndex)&&(identical(other.name, name) || other.name == name)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.queueItemId, queueItemId) || other.queueItemId == queueItemId)&&(identical(other.queueId, queueId) || other.queueId == queueId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,streamdetails,index,image,mediaItem,sortIndex,name,duration,queueItemId,queueId);

@override
String toString() {
  return 'MusicAssistantQueueItem(streamdetails: $streamdetails, index: $index, image: $image, mediaItem: $mediaItem, sortIndex: $sortIndex, name: $name, duration: $duration, queueItemId: $queueItemId, queueId: $queueId)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantQueueItemCopyWith<$Res> implements $MusicAssistantQueueItemCopyWith<$Res> {
  factory _$MusicAssistantQueueItemCopyWith(_MusicAssistantQueueItem value, $Res Function(_MusicAssistantQueueItem) _then) = __$MusicAssistantQueueItemCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantQueueItem.streamdetailsKey_) MusicAssistantStreamDetails? streamdetails,@JsonKey(name: MusicAssistantQueueItem.indexKey_) int index,@JsonKey(name: MusicAssistantQueueItem.imageKey_) MusicAssistantMediaItemImage? image,@JsonKey(name: MusicAssistantQueueItem.mediaItemKey_) MusicAssistantTrack? mediaItem,@JsonKey(name: MusicAssistantQueueItem.sortIndexKey_) int sortIndex,@JsonKey(name: MusicAssistantQueueItem.nameKey_) String name,@JsonKey(name: MusicAssistantQueueItem.durationKey_) int? duration,@JsonKey(name: MusicAssistantQueueItem.queueItemIdKey_) String queueItemId,@JsonKey(name: MusicAssistantQueueItem.queueIdKey_) String queueId
});


@override $MusicAssistantStreamDetailsCopyWith<$Res>? get streamdetails;@override $MusicAssistantMediaItemImageCopyWith<$Res>? get image;@override $MusicAssistantTrackCopyWith<$Res>? get mediaItem;

}
/// @nodoc
class __$MusicAssistantQueueItemCopyWithImpl<$Res>
    implements _$MusicAssistantQueueItemCopyWith<$Res> {
  __$MusicAssistantQueueItemCopyWithImpl(this._self, this._then);

  final _MusicAssistantQueueItem _self;
  final $Res Function(_MusicAssistantQueueItem) _then;

/// Create a copy of MusicAssistantQueueItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? streamdetails = freezed,Object? index = null,Object? image = freezed,Object? mediaItem = freezed,Object? sortIndex = null,Object? name = null,Object? duration = freezed,Object? queueItemId = null,Object? queueId = null,}) {
  return _then(_MusicAssistantQueueItem(
streamdetails: freezed == streamdetails ? _self.streamdetails : streamdetails // ignore: cast_nullable_to_non_nullable
as MusicAssistantStreamDetails?,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as MusicAssistantMediaItemImage?,mediaItem: freezed == mediaItem ? _self.mediaItem : mediaItem // ignore: cast_nullable_to_non_nullable
as MusicAssistantTrack?,sortIndex: null == sortIndex ? _self.sortIndex : sortIndex // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int?,queueItemId: null == queueItemId ? _self.queueItemId : queueItemId // ignore: cast_nullable_to_non_nullable
as String,queueId: null == queueId ? _self.queueId : queueId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of MusicAssistantQueueItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantStreamDetailsCopyWith<$Res>? get streamdetails {
    if (_self.streamdetails == null) {
    return null;
  }

  return $MusicAssistantStreamDetailsCopyWith<$Res>(_self.streamdetails!, (value) {
    return _then(_self.copyWith(streamdetails: value));
  });
}/// Create a copy of MusicAssistantQueueItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantMediaItemImageCopyWith<$Res>? get image {
    if (_self.image == null) {
    return null;
  }

  return $MusicAssistantMediaItemImageCopyWith<$Res>(_self.image!, (value) {
    return _then(_self.copyWith(image: value));
  });
}/// Create a copy of MusicAssistantQueueItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantTrackCopyWith<$Res>? get mediaItem {
    if (_self.mediaItem == null) {
    return null;
  }

  return $MusicAssistantTrackCopyWith<$Res>(_self.mediaItem!, (value) {
    return _then(_self.copyWith(mediaItem: value));
  });
}
}

// dart format on
