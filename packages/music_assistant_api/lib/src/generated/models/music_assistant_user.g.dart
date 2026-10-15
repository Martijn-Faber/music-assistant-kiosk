// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantUser _$MusicAssistantUserFromJson(Map<String, dynamic> json) =>
    _MusicAssistantUser(
      userId: json['user_id'] as String,
      username: json['username'] as String,
      role: json['role'] as String,
      enabled: json['enabled'] as bool? ?? true,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      displayName: json['display_name'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      preferences: json['preferences'] as Map<String, dynamic>?,
      providerFilter: (json['provider_filter'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      playerFilter: (json['player_filter'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$MusicAssistantUserToJson(_MusicAssistantUser instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'username': instance.username,
      'role': instance.role,
      'enabled': instance.enabled,
      'created_at': instance.createdAt?.toIso8601String(),
      'display_name': instance.displayName,
      'avatar_url': instance.avatarUrl,
      'preferences': instance.preferences,
      'provider_filter': instance.providerFilter,
      'player_filter': instance.playerFilter,
    };
