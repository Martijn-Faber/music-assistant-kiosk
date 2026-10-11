class PlaybackQualityInfo {
  const PlaybackQualityInfo({
    this.source,
    this.streamType,
    this.codec,
    this.container,
    this.sampleRateHz,
    this.bitDepth,
    this.channels,
    this.bitRate,
    this.qualityLabel,
  });

  final String? source;
  final String? streamType;
  final String? codec;
  final String? container;
  final int? sampleRateHz;
  final int? bitDepth;
  final int? channels;
  final int? bitRate;
  final String? qualityLabel;
}
