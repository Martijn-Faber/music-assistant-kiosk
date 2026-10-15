/// AudioNormalizationDetails
///
/// ```json
/// {
///     "properties": {
///         "mode": {
///             "$ref": "#/components/schemas/VolumeNormalizationMode",
///             "default": "unknown"
///         },
///         "measurement_source": {
///             "$ref": "#/components/schemas/AudioNormalizationMeasurementSource",
///             "default": "unknown"
///         },
///         "target_lufs": {
///             "type": "number",
///             "nullable": true
///         },
///         "measured_lufs": {
///             "type": "number",
///             "nullable": true
///         },
///         "applied_gain_db": {
///             "type": "number",
///             "nullable": true
///         }
///     },
///     "type": "object"
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_audio_normalization_details.freezed.dart';
part 'music_assistant_audio_normalization_details.g.dart';

@freezed
abstract class MusicAssistantAudioNormalizationDetails
    with _$MusicAssistantAudioNormalizationDetails {
  const MusicAssistantAudioNormalizationDetails._();

  @jsonSerializable
  const factory MusicAssistantAudioNormalizationDetails({
    /// mode
    @Default(MusicAssistantVolumeNormalizationMode.unknown)
    @JsonKey(name: MusicAssistantAudioNormalizationDetails.modeKey_)
    MusicAssistantVolumeNormalizationMode mode,

    /// measurementSource
    @Default(MusicAssistantAudioNormalizationMeasurementSource.unknown)
    @JsonKey(
      name: MusicAssistantAudioNormalizationDetails.measurementSourceKey_,
    )
    MusicAssistantAudioNormalizationMeasurementSource measurementSource,

    /// targetLufs
    @JsonKey(name: MusicAssistantAudioNormalizationDetails.targetLufsKey_)
    double? targetLufs,

    /// measuredLufs
    @JsonKey(name: MusicAssistantAudioNormalizationDetails.measuredLufsKey_)
    double? measuredLufs,

    /// appliedGainDb
    @JsonKey(name: MusicAssistantAudioNormalizationDetails.appliedGainDbKey_)
    double? appliedGainDb,
  }) = _MusicAssistantAudioNormalizationDetails;

  factory MusicAssistantAudioNormalizationDetails.fromJson(
    Map<String, dynamic> json,
  ) => _$MusicAssistantAudioNormalizationDetailsFromJson(json);

  static const String modeKey_ = 'mode';

  static const String measurementSourceKey_ = 'measurement_source';

  static const String targetLufsKey_ = 'target_lufs';

  static const String measuredLufsKey_ = 'measured_lufs';

  static const String appliedGainDbKey_ = 'applied_gain_db';
}
