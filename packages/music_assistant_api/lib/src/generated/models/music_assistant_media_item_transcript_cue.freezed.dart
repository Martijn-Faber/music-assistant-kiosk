// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_media_item_transcript_cue.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantMediaItemTranscriptCue {

/// start
@JsonKey(name: MusicAssistantMediaItemTranscriptCue.startKey_) double get start;/// end
@JsonKey(name: MusicAssistantMediaItemTranscriptCue.endKey_) double? get end;/// text
@JsonKey(name: MusicAssistantMediaItemTranscriptCue.textKey_) String get text;/// speaker
@JsonKey(name: MusicAssistantMediaItemTranscriptCue.speakerKey_) String? get speaker;
/// Create a copy of MusicAssistantMediaItemTranscriptCue
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantMediaItemTranscriptCueCopyWith<MusicAssistantMediaItemTranscriptCue> get copyWith => _$MusicAssistantMediaItemTranscriptCueCopyWithImpl<MusicAssistantMediaItemTranscriptCue>(this as MusicAssistantMediaItemTranscriptCue, _$identity);

  /// Serializes this MusicAssistantMediaItemTranscriptCue to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantMediaItemTranscriptCue&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&(identical(other.text, text) || other.text == text)&&(identical(other.speaker, speaker) || other.speaker == speaker));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,start,end,text,speaker);

@override
String toString() {
  return 'MusicAssistantMediaItemTranscriptCue(start: $start, end: $end, text: $text, speaker: $speaker)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantMediaItemTranscriptCueCopyWith<$Res>  {
  factory $MusicAssistantMediaItemTranscriptCueCopyWith(MusicAssistantMediaItemTranscriptCue value, $Res Function(MusicAssistantMediaItemTranscriptCue) _then) = _$MusicAssistantMediaItemTranscriptCueCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantMediaItemTranscriptCue.startKey_) double start,@JsonKey(name: MusicAssistantMediaItemTranscriptCue.endKey_) double? end,@JsonKey(name: MusicAssistantMediaItemTranscriptCue.textKey_) String text,@JsonKey(name: MusicAssistantMediaItemTranscriptCue.speakerKey_) String? speaker
});




}
/// @nodoc
class _$MusicAssistantMediaItemTranscriptCueCopyWithImpl<$Res>
    implements $MusicAssistantMediaItemTranscriptCueCopyWith<$Res> {
  _$MusicAssistantMediaItemTranscriptCueCopyWithImpl(this._self, this._then);

  final MusicAssistantMediaItemTranscriptCue _self;
  final $Res Function(MusicAssistantMediaItemTranscriptCue) _then;

/// Create a copy of MusicAssistantMediaItemTranscriptCue
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? start = null,Object? end = freezed,Object? text = null,Object? speaker = freezed,}) {
  return _then(_self.copyWith(
start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as double,end: freezed == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as double?,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,speaker: freezed == speaker ? _self.speaker : speaker // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MusicAssistantMediaItemTranscriptCue].
extension MusicAssistantMediaItemTranscriptCuePatterns on MusicAssistantMediaItemTranscriptCue {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantMediaItemTranscriptCue value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantMediaItemTranscriptCue() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantMediaItemTranscriptCue value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantMediaItemTranscriptCue():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantMediaItemTranscriptCue value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantMediaItemTranscriptCue() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantMediaItemTranscriptCue.startKey_)  double start, @JsonKey(name: MusicAssistantMediaItemTranscriptCue.endKey_)  double? end, @JsonKey(name: MusicAssistantMediaItemTranscriptCue.textKey_)  String text, @JsonKey(name: MusicAssistantMediaItemTranscriptCue.speakerKey_)  String? speaker)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantMediaItemTranscriptCue() when $default != null:
return $default(_that.start,_that.end,_that.text,_that.speaker);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantMediaItemTranscriptCue.startKey_)  double start, @JsonKey(name: MusicAssistantMediaItemTranscriptCue.endKey_)  double? end, @JsonKey(name: MusicAssistantMediaItemTranscriptCue.textKey_)  String text, @JsonKey(name: MusicAssistantMediaItemTranscriptCue.speakerKey_)  String? speaker)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantMediaItemTranscriptCue():
return $default(_that.start,_that.end,_that.text,_that.speaker);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantMediaItemTranscriptCue.startKey_)  double start, @JsonKey(name: MusicAssistantMediaItemTranscriptCue.endKey_)  double? end, @JsonKey(name: MusicAssistantMediaItemTranscriptCue.textKey_)  String text, @JsonKey(name: MusicAssistantMediaItemTranscriptCue.speakerKey_)  String? speaker)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantMediaItemTranscriptCue() when $default != null:
return $default(_that.start,_that.end,_that.text,_that.speaker);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantMediaItemTranscriptCue extends MusicAssistantMediaItemTranscriptCue {
  const _MusicAssistantMediaItemTranscriptCue({@JsonKey(name: MusicAssistantMediaItemTranscriptCue.startKey_) required this.start, @JsonKey(name: MusicAssistantMediaItemTranscriptCue.endKey_) this.end, @JsonKey(name: MusicAssistantMediaItemTranscriptCue.textKey_) required this.text, @JsonKey(name: MusicAssistantMediaItemTranscriptCue.speakerKey_) this.speaker}): super._();
  factory _MusicAssistantMediaItemTranscriptCue.fromJson(Map<String, dynamic> json) => _$MusicAssistantMediaItemTranscriptCueFromJson(json);

/// start
@override@JsonKey(name: MusicAssistantMediaItemTranscriptCue.startKey_) final  double start;
/// end
@override@JsonKey(name: MusicAssistantMediaItemTranscriptCue.endKey_) final  double? end;
/// text
@override@JsonKey(name: MusicAssistantMediaItemTranscriptCue.textKey_) final  String text;
/// speaker
@override@JsonKey(name: MusicAssistantMediaItemTranscriptCue.speakerKey_) final  String? speaker;

/// Create a copy of MusicAssistantMediaItemTranscriptCue
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantMediaItemTranscriptCueCopyWith<_MusicAssistantMediaItemTranscriptCue> get copyWith => __$MusicAssistantMediaItemTranscriptCueCopyWithImpl<_MusicAssistantMediaItemTranscriptCue>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantMediaItemTranscriptCueToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantMediaItemTranscriptCue&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&(identical(other.text, text) || other.text == text)&&(identical(other.speaker, speaker) || other.speaker == speaker));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,start,end,text,speaker);

@override
String toString() {
  return 'MusicAssistantMediaItemTranscriptCue(start: $start, end: $end, text: $text, speaker: $speaker)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantMediaItemTranscriptCueCopyWith<$Res> implements $MusicAssistantMediaItemTranscriptCueCopyWith<$Res> {
  factory _$MusicAssistantMediaItemTranscriptCueCopyWith(_MusicAssistantMediaItemTranscriptCue value, $Res Function(_MusicAssistantMediaItemTranscriptCue) _then) = __$MusicAssistantMediaItemTranscriptCueCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantMediaItemTranscriptCue.startKey_) double start,@JsonKey(name: MusicAssistantMediaItemTranscriptCue.endKey_) double? end,@JsonKey(name: MusicAssistantMediaItemTranscriptCue.textKey_) String text,@JsonKey(name: MusicAssistantMediaItemTranscriptCue.speakerKey_) String? speaker
});




}
/// @nodoc
class __$MusicAssistantMediaItemTranscriptCueCopyWithImpl<$Res>
    implements _$MusicAssistantMediaItemTranscriptCueCopyWith<$Res> {
  __$MusicAssistantMediaItemTranscriptCueCopyWithImpl(this._self, this._then);

  final _MusicAssistantMediaItemTranscriptCue _self;
  final $Res Function(_MusicAssistantMediaItemTranscriptCue) _then;

/// Create a copy of MusicAssistantMediaItemTranscriptCue
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? start = null,Object? end = freezed,Object? text = null,Object? speaker = freezed,}) {
  return _then(_MusicAssistantMediaItemTranscriptCue(
start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as double,end: freezed == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as double?,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,speaker: freezed == speaker ? _self.speaker : speaker // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
