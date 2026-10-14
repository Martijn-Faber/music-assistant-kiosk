// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_media_item_palette.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantMediaItemPalette {

/// primary
@JsonKey(name: MusicAssistantMediaItemPalette.primaryKey_) List<int>? get primary;/// backgroundLight
@JsonKey(name: MusicAssistantMediaItemPalette.backgroundLightKey_) List<int>? get backgroundLight;/// onLight
@JsonKey(name: MusicAssistantMediaItemPalette.onLightKey_) List<int>? get onLight;/// backgroundDark
@JsonKey(name: MusicAssistantMediaItemPalette.backgroundDarkKey_) List<int>? get backgroundDark;/// onDark
@JsonKey(name: MusicAssistantMediaItemPalette.onDarkKey_) List<int>? get onDark;/// accent
@JsonKey(name: MusicAssistantMediaItemPalette.accentKey_) List<int>? get accent;
/// Create a copy of MusicAssistantMediaItemPalette
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantMediaItemPaletteCopyWith<MusicAssistantMediaItemPalette> get copyWith => _$MusicAssistantMediaItemPaletteCopyWithImpl<MusicAssistantMediaItemPalette>(this as MusicAssistantMediaItemPalette, _$identity);

  /// Serializes this MusicAssistantMediaItemPalette to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantMediaItemPalette&&const DeepCollectionEquality().equals(other.primary, primary)&&const DeepCollectionEquality().equals(other.backgroundLight, backgroundLight)&&const DeepCollectionEquality().equals(other.onLight, onLight)&&const DeepCollectionEquality().equals(other.backgroundDark, backgroundDark)&&const DeepCollectionEquality().equals(other.onDark, onDark)&&const DeepCollectionEquality().equals(other.accent, accent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(primary),const DeepCollectionEquality().hash(backgroundLight),const DeepCollectionEquality().hash(onLight),const DeepCollectionEquality().hash(backgroundDark),const DeepCollectionEquality().hash(onDark),const DeepCollectionEquality().hash(accent));

@override
String toString() {
  return 'MusicAssistantMediaItemPalette(primary: $primary, backgroundLight: $backgroundLight, onLight: $onLight, backgroundDark: $backgroundDark, onDark: $onDark, accent: $accent)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantMediaItemPaletteCopyWith<$Res>  {
  factory $MusicAssistantMediaItemPaletteCopyWith(MusicAssistantMediaItemPalette value, $Res Function(MusicAssistantMediaItemPalette) _then) = _$MusicAssistantMediaItemPaletteCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantMediaItemPalette.primaryKey_) List<int>? primary,@JsonKey(name: MusicAssistantMediaItemPalette.backgroundLightKey_) List<int>? backgroundLight,@JsonKey(name: MusicAssistantMediaItemPalette.onLightKey_) List<int>? onLight,@JsonKey(name: MusicAssistantMediaItemPalette.backgroundDarkKey_) List<int>? backgroundDark,@JsonKey(name: MusicAssistantMediaItemPalette.onDarkKey_) List<int>? onDark,@JsonKey(name: MusicAssistantMediaItemPalette.accentKey_) List<int>? accent
});




}
/// @nodoc
class _$MusicAssistantMediaItemPaletteCopyWithImpl<$Res>
    implements $MusicAssistantMediaItemPaletteCopyWith<$Res> {
  _$MusicAssistantMediaItemPaletteCopyWithImpl(this._self, this._then);

  final MusicAssistantMediaItemPalette _self;
  final $Res Function(MusicAssistantMediaItemPalette) _then;

/// Create a copy of MusicAssistantMediaItemPalette
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? primary = freezed,Object? backgroundLight = freezed,Object? onLight = freezed,Object? backgroundDark = freezed,Object? onDark = freezed,Object? accent = freezed,}) {
  return _then(_self.copyWith(
primary: freezed == primary ? _self.primary : primary // ignore: cast_nullable_to_non_nullable
as List<int>?,backgroundLight: freezed == backgroundLight ? _self.backgroundLight : backgroundLight // ignore: cast_nullable_to_non_nullable
as List<int>?,onLight: freezed == onLight ? _self.onLight : onLight // ignore: cast_nullable_to_non_nullable
as List<int>?,backgroundDark: freezed == backgroundDark ? _self.backgroundDark : backgroundDark // ignore: cast_nullable_to_non_nullable
as List<int>?,onDark: freezed == onDark ? _self.onDark : onDark // ignore: cast_nullable_to_non_nullable
as List<int>?,accent: freezed == accent ? _self.accent : accent // ignore: cast_nullable_to_non_nullable
as List<int>?,
  ));
}

}


/// Adds pattern-matching-related methods to [MusicAssistantMediaItemPalette].
extension MusicAssistantMediaItemPalettePatterns on MusicAssistantMediaItemPalette {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantMediaItemPalette value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantMediaItemPalette() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantMediaItemPalette value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantMediaItemPalette():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantMediaItemPalette value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantMediaItemPalette() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantMediaItemPalette.primaryKey_)  List<int>? primary, @JsonKey(name: MusicAssistantMediaItemPalette.backgroundLightKey_)  List<int>? backgroundLight, @JsonKey(name: MusicAssistantMediaItemPalette.onLightKey_)  List<int>? onLight, @JsonKey(name: MusicAssistantMediaItemPalette.backgroundDarkKey_)  List<int>? backgroundDark, @JsonKey(name: MusicAssistantMediaItemPalette.onDarkKey_)  List<int>? onDark, @JsonKey(name: MusicAssistantMediaItemPalette.accentKey_)  List<int>? accent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantMediaItemPalette() when $default != null:
return $default(_that.primary,_that.backgroundLight,_that.onLight,_that.backgroundDark,_that.onDark,_that.accent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantMediaItemPalette.primaryKey_)  List<int>? primary, @JsonKey(name: MusicAssistantMediaItemPalette.backgroundLightKey_)  List<int>? backgroundLight, @JsonKey(name: MusicAssistantMediaItemPalette.onLightKey_)  List<int>? onLight, @JsonKey(name: MusicAssistantMediaItemPalette.backgroundDarkKey_)  List<int>? backgroundDark, @JsonKey(name: MusicAssistantMediaItemPalette.onDarkKey_)  List<int>? onDark, @JsonKey(name: MusicAssistantMediaItemPalette.accentKey_)  List<int>? accent)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantMediaItemPalette():
return $default(_that.primary,_that.backgroundLight,_that.onLight,_that.backgroundDark,_that.onDark,_that.accent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantMediaItemPalette.primaryKey_)  List<int>? primary, @JsonKey(name: MusicAssistantMediaItemPalette.backgroundLightKey_)  List<int>? backgroundLight, @JsonKey(name: MusicAssistantMediaItemPalette.onLightKey_)  List<int>? onLight, @JsonKey(name: MusicAssistantMediaItemPalette.backgroundDarkKey_)  List<int>? backgroundDark, @JsonKey(name: MusicAssistantMediaItemPalette.onDarkKey_)  List<int>? onDark, @JsonKey(name: MusicAssistantMediaItemPalette.accentKey_)  List<int>? accent)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantMediaItemPalette() when $default != null:
return $default(_that.primary,_that.backgroundLight,_that.onLight,_that.backgroundDark,_that.onDark,_that.accent);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantMediaItemPalette extends MusicAssistantMediaItemPalette {
  const _MusicAssistantMediaItemPalette({@JsonKey(name: MusicAssistantMediaItemPalette.primaryKey_) final  List<int>? primary, @JsonKey(name: MusicAssistantMediaItemPalette.backgroundLightKey_) final  List<int>? backgroundLight, @JsonKey(name: MusicAssistantMediaItemPalette.onLightKey_) final  List<int>? onLight, @JsonKey(name: MusicAssistantMediaItemPalette.backgroundDarkKey_) final  List<int>? backgroundDark, @JsonKey(name: MusicAssistantMediaItemPalette.onDarkKey_) final  List<int>? onDark, @JsonKey(name: MusicAssistantMediaItemPalette.accentKey_) final  List<int>? accent}): _primary = primary,_backgroundLight = backgroundLight,_onLight = onLight,_backgroundDark = backgroundDark,_onDark = onDark,_accent = accent,super._();
  factory _MusicAssistantMediaItemPalette.fromJson(Map<String, dynamic> json) => _$MusicAssistantMediaItemPaletteFromJson(json);

/// primary
 final  List<int>? _primary;
/// primary
@override@JsonKey(name: MusicAssistantMediaItemPalette.primaryKey_) List<int>? get primary {
  final value = _primary;
  if (value == null) return null;
  if (_primary is EqualUnmodifiableListView) return _primary;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// backgroundLight
 final  List<int>? _backgroundLight;
/// backgroundLight
@override@JsonKey(name: MusicAssistantMediaItemPalette.backgroundLightKey_) List<int>? get backgroundLight {
  final value = _backgroundLight;
  if (value == null) return null;
  if (_backgroundLight is EqualUnmodifiableListView) return _backgroundLight;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// onLight
 final  List<int>? _onLight;
/// onLight
@override@JsonKey(name: MusicAssistantMediaItemPalette.onLightKey_) List<int>? get onLight {
  final value = _onLight;
  if (value == null) return null;
  if (_onLight is EqualUnmodifiableListView) return _onLight;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// backgroundDark
 final  List<int>? _backgroundDark;
/// backgroundDark
@override@JsonKey(name: MusicAssistantMediaItemPalette.backgroundDarkKey_) List<int>? get backgroundDark {
  final value = _backgroundDark;
  if (value == null) return null;
  if (_backgroundDark is EqualUnmodifiableListView) return _backgroundDark;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// onDark
 final  List<int>? _onDark;
/// onDark
@override@JsonKey(name: MusicAssistantMediaItemPalette.onDarkKey_) List<int>? get onDark {
  final value = _onDark;
  if (value == null) return null;
  if (_onDark is EqualUnmodifiableListView) return _onDark;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// accent
 final  List<int>? _accent;
/// accent
@override@JsonKey(name: MusicAssistantMediaItemPalette.accentKey_) List<int>? get accent {
  final value = _accent;
  if (value == null) return null;
  if (_accent is EqualUnmodifiableListView) return _accent;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of MusicAssistantMediaItemPalette
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantMediaItemPaletteCopyWith<_MusicAssistantMediaItemPalette> get copyWith => __$MusicAssistantMediaItemPaletteCopyWithImpl<_MusicAssistantMediaItemPalette>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantMediaItemPaletteToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantMediaItemPalette&&const DeepCollectionEquality().equals(other._primary, _primary)&&const DeepCollectionEquality().equals(other._backgroundLight, _backgroundLight)&&const DeepCollectionEquality().equals(other._onLight, _onLight)&&const DeepCollectionEquality().equals(other._backgroundDark, _backgroundDark)&&const DeepCollectionEquality().equals(other._onDark, _onDark)&&const DeepCollectionEquality().equals(other._accent, _accent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_primary),const DeepCollectionEquality().hash(_backgroundLight),const DeepCollectionEquality().hash(_onLight),const DeepCollectionEquality().hash(_backgroundDark),const DeepCollectionEquality().hash(_onDark),const DeepCollectionEquality().hash(_accent));

@override
String toString() {
  return 'MusicAssistantMediaItemPalette(primary: $primary, backgroundLight: $backgroundLight, onLight: $onLight, backgroundDark: $backgroundDark, onDark: $onDark, accent: $accent)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantMediaItemPaletteCopyWith<$Res> implements $MusicAssistantMediaItemPaletteCopyWith<$Res> {
  factory _$MusicAssistantMediaItemPaletteCopyWith(_MusicAssistantMediaItemPalette value, $Res Function(_MusicAssistantMediaItemPalette) _then) = __$MusicAssistantMediaItemPaletteCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantMediaItemPalette.primaryKey_) List<int>? primary,@JsonKey(name: MusicAssistantMediaItemPalette.backgroundLightKey_) List<int>? backgroundLight,@JsonKey(name: MusicAssistantMediaItemPalette.onLightKey_) List<int>? onLight,@JsonKey(name: MusicAssistantMediaItemPalette.backgroundDarkKey_) List<int>? backgroundDark,@JsonKey(name: MusicAssistantMediaItemPalette.onDarkKey_) List<int>? onDark,@JsonKey(name: MusicAssistantMediaItemPalette.accentKey_) List<int>? accent
});




}
/// @nodoc
class __$MusicAssistantMediaItemPaletteCopyWithImpl<$Res>
    implements _$MusicAssistantMediaItemPaletteCopyWith<$Res> {
  __$MusicAssistantMediaItemPaletteCopyWithImpl(this._self, this._then);

  final _MusicAssistantMediaItemPalette _self;
  final $Res Function(_MusicAssistantMediaItemPalette) _then;

/// Create a copy of MusicAssistantMediaItemPalette
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? primary = freezed,Object? backgroundLight = freezed,Object? onLight = freezed,Object? backgroundDark = freezed,Object? onDark = freezed,Object? accent = freezed,}) {
  return _then(_MusicAssistantMediaItemPalette(
primary: freezed == primary ? _self._primary : primary // ignore: cast_nullable_to_non_nullable
as List<int>?,backgroundLight: freezed == backgroundLight ? _self._backgroundLight : backgroundLight // ignore: cast_nullable_to_non_nullable
as List<int>?,onLight: freezed == onLight ? _self._onLight : onLight // ignore: cast_nullable_to_non_nullable
as List<int>?,backgroundDark: freezed == backgroundDark ? _self._backgroundDark : backgroundDark // ignore: cast_nullable_to_non_nullable
as List<int>?,onDark: freezed == onDark ? _self._onDark : onDark // ignore: cast_nullable_to_non_nullable
as List<int>?,accent: freezed == accent ? _self._accent : accent // ignore: cast_nullable_to_non_nullable
as List<int>?,
  ));
}


}

// dart format on
