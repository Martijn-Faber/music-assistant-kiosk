// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_audio_processing_chain.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantAudioProcessingChain {

/// inputFidelity
@JsonKey(name: MusicAssistantAudioProcessingChain.inputFidelityKey_) MusicAssistantAudioFidelity? get inputFidelity;/// queueProcessing
@JsonKey(name: MusicAssistantAudioProcessingChain.queueProcessingKey_) MusicAssistantAudioQueueProcessing? get queueProcessing;/// outputs
@JsonKey(name: MusicAssistantAudioProcessingChain.outputsKey_) List<MusicAssistantAudioOutputDetails>? get outputs;
/// Create a copy of MusicAssistantAudioProcessingChain
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantAudioProcessingChainCopyWith<MusicAssistantAudioProcessingChain> get copyWith => _$MusicAssistantAudioProcessingChainCopyWithImpl<MusicAssistantAudioProcessingChain>(this as MusicAssistantAudioProcessingChain, _$identity);

  /// Serializes this MusicAssistantAudioProcessingChain to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantAudioProcessingChain&&(identical(other.inputFidelity, inputFidelity) || other.inputFidelity == inputFidelity)&&(identical(other.queueProcessing, queueProcessing) || other.queueProcessing == queueProcessing)&&const DeepCollectionEquality().equals(other.outputs, outputs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,inputFidelity,queueProcessing,const DeepCollectionEquality().hash(outputs));

@override
String toString() {
  return 'MusicAssistantAudioProcessingChain(inputFidelity: $inputFidelity, queueProcessing: $queueProcessing, outputs: $outputs)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantAudioProcessingChainCopyWith<$Res>  {
  factory $MusicAssistantAudioProcessingChainCopyWith(MusicAssistantAudioProcessingChain value, $Res Function(MusicAssistantAudioProcessingChain) _then) = _$MusicAssistantAudioProcessingChainCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantAudioProcessingChain.inputFidelityKey_) MusicAssistantAudioFidelity? inputFidelity,@JsonKey(name: MusicAssistantAudioProcessingChain.queueProcessingKey_) MusicAssistantAudioQueueProcessing? queueProcessing,@JsonKey(name: MusicAssistantAudioProcessingChain.outputsKey_) List<MusicAssistantAudioOutputDetails>? outputs
});


$MusicAssistantAudioFidelityCopyWith<$Res>? get inputFidelity;$MusicAssistantAudioQueueProcessingCopyWith<$Res>? get queueProcessing;

}
/// @nodoc
class _$MusicAssistantAudioProcessingChainCopyWithImpl<$Res>
    implements $MusicAssistantAudioProcessingChainCopyWith<$Res> {
  _$MusicAssistantAudioProcessingChainCopyWithImpl(this._self, this._then);

  final MusicAssistantAudioProcessingChain _self;
  final $Res Function(MusicAssistantAudioProcessingChain) _then;

/// Create a copy of MusicAssistantAudioProcessingChain
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? inputFidelity = freezed,Object? queueProcessing = freezed,Object? outputs = freezed,}) {
  return _then(_self.copyWith(
inputFidelity: freezed == inputFidelity ? _self.inputFidelity : inputFidelity // ignore: cast_nullable_to_non_nullable
as MusicAssistantAudioFidelity?,queueProcessing: freezed == queueProcessing ? _self.queueProcessing : queueProcessing // ignore: cast_nullable_to_non_nullable
as MusicAssistantAudioQueueProcessing?,outputs: freezed == outputs ? _self.outputs : outputs // ignore: cast_nullable_to_non_nullable
as List<MusicAssistantAudioOutputDetails>?,
  ));
}
/// Create a copy of MusicAssistantAudioProcessingChain
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantAudioFidelityCopyWith<$Res>? get inputFidelity {
    if (_self.inputFidelity == null) {
    return null;
  }

  return $MusicAssistantAudioFidelityCopyWith<$Res>(_self.inputFidelity!, (value) {
    return _then(_self.copyWith(inputFidelity: value));
  });
}/// Create a copy of MusicAssistantAudioProcessingChain
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantAudioQueueProcessingCopyWith<$Res>? get queueProcessing {
    if (_self.queueProcessing == null) {
    return null;
  }

  return $MusicAssistantAudioQueueProcessingCopyWith<$Res>(_self.queueProcessing!, (value) {
    return _then(_self.copyWith(queueProcessing: value));
  });
}
}


/// Adds pattern-matching-related methods to [MusicAssistantAudioProcessingChain].
extension MusicAssistantAudioProcessingChainPatterns on MusicAssistantAudioProcessingChain {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantAudioProcessingChain value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantAudioProcessingChain() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantAudioProcessingChain value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantAudioProcessingChain():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantAudioProcessingChain value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantAudioProcessingChain() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantAudioProcessingChain.inputFidelityKey_)  MusicAssistantAudioFidelity? inputFidelity, @JsonKey(name: MusicAssistantAudioProcessingChain.queueProcessingKey_)  MusicAssistantAudioQueueProcessing? queueProcessing, @JsonKey(name: MusicAssistantAudioProcessingChain.outputsKey_)  List<MusicAssistantAudioOutputDetails>? outputs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantAudioProcessingChain() when $default != null:
return $default(_that.inputFidelity,_that.queueProcessing,_that.outputs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantAudioProcessingChain.inputFidelityKey_)  MusicAssistantAudioFidelity? inputFidelity, @JsonKey(name: MusicAssistantAudioProcessingChain.queueProcessingKey_)  MusicAssistantAudioQueueProcessing? queueProcessing, @JsonKey(name: MusicAssistantAudioProcessingChain.outputsKey_)  List<MusicAssistantAudioOutputDetails>? outputs)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantAudioProcessingChain():
return $default(_that.inputFidelity,_that.queueProcessing,_that.outputs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantAudioProcessingChain.inputFidelityKey_)  MusicAssistantAudioFidelity? inputFidelity, @JsonKey(name: MusicAssistantAudioProcessingChain.queueProcessingKey_)  MusicAssistantAudioQueueProcessing? queueProcessing, @JsonKey(name: MusicAssistantAudioProcessingChain.outputsKey_)  List<MusicAssistantAudioOutputDetails>? outputs)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantAudioProcessingChain() when $default != null:
return $default(_that.inputFidelity,_that.queueProcessing,_that.outputs);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantAudioProcessingChain extends MusicAssistantAudioProcessingChain {
  const _MusicAssistantAudioProcessingChain({@JsonKey(name: MusicAssistantAudioProcessingChain.inputFidelityKey_) this.inputFidelity, @JsonKey(name: MusicAssistantAudioProcessingChain.queueProcessingKey_) this.queueProcessing, @JsonKey(name: MusicAssistantAudioProcessingChain.outputsKey_) final  List<MusicAssistantAudioOutputDetails>? outputs}): _outputs = outputs,super._();
  factory _MusicAssistantAudioProcessingChain.fromJson(Map<String, dynamic> json) => _$MusicAssistantAudioProcessingChainFromJson(json);

/// inputFidelity
@override@JsonKey(name: MusicAssistantAudioProcessingChain.inputFidelityKey_) final  MusicAssistantAudioFidelity? inputFidelity;
/// queueProcessing
@override@JsonKey(name: MusicAssistantAudioProcessingChain.queueProcessingKey_) final  MusicAssistantAudioQueueProcessing? queueProcessing;
/// outputs
 final  List<MusicAssistantAudioOutputDetails>? _outputs;
/// outputs
@override@JsonKey(name: MusicAssistantAudioProcessingChain.outputsKey_) List<MusicAssistantAudioOutputDetails>? get outputs {
  final value = _outputs;
  if (value == null) return null;
  if (_outputs is EqualUnmodifiableListView) return _outputs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of MusicAssistantAudioProcessingChain
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantAudioProcessingChainCopyWith<_MusicAssistantAudioProcessingChain> get copyWith => __$MusicAssistantAudioProcessingChainCopyWithImpl<_MusicAssistantAudioProcessingChain>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantAudioProcessingChainToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantAudioProcessingChain&&(identical(other.inputFidelity, inputFidelity) || other.inputFidelity == inputFidelity)&&(identical(other.queueProcessing, queueProcessing) || other.queueProcessing == queueProcessing)&&const DeepCollectionEquality().equals(other._outputs, _outputs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,inputFidelity,queueProcessing,const DeepCollectionEquality().hash(_outputs));

@override
String toString() {
  return 'MusicAssistantAudioProcessingChain(inputFidelity: $inputFidelity, queueProcessing: $queueProcessing, outputs: $outputs)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantAudioProcessingChainCopyWith<$Res> implements $MusicAssistantAudioProcessingChainCopyWith<$Res> {
  factory _$MusicAssistantAudioProcessingChainCopyWith(_MusicAssistantAudioProcessingChain value, $Res Function(_MusicAssistantAudioProcessingChain) _then) = __$MusicAssistantAudioProcessingChainCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantAudioProcessingChain.inputFidelityKey_) MusicAssistantAudioFidelity? inputFidelity,@JsonKey(name: MusicAssistantAudioProcessingChain.queueProcessingKey_) MusicAssistantAudioQueueProcessing? queueProcessing,@JsonKey(name: MusicAssistantAudioProcessingChain.outputsKey_) List<MusicAssistantAudioOutputDetails>? outputs
});


@override $MusicAssistantAudioFidelityCopyWith<$Res>? get inputFidelity;@override $MusicAssistantAudioQueueProcessingCopyWith<$Res>? get queueProcessing;

}
/// @nodoc
class __$MusicAssistantAudioProcessingChainCopyWithImpl<$Res>
    implements _$MusicAssistantAudioProcessingChainCopyWith<$Res> {
  __$MusicAssistantAudioProcessingChainCopyWithImpl(this._self, this._then);

  final _MusicAssistantAudioProcessingChain _self;
  final $Res Function(_MusicAssistantAudioProcessingChain) _then;

/// Create a copy of MusicAssistantAudioProcessingChain
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? inputFidelity = freezed,Object? queueProcessing = freezed,Object? outputs = freezed,}) {
  return _then(_MusicAssistantAudioProcessingChain(
inputFidelity: freezed == inputFidelity ? _self.inputFidelity : inputFidelity // ignore: cast_nullable_to_non_nullable
as MusicAssistantAudioFidelity?,queueProcessing: freezed == queueProcessing ? _self.queueProcessing : queueProcessing // ignore: cast_nullable_to_non_nullable
as MusicAssistantAudioQueueProcessing?,outputs: freezed == outputs ? _self._outputs : outputs // ignore: cast_nullable_to_non_nullable
as List<MusicAssistantAudioOutputDetails>?,
  ));
}

/// Create a copy of MusicAssistantAudioProcessingChain
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantAudioFidelityCopyWith<$Res>? get inputFidelity {
    if (_self.inputFidelity == null) {
    return null;
  }

  return $MusicAssistantAudioFidelityCopyWith<$Res>(_self.inputFidelity!, (value) {
    return _then(_self.copyWith(inputFidelity: value));
  });
}/// Create a copy of MusicAssistantAudioProcessingChain
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantAudioQueueProcessingCopyWith<$Res>? get queueProcessing {
    if (_self.queueProcessing == null) {
    return null;
  }

  return $MusicAssistantAudioQueueProcessingCopyWith<$Res>(_self.queueProcessing!, (value) {
    return _then(_self.copyWith(queueProcessing: value));
  });
}
}

// dart format on
