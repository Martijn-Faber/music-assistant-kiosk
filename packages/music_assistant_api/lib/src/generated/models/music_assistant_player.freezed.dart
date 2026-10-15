// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_assistant_player.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicAssistantPlayer {

/// playerId
@JsonKey(name: MusicAssistantPlayer.playerIdKey_) String get playerId;/// provider
@JsonKey(name: MusicAssistantPlayer.providerKey_) String get provider;/// type
@JsonKey(name: MusicAssistantPlayer.typeKey_) MusicAssistantPlayerType get type;/// name
@JsonKey(name: MusicAssistantPlayer.nameKey_) String get name;/// available
@JsonKey(name: MusicAssistantPlayer.availableKey_) bool get available;/// deviceInfo
@JsonKey(name: MusicAssistantPlayer.deviceInfoKey_) MusicAssistantDeviceInfo get deviceInfo;/// supportedFeatures
@JsonKey(name: MusicAssistantPlayer.supportedFeaturesKey_) List<MusicAssistantPlayerFeature>? get supportedFeatures;/// playbackState
@JsonKey(name: MusicAssistantPlayer.playbackStateKey_) MusicAssistantPlaybackState get playbackState;/// elapsedTime
@JsonKey(name: MusicAssistantPlayer.elapsedTimeKey_) double? get elapsedTime;/// elapsedTimeLastUpdated
@JsonKey(name: MusicAssistantPlayer.elapsedTimeLastUpdatedKey_) double? get elapsedTimeLastUpdated;/// powered
@JsonKey(name: MusicAssistantPlayer.poweredKey_) bool? get powered;/// volumeLevel
@JsonKey(name: MusicAssistantPlayer.volumeLevelKey_) int? get volumeLevel;/// volumeMuted
@JsonKey(name: MusicAssistantPlayer.volumeMutedKey_) bool? get volumeMuted;/// groupMembers
@JsonKey(name: MusicAssistantPlayer.groupMembersKey_) List<String>? get groupMembers;/// staticGroupMembers
@JsonKey(name: MusicAssistantPlayer.staticGroupMembersKey_) List<String>? get staticGroupMembers;/// canGroupWith
@JsonKey(name: MusicAssistantPlayer.canGroupWithKey_) List<String>? get canGroupWith;/// syncedTo
@JsonKey(name: MusicAssistantPlayer.syncedToKey_) String? get syncedTo;/// activeSoundMode
@JsonKey(name: MusicAssistantPlayer.activeSoundModeKey_) String? get activeSoundMode;/// soundModeList
@JsonKey(name: MusicAssistantPlayer.soundModeListKey_) List<MusicAssistantPlayerSoundMode>? get soundModeList;/// options
@JsonKey(name: MusicAssistantPlayer.optionsKey_) List<MusicAssistantPlayerOption>? get options;/// activeSource
@JsonKey(name: MusicAssistantPlayer.activeSourceKey_) String? get activeSource;/// sourceList
@JsonKey(name: MusicAssistantPlayer.sourceListKey_) List<MusicAssistantPlayerSource>? get sourceList;/// activeGroup
@JsonKey(name: MusicAssistantPlayer.activeGroupKey_) String? get activeGroup;/// currentMedia
@JsonKey(name: MusicAssistantPlayer.currentMediaKey_) MusicAssistantPlayerMedia? get currentMedia;/// enabled
@JsonKey(name: MusicAssistantPlayer.enabledKey_) bool get enabled;/// hideInUi
@JsonKey(name: MusicAssistantPlayer.hideInUiKey_) bool get hideInUi;/// private
@JsonKey(name: MusicAssistantPlayer.privateKey_) bool get private;/// exposeToHa
@JsonKey(name: MusicAssistantPlayer.exposeToHaKey_) bool get exposeToHa;/// icon
@JsonKey(name: MusicAssistantPlayer.iconKey_) String get icon;/// groupVolume
@JsonKey(name: MusicAssistantPlayer.groupVolumeKey_) int? get groupVolume;/// groupVolumeMuted
@JsonKey(name: MusicAssistantPlayer.groupVolumeMutedKey_) bool? get groupVolumeMuted;/// extraAttributes
@JsonKey(name: MusicAssistantPlayer.extraAttributesKey_) Map<String, String?>? get extraAttributes;/// powerControl
@JsonKey(name: MusicAssistantPlayer.powerControlKey_) String get powerControl;/// volumeControl
@JsonKey(name: MusicAssistantPlayer.volumeControlKey_) String get volumeControl;/// muteControl
@JsonKey(name: MusicAssistantPlayer.muteControlKey_) String get muteControl;/// outputProtocols
@JsonKey(name: MusicAssistantPlayer.outputProtocolsKey_) List<MusicAssistantOutputProtocol>? get outputProtocols;/// activeOutputProtocol
@JsonKey(name: MusicAssistantPlayer.activeOutputProtocolKey_) String? get activeOutputProtocol;/// needsSetup
@JsonKey(name: MusicAssistantPlayer.needsSetupKey_) bool get needsSetup;/// setupReason
@JsonKey(name: MusicAssistantPlayer.setupReasonKey_) String? get setupReason;/// hasSetupFlow
@JsonKey(name: MusicAssistantPlayer.hasSetupFlowKey_) bool get hasSetupFlow;/// sleepTimerExpiresAt
@JsonKey(name: MusicAssistantPlayer.sleepTimerExpiresAtKey_) double? get sleepTimerExpiresAt;/// activeSourceAudio
@JsonKey(name: MusicAssistantPlayer.activeSourceAudioKey_) MusicAssistantActiveSourceAudioDetails? get activeSourceAudio;
/// Create a copy of MusicAssistantPlayer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicAssistantPlayerCopyWith<MusicAssistantPlayer> get copyWith => _$MusicAssistantPlayerCopyWithImpl<MusicAssistantPlayer>(this as MusicAssistantPlayer, _$identity);

  /// Serializes this MusicAssistantPlayer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicAssistantPlayer&&(identical(other.playerId, playerId) || other.playerId == playerId)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name)&&(identical(other.available, available) || other.available == available)&&(identical(other.deviceInfo, deviceInfo) || other.deviceInfo == deviceInfo)&&const DeepCollectionEquality().equals(other.supportedFeatures, supportedFeatures)&&(identical(other.playbackState, playbackState) || other.playbackState == playbackState)&&(identical(other.elapsedTime, elapsedTime) || other.elapsedTime == elapsedTime)&&(identical(other.elapsedTimeLastUpdated, elapsedTimeLastUpdated) || other.elapsedTimeLastUpdated == elapsedTimeLastUpdated)&&(identical(other.powered, powered) || other.powered == powered)&&(identical(other.volumeLevel, volumeLevel) || other.volumeLevel == volumeLevel)&&(identical(other.volumeMuted, volumeMuted) || other.volumeMuted == volumeMuted)&&const DeepCollectionEquality().equals(other.groupMembers, groupMembers)&&const DeepCollectionEquality().equals(other.staticGroupMembers, staticGroupMembers)&&const DeepCollectionEquality().equals(other.canGroupWith, canGroupWith)&&(identical(other.syncedTo, syncedTo) || other.syncedTo == syncedTo)&&(identical(other.activeSoundMode, activeSoundMode) || other.activeSoundMode == activeSoundMode)&&const DeepCollectionEquality().equals(other.soundModeList, soundModeList)&&const DeepCollectionEquality().equals(other.options, options)&&(identical(other.activeSource, activeSource) || other.activeSource == activeSource)&&const DeepCollectionEquality().equals(other.sourceList, sourceList)&&(identical(other.activeGroup, activeGroup) || other.activeGroup == activeGroup)&&(identical(other.currentMedia, currentMedia) || other.currentMedia == currentMedia)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.hideInUi, hideInUi) || other.hideInUi == hideInUi)&&(identical(other.private, private) || other.private == private)&&(identical(other.exposeToHa, exposeToHa) || other.exposeToHa == exposeToHa)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.groupVolume, groupVolume) || other.groupVolume == groupVolume)&&(identical(other.groupVolumeMuted, groupVolumeMuted) || other.groupVolumeMuted == groupVolumeMuted)&&const DeepCollectionEquality().equals(other.extraAttributes, extraAttributes)&&(identical(other.powerControl, powerControl) || other.powerControl == powerControl)&&(identical(other.volumeControl, volumeControl) || other.volumeControl == volumeControl)&&(identical(other.muteControl, muteControl) || other.muteControl == muteControl)&&const DeepCollectionEquality().equals(other.outputProtocols, outputProtocols)&&(identical(other.activeOutputProtocol, activeOutputProtocol) || other.activeOutputProtocol == activeOutputProtocol)&&(identical(other.needsSetup, needsSetup) || other.needsSetup == needsSetup)&&(identical(other.setupReason, setupReason) || other.setupReason == setupReason)&&(identical(other.hasSetupFlow, hasSetupFlow) || other.hasSetupFlow == hasSetupFlow)&&(identical(other.sleepTimerExpiresAt, sleepTimerExpiresAt) || other.sleepTimerExpiresAt == sleepTimerExpiresAt)&&(identical(other.activeSourceAudio, activeSourceAudio) || other.activeSourceAudio == activeSourceAudio));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,playerId,provider,type,name,available,deviceInfo,const DeepCollectionEquality().hash(supportedFeatures),playbackState,elapsedTime,elapsedTimeLastUpdated,powered,volumeLevel,volumeMuted,const DeepCollectionEquality().hash(groupMembers),const DeepCollectionEquality().hash(staticGroupMembers),const DeepCollectionEquality().hash(canGroupWith),syncedTo,activeSoundMode,const DeepCollectionEquality().hash(soundModeList),const DeepCollectionEquality().hash(options),activeSource,const DeepCollectionEquality().hash(sourceList),activeGroup,currentMedia,enabled,hideInUi,private,exposeToHa,icon,groupVolume,groupVolumeMuted,const DeepCollectionEquality().hash(extraAttributes),powerControl,volumeControl,muteControl,const DeepCollectionEquality().hash(outputProtocols),activeOutputProtocol,needsSetup,setupReason,hasSetupFlow,sleepTimerExpiresAt,activeSourceAudio]);

@override
String toString() {
  return 'MusicAssistantPlayer(playerId: $playerId, provider: $provider, type: $type, name: $name, available: $available, deviceInfo: $deviceInfo, supportedFeatures: $supportedFeatures, playbackState: $playbackState, elapsedTime: $elapsedTime, elapsedTimeLastUpdated: $elapsedTimeLastUpdated, powered: $powered, volumeLevel: $volumeLevel, volumeMuted: $volumeMuted, groupMembers: $groupMembers, staticGroupMembers: $staticGroupMembers, canGroupWith: $canGroupWith, syncedTo: $syncedTo, activeSoundMode: $activeSoundMode, soundModeList: $soundModeList, options: $options, activeSource: $activeSource, sourceList: $sourceList, activeGroup: $activeGroup, currentMedia: $currentMedia, enabled: $enabled, hideInUi: $hideInUi, private: $private, exposeToHa: $exposeToHa, icon: $icon, groupVolume: $groupVolume, groupVolumeMuted: $groupVolumeMuted, extraAttributes: $extraAttributes, powerControl: $powerControl, volumeControl: $volumeControl, muteControl: $muteControl, outputProtocols: $outputProtocols, activeOutputProtocol: $activeOutputProtocol, needsSetup: $needsSetup, setupReason: $setupReason, hasSetupFlow: $hasSetupFlow, sleepTimerExpiresAt: $sleepTimerExpiresAt, activeSourceAudio: $activeSourceAudio)';
}


}

/// @nodoc
abstract mixin class $MusicAssistantPlayerCopyWith<$Res>  {
  factory $MusicAssistantPlayerCopyWith(MusicAssistantPlayer value, $Res Function(MusicAssistantPlayer) _then) = _$MusicAssistantPlayerCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: MusicAssistantPlayer.playerIdKey_) String playerId,@JsonKey(name: MusicAssistantPlayer.providerKey_) String provider,@JsonKey(name: MusicAssistantPlayer.typeKey_) MusicAssistantPlayerType type,@JsonKey(name: MusicAssistantPlayer.nameKey_) String name,@JsonKey(name: MusicAssistantPlayer.availableKey_) bool available,@JsonKey(name: MusicAssistantPlayer.deviceInfoKey_) MusicAssistantDeviceInfo deviceInfo,@JsonKey(name: MusicAssistantPlayer.supportedFeaturesKey_) List<MusicAssistantPlayerFeature>? supportedFeatures,@JsonKey(name: MusicAssistantPlayer.playbackStateKey_) MusicAssistantPlaybackState playbackState,@JsonKey(name: MusicAssistantPlayer.elapsedTimeKey_) double? elapsedTime,@JsonKey(name: MusicAssistantPlayer.elapsedTimeLastUpdatedKey_) double? elapsedTimeLastUpdated,@JsonKey(name: MusicAssistantPlayer.poweredKey_) bool? powered,@JsonKey(name: MusicAssistantPlayer.volumeLevelKey_) int? volumeLevel,@JsonKey(name: MusicAssistantPlayer.volumeMutedKey_) bool? volumeMuted,@JsonKey(name: MusicAssistantPlayer.groupMembersKey_) List<String>? groupMembers,@JsonKey(name: MusicAssistantPlayer.staticGroupMembersKey_) List<String>? staticGroupMembers,@JsonKey(name: MusicAssistantPlayer.canGroupWithKey_) List<String>? canGroupWith,@JsonKey(name: MusicAssistantPlayer.syncedToKey_) String? syncedTo,@JsonKey(name: MusicAssistantPlayer.activeSoundModeKey_) String? activeSoundMode,@JsonKey(name: MusicAssistantPlayer.soundModeListKey_) List<MusicAssistantPlayerSoundMode>? soundModeList,@JsonKey(name: MusicAssistantPlayer.optionsKey_) List<MusicAssistantPlayerOption>? options,@JsonKey(name: MusicAssistantPlayer.activeSourceKey_) String? activeSource,@JsonKey(name: MusicAssistantPlayer.sourceListKey_) List<MusicAssistantPlayerSource>? sourceList,@JsonKey(name: MusicAssistantPlayer.activeGroupKey_) String? activeGroup,@JsonKey(name: MusicAssistantPlayer.currentMediaKey_) MusicAssistantPlayerMedia? currentMedia,@JsonKey(name: MusicAssistantPlayer.enabledKey_) bool enabled,@JsonKey(name: MusicAssistantPlayer.hideInUiKey_) bool hideInUi,@JsonKey(name: MusicAssistantPlayer.privateKey_) bool private,@JsonKey(name: MusicAssistantPlayer.exposeToHaKey_) bool exposeToHa,@JsonKey(name: MusicAssistantPlayer.iconKey_) String icon,@JsonKey(name: MusicAssistantPlayer.groupVolumeKey_) int? groupVolume,@JsonKey(name: MusicAssistantPlayer.groupVolumeMutedKey_) bool? groupVolumeMuted,@JsonKey(name: MusicAssistantPlayer.extraAttributesKey_) Map<String, String?>? extraAttributes,@JsonKey(name: MusicAssistantPlayer.powerControlKey_) String powerControl,@JsonKey(name: MusicAssistantPlayer.volumeControlKey_) String volumeControl,@JsonKey(name: MusicAssistantPlayer.muteControlKey_) String muteControl,@JsonKey(name: MusicAssistantPlayer.outputProtocolsKey_) List<MusicAssistantOutputProtocol>? outputProtocols,@JsonKey(name: MusicAssistantPlayer.activeOutputProtocolKey_) String? activeOutputProtocol,@JsonKey(name: MusicAssistantPlayer.needsSetupKey_) bool needsSetup,@JsonKey(name: MusicAssistantPlayer.setupReasonKey_) String? setupReason,@JsonKey(name: MusicAssistantPlayer.hasSetupFlowKey_) bool hasSetupFlow,@JsonKey(name: MusicAssistantPlayer.sleepTimerExpiresAtKey_) double? sleepTimerExpiresAt,@JsonKey(name: MusicAssistantPlayer.activeSourceAudioKey_) MusicAssistantActiveSourceAudioDetails? activeSourceAudio
});


$MusicAssistantDeviceInfoCopyWith<$Res> get deviceInfo;$MusicAssistantPlayerMediaCopyWith<$Res>? get currentMedia;$MusicAssistantActiveSourceAudioDetailsCopyWith<$Res>? get activeSourceAudio;

}
/// @nodoc
class _$MusicAssistantPlayerCopyWithImpl<$Res>
    implements $MusicAssistantPlayerCopyWith<$Res> {
  _$MusicAssistantPlayerCopyWithImpl(this._self, this._then);

  final MusicAssistantPlayer _self;
  final $Res Function(MusicAssistantPlayer) _then;

/// Create a copy of MusicAssistantPlayer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? playerId = null,Object? provider = null,Object? type = null,Object? name = null,Object? available = null,Object? deviceInfo = null,Object? supportedFeatures = freezed,Object? playbackState = null,Object? elapsedTime = freezed,Object? elapsedTimeLastUpdated = freezed,Object? powered = freezed,Object? volumeLevel = freezed,Object? volumeMuted = freezed,Object? groupMembers = freezed,Object? staticGroupMembers = freezed,Object? canGroupWith = freezed,Object? syncedTo = freezed,Object? activeSoundMode = freezed,Object? soundModeList = freezed,Object? options = freezed,Object? activeSource = freezed,Object? sourceList = freezed,Object? activeGroup = freezed,Object? currentMedia = freezed,Object? enabled = null,Object? hideInUi = null,Object? private = null,Object? exposeToHa = null,Object? icon = null,Object? groupVolume = freezed,Object? groupVolumeMuted = freezed,Object? extraAttributes = freezed,Object? powerControl = null,Object? volumeControl = null,Object? muteControl = null,Object? outputProtocols = freezed,Object? activeOutputProtocol = freezed,Object? needsSetup = null,Object? setupReason = freezed,Object? hasSetupFlow = null,Object? sleepTimerExpiresAt = freezed,Object? activeSourceAudio = freezed,}) {
  return _then(_self.copyWith(
playerId: null == playerId ? _self.playerId : playerId // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MusicAssistantPlayerType,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as bool,deviceInfo: null == deviceInfo ? _self.deviceInfo : deviceInfo // ignore: cast_nullable_to_non_nullable
as MusicAssistantDeviceInfo,supportedFeatures: freezed == supportedFeatures ? _self.supportedFeatures : supportedFeatures // ignore: cast_nullable_to_non_nullable
as List<MusicAssistantPlayerFeature>?,playbackState: null == playbackState ? _self.playbackState : playbackState // ignore: cast_nullable_to_non_nullable
as MusicAssistantPlaybackState,elapsedTime: freezed == elapsedTime ? _self.elapsedTime : elapsedTime // ignore: cast_nullable_to_non_nullable
as double?,elapsedTimeLastUpdated: freezed == elapsedTimeLastUpdated ? _self.elapsedTimeLastUpdated : elapsedTimeLastUpdated // ignore: cast_nullable_to_non_nullable
as double?,powered: freezed == powered ? _self.powered : powered // ignore: cast_nullable_to_non_nullable
as bool?,volumeLevel: freezed == volumeLevel ? _self.volumeLevel : volumeLevel // ignore: cast_nullable_to_non_nullable
as int?,volumeMuted: freezed == volumeMuted ? _self.volumeMuted : volumeMuted // ignore: cast_nullable_to_non_nullable
as bool?,groupMembers: freezed == groupMembers ? _self.groupMembers : groupMembers // ignore: cast_nullable_to_non_nullable
as List<String>?,staticGroupMembers: freezed == staticGroupMembers ? _self.staticGroupMembers : staticGroupMembers // ignore: cast_nullable_to_non_nullable
as List<String>?,canGroupWith: freezed == canGroupWith ? _self.canGroupWith : canGroupWith // ignore: cast_nullable_to_non_nullable
as List<String>?,syncedTo: freezed == syncedTo ? _self.syncedTo : syncedTo // ignore: cast_nullable_to_non_nullable
as String?,activeSoundMode: freezed == activeSoundMode ? _self.activeSoundMode : activeSoundMode // ignore: cast_nullable_to_non_nullable
as String?,soundModeList: freezed == soundModeList ? _self.soundModeList : soundModeList // ignore: cast_nullable_to_non_nullable
as List<MusicAssistantPlayerSoundMode>?,options: freezed == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<MusicAssistantPlayerOption>?,activeSource: freezed == activeSource ? _self.activeSource : activeSource // ignore: cast_nullable_to_non_nullable
as String?,sourceList: freezed == sourceList ? _self.sourceList : sourceList // ignore: cast_nullable_to_non_nullable
as List<MusicAssistantPlayerSource>?,activeGroup: freezed == activeGroup ? _self.activeGroup : activeGroup // ignore: cast_nullable_to_non_nullable
as String?,currentMedia: freezed == currentMedia ? _self.currentMedia : currentMedia // ignore: cast_nullable_to_non_nullable
as MusicAssistantPlayerMedia?,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,hideInUi: null == hideInUi ? _self.hideInUi : hideInUi // ignore: cast_nullable_to_non_nullable
as bool,private: null == private ? _self.private : private // ignore: cast_nullable_to_non_nullable
as bool,exposeToHa: null == exposeToHa ? _self.exposeToHa : exposeToHa // ignore: cast_nullable_to_non_nullable
as bool,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,groupVolume: freezed == groupVolume ? _self.groupVolume : groupVolume // ignore: cast_nullable_to_non_nullable
as int?,groupVolumeMuted: freezed == groupVolumeMuted ? _self.groupVolumeMuted : groupVolumeMuted // ignore: cast_nullable_to_non_nullable
as bool?,extraAttributes: freezed == extraAttributes ? _self.extraAttributes : extraAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, String?>?,powerControl: null == powerControl ? _self.powerControl : powerControl // ignore: cast_nullable_to_non_nullable
as String,volumeControl: null == volumeControl ? _self.volumeControl : volumeControl // ignore: cast_nullable_to_non_nullable
as String,muteControl: null == muteControl ? _self.muteControl : muteControl // ignore: cast_nullable_to_non_nullable
as String,outputProtocols: freezed == outputProtocols ? _self.outputProtocols : outputProtocols // ignore: cast_nullable_to_non_nullable
as List<MusicAssistantOutputProtocol>?,activeOutputProtocol: freezed == activeOutputProtocol ? _self.activeOutputProtocol : activeOutputProtocol // ignore: cast_nullable_to_non_nullable
as String?,needsSetup: null == needsSetup ? _self.needsSetup : needsSetup // ignore: cast_nullable_to_non_nullable
as bool,setupReason: freezed == setupReason ? _self.setupReason : setupReason // ignore: cast_nullable_to_non_nullable
as String?,hasSetupFlow: null == hasSetupFlow ? _self.hasSetupFlow : hasSetupFlow // ignore: cast_nullable_to_non_nullable
as bool,sleepTimerExpiresAt: freezed == sleepTimerExpiresAt ? _self.sleepTimerExpiresAt : sleepTimerExpiresAt // ignore: cast_nullable_to_non_nullable
as double?,activeSourceAudio: freezed == activeSourceAudio ? _self.activeSourceAudio : activeSourceAudio // ignore: cast_nullable_to_non_nullable
as MusicAssistantActiveSourceAudioDetails?,
  ));
}
/// Create a copy of MusicAssistantPlayer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantDeviceInfoCopyWith<$Res> get deviceInfo {
  
  return $MusicAssistantDeviceInfoCopyWith<$Res>(_self.deviceInfo, (value) {
    return _then(_self.copyWith(deviceInfo: value));
  });
}/// Create a copy of MusicAssistantPlayer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantPlayerMediaCopyWith<$Res>? get currentMedia {
    if (_self.currentMedia == null) {
    return null;
  }

  return $MusicAssistantPlayerMediaCopyWith<$Res>(_self.currentMedia!, (value) {
    return _then(_self.copyWith(currentMedia: value));
  });
}/// Create a copy of MusicAssistantPlayer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantActiveSourceAudioDetailsCopyWith<$Res>? get activeSourceAudio {
    if (_self.activeSourceAudio == null) {
    return null;
  }

  return $MusicAssistantActiveSourceAudioDetailsCopyWith<$Res>(_self.activeSourceAudio!, (value) {
    return _then(_self.copyWith(activeSourceAudio: value));
  });
}
}


/// Adds pattern-matching-related methods to [MusicAssistantPlayer].
extension MusicAssistantPlayerPatterns on MusicAssistantPlayer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicAssistantPlayer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicAssistantPlayer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicAssistantPlayer value)  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantPlayer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicAssistantPlayer value)?  $default,){
final _that = this;
switch (_that) {
case _MusicAssistantPlayer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantPlayer.playerIdKey_)  String playerId, @JsonKey(name: MusicAssistantPlayer.providerKey_)  String provider, @JsonKey(name: MusicAssistantPlayer.typeKey_)  MusicAssistantPlayerType type, @JsonKey(name: MusicAssistantPlayer.nameKey_)  String name, @JsonKey(name: MusicAssistantPlayer.availableKey_)  bool available, @JsonKey(name: MusicAssistantPlayer.deviceInfoKey_)  MusicAssistantDeviceInfo deviceInfo, @JsonKey(name: MusicAssistantPlayer.supportedFeaturesKey_)  List<MusicAssistantPlayerFeature>? supportedFeatures, @JsonKey(name: MusicAssistantPlayer.playbackStateKey_)  MusicAssistantPlaybackState playbackState, @JsonKey(name: MusicAssistantPlayer.elapsedTimeKey_)  double? elapsedTime, @JsonKey(name: MusicAssistantPlayer.elapsedTimeLastUpdatedKey_)  double? elapsedTimeLastUpdated, @JsonKey(name: MusicAssistantPlayer.poweredKey_)  bool? powered, @JsonKey(name: MusicAssistantPlayer.volumeLevelKey_)  int? volumeLevel, @JsonKey(name: MusicAssistantPlayer.volumeMutedKey_)  bool? volumeMuted, @JsonKey(name: MusicAssistantPlayer.groupMembersKey_)  List<String>? groupMembers, @JsonKey(name: MusicAssistantPlayer.staticGroupMembersKey_)  List<String>? staticGroupMembers, @JsonKey(name: MusicAssistantPlayer.canGroupWithKey_)  List<String>? canGroupWith, @JsonKey(name: MusicAssistantPlayer.syncedToKey_)  String? syncedTo, @JsonKey(name: MusicAssistantPlayer.activeSoundModeKey_)  String? activeSoundMode, @JsonKey(name: MusicAssistantPlayer.soundModeListKey_)  List<MusicAssistantPlayerSoundMode>? soundModeList, @JsonKey(name: MusicAssistantPlayer.optionsKey_)  List<MusicAssistantPlayerOption>? options, @JsonKey(name: MusicAssistantPlayer.activeSourceKey_)  String? activeSource, @JsonKey(name: MusicAssistantPlayer.sourceListKey_)  List<MusicAssistantPlayerSource>? sourceList, @JsonKey(name: MusicAssistantPlayer.activeGroupKey_)  String? activeGroup, @JsonKey(name: MusicAssistantPlayer.currentMediaKey_)  MusicAssistantPlayerMedia? currentMedia, @JsonKey(name: MusicAssistantPlayer.enabledKey_)  bool enabled, @JsonKey(name: MusicAssistantPlayer.hideInUiKey_)  bool hideInUi, @JsonKey(name: MusicAssistantPlayer.privateKey_)  bool private, @JsonKey(name: MusicAssistantPlayer.exposeToHaKey_)  bool exposeToHa, @JsonKey(name: MusicAssistantPlayer.iconKey_)  String icon, @JsonKey(name: MusicAssistantPlayer.groupVolumeKey_)  int? groupVolume, @JsonKey(name: MusicAssistantPlayer.groupVolumeMutedKey_)  bool? groupVolumeMuted, @JsonKey(name: MusicAssistantPlayer.extraAttributesKey_)  Map<String, String?>? extraAttributes, @JsonKey(name: MusicAssistantPlayer.powerControlKey_)  String powerControl, @JsonKey(name: MusicAssistantPlayer.volumeControlKey_)  String volumeControl, @JsonKey(name: MusicAssistantPlayer.muteControlKey_)  String muteControl, @JsonKey(name: MusicAssistantPlayer.outputProtocolsKey_)  List<MusicAssistantOutputProtocol>? outputProtocols, @JsonKey(name: MusicAssistantPlayer.activeOutputProtocolKey_)  String? activeOutputProtocol, @JsonKey(name: MusicAssistantPlayer.needsSetupKey_)  bool needsSetup, @JsonKey(name: MusicAssistantPlayer.setupReasonKey_)  String? setupReason, @JsonKey(name: MusicAssistantPlayer.hasSetupFlowKey_)  bool hasSetupFlow, @JsonKey(name: MusicAssistantPlayer.sleepTimerExpiresAtKey_)  double? sleepTimerExpiresAt, @JsonKey(name: MusicAssistantPlayer.activeSourceAudioKey_)  MusicAssistantActiveSourceAudioDetails? activeSourceAudio)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicAssistantPlayer() when $default != null:
return $default(_that.playerId,_that.provider,_that.type,_that.name,_that.available,_that.deviceInfo,_that.supportedFeatures,_that.playbackState,_that.elapsedTime,_that.elapsedTimeLastUpdated,_that.powered,_that.volumeLevel,_that.volumeMuted,_that.groupMembers,_that.staticGroupMembers,_that.canGroupWith,_that.syncedTo,_that.activeSoundMode,_that.soundModeList,_that.options,_that.activeSource,_that.sourceList,_that.activeGroup,_that.currentMedia,_that.enabled,_that.hideInUi,_that.private,_that.exposeToHa,_that.icon,_that.groupVolume,_that.groupVolumeMuted,_that.extraAttributes,_that.powerControl,_that.volumeControl,_that.muteControl,_that.outputProtocols,_that.activeOutputProtocol,_that.needsSetup,_that.setupReason,_that.hasSetupFlow,_that.sleepTimerExpiresAt,_that.activeSourceAudio);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: MusicAssistantPlayer.playerIdKey_)  String playerId, @JsonKey(name: MusicAssistantPlayer.providerKey_)  String provider, @JsonKey(name: MusicAssistantPlayer.typeKey_)  MusicAssistantPlayerType type, @JsonKey(name: MusicAssistantPlayer.nameKey_)  String name, @JsonKey(name: MusicAssistantPlayer.availableKey_)  bool available, @JsonKey(name: MusicAssistantPlayer.deviceInfoKey_)  MusicAssistantDeviceInfo deviceInfo, @JsonKey(name: MusicAssistantPlayer.supportedFeaturesKey_)  List<MusicAssistantPlayerFeature>? supportedFeatures, @JsonKey(name: MusicAssistantPlayer.playbackStateKey_)  MusicAssistantPlaybackState playbackState, @JsonKey(name: MusicAssistantPlayer.elapsedTimeKey_)  double? elapsedTime, @JsonKey(name: MusicAssistantPlayer.elapsedTimeLastUpdatedKey_)  double? elapsedTimeLastUpdated, @JsonKey(name: MusicAssistantPlayer.poweredKey_)  bool? powered, @JsonKey(name: MusicAssistantPlayer.volumeLevelKey_)  int? volumeLevel, @JsonKey(name: MusicAssistantPlayer.volumeMutedKey_)  bool? volumeMuted, @JsonKey(name: MusicAssistantPlayer.groupMembersKey_)  List<String>? groupMembers, @JsonKey(name: MusicAssistantPlayer.staticGroupMembersKey_)  List<String>? staticGroupMembers, @JsonKey(name: MusicAssistantPlayer.canGroupWithKey_)  List<String>? canGroupWith, @JsonKey(name: MusicAssistantPlayer.syncedToKey_)  String? syncedTo, @JsonKey(name: MusicAssistantPlayer.activeSoundModeKey_)  String? activeSoundMode, @JsonKey(name: MusicAssistantPlayer.soundModeListKey_)  List<MusicAssistantPlayerSoundMode>? soundModeList, @JsonKey(name: MusicAssistantPlayer.optionsKey_)  List<MusicAssistantPlayerOption>? options, @JsonKey(name: MusicAssistantPlayer.activeSourceKey_)  String? activeSource, @JsonKey(name: MusicAssistantPlayer.sourceListKey_)  List<MusicAssistantPlayerSource>? sourceList, @JsonKey(name: MusicAssistantPlayer.activeGroupKey_)  String? activeGroup, @JsonKey(name: MusicAssistantPlayer.currentMediaKey_)  MusicAssistantPlayerMedia? currentMedia, @JsonKey(name: MusicAssistantPlayer.enabledKey_)  bool enabled, @JsonKey(name: MusicAssistantPlayer.hideInUiKey_)  bool hideInUi, @JsonKey(name: MusicAssistantPlayer.privateKey_)  bool private, @JsonKey(name: MusicAssistantPlayer.exposeToHaKey_)  bool exposeToHa, @JsonKey(name: MusicAssistantPlayer.iconKey_)  String icon, @JsonKey(name: MusicAssistantPlayer.groupVolumeKey_)  int? groupVolume, @JsonKey(name: MusicAssistantPlayer.groupVolumeMutedKey_)  bool? groupVolumeMuted, @JsonKey(name: MusicAssistantPlayer.extraAttributesKey_)  Map<String, String?>? extraAttributes, @JsonKey(name: MusicAssistantPlayer.powerControlKey_)  String powerControl, @JsonKey(name: MusicAssistantPlayer.volumeControlKey_)  String volumeControl, @JsonKey(name: MusicAssistantPlayer.muteControlKey_)  String muteControl, @JsonKey(name: MusicAssistantPlayer.outputProtocolsKey_)  List<MusicAssistantOutputProtocol>? outputProtocols, @JsonKey(name: MusicAssistantPlayer.activeOutputProtocolKey_)  String? activeOutputProtocol, @JsonKey(name: MusicAssistantPlayer.needsSetupKey_)  bool needsSetup, @JsonKey(name: MusicAssistantPlayer.setupReasonKey_)  String? setupReason, @JsonKey(name: MusicAssistantPlayer.hasSetupFlowKey_)  bool hasSetupFlow, @JsonKey(name: MusicAssistantPlayer.sleepTimerExpiresAtKey_)  double? sleepTimerExpiresAt, @JsonKey(name: MusicAssistantPlayer.activeSourceAudioKey_)  MusicAssistantActiveSourceAudioDetails? activeSourceAudio)  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantPlayer():
return $default(_that.playerId,_that.provider,_that.type,_that.name,_that.available,_that.deviceInfo,_that.supportedFeatures,_that.playbackState,_that.elapsedTime,_that.elapsedTimeLastUpdated,_that.powered,_that.volumeLevel,_that.volumeMuted,_that.groupMembers,_that.staticGroupMembers,_that.canGroupWith,_that.syncedTo,_that.activeSoundMode,_that.soundModeList,_that.options,_that.activeSource,_that.sourceList,_that.activeGroup,_that.currentMedia,_that.enabled,_that.hideInUi,_that.private,_that.exposeToHa,_that.icon,_that.groupVolume,_that.groupVolumeMuted,_that.extraAttributes,_that.powerControl,_that.volumeControl,_that.muteControl,_that.outputProtocols,_that.activeOutputProtocol,_that.needsSetup,_that.setupReason,_that.hasSetupFlow,_that.sleepTimerExpiresAt,_that.activeSourceAudio);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: MusicAssistantPlayer.playerIdKey_)  String playerId, @JsonKey(name: MusicAssistantPlayer.providerKey_)  String provider, @JsonKey(name: MusicAssistantPlayer.typeKey_)  MusicAssistantPlayerType type, @JsonKey(name: MusicAssistantPlayer.nameKey_)  String name, @JsonKey(name: MusicAssistantPlayer.availableKey_)  bool available, @JsonKey(name: MusicAssistantPlayer.deviceInfoKey_)  MusicAssistantDeviceInfo deviceInfo, @JsonKey(name: MusicAssistantPlayer.supportedFeaturesKey_)  List<MusicAssistantPlayerFeature>? supportedFeatures, @JsonKey(name: MusicAssistantPlayer.playbackStateKey_)  MusicAssistantPlaybackState playbackState, @JsonKey(name: MusicAssistantPlayer.elapsedTimeKey_)  double? elapsedTime, @JsonKey(name: MusicAssistantPlayer.elapsedTimeLastUpdatedKey_)  double? elapsedTimeLastUpdated, @JsonKey(name: MusicAssistantPlayer.poweredKey_)  bool? powered, @JsonKey(name: MusicAssistantPlayer.volumeLevelKey_)  int? volumeLevel, @JsonKey(name: MusicAssistantPlayer.volumeMutedKey_)  bool? volumeMuted, @JsonKey(name: MusicAssistantPlayer.groupMembersKey_)  List<String>? groupMembers, @JsonKey(name: MusicAssistantPlayer.staticGroupMembersKey_)  List<String>? staticGroupMembers, @JsonKey(name: MusicAssistantPlayer.canGroupWithKey_)  List<String>? canGroupWith, @JsonKey(name: MusicAssistantPlayer.syncedToKey_)  String? syncedTo, @JsonKey(name: MusicAssistantPlayer.activeSoundModeKey_)  String? activeSoundMode, @JsonKey(name: MusicAssistantPlayer.soundModeListKey_)  List<MusicAssistantPlayerSoundMode>? soundModeList, @JsonKey(name: MusicAssistantPlayer.optionsKey_)  List<MusicAssistantPlayerOption>? options, @JsonKey(name: MusicAssistantPlayer.activeSourceKey_)  String? activeSource, @JsonKey(name: MusicAssistantPlayer.sourceListKey_)  List<MusicAssistantPlayerSource>? sourceList, @JsonKey(name: MusicAssistantPlayer.activeGroupKey_)  String? activeGroup, @JsonKey(name: MusicAssistantPlayer.currentMediaKey_)  MusicAssistantPlayerMedia? currentMedia, @JsonKey(name: MusicAssistantPlayer.enabledKey_)  bool enabled, @JsonKey(name: MusicAssistantPlayer.hideInUiKey_)  bool hideInUi, @JsonKey(name: MusicAssistantPlayer.privateKey_)  bool private, @JsonKey(name: MusicAssistantPlayer.exposeToHaKey_)  bool exposeToHa, @JsonKey(name: MusicAssistantPlayer.iconKey_)  String icon, @JsonKey(name: MusicAssistantPlayer.groupVolumeKey_)  int? groupVolume, @JsonKey(name: MusicAssistantPlayer.groupVolumeMutedKey_)  bool? groupVolumeMuted, @JsonKey(name: MusicAssistantPlayer.extraAttributesKey_)  Map<String, String?>? extraAttributes, @JsonKey(name: MusicAssistantPlayer.powerControlKey_)  String powerControl, @JsonKey(name: MusicAssistantPlayer.volumeControlKey_)  String volumeControl, @JsonKey(name: MusicAssistantPlayer.muteControlKey_)  String muteControl, @JsonKey(name: MusicAssistantPlayer.outputProtocolsKey_)  List<MusicAssistantOutputProtocol>? outputProtocols, @JsonKey(name: MusicAssistantPlayer.activeOutputProtocolKey_)  String? activeOutputProtocol, @JsonKey(name: MusicAssistantPlayer.needsSetupKey_)  bool needsSetup, @JsonKey(name: MusicAssistantPlayer.setupReasonKey_)  String? setupReason, @JsonKey(name: MusicAssistantPlayer.hasSetupFlowKey_)  bool hasSetupFlow, @JsonKey(name: MusicAssistantPlayer.sleepTimerExpiresAtKey_)  double? sleepTimerExpiresAt, @JsonKey(name: MusicAssistantPlayer.activeSourceAudioKey_)  MusicAssistantActiveSourceAudioDetails? activeSourceAudio)?  $default,) {final _that = this;
switch (_that) {
case _MusicAssistantPlayer() when $default != null:
return $default(_that.playerId,_that.provider,_that.type,_that.name,_that.available,_that.deviceInfo,_that.supportedFeatures,_that.playbackState,_that.elapsedTime,_that.elapsedTimeLastUpdated,_that.powered,_that.volumeLevel,_that.volumeMuted,_that.groupMembers,_that.staticGroupMembers,_that.canGroupWith,_that.syncedTo,_that.activeSoundMode,_that.soundModeList,_that.options,_that.activeSource,_that.sourceList,_that.activeGroup,_that.currentMedia,_that.enabled,_that.hideInUi,_that.private,_that.exposeToHa,_that.icon,_that.groupVolume,_that.groupVolumeMuted,_that.extraAttributes,_that.powerControl,_that.volumeControl,_that.muteControl,_that.outputProtocols,_that.activeOutputProtocol,_that.needsSetup,_that.setupReason,_that.hasSetupFlow,_that.sleepTimerExpiresAt,_that.activeSourceAudio);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _MusicAssistantPlayer extends MusicAssistantPlayer {
  const _MusicAssistantPlayer({@JsonKey(name: MusicAssistantPlayer.playerIdKey_) required this.playerId, @JsonKey(name: MusicAssistantPlayer.providerKey_) required this.provider, @JsonKey(name: MusicAssistantPlayer.typeKey_) required this.type, @JsonKey(name: MusicAssistantPlayer.nameKey_) required this.name, @JsonKey(name: MusicAssistantPlayer.availableKey_) required this.available, @JsonKey(name: MusicAssistantPlayer.deviceInfoKey_) required this.deviceInfo, @JsonKey(name: MusicAssistantPlayer.supportedFeaturesKey_) final  List<MusicAssistantPlayerFeature>? supportedFeatures, @JsonKey(name: MusicAssistantPlayer.playbackStateKey_) this.playbackState = MusicAssistantPlaybackState.idle, @JsonKey(name: MusicAssistantPlayer.elapsedTimeKey_) this.elapsedTime, @JsonKey(name: MusicAssistantPlayer.elapsedTimeLastUpdatedKey_) this.elapsedTimeLastUpdated, @JsonKey(name: MusicAssistantPlayer.poweredKey_) this.powered, @JsonKey(name: MusicAssistantPlayer.volumeLevelKey_) this.volumeLevel, @JsonKey(name: MusicAssistantPlayer.volumeMutedKey_) this.volumeMuted, @JsonKey(name: MusicAssistantPlayer.groupMembersKey_) final  List<String>? groupMembers, @JsonKey(name: MusicAssistantPlayer.staticGroupMembersKey_) final  List<String>? staticGroupMembers, @JsonKey(name: MusicAssistantPlayer.canGroupWithKey_) final  List<String>? canGroupWith, @JsonKey(name: MusicAssistantPlayer.syncedToKey_) this.syncedTo, @JsonKey(name: MusicAssistantPlayer.activeSoundModeKey_) this.activeSoundMode, @JsonKey(name: MusicAssistantPlayer.soundModeListKey_) final  List<MusicAssistantPlayerSoundMode>? soundModeList, @JsonKey(name: MusicAssistantPlayer.optionsKey_) final  List<MusicAssistantPlayerOption>? options, @JsonKey(name: MusicAssistantPlayer.activeSourceKey_) this.activeSource, @JsonKey(name: MusicAssistantPlayer.sourceListKey_) final  List<MusicAssistantPlayerSource>? sourceList, @JsonKey(name: MusicAssistantPlayer.activeGroupKey_) this.activeGroup, @JsonKey(name: MusicAssistantPlayer.currentMediaKey_) this.currentMedia, @JsonKey(name: MusicAssistantPlayer.enabledKey_) this.enabled = true, @JsonKey(name: MusicAssistantPlayer.hideInUiKey_) this.hideInUi = false, @JsonKey(name: MusicAssistantPlayer.privateKey_) this.private = false, @JsonKey(name: MusicAssistantPlayer.exposeToHaKey_) this.exposeToHa = true, @JsonKey(name: MusicAssistantPlayer.iconKey_) this.icon = 'speaker', @JsonKey(name: MusicAssistantPlayer.groupVolumeKey_) this.groupVolume, @JsonKey(name: MusicAssistantPlayer.groupVolumeMutedKey_) this.groupVolumeMuted, @JsonKey(name: MusicAssistantPlayer.extraAttributesKey_) final  Map<String, String?>? extraAttributes, @JsonKey(name: MusicAssistantPlayer.powerControlKey_) this.powerControl = 'none', @JsonKey(name: MusicAssistantPlayer.volumeControlKey_) this.volumeControl = 'none', @JsonKey(name: MusicAssistantPlayer.muteControlKey_) this.muteControl = 'none', @JsonKey(name: MusicAssistantPlayer.outputProtocolsKey_) final  List<MusicAssistantOutputProtocol>? outputProtocols, @JsonKey(name: MusicAssistantPlayer.activeOutputProtocolKey_) this.activeOutputProtocol, @JsonKey(name: MusicAssistantPlayer.needsSetupKey_) this.needsSetup = false, @JsonKey(name: MusicAssistantPlayer.setupReasonKey_) this.setupReason, @JsonKey(name: MusicAssistantPlayer.hasSetupFlowKey_) this.hasSetupFlow = false, @JsonKey(name: MusicAssistantPlayer.sleepTimerExpiresAtKey_) this.sleepTimerExpiresAt, @JsonKey(name: MusicAssistantPlayer.activeSourceAudioKey_) this.activeSourceAudio}): _supportedFeatures = supportedFeatures,_groupMembers = groupMembers,_staticGroupMembers = staticGroupMembers,_canGroupWith = canGroupWith,_soundModeList = soundModeList,_options = options,_sourceList = sourceList,_extraAttributes = extraAttributes,_outputProtocols = outputProtocols,super._();
  factory _MusicAssistantPlayer.fromJson(Map<String, dynamic> json) => _$MusicAssistantPlayerFromJson(json);

/// playerId
@override@JsonKey(name: MusicAssistantPlayer.playerIdKey_) final  String playerId;
/// provider
@override@JsonKey(name: MusicAssistantPlayer.providerKey_) final  String provider;
/// type
@override@JsonKey(name: MusicAssistantPlayer.typeKey_) final  MusicAssistantPlayerType type;
/// name
@override@JsonKey(name: MusicAssistantPlayer.nameKey_) final  String name;
/// available
@override@JsonKey(name: MusicAssistantPlayer.availableKey_) final  bool available;
/// deviceInfo
@override@JsonKey(name: MusicAssistantPlayer.deviceInfoKey_) final  MusicAssistantDeviceInfo deviceInfo;
/// supportedFeatures
 final  List<MusicAssistantPlayerFeature>? _supportedFeatures;
/// supportedFeatures
@override@JsonKey(name: MusicAssistantPlayer.supportedFeaturesKey_) List<MusicAssistantPlayerFeature>? get supportedFeatures {
  final value = _supportedFeatures;
  if (value == null) return null;
  if (_supportedFeatures is EqualUnmodifiableListView) return _supportedFeatures;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// playbackState
@override@JsonKey(name: MusicAssistantPlayer.playbackStateKey_) final  MusicAssistantPlaybackState playbackState;
/// elapsedTime
@override@JsonKey(name: MusicAssistantPlayer.elapsedTimeKey_) final  double? elapsedTime;
/// elapsedTimeLastUpdated
@override@JsonKey(name: MusicAssistantPlayer.elapsedTimeLastUpdatedKey_) final  double? elapsedTimeLastUpdated;
/// powered
@override@JsonKey(name: MusicAssistantPlayer.poweredKey_) final  bool? powered;
/// volumeLevel
@override@JsonKey(name: MusicAssistantPlayer.volumeLevelKey_) final  int? volumeLevel;
/// volumeMuted
@override@JsonKey(name: MusicAssistantPlayer.volumeMutedKey_) final  bool? volumeMuted;
/// groupMembers
 final  List<String>? _groupMembers;
/// groupMembers
@override@JsonKey(name: MusicAssistantPlayer.groupMembersKey_) List<String>? get groupMembers {
  final value = _groupMembers;
  if (value == null) return null;
  if (_groupMembers is EqualUnmodifiableListView) return _groupMembers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// staticGroupMembers
 final  List<String>? _staticGroupMembers;
/// staticGroupMembers
@override@JsonKey(name: MusicAssistantPlayer.staticGroupMembersKey_) List<String>? get staticGroupMembers {
  final value = _staticGroupMembers;
  if (value == null) return null;
  if (_staticGroupMembers is EqualUnmodifiableListView) return _staticGroupMembers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// canGroupWith
 final  List<String>? _canGroupWith;
/// canGroupWith
@override@JsonKey(name: MusicAssistantPlayer.canGroupWithKey_) List<String>? get canGroupWith {
  final value = _canGroupWith;
  if (value == null) return null;
  if (_canGroupWith is EqualUnmodifiableListView) return _canGroupWith;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// syncedTo
@override@JsonKey(name: MusicAssistantPlayer.syncedToKey_) final  String? syncedTo;
/// activeSoundMode
@override@JsonKey(name: MusicAssistantPlayer.activeSoundModeKey_) final  String? activeSoundMode;
/// soundModeList
 final  List<MusicAssistantPlayerSoundMode>? _soundModeList;
/// soundModeList
@override@JsonKey(name: MusicAssistantPlayer.soundModeListKey_) List<MusicAssistantPlayerSoundMode>? get soundModeList {
  final value = _soundModeList;
  if (value == null) return null;
  if (_soundModeList is EqualUnmodifiableListView) return _soundModeList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// options
 final  List<MusicAssistantPlayerOption>? _options;
/// options
@override@JsonKey(name: MusicAssistantPlayer.optionsKey_) List<MusicAssistantPlayerOption>? get options {
  final value = _options;
  if (value == null) return null;
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// activeSource
@override@JsonKey(name: MusicAssistantPlayer.activeSourceKey_) final  String? activeSource;
/// sourceList
 final  List<MusicAssistantPlayerSource>? _sourceList;
/// sourceList
@override@JsonKey(name: MusicAssistantPlayer.sourceListKey_) List<MusicAssistantPlayerSource>? get sourceList {
  final value = _sourceList;
  if (value == null) return null;
  if (_sourceList is EqualUnmodifiableListView) return _sourceList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// activeGroup
@override@JsonKey(name: MusicAssistantPlayer.activeGroupKey_) final  String? activeGroup;
/// currentMedia
@override@JsonKey(name: MusicAssistantPlayer.currentMediaKey_) final  MusicAssistantPlayerMedia? currentMedia;
/// enabled
@override@JsonKey(name: MusicAssistantPlayer.enabledKey_) final  bool enabled;
/// hideInUi
@override@JsonKey(name: MusicAssistantPlayer.hideInUiKey_) final  bool hideInUi;
/// private
@override@JsonKey(name: MusicAssistantPlayer.privateKey_) final  bool private;
/// exposeToHa
@override@JsonKey(name: MusicAssistantPlayer.exposeToHaKey_) final  bool exposeToHa;
/// icon
@override@JsonKey(name: MusicAssistantPlayer.iconKey_) final  String icon;
/// groupVolume
@override@JsonKey(name: MusicAssistantPlayer.groupVolumeKey_) final  int? groupVolume;
/// groupVolumeMuted
@override@JsonKey(name: MusicAssistantPlayer.groupVolumeMutedKey_) final  bool? groupVolumeMuted;
/// extraAttributes
 final  Map<String, String?>? _extraAttributes;
/// extraAttributes
@override@JsonKey(name: MusicAssistantPlayer.extraAttributesKey_) Map<String, String?>? get extraAttributes {
  final value = _extraAttributes;
  if (value == null) return null;
  if (_extraAttributes is EqualUnmodifiableMapView) return _extraAttributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

/// powerControl
@override@JsonKey(name: MusicAssistantPlayer.powerControlKey_) final  String powerControl;
/// volumeControl
@override@JsonKey(name: MusicAssistantPlayer.volumeControlKey_) final  String volumeControl;
/// muteControl
@override@JsonKey(name: MusicAssistantPlayer.muteControlKey_) final  String muteControl;
/// outputProtocols
 final  List<MusicAssistantOutputProtocol>? _outputProtocols;
/// outputProtocols
@override@JsonKey(name: MusicAssistantPlayer.outputProtocolsKey_) List<MusicAssistantOutputProtocol>? get outputProtocols {
  final value = _outputProtocols;
  if (value == null) return null;
  if (_outputProtocols is EqualUnmodifiableListView) return _outputProtocols;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// activeOutputProtocol
@override@JsonKey(name: MusicAssistantPlayer.activeOutputProtocolKey_) final  String? activeOutputProtocol;
/// needsSetup
@override@JsonKey(name: MusicAssistantPlayer.needsSetupKey_) final  bool needsSetup;
/// setupReason
@override@JsonKey(name: MusicAssistantPlayer.setupReasonKey_) final  String? setupReason;
/// hasSetupFlow
@override@JsonKey(name: MusicAssistantPlayer.hasSetupFlowKey_) final  bool hasSetupFlow;
/// sleepTimerExpiresAt
@override@JsonKey(name: MusicAssistantPlayer.sleepTimerExpiresAtKey_) final  double? sleepTimerExpiresAt;
/// activeSourceAudio
@override@JsonKey(name: MusicAssistantPlayer.activeSourceAudioKey_) final  MusicAssistantActiveSourceAudioDetails? activeSourceAudio;

/// Create a copy of MusicAssistantPlayer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicAssistantPlayerCopyWith<_MusicAssistantPlayer> get copyWith => __$MusicAssistantPlayerCopyWithImpl<_MusicAssistantPlayer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicAssistantPlayerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicAssistantPlayer&&(identical(other.playerId, playerId) || other.playerId == playerId)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name)&&(identical(other.available, available) || other.available == available)&&(identical(other.deviceInfo, deviceInfo) || other.deviceInfo == deviceInfo)&&const DeepCollectionEquality().equals(other._supportedFeatures, _supportedFeatures)&&(identical(other.playbackState, playbackState) || other.playbackState == playbackState)&&(identical(other.elapsedTime, elapsedTime) || other.elapsedTime == elapsedTime)&&(identical(other.elapsedTimeLastUpdated, elapsedTimeLastUpdated) || other.elapsedTimeLastUpdated == elapsedTimeLastUpdated)&&(identical(other.powered, powered) || other.powered == powered)&&(identical(other.volumeLevel, volumeLevel) || other.volumeLevel == volumeLevel)&&(identical(other.volumeMuted, volumeMuted) || other.volumeMuted == volumeMuted)&&const DeepCollectionEquality().equals(other._groupMembers, _groupMembers)&&const DeepCollectionEquality().equals(other._staticGroupMembers, _staticGroupMembers)&&const DeepCollectionEquality().equals(other._canGroupWith, _canGroupWith)&&(identical(other.syncedTo, syncedTo) || other.syncedTo == syncedTo)&&(identical(other.activeSoundMode, activeSoundMode) || other.activeSoundMode == activeSoundMode)&&const DeepCollectionEquality().equals(other._soundModeList, _soundModeList)&&const DeepCollectionEquality().equals(other._options, _options)&&(identical(other.activeSource, activeSource) || other.activeSource == activeSource)&&const DeepCollectionEquality().equals(other._sourceList, _sourceList)&&(identical(other.activeGroup, activeGroup) || other.activeGroup == activeGroup)&&(identical(other.currentMedia, currentMedia) || other.currentMedia == currentMedia)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.hideInUi, hideInUi) || other.hideInUi == hideInUi)&&(identical(other.private, private) || other.private == private)&&(identical(other.exposeToHa, exposeToHa) || other.exposeToHa == exposeToHa)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.groupVolume, groupVolume) || other.groupVolume == groupVolume)&&(identical(other.groupVolumeMuted, groupVolumeMuted) || other.groupVolumeMuted == groupVolumeMuted)&&const DeepCollectionEquality().equals(other._extraAttributes, _extraAttributes)&&(identical(other.powerControl, powerControl) || other.powerControl == powerControl)&&(identical(other.volumeControl, volumeControl) || other.volumeControl == volumeControl)&&(identical(other.muteControl, muteControl) || other.muteControl == muteControl)&&const DeepCollectionEquality().equals(other._outputProtocols, _outputProtocols)&&(identical(other.activeOutputProtocol, activeOutputProtocol) || other.activeOutputProtocol == activeOutputProtocol)&&(identical(other.needsSetup, needsSetup) || other.needsSetup == needsSetup)&&(identical(other.setupReason, setupReason) || other.setupReason == setupReason)&&(identical(other.hasSetupFlow, hasSetupFlow) || other.hasSetupFlow == hasSetupFlow)&&(identical(other.sleepTimerExpiresAt, sleepTimerExpiresAt) || other.sleepTimerExpiresAt == sleepTimerExpiresAt)&&(identical(other.activeSourceAudio, activeSourceAudio) || other.activeSourceAudio == activeSourceAudio));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,playerId,provider,type,name,available,deviceInfo,const DeepCollectionEquality().hash(_supportedFeatures),playbackState,elapsedTime,elapsedTimeLastUpdated,powered,volumeLevel,volumeMuted,const DeepCollectionEquality().hash(_groupMembers),const DeepCollectionEquality().hash(_staticGroupMembers),const DeepCollectionEquality().hash(_canGroupWith),syncedTo,activeSoundMode,const DeepCollectionEquality().hash(_soundModeList),const DeepCollectionEquality().hash(_options),activeSource,const DeepCollectionEquality().hash(_sourceList),activeGroup,currentMedia,enabled,hideInUi,private,exposeToHa,icon,groupVolume,groupVolumeMuted,const DeepCollectionEquality().hash(_extraAttributes),powerControl,volumeControl,muteControl,const DeepCollectionEquality().hash(_outputProtocols),activeOutputProtocol,needsSetup,setupReason,hasSetupFlow,sleepTimerExpiresAt,activeSourceAudio]);

@override
String toString() {
  return 'MusicAssistantPlayer(playerId: $playerId, provider: $provider, type: $type, name: $name, available: $available, deviceInfo: $deviceInfo, supportedFeatures: $supportedFeatures, playbackState: $playbackState, elapsedTime: $elapsedTime, elapsedTimeLastUpdated: $elapsedTimeLastUpdated, powered: $powered, volumeLevel: $volumeLevel, volumeMuted: $volumeMuted, groupMembers: $groupMembers, staticGroupMembers: $staticGroupMembers, canGroupWith: $canGroupWith, syncedTo: $syncedTo, activeSoundMode: $activeSoundMode, soundModeList: $soundModeList, options: $options, activeSource: $activeSource, sourceList: $sourceList, activeGroup: $activeGroup, currentMedia: $currentMedia, enabled: $enabled, hideInUi: $hideInUi, private: $private, exposeToHa: $exposeToHa, icon: $icon, groupVolume: $groupVolume, groupVolumeMuted: $groupVolumeMuted, extraAttributes: $extraAttributes, powerControl: $powerControl, volumeControl: $volumeControl, muteControl: $muteControl, outputProtocols: $outputProtocols, activeOutputProtocol: $activeOutputProtocol, needsSetup: $needsSetup, setupReason: $setupReason, hasSetupFlow: $hasSetupFlow, sleepTimerExpiresAt: $sleepTimerExpiresAt, activeSourceAudio: $activeSourceAudio)';
}


}

/// @nodoc
abstract mixin class _$MusicAssistantPlayerCopyWith<$Res> implements $MusicAssistantPlayerCopyWith<$Res> {
  factory _$MusicAssistantPlayerCopyWith(_MusicAssistantPlayer value, $Res Function(_MusicAssistantPlayer) _then) = __$MusicAssistantPlayerCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: MusicAssistantPlayer.playerIdKey_) String playerId,@JsonKey(name: MusicAssistantPlayer.providerKey_) String provider,@JsonKey(name: MusicAssistantPlayer.typeKey_) MusicAssistantPlayerType type,@JsonKey(name: MusicAssistantPlayer.nameKey_) String name,@JsonKey(name: MusicAssistantPlayer.availableKey_) bool available,@JsonKey(name: MusicAssistantPlayer.deviceInfoKey_) MusicAssistantDeviceInfo deviceInfo,@JsonKey(name: MusicAssistantPlayer.supportedFeaturesKey_) List<MusicAssistantPlayerFeature>? supportedFeatures,@JsonKey(name: MusicAssistantPlayer.playbackStateKey_) MusicAssistantPlaybackState playbackState,@JsonKey(name: MusicAssistantPlayer.elapsedTimeKey_) double? elapsedTime,@JsonKey(name: MusicAssistantPlayer.elapsedTimeLastUpdatedKey_) double? elapsedTimeLastUpdated,@JsonKey(name: MusicAssistantPlayer.poweredKey_) bool? powered,@JsonKey(name: MusicAssistantPlayer.volumeLevelKey_) int? volumeLevel,@JsonKey(name: MusicAssistantPlayer.volumeMutedKey_) bool? volumeMuted,@JsonKey(name: MusicAssistantPlayer.groupMembersKey_) List<String>? groupMembers,@JsonKey(name: MusicAssistantPlayer.staticGroupMembersKey_) List<String>? staticGroupMembers,@JsonKey(name: MusicAssistantPlayer.canGroupWithKey_) List<String>? canGroupWith,@JsonKey(name: MusicAssistantPlayer.syncedToKey_) String? syncedTo,@JsonKey(name: MusicAssistantPlayer.activeSoundModeKey_) String? activeSoundMode,@JsonKey(name: MusicAssistantPlayer.soundModeListKey_) List<MusicAssistantPlayerSoundMode>? soundModeList,@JsonKey(name: MusicAssistantPlayer.optionsKey_) List<MusicAssistantPlayerOption>? options,@JsonKey(name: MusicAssistantPlayer.activeSourceKey_) String? activeSource,@JsonKey(name: MusicAssistantPlayer.sourceListKey_) List<MusicAssistantPlayerSource>? sourceList,@JsonKey(name: MusicAssistantPlayer.activeGroupKey_) String? activeGroup,@JsonKey(name: MusicAssistantPlayer.currentMediaKey_) MusicAssistantPlayerMedia? currentMedia,@JsonKey(name: MusicAssistantPlayer.enabledKey_) bool enabled,@JsonKey(name: MusicAssistantPlayer.hideInUiKey_) bool hideInUi,@JsonKey(name: MusicAssistantPlayer.privateKey_) bool private,@JsonKey(name: MusicAssistantPlayer.exposeToHaKey_) bool exposeToHa,@JsonKey(name: MusicAssistantPlayer.iconKey_) String icon,@JsonKey(name: MusicAssistantPlayer.groupVolumeKey_) int? groupVolume,@JsonKey(name: MusicAssistantPlayer.groupVolumeMutedKey_) bool? groupVolumeMuted,@JsonKey(name: MusicAssistantPlayer.extraAttributesKey_) Map<String, String?>? extraAttributes,@JsonKey(name: MusicAssistantPlayer.powerControlKey_) String powerControl,@JsonKey(name: MusicAssistantPlayer.volumeControlKey_) String volumeControl,@JsonKey(name: MusicAssistantPlayer.muteControlKey_) String muteControl,@JsonKey(name: MusicAssistantPlayer.outputProtocolsKey_) List<MusicAssistantOutputProtocol>? outputProtocols,@JsonKey(name: MusicAssistantPlayer.activeOutputProtocolKey_) String? activeOutputProtocol,@JsonKey(name: MusicAssistantPlayer.needsSetupKey_) bool needsSetup,@JsonKey(name: MusicAssistantPlayer.setupReasonKey_) String? setupReason,@JsonKey(name: MusicAssistantPlayer.hasSetupFlowKey_) bool hasSetupFlow,@JsonKey(name: MusicAssistantPlayer.sleepTimerExpiresAtKey_) double? sleepTimerExpiresAt,@JsonKey(name: MusicAssistantPlayer.activeSourceAudioKey_) MusicAssistantActiveSourceAudioDetails? activeSourceAudio
});


@override $MusicAssistantDeviceInfoCopyWith<$Res> get deviceInfo;@override $MusicAssistantPlayerMediaCopyWith<$Res>? get currentMedia;@override $MusicAssistantActiveSourceAudioDetailsCopyWith<$Res>? get activeSourceAudio;

}
/// @nodoc
class __$MusicAssistantPlayerCopyWithImpl<$Res>
    implements _$MusicAssistantPlayerCopyWith<$Res> {
  __$MusicAssistantPlayerCopyWithImpl(this._self, this._then);

  final _MusicAssistantPlayer _self;
  final $Res Function(_MusicAssistantPlayer) _then;

/// Create a copy of MusicAssistantPlayer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? playerId = null,Object? provider = null,Object? type = null,Object? name = null,Object? available = null,Object? deviceInfo = null,Object? supportedFeatures = freezed,Object? playbackState = null,Object? elapsedTime = freezed,Object? elapsedTimeLastUpdated = freezed,Object? powered = freezed,Object? volumeLevel = freezed,Object? volumeMuted = freezed,Object? groupMembers = freezed,Object? staticGroupMembers = freezed,Object? canGroupWith = freezed,Object? syncedTo = freezed,Object? activeSoundMode = freezed,Object? soundModeList = freezed,Object? options = freezed,Object? activeSource = freezed,Object? sourceList = freezed,Object? activeGroup = freezed,Object? currentMedia = freezed,Object? enabled = null,Object? hideInUi = null,Object? private = null,Object? exposeToHa = null,Object? icon = null,Object? groupVolume = freezed,Object? groupVolumeMuted = freezed,Object? extraAttributes = freezed,Object? powerControl = null,Object? volumeControl = null,Object? muteControl = null,Object? outputProtocols = freezed,Object? activeOutputProtocol = freezed,Object? needsSetup = null,Object? setupReason = freezed,Object? hasSetupFlow = null,Object? sleepTimerExpiresAt = freezed,Object? activeSourceAudio = freezed,}) {
  return _then(_MusicAssistantPlayer(
playerId: null == playerId ? _self.playerId : playerId // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MusicAssistantPlayerType,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as bool,deviceInfo: null == deviceInfo ? _self.deviceInfo : deviceInfo // ignore: cast_nullable_to_non_nullable
as MusicAssistantDeviceInfo,supportedFeatures: freezed == supportedFeatures ? _self._supportedFeatures : supportedFeatures // ignore: cast_nullable_to_non_nullable
as List<MusicAssistantPlayerFeature>?,playbackState: null == playbackState ? _self.playbackState : playbackState // ignore: cast_nullable_to_non_nullable
as MusicAssistantPlaybackState,elapsedTime: freezed == elapsedTime ? _self.elapsedTime : elapsedTime // ignore: cast_nullable_to_non_nullable
as double?,elapsedTimeLastUpdated: freezed == elapsedTimeLastUpdated ? _self.elapsedTimeLastUpdated : elapsedTimeLastUpdated // ignore: cast_nullable_to_non_nullable
as double?,powered: freezed == powered ? _self.powered : powered // ignore: cast_nullable_to_non_nullable
as bool?,volumeLevel: freezed == volumeLevel ? _self.volumeLevel : volumeLevel // ignore: cast_nullable_to_non_nullable
as int?,volumeMuted: freezed == volumeMuted ? _self.volumeMuted : volumeMuted // ignore: cast_nullable_to_non_nullable
as bool?,groupMembers: freezed == groupMembers ? _self._groupMembers : groupMembers // ignore: cast_nullable_to_non_nullable
as List<String>?,staticGroupMembers: freezed == staticGroupMembers ? _self._staticGroupMembers : staticGroupMembers // ignore: cast_nullable_to_non_nullable
as List<String>?,canGroupWith: freezed == canGroupWith ? _self._canGroupWith : canGroupWith // ignore: cast_nullable_to_non_nullable
as List<String>?,syncedTo: freezed == syncedTo ? _self.syncedTo : syncedTo // ignore: cast_nullable_to_non_nullable
as String?,activeSoundMode: freezed == activeSoundMode ? _self.activeSoundMode : activeSoundMode // ignore: cast_nullable_to_non_nullable
as String?,soundModeList: freezed == soundModeList ? _self._soundModeList : soundModeList // ignore: cast_nullable_to_non_nullable
as List<MusicAssistantPlayerSoundMode>?,options: freezed == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<MusicAssistantPlayerOption>?,activeSource: freezed == activeSource ? _self.activeSource : activeSource // ignore: cast_nullable_to_non_nullable
as String?,sourceList: freezed == sourceList ? _self._sourceList : sourceList // ignore: cast_nullable_to_non_nullable
as List<MusicAssistantPlayerSource>?,activeGroup: freezed == activeGroup ? _self.activeGroup : activeGroup // ignore: cast_nullable_to_non_nullable
as String?,currentMedia: freezed == currentMedia ? _self.currentMedia : currentMedia // ignore: cast_nullable_to_non_nullable
as MusicAssistantPlayerMedia?,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,hideInUi: null == hideInUi ? _self.hideInUi : hideInUi // ignore: cast_nullable_to_non_nullable
as bool,private: null == private ? _self.private : private // ignore: cast_nullable_to_non_nullable
as bool,exposeToHa: null == exposeToHa ? _self.exposeToHa : exposeToHa // ignore: cast_nullable_to_non_nullable
as bool,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,groupVolume: freezed == groupVolume ? _self.groupVolume : groupVolume // ignore: cast_nullable_to_non_nullable
as int?,groupVolumeMuted: freezed == groupVolumeMuted ? _self.groupVolumeMuted : groupVolumeMuted // ignore: cast_nullable_to_non_nullable
as bool?,extraAttributes: freezed == extraAttributes ? _self._extraAttributes : extraAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, String?>?,powerControl: null == powerControl ? _self.powerControl : powerControl // ignore: cast_nullable_to_non_nullable
as String,volumeControl: null == volumeControl ? _self.volumeControl : volumeControl // ignore: cast_nullable_to_non_nullable
as String,muteControl: null == muteControl ? _self.muteControl : muteControl // ignore: cast_nullable_to_non_nullable
as String,outputProtocols: freezed == outputProtocols ? _self._outputProtocols : outputProtocols // ignore: cast_nullable_to_non_nullable
as List<MusicAssistantOutputProtocol>?,activeOutputProtocol: freezed == activeOutputProtocol ? _self.activeOutputProtocol : activeOutputProtocol // ignore: cast_nullable_to_non_nullable
as String?,needsSetup: null == needsSetup ? _self.needsSetup : needsSetup // ignore: cast_nullable_to_non_nullable
as bool,setupReason: freezed == setupReason ? _self.setupReason : setupReason // ignore: cast_nullable_to_non_nullable
as String?,hasSetupFlow: null == hasSetupFlow ? _self.hasSetupFlow : hasSetupFlow // ignore: cast_nullable_to_non_nullable
as bool,sleepTimerExpiresAt: freezed == sleepTimerExpiresAt ? _self.sleepTimerExpiresAt : sleepTimerExpiresAt // ignore: cast_nullable_to_non_nullable
as double?,activeSourceAudio: freezed == activeSourceAudio ? _self.activeSourceAudio : activeSourceAudio // ignore: cast_nullable_to_non_nullable
as MusicAssistantActiveSourceAudioDetails?,
  ));
}

/// Create a copy of MusicAssistantPlayer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantDeviceInfoCopyWith<$Res> get deviceInfo {
  
  return $MusicAssistantDeviceInfoCopyWith<$Res>(_self.deviceInfo, (value) {
    return _then(_self.copyWith(deviceInfo: value));
  });
}/// Create a copy of MusicAssistantPlayer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantPlayerMediaCopyWith<$Res>? get currentMedia {
    if (_self.currentMedia == null) {
    return null;
  }

  return $MusicAssistantPlayerMediaCopyWith<$Res>(_self.currentMedia!, (value) {
    return _then(_self.copyWith(currentMedia: value));
  });
}/// Create a copy of MusicAssistantPlayer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicAssistantActiveSourceAudioDetailsCopyWith<$Res>? get activeSourceAudio {
    if (_self.activeSourceAudio == null) {
    return null;
  }

  return $MusicAssistantActiveSourceAudioDetailsCopyWith<$Res>(_self.activeSourceAudio!, (value) {
    return _then(_self.copyWith(activeSourceAudio: value));
  });
}
}

// dart format on
