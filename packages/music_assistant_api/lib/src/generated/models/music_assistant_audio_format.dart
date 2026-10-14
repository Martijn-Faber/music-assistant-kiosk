/// AudioFormat
///
/// ```json
/// {
///     "properties": {
///         "bit_rate": {
///             "type": "integer",
///             "nullable": true
///         },
///         "content_type": {
///             "$ref": "#/components/schemas/ContentType",
///             "default": "?"
///         },
///         "bit_depth": {
///             "type": "integer",
///             "default": 16
///         },
///         "sample_rate": {
///             "type": "integer",
///             "default": 44100
///         },
///         "channels": {
///             "type": "integer",
///             "default": 2
///         },
///         "codec_type": {
///             "$ref": "#/components/schemas/ContentType",
///             "default": "?"
///         }
///     },
///     "type": "object"
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_audio_format.freezed.dart';
part 'music_assistant_audio_format.g.dart';

@freezed
abstract class MusicAssistantAudioFormat with _$MusicAssistantAudioFormat {
  const MusicAssistantAudioFormat._();

  @jsonSerializable
  const factory MusicAssistantAudioFormat({
    /// bitRate
    @JsonKey(name: MusicAssistantAudioFormat.bitRateKey_) int? bitRate,

    /// contentType
    @Default(MusicAssistantContentType.value61)
    @JsonKey(name: MusicAssistantAudioFormat.contentTypeKey_)
    MusicAssistantContentType contentType,

    /// bitDepth
    @Default(16)
    @JsonKey(name: MusicAssistantAudioFormat.bitDepthKey_)
    int bitDepth,

    /// sampleRate
    @Default(44100)
    @JsonKey(name: MusicAssistantAudioFormat.sampleRateKey_)
    int sampleRate,

    /// channels
    @Default(2)
    @JsonKey(name: MusicAssistantAudioFormat.channelsKey_)
    int channels,

    /// codecType
    @Default(MusicAssistantContentType.value61)
    @JsonKey(name: MusicAssistantAudioFormat.codecTypeKey_)
    MusicAssistantContentType codecType,
  }) = _MusicAssistantAudioFormat;

  factory MusicAssistantAudioFormat.fromJson(Map<String, dynamic> json) =>
      _$MusicAssistantAudioFormatFromJson(json);

  static const String bitRateKey_ = 'bit_rate';

  static const String contentTypeKey_ = 'content_type';

  static const String bitDepthKey_ = 'bit_depth';

  static const String sampleRateKey_ = 'sample_rate';

  static const String channelsKey_ = 'channels';

  static const String codecTypeKey_ = 'codec_type';
}
