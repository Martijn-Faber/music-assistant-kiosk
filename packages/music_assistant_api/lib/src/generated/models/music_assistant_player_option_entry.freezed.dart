// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_player_option_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantPlayerOptionEntry {

/// key
@JsonKey(name: MusicAssistantPlayerOptionEntry.keyKey_) String get key;/// name
@JsonKey(name: MusicAssistantPlayerOptionEntry.nameKey_) String get name;/// type
@JsonKey(name: MusicAssistantPlayerOptionEntry.typeKey_) MusicAssistantPlayerOptionType get type;/// value
@JsonKey(name: MusicAssistantPlayerOptionEntry.valueKey_) dynamic get value;/// translationKey
@JsonKey(name: MusicAssistantPlayerOptionEntry.translationKeyKey_) String get translationKey;
/// Create a copy of MusicAssistantPlayerOptionEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantPlayerOptionEntryCopyWith<MusicAssistantPlayerOptionEntry> get copyWith => _$MusicAssistantPlayerOptionEntryCopyWithImpl<MusicAssistantPlayerOptionEntry>(this as MusicAssistantPlayerOptionEntry, _$identity);

  /// Serializes this MusicAssistantPlayerOptionEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantPlayerOptionEntry&&(identical(other.key, key) || other.key == key)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.value, value)&&(identical(other.translationKey, translationKey) || other.translationKey == translationKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,name,type,const DeepCollectionEquality().hash(value),translationKey);

@override
String toString() {
  return 'MusicAssistantPlayerOptionEntry(key: $key, name: $name, type: $type, value: $value, translationKey: $translationKey)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantPlayerOptionEntryCopyWith<$Res>  {
  factory $MusicAssistantPlayerOptionEntryCopyWith(MusicAssistantPlayerOptionEntry value, $Res Function(MusicAssistantPlayerOptionEntry) _then) = _$MusicAssistantPlayerOptionEntryCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantPlayerOptionEntry.keyKey_) String key,@JsonKey(name: MusicAssistantPlayerOptionEntry.nameKey_) String name,@JsonKey(name: MusicAssistantPlayerOptionEntry.typeKey_) MusicAssistantPlayerOptionType type,@JsonKey(name: MusicAssistantPlayerOptionEntry.valueKey_) dynamic value,@JsonKey(name: MusicAssistantPlayerOptionEntry.translationKeyKey_) String translationKey
});




}
/// @nodoc
class _$MusicAssistantPlayerOptionEntryCopyWithImpl<$Res>
    implements $MusicAssistantPlayerOptionEntryCopyWith<$Res> {
  _$MusicAssistantPlayerOptionEntryCopyWithImpl(this._self, this._then);

  final MusicAssistantPlayerOptionEntry _self;
  final $Res Function(MusicAssistantPlayerOptionEntry) _then;

/// Create a copy of MusicAssistantPlayerOptionEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? name = null,Object? type = null,Object? value = freezed,Object? translationKey = null,}) {
  return _then(_self.copyWith(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MusicAssistantPlayerOptionType,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as dynamic,translationKey: null == translationKey ? _self.translationKey : translationKey // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MusicAssistantPlayerOptionEntry].
extension MusicAssistantPlayerOptionEntryPatterns on MusicAssistantPlayerOptionEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantPlayerOptionEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantPlayerOptionEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantPlayerOptionEntry value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantPlayerOptionEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantPlayerOptionEntry value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantPlayerOptionEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantPlayerOptionEntry.keyKey_)  String key, @JsonKey(name: MusicAssistantPlayerOptionEntry.nameKey_)  String name, @JsonKey(name: MusicAssistantPlayerOptionEntry.typeKey_)  MusicAssistantPlayerOptionType type, @JsonKey(name: MusicAssistantPlayerOptionEntry.valueKey_)  dynamic value, @JsonKey(name: MusicAssistantPlayerOptionEntry.translationKeyKey_)  String translationKey)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantPlayerOptionEntry() when $default != null:
return $default(_that.key,_that.name,_that.type,_that.value,_that.translationKey);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantPlayerOptionEntry.keyKey_)  String key, @JsonKey(name: MusicAssistantPlayerOptionEntry.nameKey_)  String name, @JsonKey(name: MusicAssistantPlayerOptionEntry.typeKey_)  MusicAssistantPlayerOptionType type, @JsonKey(name: MusicAssistantPlayerOptionEntry.valueKey_)  dynamic value, @JsonKey(name: MusicAssistantPlayerOptionEntry.translationKeyKey_)  String translationKey)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantPlayerOptionEntry():
return $default(_that.key,_that.name,_that.type,_that.value,_that.translationKey);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantPlayerOptionEntry.keyKey_)  String key, @JsonKey(name: MusicAssistantPlayerOptionEntry.nameKey_)  String name, @JsonKey(name: MusicAssistantPlayerOptionEntry.typeKey_)  MusicAssistantPlayerOptionType type, @JsonKey(name: MusicAssistantPlayerOptionEntry.valueKey_)  dynamic value, @JsonKey(name: MusicAssistantPlayerOptionEntry.translationKeyKey_)  String translationKey)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantPlayerOptionEntry() when $default != null:
return $default(_that.key,_that.name,_that.type,_that.value,_that.translationKey);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantPlayerOptionEntry extends MusicAssistantPlayerOptionEntry {
  const _MusicAssistantPlayerOptionEntry({@JsonKey(name: MusicAssistantPlayerOptionEntry.keyKey_) required this.key, @JsonKey(name: MusicAssistantPlayerOptionEntry.nameKey_) required this.name, @JsonKey(name: MusicAssistantPlayerOptionEntry.typeKey_) required this.type, @JsonKey(name: MusicAssistantPlayerOptionEntry.valueKey_) required this.value, @JsonKey(name: MusicAssistantPlayerOptionEntry.translationKeyKey_) this.translationKey = ''}): super._();
  factory _MusicAssistantPlayerOptionEntry.fromJson(Map<String, dynamic> json) => _$MusicAssistantPlayerOptionEntryFromJson(json);

/// key
@override@JsonKey(name: MusicAssistantPlayerOptionEntry.keyKey_) final  String key;
/// name
@override@JsonKey(name: MusicAssistantPlayerOptionEntry.nameKey_) final  String name;
/// type
@override@JsonKey(name: MusicAssistantPlayerOptionEntry.typeKey_) final  MusicAssistantPlayerOptionType type;
/// value
@override@JsonKey(name: MusicAssistantPlayerOptionEntry.valueKey_) final  dynamic value;
/// translationKey
@override@JsonKey(name: MusicAssistantPlayerOptionEntry.translationKeyKey_) final  String translationKey;

/// Create a copy of MusicAssistantPlayerOptionEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantPlayerOptionEntryCopyWith<_MusicAssistantPlayerOptionEntry> get copyWith => __$MusicAssistantPlayerOptionEntryCopyWithImpl<_MusicAssistantPlayerOptionEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantPlayerOptionEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantPlayerOptionEntry&&(identical(other.key, key) || other.key == key)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.value, value)&&(identical(other.translationKey, translationKey) || other.translationKey == translationKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,name,type,const DeepCollectionEquality().hash(value),translationKey);

@override
String toString() {
  return 'MusicAssistantPlayerOptionEntry(key: $key, name: $name, type: $type, value: $value, translationKey: $translationKey)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantPlayerOptionEntryCopyWith<$Res> implements $MusicAssistantPlayerOptionEntryCopyWith<$Res> {
  factory _$MusicAssistantPlayerOptionEntryCopyWith(_MusicAssistantPlayerOptionEntry value, $Res Function(_MusicAssistantPlayerOptionEntry) _then) = __$MusicAssistantPlayerOptionEntryCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantPlayerOptionEntry.keyKey_) String key,@JsonKey(name: MusicAssistantPlayerOptionEntry.nameKey_) String name,@JsonKey(name: MusicAssistantPlayerOptionEntry.typeKey_) MusicAssistantPlayerOptionType type,@JsonKey(name: MusicAssistantPlayerOptionEntry.valueKey_) dynamic value,@JsonKey(name: MusicAssistantPlayerOptionEntry.translationKeyKey_) String translationKey
});




}
/// @nodoc
class __$MusicAssistantPlayerOptionEntryCopyWithImpl<$Res>
    implements _$MusicAssistantPlayerOptionEntryCopyWith<$Res> {
  __$MusicAssistantPlayerOptionEntryCopyWithImpl(this._self, this._then);

  final _MusicAssistantPlayerOptionEntry _self;
  final $Res Function(_MusicAssistantPlayerOptionEntry) _then;

/// Create a copy of MusicAssistantPlayerOptionEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? name = null,Object? type = null,Object? value = freezed,Object? translationKey = null,}) {
  return _then(_MusicAssistantPlayerOptionEntry(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MusicAssistantPlayerOptionType,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as dynamic,translationKey: null == translationKey ? _self.translationKey : translationKey // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
