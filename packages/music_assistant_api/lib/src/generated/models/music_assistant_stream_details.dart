/// StreamDetails
///
/// ```json
/// {
///     "properties": {
///         "provider": {
///             "type": "string"
///         },
///         "media_type": {
///             "$ref": "#/components/schemas/MediaType",
///             "default": "track"
///         },
///         "stream_type": {
///             "$ref": "#/components/schemas/StreamType",
///             "default": "custom"
///         },
///         "audio_format": {
///             "$ref": "#/components/schemas/AudioFormat"
///         },
///         "item_id": {
///             "type": "string"
///         }
///     },
///     "type": "object",
///     "required": [
///         "provider",
///         "item_id",
///         "audio_format"
///     ]
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_stream_details.freezed.dart';
part 'music_assistant_stream_details.g.dart';

@freezed
abstract class MusicAssistantStreamDetails with _$MusicAssistantStreamDetails {
  const MusicAssistantStreamDetails._();

  @jsonSerializable
  const factory MusicAssistantStreamDetails({
    /// provider
    @JsonKey(name: MusicAssistantStreamDetails.providerKey_)
    required String provider,

    /// mediaType
    @Default(MusicAssistantMediaType.track)
    @JsonKey(name: MusicAssistantStreamDetails.mediaTypeKey_)
    MusicAssistantMediaType mediaType,

    /// streamType
    @Default(MusicAssistantStreamType.custom)
    @JsonKey(name: MusicAssistantStreamDetails.streamTypeKey_)
    MusicAssistantStreamType streamType,

    /// audioFormat
    @JsonKey(name: MusicAssistantStreamDetails.audioFormatKey_)
    required MusicAssistantAudioFormat audioFormat,

    /// itemId
    @JsonKey(name: MusicAssistantStreamDetails.itemIdKey_)
    required String itemId,
  }) = _MusicAssistantStreamDetails;

  factory MusicAssistantStreamDetails.fromJson(Map<String, dynamic> json) =>
      _$MusicAssistantStreamDetailsFromJson(json);

  static const String providerKey_ = 'provider';

  static const String mediaTypeKey_ = 'media_type';

  static const String streamTypeKey_ = 'stream_type';

  static const String audioFormatKey_ = 'audio_format';

  static const String itemIdKey_ = 'item_id';
}
