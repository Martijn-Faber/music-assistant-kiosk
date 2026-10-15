// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantPlayer _$MusicAssistantPlayerFromJson(
  Map<String, dynamic> json,
) => _MusicAssistantPlayer(
  playerId: json['player_id'] as String,
  provider: json['provider'] as String,
  type: MusicAssistantPlayerType.fromJson(json['type'] as String),
  name: json['name'] as String,
  available: json['available'] as bool,
  deviceInfo: MusicAssistantDeviceInfo.fromJson(
    json['device_info'] as Map<String, dynamic>,
  ),
  supportedFeatures: (json['supported_features'] as List<dynamic>?)
      ?.map((e) => MusicAssistantPlayerFeature.fromJson(e as String))
      .toList(),
  playbackState: json['playback_state'] == null
      ? MusicAssistantPlaybackState.idle
      : MusicAssistantPlaybackState.fromJson(json['playback_state'] as String),
  elapsedTime: (json['elapsed_time'] as num?)?.toDouble(),
  elapsedTimeLastUpdated: (json['elapsed_time_last_updated'] as num?)
      ?.toDouble(),
  powered: json['powered'] as bool?,
  volumeLevel: (json['volume_level'] as num?)?.toInt(),
  volumeMuted: json['volume_muted'] as bool?,
  groupMembers: (json['group_members'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  staticGroupMembers: (json['static_group_members'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  canGroupWith: (json['can_group_with'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  syncedTo: json['synced_to'] as String?,
  activeSoundMode: json['active_sound_mode'] as String?,
  soundModeList: (json['sound_mode_list'] as List<dynamic>?)
      ?.map(
        (e) =>
            MusicAssistantPlayerSoundMode.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  options: (json['options'] as List<dynamic>?)
      ?.map(
        (e) => MusicAssistantPlayerOption.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  activeSource: json['active_source'] as String?,
  sourceList: (json['source_list'] as List<dynamic>?)
      ?.map(
        (e) => MusicAssistantPlayerSource.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  activeGroup: json['active_group'] as String?,
  currentMedia: json['current_media'] == null
      ? null
      : MusicAssistantPlayerMedia.fromJson(
          json['current_media'] as Map<String, dynamic>,
        ),
  enabled: json['enabled'] as bool? ?? true,
  hideInUi: json['hide_in_ui'] as bool? ?? false,
  private: json['private'] as bool? ?? false,
  exposeToHa: json['expose_to_ha'] as bool? ?? true,
  icon: json['icon'] as String? ?? 'speaker',
  groupVolume: (json['group_volume'] as num?)?.toInt(),
  groupVolumeMuted: json['group_volume_muted'] as bool?,
  extraAttributes: (json['extra_attributes'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  powerControl: json['power_control'] as String? ?? 'none',
  volumeControl: json['volume_control'] as String? ?? 'none',
  muteControl: json['mute_control'] as String? ?? 'none',
  outputProtocols: (json['output_protocols'] as List<dynamic>?)
      ?.map(
        (e) => MusicAssistantOutputProtocol.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  activeOutputProtocol: json['active_output_protocol'] as String?,
  needsSetup: json['needs_setup'] as bool? ?? false,
  setupReason: json['setup_reason'] as String?,
  hasSetupFlow: json['has_setup_flow'] as bool? ?? false,
  sleepTimerExpiresAt: (json['sleep_timer_expires_at'] as num?)?.toDouble(),
  activeSourceAudio: json['active_source_audio'] == null
      ? null
      : MusicAssistantActiveSourceAudioDetails.fromJson(
          json['active_source_audio'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$MusicAssistantPlayerToJson(
  _MusicAssistantPlayer instance,
) => <String, dynamic>{
  'player_id': instance.playerId,
  'provider': instance.provider,
  'type': instance.type.toJson(),
  'name': instance.name,
  'available': instance.available,
  'device_info': instance.deviceInfo.toJson(),
  'supported_features': instance.supportedFeatures
      ?.map((e) => e.toJson())
      .toList(),
  'playback_state': instance.playbackState.toJson(),
  'elapsed_time': instance.elapsedTime,
  'elapsed_time_last_updated': instance.elapsedTimeLastUpdated,
  'powered': instance.powered,
  'volume_level': instance.volumeLevel,
  'volume_muted': instance.volumeMuted,
  'group_members': instance.groupMembers,
  'static_group_members': instance.staticGroupMembers,
  'can_group_with': instance.canGroupWith,
  'synced_to': instance.syncedTo,
  'active_sound_mode': instance.activeSoundMode,
  'sound_mode_list': instance.soundModeList?.map((e) => e.toJson()).toList(),
  'options': instance.options?.map((e) => e.toJson()).toList(),
  'active_source': instance.activeSource,
  'source_list': instance.sourceList?.map((e) => e.toJson()).toList(),
  'active_group': instance.activeGroup,
  'current_media': instance.currentMedia?.toJson(),
  'enabled': instance.enabled,
  'hide_in_ui': instance.hideInUi,
  'private': instance.private,
  'expose_to_ha': instance.exposeToHa,
  'icon': instance.icon,
  'group_volume': instance.groupVolume,
  'group_volume_muted': instance.groupVolumeMuted,
  'extra_attributes': instance.extraAttributes,
  'power_control': instance.powerControl,
  'volume_control': instance.volumeControl,
  'mute_control': instance.muteControl,
  'output_protocols': instance.outputProtocols?.map((e) => e.toJson()).toList(),
  'active_output_protocol': instance.activeOutputProtocol,
  'needs_setup': instance.needsSetup,
  'setup_reason': instance.setupReason,
  'has_setup_flow': instance.hasSetupFlow,
  'sleep_timer_expires_at': instance.sleepTimerExpiresAt,
  'active_source_audio': instance.activeSourceAudio?.toJson(),
};
