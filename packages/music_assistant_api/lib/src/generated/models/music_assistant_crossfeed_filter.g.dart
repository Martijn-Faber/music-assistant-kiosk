// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_crossfeed_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantCrossfeedFilter _$MusicAssistantCrossfeedFilterFromJson(
  Map<String, dynamic> json,
) => _MusicAssistantCrossfeedFilter(
  enabled: json['enabled'] as bool,
  type: json['type'] == null
      ? MusicAssistantCrossfeedFilterType.crossfeed
      : MusicAssistantCrossfeedFilterType.fromJson(json['type'] as String),
  strength: (json['strength'] as num?)?.toDouble() ?? 0.2,
  soundstage: (json['soundstage'] as num?)?.toDouble() ?? 0.5,
);

Map<String, dynamic> _$MusicAssistantCrossfeedFilterToJson(
  _MusicAssistantCrossfeedFilter instance,
) => <String, dynamic>{
  'enabled': instance.enabled,
  'type': instance.type.toJson(),
  'strength': instance.strength,
  'soundstage': instance.soundstage,
};
