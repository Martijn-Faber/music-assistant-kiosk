/// A server-pushed event received from the Music Assistant WebSocket API.
class MusicAssistantEvent {
  const MusicAssistantEvent({
    required this.eventName,
    required this.type,
    this.objectId,
    this.data,
  });

  factory MusicAssistantEvent.fromJson(Map<String, dynamic> json) {
    final eventName = json['event'];
    if (eventName is! String || eventName.isEmpty) {
      throw const FormatException('The WebSocket event has no event name.');
    }
    final rawObjectId = json['object_id'];
    return MusicAssistantEvent(
      eventName: eventName,
      type: MusicAssistantEventType.fromValue(eventName),
      objectId: rawObjectId is String ? rawObjectId : null,
      data: json['data'],
    );
  }

  /// The original event name, including names this SDK does not recognize yet.
  final String eventName;
  final MusicAssistantEventType type;
  final String? objectId;

  /// The event payload, which is decoded into a typed model by event handlers.
  final Object? data;
}

/// Event types currently recognized by the SDK.
enum MusicAssistantEventType {
  playerAdded('player_added'),
  playerUpdated('player_updated'),
  playerRemoved('player_removed'),
  playerConfigUpdated('player_config_updated'),
  playerDspConfigUpdated('player_dsp_config_updated'),
  playerOptionsUpdated('player_options_updated'),
  playerSleepTimerUpdated('player_sleep_timer_updated'),
  dspPresetsUpdated('dsp_presets_updated'),
  dspIrsUpdated('dsp_irs_updated'),
  queueAdded('queue_added'),
  queueUpdated('queue_updated'),
  queueItemsUpdated('queue_items_updated'),
  queueTimeUpdated('queue_time_updated'),
  mediaItemPlayed('media_item_played'),
  mediaItemAdded('media_item_added'),
  mediaItemUpdated('media_item_updated'),
  mediaItemDeleted('media_item_deleted'),
  favoriteUpdated('favorite_updated'),
  playlogUpdated('playlog_updated'),
  providersUpdated('providers_updated'),
  providerEvent('provider_event'),
  setupFlowUpdated('setup_flow_updated'),
  syncTasksUpdated('sync_tasks_updated'),
  tasksUpdated('tasks_updated'),
  dashboardShow('dashboard_show'),
  dashboardHide('dashboard_hide'),
  dashboardsUpdated('dashboards_updated'),
  dashboardSessionsUpdated('dashboard_sessions_updated'),
  musicSyncCompleted('music_sync_completed'),
  authSession('auth_session'),
  coreStateUpdated('core_state_updated'),
  applicationShutdown('application_shutdown'),
  unknown('unknown');

  const MusicAssistantEventType(this.value);

  final String value;

  static MusicAssistantEventType fromValue(String value) =>
      MusicAssistantEventType.values.firstWhere(
        (type) => type.value == value,
        orElse: () => MusicAssistantEventType.unknown,
      );
}
