/// StreamType
///
/// ```json
/// {
///     "type": "string",
///     "enum": [
///         "http",
///         "encrypted_http",
///         "hls",
///         "icy",
///         "shoutcast",
///         "in_band",
///         "local_file",
///         "named_pipe",
///         "other_ffmpeg",
///         "custom",
///         "unknown"
///     ],
///     "description": "Enum: StreamType. Possible values: http, encrypted_http, hls, icy, shoutcast, in_band, local_file, named_pipe, other_ffmpeg, custom, unknown"
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_stream_type.g.dart';

@JsonEnum(alwaysCreate: true)
enum MusicAssistantStreamType {
  @JsonValue('http')
  http,
  @JsonValue('encrypted_http')
  encryptedHttp,
  @JsonValue('hls')
  hls,
  @JsonValue('icy')
  icy,
  @JsonValue('shoutcast')
  shoutcast,
  @JsonValue('in_band')
  inBand,
  @JsonValue('local_file')
  localFile,
  @JsonValue('named_pipe')
  namedPipe,
  @JsonValue('other_ffmpeg')
  otherFfmpeg,
  @JsonValue('custom')
  custom,
  @JsonValue('unknown')
  unknown;

  factory MusicAssistantStreamType.fromJson(String json) =>
      MusicAssistantStreamType.values.firstWhere(
        (e) => e.toJson() == json,
        orElse: () => MusicAssistantStreamType.unknown,
      );

  String toJson() => _$MusicAssistantStreamTypeEnumMap[this]!;
}
