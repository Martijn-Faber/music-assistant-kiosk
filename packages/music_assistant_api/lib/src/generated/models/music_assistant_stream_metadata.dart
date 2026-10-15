/// StreamMetadata
///
/// ```json
/// {
///     "properties": {
///         "title": {
///             "type": "string"
///         },
///         "artist": {
///             "type": "string",
///             "nullable": true
///         },
///         "album": {
///             "type": "string",
///             "nullable": true
///         },
///         "image_url": {
///             "type": "string",
///             "nullable": true
///         },
///         "duration": {
///             "type": "integer",
///             "nullable": true
///         },
///         "description": {
///             "type": "string",
///             "nullable": true
///         },
///         "uri": {
///             "type": "string",
///             "nullable": true
///         },
///         "elapsed_time": {
///             "type": "integer",
///             "nullable": true
///         },
///         "elapsed_time_last_updated": {
///             "type": "number",
///             "nullable": true
///         }
///     },
///     "type": "object",
///     "required": [
///         "title"
///     ]
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_stream_metadata.freezed.dart';
part 'music_assistant_stream_metadata.g.dart';

@freezed
abstract class MusicAssistantStreamMetadata
    with _$MusicAssistantStreamMetadata {
  const MusicAssistantStreamMetadata._();

  @jsonSerializable
  const factory MusicAssistantStreamMetadata({
    /// title
    @JsonKey(name: MusicAssistantStreamMetadata.titleKey_)
    required String title,

    /// artist
    @JsonKey(name: MusicAssistantStreamMetadata.artistKey_) String? artist,

    /// album
    @JsonKey(name: MusicAssistantStreamMetadata.albumKey_) String? album,

    /// imageUrl
    @JsonKey(name: MusicAssistantStreamMetadata.imageUrlKey_) String? imageUrl,

    /// duration
    @JsonKey(name: MusicAssistantStreamMetadata.durationKey_) int? duration,

    /// description
    @JsonKey(name: MusicAssistantStreamMetadata.descriptionKey_)
    String? description,

    /// uri
    @JsonKey(name: MusicAssistantStreamMetadata.uriKey_) String? uri,

    /// elapsedTime
    @JsonKey(name: MusicAssistantStreamMetadata.elapsedTimeKey_)
    int? elapsedTime,

    /// elapsedTimeLastUpdated
    @JsonKey(name: MusicAssistantStreamMetadata.elapsedTimeLastUpdatedKey_)
    double? elapsedTimeLastUpdated,
  }) = _MusicAssistantStreamMetadata;

  factory MusicAssistantStreamMetadata.fromJson(Map<String, dynamic> json) =>
      _$MusicAssistantStreamMetadataFromJson(json);

  static const String titleKey_ = 'title';

  static const String artistKey_ = 'artist';

  static const String albumKey_ = 'album';

  static const String imageUrlKey_ = 'image_url';

  static const String durationKey_ = 'duration';

  static const String descriptionKey_ = 'description';

  static const String uriKey_ = 'uri';

  static const String elapsedTimeKey_ = 'elapsed_time';

  static const String elapsedTimeLastUpdatedKey_ = 'elapsed_time_last_updated';
}
