import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_nl.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('nl'),
  ];

  /// Title at the top of the app settings page.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// Label above the app language selector on the settings page.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguageLabel;

  /// English language name shown as an option in the language selector. Keep the language's own name.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get settingsLanguageEnglishOption;

  /// Dutch language name shown as an option in the language selector. Keep the language's own name.
  ///
  /// In en, this message translates to:
  /// **'Dutch'**
  String get settingsLanguageDutchOption;

  /// Section label above the current Music Assistant user's name and username.
  ///
  /// In en, this message translates to:
  /// **'Signed in as'**
  String get settingsSignedInAsLabel;

  /// Section label above the selector for the Music Assistant speaker controlled by this device.
  ///
  /// In en, this message translates to:
  /// **'Player on screen'**
  String get settingsPlayerOnScreenLabel;

  /// Hint shown in the player selector before a speaker or group is selected.
  ///
  /// In en, this message translates to:
  /// **'Select a player'**
  String get settingsPlayerSelectHint;

  /// Message shown below the player selector when the connected server has no available players.
  ///
  /// In en, this message translates to:
  /// **'No players found on this server.'**
  String get settingsPlayersNoneFoundMessage;

  /// Section label above the clock time format options.
  ///
  /// In en, this message translates to:
  /// **'Clock format'**
  String get settingsClockFormatLabel;

  /// Clock format option that follows the device's system time preference.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get settingsClockFormatSystemOption;

  /// Clock format option to display time with AM/PM, for example 3:45 PM.
  ///
  /// In en, this message translates to:
  /// **'12 hour'**
  String get settingsClockFormat12HourOption;

  /// Clock format option to display time from 00:00 to 23:59, for example 15:45.
  ///
  /// In en, this message translates to:
  /// **'24 hour'**
  String get settingsClockFormat24HourOption;

  /// Section label for the connected Music Assistant server's details.
  ///
  /// In en, this message translates to:
  /// **'Music Assistant server'**
  String get settingsServerSectionLabel;

  /// Field label for the connected Music Assistant server status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get settingsServerStatusLabel;

  /// Button that signs the user out of the connected Music Assistant server.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get settingsSignOutAction;

  /// Button label in shared app controls and messages for the action to try again.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get commonTryAgainAction;

  /// Button label in shared app controls and messages for the action to continue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get commonContinueAction;

  /// Tooltip for the control in shared app controls and messages: “Back”.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get commonBackTooltip;

  /// Text shown in shared app controls and messages. It communicates: “Select an option”.
  ///
  /// In en, this message translates to:
  /// **'Select an option'**
  String get commonSelectOptionHint;

  /// Fallback value used in a playback status when the selected player has no display name.
  ///
  /// In en, this message translates to:
  /// **'player'**
  String get commonPlayerFallback;

  /// Error or status message in shared app controls and messages: “Could not connect to the server. Check the address and try again”.
  ///
  /// In en, this message translates to:
  /// **'Could not connect to the server. Check the address and try again.'**
  String get commonConnectionFailed;

  /// Error or status message in shared app controls and messages: “Could not select this player. Try again”.
  ///
  /// In en, this message translates to:
  /// **'Could not select this player. Try again.'**
  String get commonPlayerSelectionFailed;

  /// Title shown in the server setup and sign-in flow: “Find your server”.
  ///
  /// In en, this message translates to:
  /// **'Find your server'**
  String get onboardingFindServerTitle;

  /// Explanatory or instructional text shown in the server setup and sign-in flow: “Looking for Music Assistant on your home network”.
  ///
  /// In en, this message translates to:
  /// **'Looking for Music Assistant on your home network.'**
  String get onboardingFindServerSubtitle;

  /// Error or status message in the server setup and sign-in flow: “Could not search the network. You can enter the server manually”.
  ///
  /// In en, this message translates to:
  /// **'Could not search the network. You can enter the server manually.'**
  String get onboardingNetworkSearchFailed;

  /// Text shown in the server setup and sign-in flow. It communicates: “No servers found. You can add one manually”.
  ///
  /// In en, this message translates to:
  /// **'No servers found. You can add one manually.'**
  String get onboardingNoServersFound;

  /// Explanatory or instructional text shown in the server setup and sign-in flow: “This usually takes a few seconds”.
  ///
  /// In en, this message translates to:
  /// **'This usually takes a few seconds.'**
  String get onboardingDiscoveryWait;

  /// Button label in the server setup and sign-in flow for the action to search again.
  ///
  /// In en, this message translates to:
  /// **'Search again'**
  String get onboardingSearchAgainAction;

  /// Button label in the server setup and sign-in flow for the action to can’t find it? enter server manually.
  ///
  /// In en, this message translates to:
  /// **'Can’t find it? Enter server manually'**
  String get onboardingManualEntryAction;

  /// Title shown in the server setup and sign-in flow: “Server address”.
  ///
  /// In en, this message translates to:
  /// **'Server address'**
  String get onboardingServerAddressTitle;

  /// Explanatory or instructional text shown in the server setup and sign-in flow: “Enter the hostname or IP address and port”.
  ///
  /// In en, this message translates to:
  /// **'Enter the hostname or IP address and port.'**
  String get onboardingServerAddressSubtitle;

  /// Label in the server setup and sign-in flow identifying hostname or ip.
  ///
  /// In en, this message translates to:
  /// **'Hostname or IP'**
  String get onboardingHostnameLabel;

  /// Label in the server setup and sign-in flow identifying port.
  ///
  /// In en, this message translates to:
  /// **'Port'**
  String get onboardingPortLabel;

  /// Error or status message in the server setup and sign-in flow: “Enter a valid server address”.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid server address.'**
  String get onboardingServerAddressInvalid;

  /// Error or status message in the server setup and sign-in flow: “Enter a valid port (1–65535)”.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid port (1–65535).'**
  String get onboardingPortInvalid;

  /// Error or status message in the server setup and sign-in flow: “Music Assistant is not responding”.
  ///
  /// In en, this message translates to:
  /// **'Music Assistant is not responding'**
  String get onboardingMusicAssistantUnresponsive;

  /// Title shown in the server setup and sign-in flow: “Scan to sign in”.
  ///
  /// In en, this message translates to:
  /// **'Scan to sign in'**
  String get onboardingScanToSignInTitle;

  /// Explanatory or instructional text shown in the server setup and sign-in flow: “Use your phone to scan this code and sign in to Home Assistant. Keep your phone and clock on the same Wi-Fi network”.
  ///
  /// In en, this message translates to:
  /// **'Use your phone to scan this code and sign in to Home Assistant. Keep your phone and clock on the same Wi-Fi network.'**
  String get onboardingScanToSignInInstructions;

  /// Text shown in the server setup and sign-in flow. It communicates: “Waiting for your phone”.
  ///
  /// In en, this message translates to:
  /// **'Waiting for your phone'**
  String get onboardingWaitingForPhone;

  /// Text shown in the server setup and sign-in flow. It communicates: “Complete sign-in on your phone”.
  ///
  /// In en, this message translates to:
  /// **'Complete sign-in on your phone'**
  String get onboardingCompleteSignInOnPhone;

  /// Text shown in the server setup and sign-in flow. It communicates: “Connecting to Music Assistant…”.
  ///
  /// In en, this message translates to:
  /// **'Connecting to Music Assistant…'**
  String get onboardingConnecting;

  /// Text shown in the server setup and sign-in flow. It communicates: “Preparing sign-in…”.
  ///
  /// In en, this message translates to:
  /// **'Preparing sign-in…'**
  String get onboardingPreparingSignIn;

  /// Error or status message in the server setup and sign-in flow: “Could not prepare sign-in. Try again”.
  ///
  /// In en, this message translates to:
  /// **'Could not prepare sign-in. Try again.'**
  String get onboardingSignInFailed;

  /// Text shown in the server setup and sign-in flow. It communicates: “Sign-in was cancelled. You can close this page”.
  ///
  /// In en, this message translates to:
  /// **'Sign-in was cancelled. You can close this page.'**
  String get onboardingBrowserSignInCancelled;

  /// Text shown in the server setup and sign-in flow. It communicates: “Music Assistant did not return a sign-in token”.
  ///
  /// In en, this message translates to:
  /// **'Music Assistant did not return a sign-in token.'**
  String get onboardingBrowserTokenMissing;

  /// Text shown in the server setup and sign-in flow. It communicates: “Connected. You can return to the clock”.
  ///
  /// In en, this message translates to:
  /// **'Connected. You can return to the clock.'**
  String get onboardingBrowserConnected;

  /// Text shown in the server setup and sign-in flow. It communicates: “This sign-in link is no longer valid. Return to the clock and scan again”.
  ///
  /// In en, this message translates to:
  /// **'This sign-in link is no longer valid. Return to the clock and scan again.'**
  String get onboardingBrowserLinkExpired;

  /// Text shown in the server setup and sign-in flow. It communicates: “You can now close this page”.
  ///
  /// In en, this message translates to:
  /// **'You can now close this page.'**
  String get onboardingBrowserClosePage;

  /// Title shown in the player selection screen: “Choose your player”.
  ///
  /// In en, this message translates to:
  /// **'Choose your player'**
  String get playerSetupTitle;

  /// Explanatory or instructional text shown in the player selection screen: “Select the speaker or group this device should control”.
  ///
  /// In en, this message translates to:
  /// **'Select the speaker or group this device should control.'**
  String get playerSetupSubtitle;

  /// Text shown in the player selection screen. It communicates: “Saving”.
  ///
  /// In en, this message translates to:
  /// **'Saving'**
  String get playerSetupSaving;

  /// Button label in the player selection screen for the action to refresh players.
  ///
  /// In en, this message translates to:
  /// **'Refresh players'**
  String get playerSetupRefreshAction;

  /// Text shown in the player selection screen. It communicates: “No players found on this server”.
  ///
  /// In en, this message translates to:
  /// **'No players found on this server.'**
  String get playerSetupNoPlayers;

  /// Plural unit displayed after a number when a selected player is a group of speakers.
  ///
  /// In en, this message translates to:
  /// **'speakers'**
  String get playerGroupSpeakers;

  /// Singular unit displayed after the number one when a selected player group contains one speaker.
  ///
  /// In en, this message translates to:
  /// **'speaker'**
  String get playerGroupSpeaker;

  /// Fallback provider name displayed when the app cannot identify the music service.
  ///
  /// In en, this message translates to:
  /// **'Unknown provider'**
  String get providerUnknownName;

  /// Text shown in the player and now-playing interface. It communicates: “Nothing is playing”.
  ///
  /// In en, this message translates to:
  /// **'Nothing is playing'**
  String get playerNothingPlaying;

  /// Text shown in the player and now-playing interface. It communicates: “Music is playing”.
  ///
  /// In en, this message translates to:
  /// **'Music is playing'**
  String get playerMusicIsPlaying;

  /// Text shown in the player and now-playing interface. It communicates: “Start listening”.
  ///
  /// In en, this message translates to:
  /// **'Start listening'**
  String get playerStartListening;

  /// Text shown in the player and now-playing interface. It communicates: “Swipe to choose something to play”.
  ///
  /// In en, this message translates to:
  /// **'Swipe to choose something to play'**
  String get playerSwipeToChoose;

  /// Error or status message in the player and now-playing interface: “Unavailable”.
  ///
  /// In en, this message translates to:
  /// **'Unavailable'**
  String get playerUnavailable;

  /// Text shown in the player and now-playing interface. It communicates: “Quality unknown”.
  ///
  /// In en, this message translates to:
  /// **'Quality unknown'**
  String get playerQualityUnknown;

  /// Error or status message in the player and now-playing interface: “Player action failed”.
  ///
  /// In en, this message translates to:
  /// **'Player action failed.'**
  String get playerActionFailed;

  /// Heading for a section in the idle screen: “Start with radio”.
  ///
  /// In en, this message translates to:
  /// **'Start with radio'**
  String get idleStartRadioSection;

  /// Empty-state message shown in the idle screen: “No favorite radio stations set up”.
  ///
  /// In en, this message translates to:
  /// **'No favorite radio stations set up'**
  String get idleRadioFavoritesEmpty;

  /// Heading for a section in the idle screen: “Your playlists”.
  ///
  /// In en, this message translates to:
  /// **'Your playlists'**
  String get idlePlaylistsSection;

  /// Empty-state message shown in the idle screen: “No playlists found”.
  ///
  /// In en, this message translates to:
  /// **'No playlists found'**
  String get idlePlaylistsEmpty;

  /// Error or status message in the idle screen: “Could not start playback”.
  ///
  /// In en, this message translates to:
  /// **'Could not start playback.'**
  String get idlePlayStartFailed;

  /// Tooltip for the control in the idle screen: “Radio station details”.
  ///
  /// In en, this message translates to:
  /// **'Radio station details'**
  String get idleRadioDetailsTooltip;

  /// Title shown in the idle screen: “Radio station”.
  ///
  /// In en, this message translates to:
  /// **'Radio station'**
  String get idleRadioStationTitle;

  /// Title shown in the playback queue interface: “Queue”.
  ///
  /// In en, this message translates to:
  /// **'Queue'**
  String get queueTitle;

  /// Title shown in the playback queue interface: “Clear queue?”.
  ///
  /// In en, this message translates to:
  /// **'Clear queue?'**
  String get queueClearConfirmationTitle;

  /// Text shown in the playback queue interface. It communicates: “This will remove all items from the queue”.
  ///
  /// In en, this message translates to:
  /// **'This will remove all items from the queue.'**
  String get queueClearConfirmationBody;

  /// Button label in the playback queue interface for the action to cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get queueCancelAction;

  /// Button label in the playback queue interface for the action to clear queue.
  ///
  /// In en, this message translates to:
  /// **'Clear queue'**
  String get queueClearAction;

  /// Error or status message in the playback queue interface: “Could not clear the queue”.
  ///
  /// In en, this message translates to:
  /// **'Could not clear the queue.'**
  String get queueClearFailed;

  /// Error or status message in the playback queue interface: “Could not start this queue item”.
  ///
  /// In en, this message translates to:
  /// **'Could not start this queue item.'**
  String get queueStartItemFailed;

  /// Error or status message in the playback queue interface: “Could not remove this queue item”.
  ///
  /// In en, this message translates to:
  /// **'Could not remove this queue item.'**
  String get queueRemoveItemFailed;

  /// Text shown in the playback queue interface. It communicates: “This item is already buffered for playback”.
  ///
  /// In en, this message translates to:
  /// **'This item is already buffered for playback.'**
  String get queueItemAlreadyBuffered;

  /// Text shown in the playback queue interface. It communicates: “This track is already buffered by the player to play next”.
  ///
  /// In en, this message translates to:
  /// **'This track is already buffered by the player to play next.'**
  String get queueTrackAlreadyBuffered;

  /// Error or status message in the playback queue interface: “Could not load the queue”.
  ///
  /// In en, this message translates to:
  /// **'Could not load the queue.'**
  String get queueLoadFailed;

  /// Empty-state message shown in the playback queue interface: “The queue is empty”.
  ///
  /// In en, this message translates to:
  /// **'The queue is empty.'**
  String get queueEmpty;

  /// Error or status message in the playback queue interface: “Could not change shuffle”.
  ///
  /// In en, this message translates to:
  /// **'Could not change shuffle.'**
  String get queueShuffleChangeFailed;

  /// Error or status message in the playback queue interface: “Shuffle is unavailable for dynamic queues”.
  ///
  /// In en, this message translates to:
  /// **'Shuffle is unavailable for dynamic queues'**
  String get queueShuffleUnavailable;

  /// Tooltip for the control in the playback queue interface: “Disable shuffle”.
  ///
  /// In en, this message translates to:
  /// **'Disable shuffle'**
  String get queueDisableShuffleTooltip;

  /// Tooltip for the control in the playback queue interface: “Enable shuffle”.
  ///
  /// In en, this message translates to:
  /// **'Enable shuffle'**
  String get queueEnableShuffleTooltip;

  /// Error or status message in the playback queue interface: “Could not change autoplay”.
  ///
  /// In en, this message translates to:
  /// **'Could not change autoplay.'**
  String get queueAutoplayChangeFailed;

  /// Tooltip for the control in the playback queue interface: “Disable autoplay”.
  ///
  /// In en, this message translates to:
  /// **'Disable autoplay'**
  String get queueDisableAutoplayTooltip;

  /// Tooltip for the control in the playback queue interface: “Enable autoplay”.
  ///
  /// In en, this message translates to:
  /// **'Enable autoplay'**
  String get queueEnableAutoplayTooltip;

  /// Tooltip for the control in the playback queue interface: “Clear queue”.
  ///
  /// In en, this message translates to:
  /// **'Clear queue'**
  String get queueClearTooltip;

  /// Tooltip for the control in the playback queue interface: “Close queue”.
  ///
  /// In en, this message translates to:
  /// **'Close queue'**
  String get queueCloseTooltip;

  /// Error or status message in the player and now-playing interface: “Could not update favorite”.
  ///
  /// In en, this message translates to:
  /// **'Could not update favorite.'**
  String get playerFavoriteChangeFailed;

  /// Tooltip for the control in the player and now-playing interface: “Remove from favorites”.
  ///
  /// In en, this message translates to:
  /// **'Remove from favorites'**
  String get playerRemoveFavoriteTooltip;

  /// Tooltip for the control in the player and now-playing interface: “Add to favorites”.
  ///
  /// In en, this message translates to:
  /// **'Add to favorites'**
  String get playerAddFavoriteTooltip;

  /// Tooltip for the control in the player and now-playing interface: “Show queue”.
  ///
  /// In en, this message translates to:
  /// **'Show queue'**
  String get playerShowQueueTooltip;

  /// Title shown in the playback details interface: “Playback details”.
  ///
  /// In en, this message translates to:
  /// **'Playback details'**
  String get playbackDetailsTitle;

  /// Error or status message in the playback details interface: “Could not load playback details”.
  ///
  /// In en, this message translates to:
  /// **'Could not load playback details.'**
  String get playbackDetailsLoadFailed;

  /// Error or status message in the playback details interface: “Playback details are unavailable”.
  ///
  /// In en, this message translates to:
  /// **'Playback details are unavailable'**
  String get playbackDetailsUnavailable;

  /// Label in the playback details interface identifying quality.
  ///
  /// In en, this message translates to:
  /// **'Quality'**
  String get playbackQualityLabel;

  /// Text shown in the playback details interface. It communicates: “Unknown”.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get playbackUnknownValue;

  /// Label in the playback details interface identifying source.
  ///
  /// In en, this message translates to:
  /// **'Source'**
  String get playbackSourceLabel;

  /// Label in the playback details interface identifying stream.
  ///
  /// In en, this message translates to:
  /// **'Stream'**
  String get playbackStreamLabel;

  /// Label in the playback details interface identifying codec.
  ///
  /// In en, this message translates to:
  /// **'Codec'**
  String get playbackCodecLabel;

  /// Label in the playback details interface identifying container.
  ///
  /// In en, this message translates to:
  /// **'Container'**
  String get playbackContainerLabel;

  /// Label in the playback details interface identifying sample rate.
  ///
  /// In en, this message translates to:
  /// **'Sample rate'**
  String get playbackSampleRateLabel;

  /// Label in the playback details interface identifying bit depth.
  ///
  /// In en, this message translates to:
  /// **'Bit depth'**
  String get playbackBitDepthLabel;

  /// Label in the playback details interface identifying channels.
  ///
  /// In en, this message translates to:
  /// **'Channels'**
  String get playbackChannelsLabel;

  /// Label in the playback details interface identifying bitrate.
  ///
  /// In en, this message translates to:
  /// **'Bitrate'**
  String get playbackBitrateLabel;

  /// Title of the dialog that displays available speakers and lets the user adjust their volume.
  ///
  /// In en, this message translates to:
  /// **'Speakers & volume'**
  String get playerVolumeDialogTitle;

  /// Error shown in the volume dialog when the speakers associated with the selected player cannot be loaded.
  ///
  /// In en, this message translates to:
  /// **'Could not load the speakers for this player.'**
  String get playerVolumeLoadFailed;

  /// Status shown beside a speaker when that speaker does not support volume control.
  ///
  /// In en, this message translates to:
  /// **'Unsupported'**
  String get playerVolumeUnsupported;

  /// Error shown when the app cannot set the selected speaker’s volume.
  ///
  /// In en, this message translates to:
  /// **'Could not change this speaker volume.'**
  String get playerVolumeChangeFailed;

  /// No description provided for @playerGroupAddSpeaker.
  ///
  /// In en, this message translates to:
  /// **'Add speaker to group'**
  String get playerGroupAddSpeaker;

  /// No description provided for @playerGroupAddAction.
  ///
  /// In en, this message translates to:
  /// **'Add to group'**
  String get playerGroupAddAction;

  /// No description provided for @playerGroupAddFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not add speaker to the group.'**
  String get playerGroupAddFailed;

  /// No description provided for @playerGroupNoSpeakersAvailable.
  ///
  /// In en, this message translates to:
  /// **'No compatible speakers available to add.'**
  String get playerGroupNoSpeakersAvailable;

  /// Status message shown while playback starts on the selected speaker. The {player} placeholder is the speaker name.
  ///
  /// In en, this message translates to:
  /// **'Starting on {player}…'**
  String playbackStartingOn(String player);

  /// Error or status message in app settings and connection status: “Secure storage is unavailable. Fully stop and relaunch the app from Flutter”.
  ///
  /// In en, this message translates to:
  /// **'Secure storage is unavailable. Fully stop and relaunch the app from Flutter.'**
  String get settingsSecureStorageUnavailable;

  /// Text shown in app settings and connection status. It communicates: “Sign in again to reconnect”.
  ///
  /// In en, this message translates to:
  /// **'Sign in again to reconnect.'**
  String get settingsSignInAgainToReconnect;

  /// Text shown in app settings and connection status. It communicates: “Connect to Music Assistant before selecting a player”.
  ///
  /// In en, this message translates to:
  /// **'Connect to Music Assistant before selecting a player.'**
  String get settingsConnectBeforeSelectingPlayer;

  /// Text shown in app settings and connection status. It communicates: “Could not load players. Try again”.
  ///
  /// In en, this message translates to:
  /// **'Could not load players. Try again.'**
  String get settingsCouldNotLoadPlayers;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'nl'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'nl':
      return AppLocalizationsNl();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
