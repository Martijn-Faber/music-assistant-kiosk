/// ContentType
///
/// ```json
/// {
///     "type": "string",
///     "enum": [
///         "ogg",
///         "wav",
///         "aiff",
///         "mpeg",
///         "m4a",
///         "mp4",
///         "mp4a",
///         "m4b",
///         "dsf",
///         "flac",
///         "mp3",
///         "wma",
///         "wmav2",
///         "wmapro",
///         "wavpack",
///         "tak",
///         "ape",
///         "mpc",
///         "aac",
///         "alac",
///         "opus",
///         "vorbis",
///         "ac3",
///         "eac3",
///         "dts",
///         "truehd",
///         "dtshd",
///         "dtsx",
///         "cook",
///         "ralf",
///         "mp2",
///         "mp1",
///         "dra",
///         "atrac3",
///         "s16le",
///         "s24le",
///         "s32le",
///         "f32le",
///         "f64le",
///         "s16be",
///         "s24be",
///         "s32be",
///         "pcm_bluray",
///         "pcm_dvd",
///         "adpcm_ima_qt",
///         "adpcm_ms",
///         "adpcm_swf",
///         "dsd_lsbf",
///         "dsd_msbf",
///         "dsd_lsbf_planar",
///         "dsd_msbf_planar",
///         "amr_nb",
///         "amr_wb",
///         "speex",
///         "alaw",
///         "mulaw",
///         "g722",
///         "g726",
///         "pcm",
///         "nut",
///         "?"
///     ],
///     "description": "Enum: ContentType. Possible values: ogg, wav, aiff, mpeg, m4a, mp4, mp4a, m4b, dsf, flac, mp3, wma, wmav2, wmapro, wavpack, tak, ape, mpc, aac, alac, opus, vorbis, ac3, eac3, dts, truehd, dtshd, dtsx, cook, ralf, mp2, mp1, dra, atrac3, s16le, s24le, s32le, f32le, f64le, s16be, s24be, s32be, pcm_bluray, pcm_dvd, adpcm_ima_qt, adpcm_ms, adpcm_swf, dsd_lsbf, dsd_msbf, dsd_lsbf_planar, dsd_msbf_planar, amr_nb, amr_wb, speex, alaw, mulaw, g722, g726, pcm, nut, ?"
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_content_type.g.dart';

@JsonEnum(alwaysCreate: true)
enum MusicAssistantContentType {
  @JsonValue('ogg')
  ogg,
  @JsonValue('wav')
  wav,
  @JsonValue('aiff')
  aiff,
  @JsonValue('mpeg')
  mpeg,
  @JsonValue('m4a')
  m4a,
  @JsonValue('mp4')
  mp4,
  @JsonValue('mp4a')
  mp4a,
  @JsonValue('m4b')
  m4b,
  @JsonValue('dsf')
  dsf,
  @JsonValue('flac')
  flac,
  @JsonValue('mp3')
  mp3,
  @JsonValue('wma')
  wma,
  @JsonValue('wmav2')
  wmav2,
  @JsonValue('wmapro')
  wmapro,
  @JsonValue('wavpack')
  wavpack,
  @JsonValue('tak')
  tak,
  @JsonValue('ape')
  ape,
  @JsonValue('mpc')
  mpc,
  @JsonValue('aac')
  aac,
  @JsonValue('alac')
  alac,
  @JsonValue('opus')
  opus,
  @JsonValue('vorbis')
  vorbis,
  @JsonValue('ac3')
  ac3,
  @JsonValue('eac3')
  eac3,
  @JsonValue('dts')
  dts,
  @JsonValue('truehd')
  truehd,
  @JsonValue('dtshd')
  dtshd,
  @JsonValue('dtsx')
  dtsx,
  @JsonValue('cook')
  cook,
  @JsonValue('ralf')
  ralf,
  @JsonValue('mp2')
  mp2,
  @JsonValue('mp1')
  mp1,
  @JsonValue('dra')
  dra,
  @JsonValue('atrac3')
  atrac3,
  @JsonValue('s16le')
  s16le,
  @JsonValue('s24le')
  s24le,
  @JsonValue('s32le')
  s32le,
  @JsonValue('f32le')
  f32le,
  @JsonValue('f64le')
  f64le,
  @JsonValue('s16be')
  s16be,
  @JsonValue('s24be')
  s24be,
  @JsonValue('s32be')
  s32be,
  @JsonValue('pcm_bluray')
  pcmBluray,
  @JsonValue('pcm_dvd')
  pcmDvd,
  @JsonValue('adpcm_ima_qt')
  adpcmImaQt,
  @JsonValue('adpcm_ms')
  adpcmMs,
  @JsonValue('adpcm_swf')
  adpcmSwf,
  @JsonValue('dsd_lsbf')
  dsdLsbf,
  @JsonValue('dsd_msbf')
  dsdMsbf,
  @JsonValue('dsd_lsbf_planar')
  dsdLsbfPlanar,
  @JsonValue('dsd_msbf_planar')
  dsdMsbfPlanar,
  @JsonValue('amr_nb')
  amrNb,
  @JsonValue('amr_wb')
  amrWb,
  @JsonValue('speex')
  speex,
  @JsonValue('alaw')
  alaw,
  @JsonValue('mulaw')
  mulaw,
  @JsonValue('g722')
  g722,
  @JsonValue('g726')
  g726,
  @JsonValue('pcm')
  pcm,
  @JsonValue('nut')
  nut,
  @JsonValue('?')
  value61,
  @JsonValue('unknown')
  unknown;

  factory MusicAssistantContentType.fromJson(String json) =>
      MusicAssistantContentType.values.firstWhere(
        (e) => e.toJson() == json,
        orElse: () => MusicAssistantContentType.unknown,
      );

  String toJson() => _$MusicAssistantContentTypeEnumMap[this]!;
}
