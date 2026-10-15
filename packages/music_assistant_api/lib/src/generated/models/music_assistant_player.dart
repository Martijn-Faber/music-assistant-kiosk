/// Player
///
/// ```json
/// {
///     "properties": {
///         "player_id": {
///             "type": "string"
///         },
///         "provider": {
///             "type": "string"
///         },
///         "type": {
///             "$ref": "#/components/schemas/PlayerType"
///         },
///         "name": {
///             "type": "string"
///         },
///         "available": {
///             "type": "boolean"
///         },
///         "device_info": {
///             "$ref": "#/components/schemas/DeviceInfo"
///         },
///         "supported_features": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/PlayerFeature"
///             }
///         },
///         "playback_state": {
///             "$ref": "#/components/schemas/PlaybackState",
///             "default": "idle"
///         },
///         "elapsed_time": {
///             "type": "number",
///             "nullable": true
///         },
///         "elapsed_time_last_updated": {
///             "type": "number",
///             "nullable": true
///         },
///         "powered": {
///             "type": "boolean",
///             "nullable": true
///         },
///         "volume_level": {
///             "type": "integer",
///             "nullable": true
///         },
///         "volume_muted": {
///             "type": "boolean",
///             "nullable": true
///         },
///         "group_members": {
///             "type": "array",
///             "items": {
///                 "type": "string"
///             }
///         },
///         "static_group_members": {
///             "type": "array",
///             "items": {
///                 "type": "string"
///             }
///         },
///         "can_group_with": {
///             "type": "array",
///             "items": {
///                 "type": "string"
///             }
///         },
///         "synced_to": {
///             "type": "string",
///             "nullable": true
///         },
///         "active_sound_mode": {
///             "type": "string",
///             "nullable": true
///         },
///         "sound_mode_list": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/PlayerSoundMode"
///             }
///         },
///         "options": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/PlayerOption"
///             }
///         },
///         "active_source": {
///             "type": "string",
///             "nullable": true
///         },
///         "source_list": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/PlayerSource"
///             }
///         },
///         "active_group": {
///             "type": "string",
///             "nullable": true
///         },
///         "current_media": {
///             "$ref": "#/components/schemas/PlayerMedia",
///             "nullable": true
///         },
///         "enabled": {
///             "type": "boolean",
///             "default": true
///         },
///         "hide_in_ui": {
///             "type": "boolean",
///             "default": false
///         },
///         "private": {
///             "type": "boolean",
///             "default": false
///         },
///         "expose_to_ha": {
///             "type": "boolean",
///             "default": true
///         },
///         "icon": {
///             "type": "string",
///             "default": "speaker"
///         },
///         "group_volume": {
///             "type": "integer",
///             "nullable": true
///         },
///         "group_volume_muted": {
///             "type": "boolean",
///             "nullable": true
///         },
///         "extra_attributes": {
///             "type": "object",
///             "additionalProperties": {
///                 "type": "string",
///                 "nullable": true
///             }
///         },
///         "power_control": {
///             "type": "string",
///             "default": "none"
///         },
///         "volume_control": {
///             "type": "string",
///             "default": "none"
///         },
///         "mute_control": {
///             "type": "string",
///             "default": "none"
///         },
///         "output_protocols": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/OutputProtocol"
///             }
///         },
///         "active_output_protocol": {
///             "type": "string",
///             "nullable": true
///         },
///         "needs_setup": {
///             "type": "boolean",
///             "default": false
///         },
///         "setup_reason": {
///             "type": "string",
///             "nullable": true
///         },
///         "has_setup_flow": {
///             "type": "boolean",
///             "default": false
///         },
///         "sleep_timer_expires_at": {
///             "type": "number",
///             "nullable": true
///         },
///         "active_source_audio": {
///             "$ref": "#/components/schemas/ActiveSourceAudioDetails",
///             "nullable": true
///         }
///     },
///     "type": "object",
///     "required": [
///         "player_id",
///         "provider",
///         "type",
///         "name",
///         "available",
///         "device_info"
///     ]
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_player.freezed.dart';
part 'music_assistant_player.g.dart';

@freezed
abstract class MusicAssistantPlayer with _$MusicAssistantPlayer {
  const MusicAssistantPlayer._();

  @jsonSerializable
  const factory MusicAssistantPlayer({
    /// playerId
    @JsonKey(name: MusicAssistantPlayer.playerIdKey_) required String playerId,

    /// provider
    @JsonKey(name: MusicAssistantPlayer.providerKey_) required String provider,

    /// type
    @JsonKey(name: MusicAssistantPlayer.typeKey_)
    required MusicAssistantPlayerType type,

    /// name
    @JsonKey(name: MusicAssistantPlayer.nameKey_) required String name,

    /// available
    @JsonKey(name: MusicAssistantPlayer.availableKey_) required bool available,

    /// deviceInfo
    @JsonKey(name: MusicAssistantPlayer.deviceInfoKey_)
    required MusicAssistantDeviceInfo deviceInfo,

    /// supportedFeatures
    @JsonKey(name: MusicAssistantPlayer.supportedFeaturesKey_)
    List<MusicAssistantPlayerFeature>? supportedFeatures,

    /// playbackState
    @Default(MusicAssistantPlaybackState.idle)
    @JsonKey(name: MusicAssistantPlayer.playbackStateKey_)
    MusicAssistantPlaybackState playbackState,

    /// elapsedTime
    @JsonKey(name: MusicAssistantPlayer.elapsedTimeKey_) double? elapsedTime,

    /// elapsedTimeLastUpdated
    @JsonKey(name: MusicAssistantPlayer.elapsedTimeLastUpdatedKey_)
    double? elapsedTimeLastUpdated,

    /// powered
    @JsonKey(name: MusicAssistantPlayer.poweredKey_) bool? powered,

    /// volumeLevel
    @JsonKey(name: MusicAssistantPlayer.volumeLevelKey_) int? volumeLevel,

    /// volumeMuted
    @JsonKey(name: MusicAssistantPlayer.volumeMutedKey_) bool? volumeMuted,

    /// groupMembers
    @JsonKey(name: MusicAssistantPlayer.groupMembersKey_)
    List<String>? groupMembers,

    /// staticGroupMembers
    @JsonKey(name: MusicAssistantPlayer.staticGroupMembersKey_)
    List<String>? staticGroupMembers,

    /// canGroupWith
    @JsonKey(name: MusicAssistantPlayer.canGroupWithKey_)
    List<String>? canGroupWith,

    /// syncedTo
    @JsonKey(name: MusicAssistantPlayer.syncedToKey_) String? syncedTo,

    /// activeSoundMode
    @JsonKey(name: MusicAssistantPlayer.activeSoundModeKey_)
    String? activeSoundMode,

    /// soundModeList
    @JsonKey(name: MusicAssistantPlayer.soundModeListKey_)
    List<MusicAssistantPlayerSoundMode>? soundModeList,

    /// options
    @JsonKey(name: MusicAssistantPlayer.optionsKey_)
    List<MusicAssistantPlayerOption>? options,

    /// activeSource
    @JsonKey(name: MusicAssistantPlayer.activeSourceKey_) String? activeSource,

    /// sourceList
    @JsonKey(name: MusicAssistantPlayer.sourceListKey_)
    List<MusicAssistantPlayerSource>? sourceList,

    /// activeGroup
    @JsonKey(name: MusicAssistantPlayer.activeGroupKey_) String? activeGroup,

    /// currentMedia
    @JsonKey(name: MusicAssistantPlayer.currentMediaKey_)
    MusicAssistantPlayerMedia? currentMedia,

    /// enabled
    @Default(true)
    @JsonKey(name: MusicAssistantPlayer.enabledKey_)
    bool enabled,

    /// hideInUi
    @Default(false)
    @JsonKey(name: MusicAssistantPlayer.hideInUiKey_)
    bool hideInUi,

    /// private
    @Default(false)
    @JsonKey(name: MusicAssistantPlayer.privateKey_)
    bool private,

    /// exposeToHa
    @Default(true)
    @JsonKey(name: MusicAssistantPlayer.exposeToHaKey_)
    bool exposeToHa,

    /// icon
    @Default('speaker')
    @JsonKey(name: MusicAssistantPlayer.iconKey_)
    String icon,

    /// groupVolume
    @JsonKey(name: MusicAssistantPlayer.groupVolumeKey_) int? groupVolume,

    /// groupVolumeMuted
    @JsonKey(name: MusicAssistantPlayer.groupVolumeMutedKey_)
    bool? groupVolumeMuted,

    /// extraAttributes
    @JsonKey(name: MusicAssistantPlayer.extraAttributesKey_)
    Map<String, String?>? extraAttributes,

    /// powerControl
    @Default('none')
    @JsonKey(name: MusicAssistantPlayer.powerControlKey_)
    String powerControl,

    /// volumeControl
    @Default('none')
    @JsonKey(name: MusicAssistantPlayer.volumeControlKey_)
    String volumeControl,

    /// muteControl
    @Default('none')
    @JsonKey(name: MusicAssistantPlayer.muteControlKey_)
    String muteControl,

    /// outputProtocols
    @JsonKey(name: MusicAssistantPlayer.outputProtocolsKey_)
    List<MusicAssistantOutputProtocol>? outputProtocols,

    /// activeOutputProtocol
    @JsonKey(name: MusicAssistantPlayer.activeOutputProtocolKey_)
    String? activeOutputProtocol,

    /// needsSetup
    @Default(false)
    @JsonKey(name: MusicAssistantPlayer.needsSetupKey_)
    bool needsSetup,

    /// setupReason
    @JsonKey(name: MusicAssistantPlayer.setupReasonKey_) String? setupReason,

    /// hasSetupFlow
    @Default(false)
    @JsonKey(name: MusicAssistantPlayer.hasSetupFlowKey_)
    bool hasSetupFlow,

    /// sleepTimerExpiresAt
    @JsonKey(name: MusicAssistantPlayer.sleepTimerExpiresAtKey_)
    double? sleepTimerExpiresAt,

    /// activeSourceAudio
    @JsonKey(name: MusicAssistantPlayer.activeSourceAudioKey_)
    MusicAssistantActiveSourceAudioDetails? activeSourceAudio,
  }) = _MusicAssistantPlayer;

  factory MusicAssistantPlayer.fromJson(Map<String, dynamic> json) =>
      _$MusicAssistantPlayerFromJson(json);

  static const String playerIdKey_ = 'player_id';

  static const String providerKey_ = 'provider';

  static const String typeKey_ = 'type';

  static const String nameKey_ = 'name';

  static const String availableKey_ = 'available';

  static const String deviceInfoKey_ = 'device_info';

  static const String supportedFeaturesKey_ = 'supported_features';

  static const String playbackStateKey_ = 'playback_state';

  static const String elapsedTimeKey_ = 'elapsed_time';

  static const String elapsedTimeLastUpdatedKey_ = 'elapsed_time_last_updated';

  static const String poweredKey_ = 'powered';

  static const String volumeLevelKey_ = 'volume_level';

  static const String volumeMutedKey_ = 'volume_muted';

  static const String groupMembersKey_ = 'group_members';

  static const String staticGroupMembersKey_ = 'static_group_members';

  static const String canGroupWithKey_ = 'can_group_with';

  static const String syncedToKey_ = 'synced_to';

  static const String activeSoundModeKey_ = 'active_sound_mode';

  static const String soundModeListKey_ = 'sound_mode_list';

  static const String optionsKey_ = 'options';

  static const String activeSourceKey_ = 'active_source';

  static const String sourceListKey_ = 'source_list';

  static const String activeGroupKey_ = 'active_group';

  static const String currentMediaKey_ = 'current_media';

  static const String enabledKey_ = 'enabled';

  static const String hideInUiKey_ = 'hide_in_ui';

  static const String privateKey_ = 'private';

  static const String exposeToHaKey_ = 'expose_to_ha';

  static const String iconKey_ = 'icon';

  static const String groupVolumeKey_ = 'group_volume';

  static const String groupVolumeMutedKey_ = 'group_volume_muted';

  static const String extraAttributesKey_ = 'extra_attributes';

  static const String powerControlKey_ = 'power_control';

  static const String volumeControlKey_ = 'volume_control';

  static const String muteControlKey_ = 'mute_control';

  static const String outputProtocolsKey_ = 'output_protocols';

  static const String activeOutputProtocolKey_ = 'active_output_protocol';

  static const String needsSetupKey_ = 'needs_setup';

  static const String setupReasonKey_ = 'setup_reason';

  static const String hasSetupFlowKey_ = 'has_setup_flow';

  static const String sleepTimerExpiresAtKey_ = 'sleep_timer_expires_at';

  static const String activeSourceAudioKey_ = 'active_source_audio';
}
