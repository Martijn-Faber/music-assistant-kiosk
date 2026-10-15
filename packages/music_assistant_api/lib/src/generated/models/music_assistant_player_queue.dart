/// PlayerQueue
///
/// ```json
/// {
///     "properties": {
///         "queue_id": {
///             "type": "string"
///         },
///         "active": {
///             "type": "boolean"
///         },
///         "display_name": {
///             "type": "string"
///         },
///         "available": {
///             "type": "boolean"
///         },
///         "items": {
///             "type": "integer"
///         },
///         "shuffle_enabled": {
///             "type": "boolean",
///             "default": false
///         },
///         "repeat_mode": {
///             "$ref": "#/components/schemas/RepeatMode",
///             "default": "off"
///         },
///         "crossfade_enabled": {
///             "type": "boolean",
///             "default": false
///         },
///         "autoplay_enabled": {
///             "type": "boolean",
///             "default": false
///         },
///         "overlay_enabled": {
///             "type": "boolean",
///             "default": false
///         },
///         "overlay_source": {
///             "$ref": "#/components/schemas/ItemMapping",
///             "nullable": true
///         },
///         "overlay_volume": {
///             "type": "integer",
///             "default": 100
///         },
///         "smart_fades_active": {
///             "type": "boolean",
///             "default": false
///         },
///         "smart_shuffle_active": {
///             "type": "boolean",
///             "default": false
///         },
///         "current_index": {
///             "type": "integer",
///             "nullable": true
///         },
///         "index_in_buffer": {
///             "type": "integer",
///             "nullable": true
///         },
///         "ended": {
///             "type": "boolean",
///             "default": false
///         },
///         "elapsed_time": {
///             "type": "number",
///             "default": 0
///         },
///         "elapsed_time_last_updated": {
///             "type": "number"
///         },
///         "playback_speed": {
///             "type": "number",
///             "default": 1.0
///         },
///         "state": {
///             "$ref": "#/components/schemas/PlaybackState",
///             "default": "idle"
///         },
///         "current_item": {
///             "$ref": "#/components/schemas/QueueItem",
///             "nullable": true
///         },
///         "next_item": {
///             "$ref": "#/components/schemas/QueueItem",
///             "nullable": true
///         },
///         "sources": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/ItemMapping"
///             }
///         },
///         "flow_mode": {
///             "type": "boolean",
///             "default": false
///         },
///         "resume_pos": {
///             "type": "integer",
///             "default": 0
///         },
///         "is_dynamic": {
///             "type": "boolean",
///             "default": false
///         },
///         "extra_attributes": {
///             "type": "object",
///             "additionalProperties": {
///                 "type": "string",
///                 "nullable": true
///             }
///         }
///     },
///     "type": "object",
///     "required": [
///         "queue_id",
///         "active",
///         "display_name",
///         "available",
///         "items"
///     ]
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_player_queue.freezed.dart';
part 'music_assistant_player_queue.g.dart';

@freezed
abstract class MusicAssistantPlayerQueue with _$MusicAssistantPlayerQueue {
  const MusicAssistantPlayerQueue._();

  @jsonSerializable
  const factory MusicAssistantPlayerQueue({
    /// queueId
    @JsonKey(name: MusicAssistantPlayerQueue.queueIdKey_)
    required String queueId,

    /// active
    @JsonKey(name: MusicAssistantPlayerQueue.activeKey_) required bool active,

    /// displayName
    @JsonKey(name: MusicAssistantPlayerQueue.displayNameKey_)
    required String displayName,

    /// available
    @JsonKey(name: MusicAssistantPlayerQueue.availableKey_)
    required bool available,

    /// items
    @JsonKey(name: MusicAssistantPlayerQueue.itemsKey_) required int items,

    /// shuffleEnabled
    @Default(false)
    @JsonKey(name: MusicAssistantPlayerQueue.shuffleEnabledKey_)
    bool shuffleEnabled,

    /// repeatMode
    @Default(MusicAssistantRepeatMode.off)
    @JsonKey(name: MusicAssistantPlayerQueue.repeatModeKey_)
    MusicAssistantRepeatMode repeatMode,

    /// crossfadeEnabled
    @Default(false)
    @JsonKey(name: MusicAssistantPlayerQueue.crossfadeEnabledKey_)
    bool crossfadeEnabled,

    /// autoplayEnabled
    @Default(false)
    @JsonKey(name: MusicAssistantPlayerQueue.autoplayEnabledKey_)
    bool autoplayEnabled,

    /// overlayEnabled
    @Default(false)
    @JsonKey(name: MusicAssistantPlayerQueue.overlayEnabledKey_)
    bool overlayEnabled,

    /// overlaySource
    @JsonKey(name: MusicAssistantPlayerQueue.overlaySourceKey_)
    MusicAssistantItemMapping? overlaySource,

    /// overlayVolume
    @Default(100)
    @JsonKey(name: MusicAssistantPlayerQueue.overlayVolumeKey_)
    int overlayVolume,

    /// smartFadesActive
    @Default(false)
    @JsonKey(name: MusicAssistantPlayerQueue.smartFadesActiveKey_)
    bool smartFadesActive,

    /// smartShuffleActive
    @Default(false)
    @JsonKey(name: MusicAssistantPlayerQueue.smartShuffleActiveKey_)
    bool smartShuffleActive,

    /// currentIndex
    @JsonKey(name: MusicAssistantPlayerQueue.currentIndexKey_)
    int? currentIndex,

    /// indexInBuffer
    @JsonKey(name: MusicAssistantPlayerQueue.indexInBufferKey_)
    int? indexInBuffer,

    /// ended
    @Default(false)
    @JsonKey(name: MusicAssistantPlayerQueue.endedKey_)
    bool ended,

    /// elapsedTime
    @Default(0)
    @JsonKey(name: MusicAssistantPlayerQueue.elapsedTimeKey_)
    double elapsedTime,

    /// elapsedTimeLastUpdated
    @JsonKey(name: MusicAssistantPlayerQueue.elapsedTimeLastUpdatedKey_)
    double? elapsedTimeLastUpdated,

    /// playbackSpeed
    @Default(1.0)
    @JsonKey(name: MusicAssistantPlayerQueue.playbackSpeedKey_)
    double playbackSpeed,

    /// state
    @Default(MusicAssistantPlaybackState.idle)
    @JsonKey(name: MusicAssistantPlayerQueue.stateKey_)
    MusicAssistantPlaybackState state,

    /// currentItem
    @JsonKey(name: MusicAssistantPlayerQueue.currentItemKey_)
    MusicAssistantQueueItem? currentItem,

    /// nextItem
    @JsonKey(name: MusicAssistantPlayerQueue.nextItemKey_)
    MusicAssistantQueueItem? nextItem,

    /// sources
    @JsonKey(name: MusicAssistantPlayerQueue.sourcesKey_)
    List<MusicAssistantItemMapping>? sources,

    /// flowMode
    @Default(false)
    @JsonKey(name: MusicAssistantPlayerQueue.flowModeKey_)
    bool flowMode,

    /// resumePos
    @Default(0)
    @JsonKey(name: MusicAssistantPlayerQueue.resumePosKey_)
    int resumePos,

    /// isDynamic
    @Default(false)
    @JsonKey(name: MusicAssistantPlayerQueue.isDynamicKey_)
    bool isDynamic,

    /// extraAttributes
    @JsonKey(name: MusicAssistantPlayerQueue.extraAttributesKey_)
    Map<String, String?>? extraAttributes,
  }) = _MusicAssistantPlayerQueue;

  factory MusicAssistantPlayerQueue.fromJson(Map<String, dynamic> json) =>
      _$MusicAssistantPlayerQueueFromJson(json);

  static const String queueIdKey_ = 'queue_id';

  static const String activeKey_ = 'active';

  static const String displayNameKey_ = 'display_name';

  static const String availableKey_ = 'available';

  static const String itemsKey_ = 'items';

  static const String shuffleEnabledKey_ = 'shuffle_enabled';

  static const String repeatModeKey_ = 'repeat_mode';

  static const String crossfadeEnabledKey_ = 'crossfade_enabled';

  static const String autoplayEnabledKey_ = 'autoplay_enabled';

  static const String overlayEnabledKey_ = 'overlay_enabled';

  static const String overlaySourceKey_ = 'overlay_source';

  static const String overlayVolumeKey_ = 'overlay_volume';

  static const String smartFadesActiveKey_ = 'smart_fades_active';

  static const String smartShuffleActiveKey_ = 'smart_shuffle_active';

  static const String currentIndexKey_ = 'current_index';

  static const String indexInBufferKey_ = 'index_in_buffer';

  static const String endedKey_ = 'ended';

  static const String elapsedTimeKey_ = 'elapsed_time';

  static const String elapsedTimeLastUpdatedKey_ = 'elapsed_time_last_updated';

  static const String playbackSpeedKey_ = 'playback_speed';

  static const String stateKey_ = 'state';

  static const String currentItemKey_ = 'current_item';

  static const String nextItemKey_ = 'next_item';

  static const String sourcesKey_ = 'sources';

  static const String flowModeKey_ = 'flow_mode';

  static const String resumePosKey_ = 'resume_pos';

  static const String isDynamicKey_ = 'is_dynamic';

  static const String extraAttributesKey_ = 'extra_attributes';
}
