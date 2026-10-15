// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_media_item_palette.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantMediaItemPalette _$MusicAssistantMediaItemPaletteFromJson(
  Map<String, dynamic> json,
) => _MusicAssistantMediaItemPalette(
  backgroundDark: (json['background_dark'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
  backgroundLight: (json['background_light'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
  primary: (json['primary'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
  accent: (json['accent'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
  onDark: (json['on_dark'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
  onLight: (json['on_light'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
);

Map<String, dynamic> _$MusicAssistantMediaItemPaletteToJson(
  _MusicAssistantMediaItemPalette instance,
) => <String, dynamic>{
  'background_dark': instance.backgroundDark,
  'background_light': instance.backgroundLight,
  'primary': instance.primary,
  'accent': instance.accent,
  'on_dark': instance.onDark,
  'on_light': instance.onLight,
};
