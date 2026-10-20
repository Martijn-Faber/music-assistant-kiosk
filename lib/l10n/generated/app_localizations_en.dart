// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsLanguageLabel => 'Language';

  @override
  String get settingsLanguageEnglishOption => 'English';

  @override
  String get settingsLanguageDutchOption => 'Dutch';

  @override
  String get settingsSignedInAsLabel => 'Signed in as';

  @override
  String get settingsPlayerOnScreenLabel => 'Player on screen';

  @override
  String get settingsPlayerSelectHint => 'Select a player';

  @override
  String get settingsPlayersNoneFoundMessage =>
      'No players found on this server.';

  @override
  String get settingsClockFormatLabel => 'Clock format';

  @override
  String get settingsClockFormatSystemOption => 'System';

  @override
  String get settingsClockFormat12HourOption => '12 hour';

  @override
  String get settingsClockFormat24HourOption => '24 hour';

  @override
  String get settingsServerSectionLabel => 'Music Assistant server';

  @override
  String get settingsServerStatusLabel => 'Status';

  @override
  String get settingsSignOutAction => 'Sign out';

  @override
  String get commonTryAgainAction => 'Try again';

  @override
  String get commonContinueAction => 'Continue';

  @override
  String get commonBackTooltip => 'Back';

  @override
  String get commonSelectOptionHint => 'Select an option';

  @override
  String get commonPlayerFallback => 'player';

  @override
  String get commonConnectionFailed =>
      'Could not connect to the server. Check the address and try again.';

  @override
  String get commonPlayerSelectionFailed =>
      'Could not select this player. Try again.';

  @override
  String get onboardingFindServerTitle => 'Find your server';

  @override
  String get onboardingFindServerSubtitle =>
      'Looking for Music Assistant on your home network.';

  @override
  String get onboardingNetworkSearchFailed =>
      'Could not search the network. You can enter the server manually.';

  @override
  String get onboardingNoServersFound =>
      'No servers found. You can add one manually.';

  @override
  String get onboardingDiscoveryWait => 'This usually takes a few seconds.';

  @override
  String get onboardingSearchAgainAction => 'Search again';

  @override
  String get onboardingManualEntryAction =>
      'Can’t find it? Enter server manually';

  @override
  String get onboardingServerAddressTitle => 'Server address';

  @override
  String get onboardingServerAddressSubtitle =>
      'Enter the hostname or IP address and port.';

  @override
  String get onboardingHostnameLabel => 'Hostname or IP';

  @override
  String get onboardingPortLabel => 'Port';

  @override
  String get onboardingServerAddressInvalid => 'Enter a valid server address.';

  @override
  String get onboardingPortInvalid => 'Enter a valid port (1–65535).';

  @override
  String get onboardingMusicAssistantUnresponsive =>
      'Music Assistant is not responding';

  @override
  String get onboardingScanToSignInTitle => 'Scan to sign in';

  @override
  String get onboardingScanToSignInInstructions =>
      'Use your phone to scan this code and sign in to Home Assistant. Keep your phone and clock on the same Wi-Fi network.';

  @override
  String get onboardingWaitingForPhone => 'Waiting for your phone';

  @override
  String get onboardingCompleteSignInOnPhone =>
      'Complete sign-in on your phone';

  @override
  String get onboardingConnecting => 'Connecting to Music Assistant…';

  @override
  String get onboardingPreparingSignIn => 'Preparing sign-in…';

  @override
  String get onboardingSignInFailed => 'Could not prepare sign-in. Try again.';

  @override
  String get onboardingBrowserSignInCancelled =>
      'Sign-in was cancelled. You can close this page.';

  @override
  String get onboardingBrowserTokenMissing =>
      'Music Assistant did not return a sign-in token.';

  @override
  String get onboardingBrowserConnected =>
      'Connected. You can return to the clock.';

  @override
  String get onboardingBrowserLinkExpired =>
      'This sign-in link is no longer valid. Return to the clock and scan again.';

  @override
  String get onboardingBrowserClosePage => 'You can now close this page.';

  @override
  String get playerSetupTitle => 'Choose your player';

  @override
  String get playerSetupSubtitle =>
      'Select the speaker or group this device should control.';

  @override
  String get playerSetupSaving => 'Saving';

  @override
  String get playerSetupRefreshAction => 'Refresh players';

  @override
  String get playerSetupNoPlayers => 'No players found on this server.';

  @override
  String get playerGroupSpeakers => 'speakers';

  @override
  String get playerGroupSpeaker => 'speaker';

  @override
  String get providerUnknownName => 'Unknown provider';

  @override
  String get playerNothingPlaying => 'Nothing is playing';

  @override
  String get playerMusicIsPlaying => 'Music is playing';

  @override
  String get playerStartListening => 'Start listening';

  @override
  String get playerSwipeToChoose => 'Swipe to choose something to play';

  @override
  String get playerUnavailable => 'Unavailable';

  @override
  String get playerQualityUnknown => 'Quality unknown';

  @override
  String get playerActionFailed => 'Player action failed.';

  @override
  String get idleStartRadioSection => 'Start with radio';

  @override
  String get idleRadioFavoritesEmpty => 'No favorite radio stations set up';

  @override
  String get idlePlaylistsSection => 'Your playlists';

  @override
  String get idlePlaylistsEmpty => 'No playlists found';

  @override
  String get idlePlayStartFailed => 'Could not start playback.';

  @override
  String get idleRadioDetailsTooltip => 'Radio station details';

  @override
  String get idleRadioStationTitle => 'Radio station';

  @override
  String get queueTitle => 'Queue';

  @override
  String get queueClearConfirmationTitle => 'Clear queue?';

  @override
  String get queueClearConfirmationBody =>
      'This will remove all items from the queue.';

  @override
  String get queueCancelAction => 'Cancel';

  @override
  String get queueClearAction => 'Clear queue';

  @override
  String get queueClearFailed => 'Could not clear the queue.';

  @override
  String get queueStartItemFailed => 'Could not start this queue item.';

  @override
  String get queueRemoveItemFailed => 'Could not remove this queue item.';

  @override
  String get queueItemAlreadyBuffered =>
      'This item is already buffered for playback.';

  @override
  String get queueTrackAlreadyBuffered =>
      'This track is already buffered by the player to play next.';

  @override
  String get queueLoadFailed => 'Could not load the queue.';

  @override
  String get queueEmpty => 'The queue is empty.';

  @override
  String get queueShuffleChangeFailed => 'Could not change shuffle.';

  @override
  String get queueShuffleUnavailable =>
      'Shuffle is unavailable for dynamic queues';

  @override
  String get queueDisableShuffleTooltip => 'Disable shuffle';

  @override
  String get queueEnableShuffleTooltip => 'Enable shuffle';

  @override
  String get queueAutoplayChangeFailed => 'Could not change autoplay.';

  @override
  String get queueDisableAutoplayTooltip => 'Disable autoplay';

  @override
  String get queueEnableAutoplayTooltip => 'Enable autoplay';

  @override
  String get queueClearTooltip => 'Clear queue';

  @override
  String get queueCloseTooltip => 'Close queue';

  @override
  String get playerFavoriteChangeFailed => 'Could not update favorite.';

  @override
  String get playerRemoveFavoriteTooltip => 'Remove from favorites';

  @override
  String get playerAddFavoriteTooltip => 'Add to favorites';

  @override
  String get playerShowQueueTooltip => 'Show queue';

  @override
  String get playbackDetailsTitle => 'Playback details';

  @override
  String get playbackDetailsLoadFailed => 'Could not load playback details.';

  @override
  String get playbackDetailsUnavailable => 'Playback details are unavailable';

  @override
  String get playbackQualityLabel => 'Quality';

  @override
  String get playbackUnknownValue => 'Unknown';

  @override
  String get playbackSourceLabel => 'Source';

  @override
  String get playbackStreamLabel => 'Stream';

  @override
  String get playbackCodecLabel => 'Codec';

  @override
  String get playbackContainerLabel => 'Container';

  @override
  String get playbackSampleRateLabel => 'Sample rate';

  @override
  String get playbackBitDepthLabel => 'Bit depth';

  @override
  String get playbackChannelsLabel => 'Channels';

  @override
  String get playbackBitrateLabel => 'Bitrate';

  @override
  String get playerVolumeDialogTitle => 'Speakers & volume';

  @override
  String get playerVolumeLoadFailed =>
      'Could not load the speakers for this player.';

  @override
  String get playerVolumeUnsupported => 'Unsupported';

  @override
  String get playerVolumeChangeFailed =>
      'Could not change this speaker volume.';

  @override
  String get playerGroupAddSpeaker => 'Add speaker to group';

  @override
  String get playerGroupAddAction => 'Add to group';

  @override
  String get playerGroupAddFailed => 'Could not add speaker to the group.';

  @override
  String get playerGroupNoSpeakersAvailable =>
      'No compatible speakers available to add.';

  @override
  String playbackStartingOn(String player) {
    return 'Starting on $player…';
  }

  @override
  String get settingsSecureStorageUnavailable =>
      'Secure storage is unavailable. Fully stop and relaunch the app from Flutter.';

  @override
  String get settingsSignInAgainToReconnect => 'Sign in again to reconnect.';

  @override
  String get settingsConnectBeforeSelectingPlayer =>
      'Connect to Music Assistant before selecting a player.';

  @override
  String get settingsCouldNotLoadPlayers =>
      'Could not load players. Try again.';
}
