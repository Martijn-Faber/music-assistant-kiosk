/// CrossfeedFilter
///
/// ```json
/// {
///     "properties": {
///         "enabled": {
///             "type": "boolean"
///         },
///         "type": {
///             "enum": [
///                 "crossfeed"
///             ],
///             "type": "string",
///             "default": "crossfeed"
///         },
///         "strength": {
///             "type": "number",
///             "default": 0.2
///         },
///         "soundstage": {
///             "type": "number",
///             "default": 0.5
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
part 'music_assistant_crossfeed_filter.freezed.dart';
part 'music_assistant_crossfeed_filter.g.dart';

@freezed
abstract class MusicAssistantCrossfeedFilter
    with _$MusicAssistantCrossfeedFilter {
  const MusicAssistantCrossfeedFilter._();

  @jsonSerializable
  const factory MusicAssistantCrossfeedFilter({
    /// enabled
    @JsonKey(name: MusicAssistantCrossfeedFilter.enabledKey_)
    required bool enabled,

    /// type
    @Default(MusicAssistantCrossfeedFilterType.crossfeed)
    @JsonKey(name: MusicAssistantCrossfeedFilter.typeKey_)
    MusicAssistantCrossfeedFilterType type,

    /// strength
    @Default(0.2)
    @JsonKey(name: MusicAssistantCrossfeedFilter.strengthKey_)
    double strength,

    /// soundstage
    @Default(0.5)
    @JsonKey(name: MusicAssistantCrossfeedFilter.soundstageKey_)
    double soundstage,
  }) = _MusicAssistantCrossfeedFilter;

  factory MusicAssistantCrossfeedFilter.fromJson(Map<String, dynamic> json) =>
      _$MusicAssistantCrossfeedFilterFromJson(json);

  static const String enabledKey_ = 'enabled';

  static const String typeKey_ = 'type';

  static const String strengthKey_ = 'strength';

  static const String soundstageKey_ = 'soundstage';
}
