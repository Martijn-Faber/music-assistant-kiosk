/// StreamDetails
///
/// ```json
/// {
///     "properties": {
///         "provider": {
///             "type": "string"
///         },
///         "item_id": {
///             "type": "string"
///         },
///         "audio_format": {
///             "$ref": "#/components/schemas/AudioFormat"
///         },
///         "media_type": {
///             "$ref": "#/components/schemas/MediaType",
///             "default": "track"
///         },
///         "stream_type": {
///             "$ref": "#/components/schemas/StreamType",
///             "default": "custom"
///         },
///         "duration": {
///             "type": "integer",
///             "nullable": true
///         },
///         "size": {
///             "type": "integer",
///             "nullable": true
///         },
///         "stream_metadata": {
///             "$ref": "#/components/schemas/StreamMetadata",
///             "nullable": true
///         },
///         "audio_processing": {
///             "$ref": "#/components/schemas/AudioProcessingChain",
///             "nullable": true
///         },
///         "loudness": {
///             "type": "number",
///             "nullable": true
///         },
///         "loudness_album": {
///             "type": "number",
///             "nullable": true
///         },
///         "prefer_album_loudness": {
///             "type": "boolean",
///             "default": false
///         },
///         "volume_normalization_mode": {
///             "$ref": "#/components/schemas/VolumeNormalizationMode",
///             "nullable": true
///         },
///         "volume_normalization_gain_correct": {
///             "type": "number",
///             "nullable": true
///         },
///         "target_loudness": {
///             "type": "number",
///             "nullable": true
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

    /// itemId
    @JsonKey(name: MusicAssistantStreamDetails.itemIdKey_)
    required String itemId,

    /// audioFormat
    @JsonKey(name: MusicAssistantStreamDetails.audioFormatKey_)
    required MusicAssistantAudioFormat audioFormat,

    /// mediaType
    @Default(MusicAssistantMediaType.track)
    @JsonKey(name: MusicAssistantStreamDetails.mediaTypeKey_)
    MusicAssistantMediaType mediaType,

    /// streamType
    @Default(MusicAssistantStreamType.custom)
    @JsonKey(name: MusicAssistantStreamDetails.streamTypeKey_)
    MusicAssistantStreamType streamType,

    /// duration
    @JsonKey(name: MusicAssistantStreamDetails.durationKey_) int? duration,

    /// size
    @JsonKey(name: MusicAssistantStreamDetails.sizeKey_) int? size,

    /// streamMetadata
    @JsonKey(name: MusicAssistantStreamDetails.streamMetadataKey_)
    MusicAssistantStreamMetadata? streamMetadata,

    /// audioProcessing
    @JsonKey(name: MusicAssistantStreamDetails.audioProcessingKey_)
    MusicAssistantAudioProcessingChain? audioProcessing,

    /// loudness
    @JsonKey(name: MusicAssistantStreamDetails.loudnessKey_) double? loudness,

    /// loudnessAlbum
    @JsonKey(name: MusicAssistantStreamDetails.loudnessAlbumKey_)
    double? loudnessAlbum,

    /// preferAlbumLoudness
    @Default(false)
    @JsonKey(name: MusicAssistantStreamDetails.preferAlbumLoudnessKey_)
    bool preferAlbumLoudness,

    /// volumeNormalizationMode
    @JsonKey(name: MusicAssistantStreamDetails.volumeNormalizationModeKey_)
    MusicAssistantVolumeNormalizationMode? volumeNormalizationMode,

    /// volumeNormalizationGainCorrect
    @JsonKey(
      name: MusicAssistantStreamDetails.volumeNormalizationGainCorrectKey_,
    )
    double? volumeNormalizationGainCorrect,

    /// targetLoudness
    @JsonKey(name: MusicAssistantStreamDetails.targetLoudnessKey_)
    double? targetLoudness,
  }) = _MusicAssistantStreamDetails;

  factory MusicAssistantStreamDetails.fromJson(Map<String, dynamic> json) =>
      _$MusicAssistantStreamDetailsFromJson(json);

  static const String providerKey_ = 'provider';

  static const String itemIdKey_ = 'item_id';

  static const String audioFormatKey_ = 'audio_format';

  static const String mediaTypeKey_ = 'media_type';

  static const String streamTypeKey_ = 'stream_type';

  static const String durationKey_ = 'duration';

  static const String sizeKey_ = 'size';

  static const String streamMetadataKey_ = 'stream_metadata';

  static const String audioProcessingKey_ = 'audio_processing';

  static const String loudnessKey_ = 'loudness';

  static const String loudnessAlbumKey_ = 'loudness_album';

  static const String preferAlbumLoudnessKey_ = 'prefer_album_loudness';

  static const String volumeNormalizationModeKey_ = 'volume_normalization_mode';

  static const String volumeNormalizationGainCorrectKey_ =
      'volume_normalization_gain_correct';

  static const String targetLoudnessKey_ = 'target_loudness';
}
