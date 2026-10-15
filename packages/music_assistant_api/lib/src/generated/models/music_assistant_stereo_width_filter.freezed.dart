// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_stereo_width_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantStereoWidthFilter {

/// enabled
@JsonKey(name: MusicAssistantStereoWidthFilter.enabledKey_) bool get enabled;/// type
@JsonKey(name: MusicAssistantStereoWidthFilter.typeKey_) MusicAssistantStereoWidthFilterType get type;/// width
@JsonKey(name: MusicAssistantStereoWidthFilter.widthKey_) double get width;
/// Create a copy of MusicAssistantStereoWidthFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantStereoWidthFilterCopyWith<MusicAssistantStereoWidthFilter> get copyWith => _$MusicAssistantStereoWidthFilterCopyWithImpl<MusicAssistantStereoWidthFilter>(this as MusicAssistantStereoWidthFilter, _$identity);

  /// Serializes this MusicAssistantStereoWidthFilter to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantStereoWidthFilter&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.type, type) || other.type == type)&&(identical(other.width, width) || other.width == width));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enabled,type,width);

@override
String toString() {
  return 'MusicAssistantStereoWidthFilter(enabled: $enabled, type: $type, width: $width)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantStereoWidthFilterCopyWith<$Res>  {
  factory $MusicAssistantStereoWidthFilterCopyWith(MusicAssistantStereoWidthFilter value, $Res Function(MusicAssistantStereoWidthFilter) _then) = _$MusicAssistantStereoWidthFilterCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantStereoWidthFilter.enabledKey_) bool enabled,@JsonKey(name: MusicAssistantStereoWidthFilter.typeKey_) MusicAssistantStereoWidthFilterType type,@JsonKey(name: MusicAssistantStereoWidthFilter.widthKey_) double width
});




}
/// @nodoc
class _$MusicAssistantStereoWidthFilterCopyWithImpl<$Res>
    implements $MusicAssistantStereoWidthFilterCopyWith<$Res> {
  _$MusicAssistantStereoWidthFilterCopyWithImpl(this._self, this._then);

  final MusicAssistantStereoWidthFilter _self;
  final $Res Function(MusicAssistantStereoWidthFilter) _then;

/// Create a copy of MusicAssistantStereoWidthFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enabled = null,Object? type = null,Object? width = null,}) {
  return _then(_self.copyWith(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MusicAssistantStereoWidthFilterType,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [MusicAssistantStereoWidthFilter].
extension MusicAssistantStereoWidthFilterPatterns on MusicAssistantStereoWidthFilter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantStereoWidthFilter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantStereoWidthFilter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantStereoWidthFilter value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantStereoWidthFilter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantStereoWidthFilter value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantStereoWidthFilter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantStereoWidthFilter.enabledKey_)  bool enabled, @JsonKey(name: MusicAssistantStereoWidthFilter.typeKey_)  MusicAssistantStereoWidthFilterType type, @JsonKey(name: MusicAssistantStereoWidthFilter.widthKey_)  double width)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantStereoWidthFilter() when $default != null:
return $default(_that.enabled,_that.type,_that.width);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantStereoWidthFilter.enabledKey_)  bool enabled, @JsonKey(name: MusicAssistantStereoWidthFilter.typeKey_)  MusicAssistantStereoWidthFilterType type, @JsonKey(name: MusicAssistantStereoWidthFilter.widthKey_)  double width)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantStereoWidthFilter():
return $default(_that.enabled,_that.type,_that.width);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantStereoWidthFilter.enabledKey_)  bool enabled, @JsonKey(name: MusicAssistantStereoWidthFilter.typeKey_)  MusicAssistantStereoWidthFilterType type, @JsonKey(name: MusicAssistantStereoWidthFilter.widthKey_)  double width)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantStereoWidthFilter() when $default != null:
return $default(_that.enabled,_that.type,_that.width);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantStereoWidthFilter extends MusicAssistantStereoWidthFilter {
  const _MusicAssistantStereoWidthFilter({@JsonKey(name: MusicAssistantStereoWidthFilter.enabledKey_) required this.enabled, @JsonKey(name: MusicAssistantStereoWidthFilter.typeKey_) this.type = MusicAssistantStereoWidthFilterType.stereoWidth, @JsonKey(name: MusicAssistantStereoWidthFilter.widthKey_) this.width = 1.0}): super._();
  factory _MusicAssistantStereoWidthFilter.fromJson(Map<String, dynamic> json) => _$MusicAssistantStereoWidthFilterFromJson(json);

/// enabled
@override@JsonKey(name: MusicAssistantStereoWidthFilter.enabledKey_) final  bool enabled;
/// type
@override@JsonKey(name: MusicAssistantStereoWidthFilter.typeKey_) final  MusicAssistantStereoWidthFilterType type;
/// width
@override@JsonKey(name: MusicAssistantStereoWidthFilter.widthKey_) final  double width;

/// Create a copy of MusicAssistantStereoWidthFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantStereoWidthFilterCopyWith<_MusicAssistantStereoWidthFilter> get copyWith => __$MusicAssistantStereoWidthFilterCopyWithImpl<_MusicAssistantStereoWidthFilter>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantStereoWidthFilterToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantStereoWidthFilter&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.type, type) || other.type == type)&&(identical(other.width, width) || other.width == width));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enabled,type,width);

@override
String toString() {
  return 'MusicAssistantStereoWidthFilter(enabled: $enabled, type: $type, width: $width)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantStereoWidthFilterCopyWith<$Res> implements $MusicAssistantStereoWidthFilterCopyWith<$Res> {
  factory _$MusicAssistantStereoWidthFilterCopyWith(_MusicAssistantStereoWidthFilter value, $Res Function(_MusicAssistantStereoWidthFilter) _then) = __$MusicAssistantStereoWidthFilterCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantStereoWidthFilter.enabledKey_) bool enabled,@JsonKey(name: MusicAssistantStereoWidthFilter.typeKey_) MusicAssistantStereoWidthFilterType type,@JsonKey(name: MusicAssistantStereoWidthFilter.widthKey_) double width
});




}
/// @nodoc
class __$MusicAssistantStereoWidthFilterCopyWithImpl<$Res>
    implements _$MusicAssistantStereoWidthFilterCopyWith<$Res> {
  __$MusicAssistantStereoWidthFilterCopyWithImpl(this._self, this._then);

  final _MusicAssistantStereoWidthFilter _self;
  final $Res Function(_MusicAssistantStereoWidthFilter) _then;

/// Create a copy of MusicAssistantStereoWidthFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enabled = null,Object? type = null,Object? width = null,}) {
  return _then(_MusicAssistantStereoWidthFilter(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MusicAssistantStereoWidthFilterType,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
