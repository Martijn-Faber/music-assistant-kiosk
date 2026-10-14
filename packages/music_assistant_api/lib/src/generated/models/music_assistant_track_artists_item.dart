/// MusicAssistantTrackArtistsItem
///
/// ```json
/// {
///     "properties": {
///         "name": {
///             "type": "string"
///         },
///         "uri": {
///             "type": "string",
///             "nullable": true
///         }
///     },
///     "type": "object"
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_track_artists_item.freezed.dart';
part 'music_assistant_track_artists_item.g.dart';

@freezed
abstract class MusicAssistantTrackArtistsItem
    with _$MusicAssistantTrackArtistsItem {
  const MusicAssistantTrackArtistsItem._();

  @jsonSerializable
  const factory MusicAssistantTrackArtistsItem({
    /// name
    @JsonKey(name: MusicAssistantTrackArtistsItem.nameKey_) String? name,

    /// uri
    @JsonKey(name: MusicAssistantTrackArtistsItem.uriKey_) String? uri,
  }) = _MusicAssistantTrackArtistsItem;

  factory MusicAssistantTrackArtistsItem.fromJson(Map<String, dynamic> json) =>
      _$MusicAssistantTrackArtistsItemFromJson(json);

  static const String nameKey_ = 'name';

  static const String uriKey_ = 'uri';
}
