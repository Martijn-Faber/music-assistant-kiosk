// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_assistant_balance_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicAssistantBalanceFilter _$MusicAssistantBalanceFilterFromJson(
  Map<String, dynamic> json,
) => _MusicAssistantBalanceFilter(
  enabled: json['enabled'] as bool,
  type: json['type'] == null
      ? MusicAssistantBalanceFilterType.balance
      : MusicAssistantBalanceFilterType.fromJson(json['type'] as String),
  balance: (json['balance'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$MusicAssistantBalanceFilterToJson(
  _MusicAssistantBalanceFilter instance,
) => <String, dynamic>{
  'enabled': instance.enabled,
  'type': instance.type.toJson(),
  'balance': instance.balance,
};
