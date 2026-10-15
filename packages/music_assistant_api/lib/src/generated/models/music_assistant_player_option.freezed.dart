// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_player_option.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantPlayerOption {

/// key
@JsonKey(name: MusicAssistantPlayerOption.keyKey_) String get key;/// name
@JsonKey(name: MusicAssistantPlayerOption.nameKey_) String get name;/// type
@JsonKey(name: MusicAssistantPlayerOption.typeKey_) MusicAssistantPlayerOptionType get type;/// translationKey
@JsonKey(name: MusicAssistantPlayerOption.translationKeyKey_) String get translationKey;/// translationParams
@JsonKey(name: MusicAssistantPlayerOption.translationParamsKey_) List<String>? get translationParams;/// value
@JsonKey(name: MusicAssistantPlayerOption.valueKey_) dynamic get value;/// readOnly
@JsonKey(name: MusicAssistantPlayerOption.readOnlyKey_) bool get readOnly;/// minValue
@JsonKey(name: MusicAssistantPlayerOption.minValueKey_) double? get minValue;/// maxValue
@JsonKey(name: MusicAssistantPlayerOption.maxValueKey_) double? get maxValue;/// step
@JsonKey(name: MusicAssistantPlayerOption.stepKey_) double? get step;/// options
@JsonKey(name: MusicAssistantPlayerOption.optionsKey_) List<MusicAssistantPlayerOptionEntry>? get options;
/// Create a copy of MusicAssistantPlayerOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantPlayerOptionCopyWith<MusicAssistantPlayerOption> get copyWith => _$MusicAssistantPlayerOptionCopyWithImpl<MusicAssistantPlayerOption>(this as MusicAssistantPlayerOption, _$identity);

  /// Serializes this MusicAssistantPlayerOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantPlayerOption&&(identical(other.key, key) || other.key == key)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.translationKey, translationKey) || other.translationKey == translationKey)&&const DeepCollectionEquality().equals(other.translationParams, translationParams)&&const DeepCollectionEquality().equals(other.value, value)&&(identical(other.readOnly, readOnly) || other.readOnly == readOnly)&&(identical(other.minValue, minValue) || other.minValue == minValue)&&(identical(other.maxValue, maxValue) || other.maxValue == maxValue)&&(identical(other.step, step) || other.step == step)&&const DeepCollectionEquality().equals(other.options, options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,name,type,translationKey,const DeepCollectionEquality().hash(translationParams),const DeepCollectionEquality().hash(value),readOnly,minValue,maxValue,step,const DeepCollectionEquality().hash(options));

@override
String toString() {
  return 'MusicAssistantPlayerOption(key: $key, name: $name, type: $type, translationKey: $translationKey, translationParams: $translationParams, value: $value, readOnly: $readOnly, minValue: $minValue, maxValue: $maxValue, step: $step, options: $options)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantPlayerOptionCopyWith<$Res>  {
  factory $MusicAssistantPlayerOptionCopyWith(MusicAssistantPlayerOption value, $Res Function(MusicAssistantPlayerOption) _then) = _$MusicAssistantPlayerOptionCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantPlayerOption.keyKey_) String key,@JsonKey(name: MusicAssistantPlayerOption.nameKey_) String name,@JsonKey(name: MusicAssistantPlayerOption.typeKey_) MusicAssistantPlayerOptionType type,@JsonKey(name: MusicAssistantPlayerOption.translationKeyKey_) String translationKey,@JsonKey(name: MusicAssistantPlayerOption.translationParamsKey_) List<String>? translationParams,@JsonKey(name: MusicAssistantPlayerOption.valueKey_) dynamic value,@JsonKey(name: MusicAssistantPlayerOption.readOnlyKey_) bool readOnly,@JsonKey(name: MusicAssistantPlayerOption.minValueKey_) double? minValue,@JsonKey(name: MusicAssistantPlayerOption.maxValueKey_) double? maxValue,@JsonKey(name: MusicAssistantPlayerOption.stepKey_) double? step,@JsonKey(name: MusicAssistantPlayerOption.optionsKey_) List<MusicAssistantPlayerOptionEntry>? options
});




}
/// @nodoc
class _$MusicAssistantPlayerOptionCopyWithImpl<$Res>
    implements $MusicAssistantPlayerOptionCopyWith<$Res> {
  _$MusicAssistantPlayerOptionCopyWithImpl(this._self, this._then);

  final MusicAssistantPlayerOption _self;
  final $Res Function(MusicAssistantPlayerOption) _then;

/// Create a copy of MusicAssistantPlayerOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? name = null,Object? type = null,Object? translationKey = null,Object? translationParams = freezed,Object? value = freezed,Object? readOnly = null,Object? minValue = freezed,Object? maxValue = freezed,Object? step = freezed,Object? options = freezed,}) {
  return _then(_self.copyWith(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MusicAssistantPlayerOptionType,translationKey: null == translationKey ? _self.translationKey : translationKey // ignore: cast_nullable_to_non_nullable
as String,translationParams: freezed == translationParams ? _self.translationParams : translationParams // ignore: cast_nullable_to_non_nullable
as List<String>?,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as dynamic,readOnly: null == readOnly ? _self.readOnly : readOnly // ignore: cast_nullable_to_non_nullable
as bool,minValue: freezed == minValue ? _self.minValue : minValue // ignore: cast_nullable_to_non_nullable
as double?,maxValue: freezed == maxValue ? _self.maxValue : maxValue // ignore: cast_nullable_to_non_nullable
as double?,step: freezed == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as double?,options: freezed == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<MusicAssistantPlayerOptionEntry>?,
  ));
}

}


/// Adds pattern-matching-related methods to [MusicAssistantPlayerOption].
extension MusicAssistantPlayerOptionPatterns on MusicAssistantPlayerOption {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantPlayerOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantPlayerOption() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantPlayerOption value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantPlayerOption():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantPlayerOption value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantPlayerOption() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantPlayerOption.keyKey_)  String key, @JsonKey(name: MusicAssistantPlayerOption.nameKey_)  String name, @JsonKey(name: MusicAssistantPlayerOption.typeKey_)  MusicAssistantPlayerOptionType type, @JsonKey(name: MusicAssistantPlayerOption.translationKeyKey_)  String translationKey, @JsonKey(name: MusicAssistantPlayerOption.translationParamsKey_)  List<String>? translationParams, @JsonKey(name: MusicAssistantPlayerOption.valueKey_)  dynamic value, @JsonKey(name: MusicAssistantPlayerOption.readOnlyKey_)  bool readOnly, @JsonKey(name: MusicAssistantPlayerOption.minValueKey_)  double? minValue, @JsonKey(name: MusicAssistantPlayerOption.maxValueKey_)  double? maxValue, @JsonKey(name: MusicAssistantPlayerOption.stepKey_)  double? step, @JsonKey(name: MusicAssistantPlayerOption.optionsKey_)  List<MusicAssistantPlayerOptionEntry>? options)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantPlayerOption() when $default != null:
return $default(_that.key,_that.name,_that.type,_that.translationKey,_that.translationParams,_that.value,_that.readOnly,_that.minValue,_that.maxValue,_that.step,_that.options);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantPlayerOption.keyKey_)  String key, @JsonKey(name: MusicAssistantPlayerOption.nameKey_)  String name, @JsonKey(name: MusicAssistantPlayerOption.typeKey_)  MusicAssistantPlayerOptionType type, @JsonKey(name: MusicAssistantPlayerOption.translationKeyKey_)  String translationKey, @JsonKey(name: MusicAssistantPlayerOption.translationParamsKey_)  List<String>? translationParams, @JsonKey(name: MusicAssistantPlayerOption.valueKey_)  dynamic value, @JsonKey(name: MusicAssistantPlayerOption.readOnlyKey_)  bool readOnly, @JsonKey(name: MusicAssistantPlayerOption.minValueKey_)  double? minValue, @JsonKey(name: MusicAssistantPlayerOption.maxValueKey_)  double? maxValue, @JsonKey(name: MusicAssistantPlayerOption.stepKey_)  double? step, @JsonKey(name: MusicAssistantPlayerOption.optionsKey_)  List<MusicAssistantPlayerOptionEntry>? options)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantPlayerOption():
return $default(_that.key,_that.name,_that.type,_that.translationKey,_that.translationParams,_that.value,_that.readOnly,_that.minValue,_that.maxValue,_that.step,_that.options);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantPlayerOption.keyKey_)  String key, @JsonKey(name: MusicAssistantPlayerOption.nameKey_)  String name, @JsonKey(name: MusicAssistantPlayerOption.typeKey_)  MusicAssistantPlayerOptionType type, @JsonKey(name: MusicAssistantPlayerOption.translationKeyKey_)  String translationKey, @JsonKey(name: MusicAssistantPlayerOption.translationParamsKey_)  List<String>? translationParams, @JsonKey(name: MusicAssistantPlayerOption.valueKey_)  dynamic value, @JsonKey(name: MusicAssistantPlayerOption.readOnlyKey_)  bool readOnly, @JsonKey(name: MusicAssistantPlayerOption.minValueKey_)  double? minValue, @JsonKey(name: MusicAssistantPlayerOption.maxValueKey_)  double? maxValue, @JsonKey(name: MusicAssistantPlayerOption.stepKey_)  double? step, @JsonKey(name: MusicAssistantPlayerOption.optionsKey_)  List<MusicAssistantPlayerOptionEntry>? options)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantPlayerOption() when $default != null:
return $default(_that.key,_that.name,_that.type,_that.translationKey,_that.translationParams,_that.value,_that.readOnly,_that.minValue,_that.maxValue,_that.step,_that.options);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantPlayerOption extends MusicAssistantPlayerOption {
  const _MusicAssistantPlayerOption({@JsonKey(name: MusicAssistantPlayerOption.keyKey_) required this.key, @JsonKey(name: MusicAssistantPlayerOption.nameKey_) required this.name, @JsonKey(name: MusicAssistantPlayerOption.typeKey_) required this.type, @JsonKey(name: MusicAssistantPlayerOption.translationKeyKey_) this.translationKey = '', @JsonKey(name: MusicAssistantPlayerOption.translationParamsKey_) final  List<String>? translationParams, @JsonKey(name: MusicAssistantPlayerOption.valueKey_) required this.value, @JsonKey(name: MusicAssistantPlayerOption.readOnlyKey_) this.readOnly = false, @JsonKey(name: MusicAssistantPlayerOption.minValueKey_) this.minValue, @JsonKey(name: MusicAssistantPlayerOption.maxValueKey_) this.maxValue, @JsonKey(name: MusicAssistantPlayerOption.stepKey_) this.step, @JsonKey(name: MusicAssistantPlayerOption.optionsKey_) final  List<MusicAssistantPlayerOptionEntry>? options}): _translationParams = translationParams,_options = options,super._();
  factory _MusicAssistantPlayerOption.fromJson(Map<String, dynamic> json) => _$MusicAssistantPlayerOptionFromJson(json);

/// key
@override@JsonKey(name: MusicAssistantPlayerOption.keyKey_) final  String key;
/// name
@override@JsonKey(name: MusicAssistantPlayerOption.nameKey_) final  String name;
/// type
@override@JsonKey(name: MusicAssistantPlayerOption.typeKey_) final  MusicAssistantPlayerOptionType type;
/// translationKey
@override@JsonKey(name: MusicAssistantPlayerOption.translationKeyKey_) final  String translationKey;
/// translationParams
 final  List<String>? _translationParams;
/// translationParams
@override@JsonKey(name: MusicAssistantPlayerOption.translationParamsKey_) List<String>? get translationParams {
  final value = _translationParams;
  if (value == null) return null;
  if (_translationParams is EqualUnmodifiableListView) return _translationParams;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// value
@override@JsonKey(name: MusicAssistantPlayerOption.valueKey_) final  dynamic value;
/// readOnly
@override@JsonKey(name: MusicAssistantPlayerOption.readOnlyKey_) final  bool readOnly;
/// minValue
@override@JsonKey(name: MusicAssistantPlayerOption.minValueKey_) final  double? minValue;
/// maxValue
@override@JsonKey(name: MusicAssistantPlayerOption.maxValueKey_) final  double? maxValue;
/// step
@override@JsonKey(name: MusicAssistantPlayerOption.stepKey_) final  double? step;
/// options
 final  List<MusicAssistantPlayerOptionEntry>? _options;
/// options
@override@JsonKey(name: MusicAssistantPlayerOption.optionsKey_) List<MusicAssistantPlayerOptionEntry>? get options {
  final value = _options;
  if (value == null) return null;
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of MusicAssistantPlayerOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantPlayerOptionCopyWith<_MusicAssistantPlayerOption> get copyWith => __$MusicAssistantPlayerOptionCopyWithImpl<_MusicAssistantPlayerOption>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantPlayerOptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantPlayerOption&&(identical(other.key, key) || other.key == key)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.translationKey, translationKey) || other.translationKey == translationKey)&&const DeepCollectionEquality().equals(other._translationParams, _translationParams)&&const DeepCollectionEquality().equals(other.value, value)&&(identical(other.readOnly, readOnly) || other.readOnly == readOnly)&&(identical(other.minValue, minValue) || other.minValue == minValue)&&(identical(other.maxValue, maxValue) || other.maxValue == maxValue)&&(identical(other.step, step) || other.step == step)&&const DeepCollectionEquality().equals(other._options, _options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,name,type,translationKey,const DeepCollectionEquality().hash(_translationParams),const DeepCollectionEquality().hash(value),readOnly,minValue,maxValue,step,const DeepCollectionEquality().hash(_options));

@override
String toString() {
  return 'MusicAssistantPlayerOption(key: $key, name: $name, type: $type, translationKey: $translationKey, translationParams: $translationParams, value: $value, readOnly: $readOnly, minValue: $minValue, maxValue: $maxValue, step: $step, options: $options)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantPlayerOptionCopyWith<$Res> implements $MusicAssistantPlayerOptionCopyWith<$Res> {
  factory _$MusicAssistantPlayerOptionCopyWith(_MusicAssistantPlayerOption value, $Res Function(_MusicAssistantPlayerOption) _then) = __$MusicAssistantPlayerOptionCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantPlayerOption.keyKey_) String key,@JsonKey(name: MusicAssistantPlayerOption.nameKey_) String name,@JsonKey(name: MusicAssistantPlayerOption.typeKey_) MusicAssistantPlayerOptionType type,@JsonKey(name: MusicAssistantPlayerOption.translationKeyKey_) String translationKey,@JsonKey(name: MusicAssistantPlayerOption.translationParamsKey_) List<String>? translationParams,@JsonKey(name: MusicAssistantPlayerOption.valueKey_) dynamic value,@JsonKey(name: MusicAssistantPlayerOption.readOnlyKey_) bool readOnly,@JsonKey(name: MusicAssistantPlayerOption.minValueKey_) double? minValue,@JsonKey(name: MusicAssistantPlayerOption.maxValueKey_) double? maxValue,@JsonKey(name: MusicAssistantPlayerOption.stepKey_) double? step,@JsonKey(name: MusicAssistantPlayerOption.optionsKey_) List<MusicAssistantPlayerOptionEntry>? options
});




}
/// @nodoc
class __$MusicAssistantPlayerOptionCopyWithImpl<$Res>
    implements _$MusicAssistantPlayerOptionCopyWith<$Res> {
  __$MusicAssistantPlayerOptionCopyWithImpl(this._self, this._then);

  final _MusicAssistantPlayerOption _self;
  final $Res Function(_MusicAssistantPlayerOption) _then;

/// Create a copy of MusicAssistantPlayerOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? name = null,Object? type = null,Object? translationKey = null,Object? translationParams = freezed,Object? value = freezed,Object? readOnly = null,Object? minValue = freezed,Object? maxValue = freezed,Object? step = freezed,Object? options = freezed,}) {
  return _then(_MusicAssistantPlayerOption(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MusicAssistantPlayerOptionType,translationKey: null == translationKey ? _self.translationKey : translationKey // ignore: cast_nullable_to_non_nullable
as String,translationParams: freezed == translationParams ? _self._translationParams : translationParams // ignore: cast_nullable_to_non_nullable
as List<String>?,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as dynamic,readOnly: null == readOnly ? _self.readOnly : readOnly // ignore: cast_nullable_to_non_nullable
as bool,minValue: freezed == minValue ? _self.minValue : minValue // ignore: cast_nullable_to_non_nullable
as double?,maxValue: freezed == maxValue ? _self.maxValue : maxValue // ignore: cast_nullable_to_non_nullable
as double?,step: freezed == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as double?,options: freezed == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<MusicAssistantPlayerOptionEntry>?,
  ));
}


}

// dart format on
