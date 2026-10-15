/// AudioDSPFilter
///
/// ```json
/// {
///     "oneOf": [
///         {
///             "$ref": "#/components/schemas/ParametricEQFilter"
///         },
///         {
///             "$ref": "#/components/schemas/ToneControlFilter"
///         },
///         {
///             "$ref": "#/components/schemas/GainFilter"
///         },
///         {
///             "$ref": "#/components/schemas/BalanceFilter"
///         },
///         {
///             "$ref": "#/components/schemas/ConvolutionFilter"
///         },
///         {
///             "$ref": "#/components/schemas/HighLowPassFilter"
///         },
///         {
///             "$ref": "#/components/schemas/StereoWidthFilter"
///         },
///         {
///             "$ref": "#/components/schemas/CrossfeedFilter"
///         },
///         {
///             "$ref": "#/components/schemas/TransposeFilter"
///         },
///         {
///             "$ref": "#/components/schemas/SafetyLimiterFilter"
///         },
///         {
///             "$ref": "#/components/schemas/CompressorFilter"
///         }
///     ]
/// }
/// ```
library;

import 'exports.dart';

sealed class MusicAssistantAudioDSPFilter {
  const MusicAssistantAudioDSPFilter();

  const factory MusicAssistantAudioDSPFilter.parametricEq(
    MusicAssistantParametricEQFilter value,
  ) = MusicAssistantAudioDSPFilterParametricEq;
  const factory MusicAssistantAudioDSPFilter.toneControl(
    MusicAssistantToneControlFilter value,
  ) = MusicAssistantAudioDSPFilterToneControl;
  const factory MusicAssistantAudioDSPFilter.gain(
    MusicAssistantGainFilter value,
  ) = MusicAssistantAudioDSPFilterGain;
  const factory MusicAssistantAudioDSPFilter.balance(
    MusicAssistantBalanceFilter value,
  ) = MusicAssistantAudioDSPFilterBalance;
  const factory MusicAssistantAudioDSPFilter.convolution(
    MusicAssistantConvolutionFilter value,
  ) = MusicAssistantAudioDSPFilterConvolution;
  const factory MusicAssistantAudioDSPFilter.highLowPass(
    MusicAssistantHighLowPassFilter value,
  ) = MusicAssistantAudioDSPFilterHighLowPass;
  const factory MusicAssistantAudioDSPFilter.stereoWidth(
    MusicAssistantStereoWidthFilter value,
  ) = MusicAssistantAudioDSPFilterStereoWidth;
  const factory MusicAssistantAudioDSPFilter.crossfeed(
    MusicAssistantCrossfeedFilter value,
  ) = MusicAssistantAudioDSPFilterCrossfeed;
  const factory MusicAssistantAudioDSPFilter.transpose(
    MusicAssistantTransposeFilter value,
  ) = MusicAssistantAudioDSPFilterTranspose;
  const factory MusicAssistantAudioDSPFilter.safetyLimiter(
    MusicAssistantSafetyLimiterFilter value,
  ) = MusicAssistantAudioDSPFilterSafetyLimiter;
  const factory MusicAssistantAudioDSPFilter.compressor(
    MusicAssistantCompressorFilter value,
  ) = MusicAssistantAudioDSPFilterCompressor;
  const factory MusicAssistantAudioDSPFilter.fallback(
    Map<String, dynamic> value,
  ) = MusicAssistantAudioDSPFilterFallback;

  factory MusicAssistantAudioDSPFilter.fromJson(Map<String, dynamic> json) =>
      switch (json['type']) {
        'parametric_eq' => MusicAssistantAudioDSPFilterParametricEq(
          MusicAssistantParametricEQFilter.fromJson(json),
        ),
        'tone_control' => MusicAssistantAudioDSPFilterToneControl(
          MusicAssistantToneControlFilter.fromJson(json),
        ),
        'gain' => MusicAssistantAudioDSPFilterGain(
          MusicAssistantGainFilter.fromJson(json),
        ),
        'balance' => MusicAssistantAudioDSPFilterBalance(
          MusicAssistantBalanceFilter.fromJson(json),
        ),
        'convolution' => MusicAssistantAudioDSPFilterConvolution(
          MusicAssistantConvolutionFilter.fromJson(json),
        ),
        'high_low_pass' => MusicAssistantAudioDSPFilterHighLowPass(
          MusicAssistantHighLowPassFilter.fromJson(json),
        ),
        'stereo_width' => MusicAssistantAudioDSPFilterStereoWidth(
          MusicAssistantStereoWidthFilter.fromJson(json),
        ),
        'crossfeed' => MusicAssistantAudioDSPFilterCrossfeed(
          MusicAssistantCrossfeedFilter.fromJson(json),
        ),
        'transpose' => MusicAssistantAudioDSPFilterTranspose(
          MusicAssistantTransposeFilter.fromJson(json),
        ),
        'safety_limiter' => MusicAssistantAudioDSPFilterSafetyLimiter(
          MusicAssistantSafetyLimiterFilter.fromJson(json),
        ),
        'compressor' => MusicAssistantAudioDSPFilterCompressor(
          MusicAssistantCompressorFilter.fromJson(json),
        ),
        _ => _fromKeys(json),
      };

  static MusicAssistantAudioDSPFilter _fromKeys(Map<String, dynamic> json) {
    // No discriminator value we know: the variant whose required keys are all
    // present and that declares the most of the payload's keys wins (the
    // earlier one on a tie).
    const variants = <({Set<String> required, Set<String> declared})>[
      (
        required: {'enabled'},
        declared: {'enabled', 'preamp', 'per_channel_preamp', 'type', 'bands'},
      ),
      (
        required: {'enabled'},
        declared: {
          'enabled',
          'type',
          'bass_level',
          'mid_level',
          'treble_level',
        },
      ),
      (required: {'enabled'}, declared: {'enabled', 'type', 'gain'}),
      (required: {'enabled'}, declared: {'enabled', 'type', 'balance'}),
      (required: {'enabled'}, declared: {'enabled', 'type', 'ir_id', 'gain'}),
      (
        required: {'enabled'},
        declared: {'enabled', 'type', 'mode', 'frequency', 'slope'},
      ),
      (required: {'enabled'}, declared: {'enabled', 'type', 'width'}),
      (
        required: {'enabled'},
        declared: {'enabled', 'type', 'strength', 'soundstage'},
      ),
      (required: {'enabled'}, declared: {'enabled', 'type', 'semitones'}),
      (required: {'enabled'}, declared: {'enabled', 'type', 'ceiling'}),
      (
        required: {'enabled'},
        declared: {
          'enabled',
          'type',
          'threshold',
          'ratio',
          'attack',
          'release',
          'knee',
          'makeup',
        },
      ),
    ];
    var best = -1;
    var bestScore = -1;
    for (var i = 0; i < variants.length; i++) {
      final variant = variants[i];
      if (!variant.required.every(json.containsKey)) continue;
      final score = json.keys.where(variant.declared.contains).length;
      if (score > bestScore) {
        best = i;
        bestScore = score;
      }
    }
    return switch (best) {
      0 => MusicAssistantAudioDSPFilterParametricEq(
        MusicAssistantParametricEQFilter.fromJson(json),
      ),
      1 => MusicAssistantAudioDSPFilterToneControl(
        MusicAssistantToneControlFilter.fromJson(json),
      ),
      2 => MusicAssistantAudioDSPFilterGain(
        MusicAssistantGainFilter.fromJson(json),
      ),
      3 => MusicAssistantAudioDSPFilterBalance(
        MusicAssistantBalanceFilter.fromJson(json),
      ),
      4 => MusicAssistantAudioDSPFilterConvolution(
        MusicAssistantConvolutionFilter.fromJson(json),
      ),
      5 => MusicAssistantAudioDSPFilterHighLowPass(
        MusicAssistantHighLowPassFilter.fromJson(json),
      ),
      6 => MusicAssistantAudioDSPFilterStereoWidth(
        MusicAssistantStereoWidthFilter.fromJson(json),
      ),
      7 => MusicAssistantAudioDSPFilterCrossfeed(
        MusicAssistantCrossfeedFilter.fromJson(json),
      ),
      8 => MusicAssistantAudioDSPFilterTranspose(
        MusicAssistantTransposeFilter.fromJson(json),
      ),
      9 => MusicAssistantAudioDSPFilterSafetyLimiter(
        MusicAssistantSafetyLimiterFilter.fromJson(json),
      ),
      10 => MusicAssistantAudioDSPFilterCompressor(
        MusicAssistantCompressorFilter.fromJson(json),
      ),
      _ => MusicAssistantAudioDSPFilterFallback(json),
    };
  }

  Map<String, dynamic> toJson();
}

final class MusicAssistantAudioDSPFilterParametricEq
    extends MusicAssistantAudioDSPFilter {
  const MusicAssistantAudioDSPFilterParametricEq(this.value);

  final MusicAssistantParametricEQFilter value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  bool operator ==(Object other) =>
      other is MusicAssistantAudioDSPFilterParametricEq && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'MusicAssistantAudioDSPFilter.parametricEq($value)';
}

final class MusicAssistantAudioDSPFilterToneControl
    extends MusicAssistantAudioDSPFilter {
  const MusicAssistantAudioDSPFilterToneControl(this.value);

  final MusicAssistantToneControlFilter value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  bool operator ==(Object other) =>
      other is MusicAssistantAudioDSPFilterToneControl && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'MusicAssistantAudioDSPFilter.toneControl($value)';
}

final class MusicAssistantAudioDSPFilterGain
    extends MusicAssistantAudioDSPFilter {
  const MusicAssistantAudioDSPFilterGain(this.value);

  final MusicAssistantGainFilter value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  bool operator ==(Object other) =>
      other is MusicAssistantAudioDSPFilterGain && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'MusicAssistantAudioDSPFilter.gain($value)';
}

final class MusicAssistantAudioDSPFilterBalance
    extends MusicAssistantAudioDSPFilter {
  const MusicAssistantAudioDSPFilterBalance(this.value);

  final MusicAssistantBalanceFilter value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  bool operator ==(Object other) =>
      other is MusicAssistantAudioDSPFilterBalance && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'MusicAssistantAudioDSPFilter.balance($value)';
}

final class MusicAssistantAudioDSPFilterConvolution
    extends MusicAssistantAudioDSPFilter {
  const MusicAssistantAudioDSPFilterConvolution(this.value);

  final MusicAssistantConvolutionFilter value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  bool operator ==(Object other) =>
      other is MusicAssistantAudioDSPFilterConvolution && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'MusicAssistantAudioDSPFilter.convolution($value)';
}

final class MusicAssistantAudioDSPFilterHighLowPass
    extends MusicAssistantAudioDSPFilter {
  const MusicAssistantAudioDSPFilterHighLowPass(this.value);

  final MusicAssistantHighLowPassFilter value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  bool operator ==(Object other) =>
      other is MusicAssistantAudioDSPFilterHighLowPass && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'MusicAssistantAudioDSPFilter.highLowPass($value)';
}

final class MusicAssistantAudioDSPFilterStereoWidth
    extends MusicAssistantAudioDSPFilter {
  const MusicAssistantAudioDSPFilterStereoWidth(this.value);

  final MusicAssistantStereoWidthFilter value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  bool operator ==(Object other) =>
      other is MusicAssistantAudioDSPFilterStereoWidth && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'MusicAssistantAudioDSPFilter.stereoWidth($value)';
}

final class MusicAssistantAudioDSPFilterCrossfeed
    extends MusicAssistantAudioDSPFilter {
  const MusicAssistantAudioDSPFilterCrossfeed(this.value);

  final MusicAssistantCrossfeedFilter value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  bool operator ==(Object other) =>
      other is MusicAssistantAudioDSPFilterCrossfeed && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'MusicAssistantAudioDSPFilter.crossfeed($value)';
}

final class MusicAssistantAudioDSPFilterTranspose
    extends MusicAssistantAudioDSPFilter {
  const MusicAssistantAudioDSPFilterTranspose(this.value);

  final MusicAssistantTransposeFilter value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  bool operator ==(Object other) =>
      other is MusicAssistantAudioDSPFilterTranspose && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'MusicAssistantAudioDSPFilter.transpose($value)';
}

final class MusicAssistantAudioDSPFilterSafetyLimiter
    extends MusicAssistantAudioDSPFilter {
  const MusicAssistantAudioDSPFilterSafetyLimiter(this.value);

  final MusicAssistantSafetyLimiterFilter value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  bool operator ==(Object other) =>
      other is MusicAssistantAudioDSPFilterSafetyLimiter &&
      other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'MusicAssistantAudioDSPFilter.safetyLimiter($value)';
}

final class MusicAssistantAudioDSPFilterCompressor
    extends MusicAssistantAudioDSPFilter {
  const MusicAssistantAudioDSPFilterCompressor(this.value);

  final MusicAssistantCompressorFilter value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  bool operator ==(Object other) =>
      other is MusicAssistantAudioDSPFilterCompressor && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'MusicAssistantAudioDSPFilter.compressor($value)';
}

final class MusicAssistantAudioDSPFilterFallback
    extends MusicAssistantAudioDSPFilter {
  const MusicAssistantAudioDSPFilterFallback(this.value);

  final Map<String, dynamic> value;

  @override
  Map<String, dynamic> toJson() => value;

  @override
  String toString() => 'MusicAssistantAudioDSPFilter.fallback($value)';
}
