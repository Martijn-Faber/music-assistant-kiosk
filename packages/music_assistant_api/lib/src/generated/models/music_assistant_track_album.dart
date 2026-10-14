/// MusicAssistantTrackAlbum
///
/// ```json
/// {
///     "properties": {
///         "uri": {
///             "type": "string",
///             "nullable": true
///         },
///         "image_url": {
///             "type": "string",
///             "nullable": true
///         },
///         "name": {
///             "type": "string"
///         }
///     },
///     "type": "object"
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_track_album.freezed.dart';
part 'music_assistant_track_album.g.dart';

@freezed
abstract class MusicAssistantTrackAlbum with _$MusicAssistantTrackAlbum {
  const MusicAssistantTrackAlbum._();

  @jsonSerializable
  const factory MusicAssistantTrackAlbum({
    /// uri
    @JsonKey(name: MusicAssistantTrackAlbum.uriKey_) String? uri,

    /// imageUrl
    @JsonKey(name: MusicAssistantTrackAlbum.imageUrlKey_) String? imageUrl,

    /// name
    @JsonKey(name: MusicAssistantTrackAlbum.nameKey_) String? name,
  }) = _MusicAssistantTrackAlbum;

  factory MusicAssistantTrackAlbum.fromJson(Map<String, dynamic> json) =>
      _$MusicAssistantTrackAlbumFromJson(json);

  static const String uriKey_ = 'uri';

  static const String imageUrlKey_ = 'image_url';

  static const String nameKey_ = 'name';
}
