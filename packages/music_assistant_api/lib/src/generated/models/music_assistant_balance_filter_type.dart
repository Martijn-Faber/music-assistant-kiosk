/// MusicAssistantBalanceFilterType
///
/// ```json
/// {
///     "properties": {},
///     "type": "string",
///     "enum": [
///         "balance"
///     ]
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_balance_filter_type.g.dart';

@JsonEnum(alwaysCreate: true)
enum MusicAssistantBalanceFilterType {
  @JsonValue('balance')
  balance,
  @JsonValue('unknown')
  unknown;

  factory MusicAssistantBalanceFilterType.fromJson(String json) =>
      MusicAssistantBalanceFilterType.values.firstWhere(
        (e) => e.toJson() == json,
        orElse: () => MusicAssistantBalanceFilterType.unknown,
      );

  String toJson() => _$MusicAssistantBalanceFilterTypeEnumMap[this]!;
}
