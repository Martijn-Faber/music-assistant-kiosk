// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_balance_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantBalanceFilter {

/// enabled
@JsonKey(name: MusicAssistantBalanceFilter.enabledKey_) bool get enabled;/// type
@JsonKey(name: MusicAssistantBalanceFilter.typeKey_) MusicAssistantBalanceFilterType get type;/// balance
@JsonKey(name: MusicAssistantBalanceFilter.balanceKey_) double get balance;
/// Create a copy of MusicAssistantBalanceFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantBalanceFilterCopyWith<MusicAssistantBalanceFilter> get copyWith => _$MusicAssistantBalanceFilterCopyWithImpl<MusicAssistantBalanceFilter>(this as MusicAssistantBalanceFilter, _$identity);

  /// Serializes this MusicAssistantBalanceFilter to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantBalanceFilter&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.type, type) || other.type == type)&&(identical(other.balance, balance) || other.balance == balance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enabled,type,balance);

@override
String toString() {
  return 'MusicAssistantBalanceFilter(enabled: $enabled, type: $type, balance: $balance)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantBalanceFilterCopyWith<$Res>  {
  factory $MusicAssistantBalanceFilterCopyWith(MusicAssistantBalanceFilter value, $Res Function(MusicAssistantBalanceFilter) _then) = _$MusicAssistantBalanceFilterCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantBalanceFilter.enabledKey_) bool enabled,@JsonKey(name: MusicAssistantBalanceFilter.typeKey_) MusicAssistantBalanceFilterType type,@JsonKey(name: MusicAssistantBalanceFilter.balanceKey_) double balance
});




}
/// @nodoc
class _$MusicAssistantBalanceFilterCopyWithImpl<$Res>
    implements $MusicAssistantBalanceFilterCopyWith<$Res> {
  _$MusicAssistantBalanceFilterCopyWithImpl(this._self, this._then);

  final MusicAssistantBalanceFilter _self;
  final $Res Function(MusicAssistantBalanceFilter) _then;

/// Create a copy of MusicAssistantBalanceFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enabled = null,Object? type = null,Object? balance = null,}) {
  return _then(_self.copyWith(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MusicAssistantBalanceFilterType,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [MusicAssistantBalanceFilter].
extension MusicAssistantBalanceFilterPatterns on MusicAssistantBalanceFilter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantBalanceFilter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantBalanceFilter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantBalanceFilter value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantBalanceFilter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantBalanceFilter value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantBalanceFilter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantBalanceFilter.enabledKey_)  bool enabled, @JsonKey(name: MusicAssistantBalanceFilter.typeKey_)  MusicAssistantBalanceFilterType type, @JsonKey(name: MusicAssistantBalanceFilter.balanceKey_)  double balance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantBalanceFilter() when $default != null:
return $default(_that.enabled,_that.type,_that.balance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantBalanceFilter.enabledKey_)  bool enabled, @JsonKey(name: MusicAssistantBalanceFilter.typeKey_)  MusicAssistantBalanceFilterType type, @JsonKey(name: MusicAssistantBalanceFilter.balanceKey_)  double balance)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantBalanceFilter():
return $default(_that.enabled,_that.type,_that.balance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantBalanceFilter.enabledKey_)  bool enabled, @JsonKey(name: MusicAssistantBalanceFilter.typeKey_)  MusicAssistantBalanceFilterType type, @JsonKey(name: MusicAssistantBalanceFilter.balanceKey_)  double balance)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantBalanceFilter() when $default != null:
return $default(_that.enabled,_that.type,_that.balance);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantBalanceFilter extends MusicAssistantBalanceFilter {
  const _MusicAssistantBalanceFilter({@JsonKey(name: MusicAssistantBalanceFilter.enabledKey_) required this.enabled, @JsonKey(name: MusicAssistantBalanceFilter.typeKey_) this.type = MusicAssistantBalanceFilterType.balance, @JsonKey(name: MusicAssistantBalanceFilter.balanceKey_) this.balance = 0.0}): super._();
  factory _MusicAssistantBalanceFilter.fromJson(Map<String, dynamic> json) => _$MusicAssistantBalanceFilterFromJson(json);

/// enabled
@override@JsonKey(name: MusicAssistantBalanceFilter.enabledKey_) final  bool enabled;
/// type
@override@JsonKey(name: MusicAssistantBalanceFilter.typeKey_) final  MusicAssistantBalanceFilterType type;
/// balance
@override@JsonKey(name: MusicAssistantBalanceFilter.balanceKey_) final  double balance;

/// Create a copy of MusicAssistantBalanceFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantBalanceFilterCopyWith<_MusicAssistantBalanceFilter> get copyWith => __$MusicAssistantBalanceFilterCopyWithImpl<_MusicAssistantBalanceFilter>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantBalanceFilterToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantBalanceFilter&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.type, type) || other.type == type)&&(identical(other.balance, balance) || other.balance == balance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enabled,type,balance);

@override
String toString() {
  return 'MusicAssistantBalanceFilter(enabled: $enabled, type: $type, balance: $balance)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantBalanceFilterCopyWith<$Res> implements $MusicAssistantBalanceFilterCopyWith<$Res> {
  factory _$MusicAssistantBalanceFilterCopyWith(_MusicAssistantBalanceFilter value, $Res Function(_MusicAssistantBalanceFilter) _then) = __$MusicAssistantBalanceFilterCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantBalanceFilter.enabledKey_) bool enabled,@JsonKey(name: MusicAssistantBalanceFilter.typeKey_) MusicAssistantBalanceFilterType type,@JsonKey(name: MusicAssistantBalanceFilter.balanceKey_) double balance
});




}
/// @nodoc
class __$MusicAssistantBalanceFilterCopyWithImpl<$Res>
    implements _$MusicAssistantBalanceFilterCopyWith<$Res> {
  __$MusicAssistantBalanceFilterCopyWithImpl(this._self, this._then);

  final _MusicAssistantBalanceFilter _self;
  final $Res Function(_MusicAssistantBalanceFilter) _then;

/// Create a copy of MusicAssistantBalanceFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enabled = null,Object? type = null,Object? balance = null,}) {
  return _then(_MusicAssistantBalanceFilter(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MusicAssistantBalanceFilterType,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
