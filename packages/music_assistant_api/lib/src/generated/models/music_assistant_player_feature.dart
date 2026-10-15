/// PlayerFeature
///
/// ```json
/// {
///     "type": "string",
///     "enum": [
///         "power",
///         "volume_set",
///         "volume_mute",
///         "pause",
///         "set_members",
///         "multi_device_dsp",
///         "seek",
///         "next_previous",
///         "play_announcement",
///         "enqueue",
///         "select_sound_mode",
///         "select_source",
///         "options",
///         "gapless_playback",
///         "gapless_different_samplerate",
///         "play_media",
///         "unknown"
///     ],
///     "description": "Enum: PlayerFeature. Possible values: power, volume_set, volume_mute, pause, set_members, multi_device_dsp, seek, next_previous, play_announcement, enqueue, select_sound_mode, select_source, options, gapless_playback, gapless_different_samplerate, play_media, unknown"
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_player_feature.g.dart';

@JsonEnum(alwaysCreate: true)
enum MusicAssistantPlayerFeature {
  @JsonValue('power')
  power,
  @JsonValue('volume_set')
  volumeSet,
  @JsonValue('volume_mute')
  volumeMute,
  @JsonValue('pause')
  pause,
  @JsonValue('set_members')
  setMembers,
  @JsonValue('multi_device_dsp')
  multiDeviceDsp,
  @JsonValue('seek')
  seek,
  @JsonValue('next_previous')
  nextPrevious,
  @JsonValue('play_announcement')
  playAnnouncement,
  @JsonValue('enqueue')
  enqueue,
  @JsonValue('select_sound_mode')
  selectSoundMode,
  @JsonValue('select_source')
  selectSource,
  @JsonValue('options')
  options,
  @JsonValue('gapless_playback')
  gaplessPlayback,
  @JsonValue('gapless_different_samplerate')
  gaplessDifferentSamplerate,
  @JsonValue('play_media')
  playMedia,
  @JsonValue('unknown')
  unknown;

  factory MusicAssistantPlayerFeature.fromJson(String json) =>
      MusicAssistantPlayerFeature.values.firstWhere(
        (e) => e.toJson() == json,
        orElse: () => MusicAssistantPlayerFeature.unknown,
      );

  String toJson() => _$MusicAssistantPlayerFeatureEnumMap[this]!;
}
