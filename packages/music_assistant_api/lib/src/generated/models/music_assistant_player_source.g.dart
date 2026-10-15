// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_player_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantPlayerSource _$MusicAssistantPlayerSourceFromJson(
  Map<String, dynamic> json,
) => _MusicAssistantPlayerSource(
  id: json['id'] as String,
  name: json['name'] as String,
  passive: json['passive'] as bool? ?? false,
  canPlayPause: json['can_play_pause'] as bool? ?? false,
  canSeek: json['can_seek'] as bool? ?? false,
  canNextPrevious: json['can_next_previous'] as bool? ?? false,
  canShuffle: json['can_shuffle'] as bool? ?? false,
  canRepeat: json['can_repeat'] as bool? ?? false,
  shuffleEnabled: json['shuffle_enabled'] as bool?,
  repeatMode: json['repeat_mode'] == null
      ? null
      : MusicAssistantRepeatMode.fromJson(json['repeat_mode'] as String),
  accountId: json['account_id'] as String?,
);

Map<String, dynamic> _$MusicAssistantPlayerSourceToJson(
  _MusicAssistantPlayerSource instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'passive': instance.passive,
  'can_play_pause': instance.canPlayPause,
  'can_seek': instance.canSeek,
  'can_next_previous': instance.canNextPrevious,
  'can_shuffle': instance.canShuffle,
  'can_repeat': instance.canRepeat,
  'shuffle_enabled': instance.shuffleEnabled,
  'repeat_mode': instance.repeatMode?.toJson(),
  'account_id': instance.accountId,
};
