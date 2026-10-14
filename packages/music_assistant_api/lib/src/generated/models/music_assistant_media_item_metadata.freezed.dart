// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_media_item_metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantMediaItemMetadata {

/// images
@JsonKey(name: MusicAssistantMediaItemMetadata.imagesKey_) List<MusicAssistantMediaItemImage>? get images;/// description
@JsonKey(name: MusicAssistantMediaItemMetadata.descriptionKey_) String? get description;
/// Create a copy of MusicAssistantMediaItemMetadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantMediaItemMetadataCopyWith<MusicAssistantMediaItemMetadata> get copyWith => _$MusicAssistantMediaItemMetadataCopyWithImpl<MusicAssistantMediaItemMetadata>(this as MusicAssistantMediaItemMetadata, _$identity);

  /// Serializes this MusicAssistantMediaItemMetadata to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantMediaItemMetadata&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(images),description);

@override
String toString() {
  return 'MusicAssistantMediaItemMetadata(images: $images, description: $description)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantMediaItemMetadataCopyWith<$Res>  {
  factory $MusicAssistantMediaItemMetadataCopyWith(MusicAssistantMediaItemMetadata value, $Res Function(MusicAssistantMediaItemMetadata) _then) = _$MusicAssistantMediaItemMetadataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantMediaItemMetadata.imagesKey_) List<MusicAssistantMediaItemImage>? images,@JsonKey(name: MusicAssistantMediaItemMetadata.descriptionKey_) String? description
});




}
/// @nodoc
class _$MusicAssistantMediaItemMetadataCopyWithImpl<$Res>
    implements $MusicAssistantMediaItemMetadataCopyWith<$Res> {
  _$MusicAssistantMediaItemMetadataCopyWithImpl(this._self, this._then);

  final MusicAssistantMediaItemMetadata _self;
  final $Res Function(MusicAssistantMediaItemMetadata) _then;

/// Create a copy of MusicAssistantMediaItemMetadata
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? images = freezed,Object? description = freezed,}) {
  return _then(_self.copyWith(
images: freezed == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<MusicAssistantMediaItemImage>?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MusicAssistantMediaItemMetadata].
extension MusicAssistantMediaItemMetadataPatterns on MusicAssistantMediaItemMetadata {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantMediaItemMetadata value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantMediaItemMetadata() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantMediaItemMetadata value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantMediaItemMetadata():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantMediaItemMetadata value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantMediaItemMetadata() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantMediaItemMetadata.imagesKey_)  List<MusicAssistantMediaItemImage>? images, @JsonKey(name: MusicAssistantMediaItemMetadata.descriptionKey_)  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantMediaItemMetadata() when $default != null:
return $default(_that.images,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantMediaItemMetadata.imagesKey_)  List<MusicAssistantMediaItemImage>? images, @JsonKey(name: MusicAssistantMediaItemMetadata.descriptionKey_)  String? description)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantMediaItemMetadata():
return $default(_that.images,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantMediaItemMetadata.imagesKey_)  List<MusicAssistantMediaItemImage>? images, @JsonKey(name: MusicAssistantMediaItemMetadata.descriptionKey_)  String? description)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantMediaItemMetadata() when $default != null:
return $default(_that.images,_that.description);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantMediaItemMetadata extends MusicAssistantMediaItemMetadata {
  const _MusicAssistantMediaItemMetadata({@JsonKey(name: MusicAssistantMediaItemMetadata.imagesKey_) final  List<MusicAssistantMediaItemImage>? images, @JsonKey(name: MusicAssistantMediaItemMetadata.descriptionKey_) this.description}): _images = images,super._();
  factory _MusicAssistantMediaItemMetadata.fromJson(Map<String, dynamic> json) => _$MusicAssistantMediaItemMetadataFromJson(json);

/// images
 final  List<MusicAssistantMediaItemImage>? _images;
/// images
@override@JsonKey(name: MusicAssistantMediaItemMetadata.imagesKey_) List<MusicAssistantMediaItemImage>? get images {
  final value = _images;
  if (value == null) return null;
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// description
@override@JsonKey(name: MusicAssistantMediaItemMetadata.descriptionKey_) final  String? description;

/// Create a copy of MusicAssistantMediaItemMetadata
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantMediaItemMetadataCopyWith<_MusicAssistantMediaItemMetadata> get copyWith => __$MusicAssistantMediaItemMetadataCopyWithImpl<_MusicAssistantMediaItemMetadata>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantMediaItemMetadataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantMediaItemMetadata&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_images),description);

@override
String toString() {
  return 'MusicAssistantMediaItemMetadata(images: $images, description: $description)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantMediaItemMetadataCopyWith<$Res> implements $MusicAssistantMediaItemMetadataCopyWith<$Res> {
  factory _$MusicAssistantMediaItemMetadataCopyWith(_MusicAssistantMediaItemMetadata value, $Res Function(_MusicAssistantMediaItemMetadata) _then) = __$MusicAssistantMediaItemMetadataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantMediaItemMetadata.imagesKey_) List<MusicAssistantMediaItemImage>? images,@JsonKey(name: MusicAssistantMediaItemMetadata.descriptionKey_) String? description
});




}
/// @nodoc
class __$MusicAssistantMediaItemMetadataCopyWithImpl<$Res>
    implements _$MusicAssistantMediaItemMetadataCopyWith<$Res> {
  __$MusicAssistantMediaItemMetadataCopyWithImpl(this._self, this._then);

  final _MusicAssistantMediaItemMetadata _self;
  final $Res Function(_MusicAssistantMediaItemMetadata) _then;

/// Create a copy of MusicAssistantMediaItemMetadata
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? images = freezed,Object? description = freezed,}) {
  return _then(_MusicAssistantMediaItemMetadata(
images: freezed == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<MusicAssistantMediaItemImage>?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
