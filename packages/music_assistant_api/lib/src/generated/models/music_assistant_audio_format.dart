/// AudioFormat
///
/// ```json
/// {
///     "properties": {
///         "content_type": {
///             "$ref": "#/components/schemas/ContentType",
///             "default": "?"
///         },
///         "codec_type": {
///             "$ref": "#/components/schemas/ContentType",
///             "default": "?"
///         },
///         "sample_rate": {
///             "type": "integer",
///             "default": 44100
///         },
///         "bit_depth": {
///             "type": "integer",
///             "default": 16
///         },
///         "channels": {
///             "type": "integer",
///             "default": 2
///         },
///         "output_format_str": {
///             "type": "string",
///             "default": ""
///         },
///         "bit_rate": {
///             "type": "integer",
///             "nullable": true
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
    /// contentType
    @Default(MusicAssistantContentType.value61)
    @JsonKey(name: MusicAssistantAudioFormat.contentTypeKey_)
    MusicAssistantContentType contentType,

    /// codecType
    @Default(MusicAssistantContentType.value61)
    @JsonKey(name: MusicAssistantAudioFormat.codecTypeKey_)
    MusicAssistantContentType codecType,

    /// sampleRate
    @Default(44100)
    @JsonKey(name: MusicAssistantAudioFormat.sampleRateKey_)
    int sampleRate,

    /// bitDepth
    @Default(16)
    @JsonKey(name: MusicAssistantAudioFormat.bitDepthKey_)
    int bitDepth,

    /// channels
    @Default(2)
    @JsonKey(name: MusicAssistantAudioFormat.channelsKey_)
    int channels,

    /// outputFormatStr
    @Default('')
    @JsonKey(name: MusicAssistantAudioFormat.outputFormatStrKey_)
    String outputFormatStr,

    /// bitRate
    @JsonKey(name: MusicAssistantAudioFormat.bitRateKey_) int? bitRate,
  }) = _MusicAssistantAudioFormat;

  factory MusicAssistantAudioFormat.fromJson(Map<String, dynamic> json) =>
      _$MusicAssistantAudioFormatFromJson(json);

  static const String contentTypeKey_ = 'content_type';

  static const String codecTypeKey_ = 'codec_type';

  static const String sampleRateKey_ = 'sample_rate';

  static const String bitDepthKey_ = 'bit_depth';

  static const String channelsKey_ = 'channels';

  static const String outputFormatStrKey_ = 'output_format_str';

  static const String bitRateKey_ = 'bit_rate';
}
