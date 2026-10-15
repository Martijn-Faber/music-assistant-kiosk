/// BalanceFilter
///
/// ```json
/// {
///     "properties": {
///         "enabled": {
///             "type": "boolean"
///         },
///         "type": {
///             "enum": [
///                 "balance"
///             ],
///             "type": "string",
///             "default": "balance"
///         },
///         "balance": {
///             "type": "number",
///             "default": 0.0
///         }
///     },
///     "type": "object",
///     "required": [
///         "enabled"
///     ]
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_balance_filter.freezed.dart';
part 'music_assistant_balance_filter.g.dart';

@freezed
abstract class MusicAssistantBalanceFilter with _$MusicAssistantBalanceFilter {
  const MusicAssistantBalanceFilter._();

  @jsonSerializable
  const factory MusicAssistantBalanceFilter({
    /// enabled
    @JsonKey(name: MusicAssistantBalanceFilter.enabledKey_)
    required bool enabled,

    /// type
    @Default(MusicAssistantBalanceFilterType.balance)
    @JsonKey(name: MusicAssistantBalanceFilter.typeKey_)
    MusicAssistantBalanceFilterType type,

    /// balance
    @Default(0.0)
    @JsonKey(name: MusicAssistantBalanceFilter.balanceKey_)
    double balance,
  }) = _MusicAssistantBalanceFilter;

  factory MusicAssistantBalanceFilter.fromJson(Map<String, dynamic> json) =>
      _$MusicAssistantBalanceFilterFromJson(json);

  static const String enabledKey_ = 'enabled';

  static const String typeKey_ = 'type';

  static const String balanceKey_ = 'balance';
}
