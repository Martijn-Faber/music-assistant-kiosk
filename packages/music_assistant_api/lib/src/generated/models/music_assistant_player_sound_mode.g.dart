// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_player_sound_mode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantPlayerSoundMode _$MusicAssistantPlayerSoundModeFromJson(
  Map<String, dynamic> json,
) => _MusicAssistantPlayerSoundMode(
  id: json['id'] as String,
  name: json['name'] as String,
  passive: json['passive'] as bool? ?? false,
  translationKey: json['translation_key'] as String? ?? '',
);

Map<String, dynamic> _$MusicAssistantPlayerSoundModeToJson(
  _MusicAssistantPlayerSoundMode instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'passive': instance.passive,
  'translation_key': instance.translationKey,
};
