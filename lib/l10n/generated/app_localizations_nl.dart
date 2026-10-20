// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get settingsTitle => 'Instellingen';

  @override
  String get settingsLanguageLabel => 'Taal';

  @override
  String get settingsLanguageEnglishOption => 'Engels';

  @override
  String get settingsLanguageDutchOption => 'Nederlands';

  @override
  String get settingsSignedInAsLabel => 'Aangemeld als';

  @override
  String get settingsPlayerOnScreenLabel => 'Speler op scherm';

  @override
  String get settingsPlayerSelectHint => 'Selecteer een speler';

  @override
  String get settingsPlayersNoneFoundMessage =>
      'Geen spelers gevonden op deze server.';

  @override
  String get settingsClockFormatLabel => 'Kloknotatie';

  @override
  String get settingsClockFormatSystemOption => 'Systeem';

  @override
  String get settingsClockFormat12HourOption => '12-uursnotatie';

  @override
  String get settingsClockFormat24HourOption => '24-uursnotatie';

  @override
  String get settingsServerSectionLabel => 'Music Assistant-server';

  @override
  String get settingsServerStatusLabel => 'Status';

  @override
  String get settingsSignOutAction => 'Afmelden';

  @override
  String get commonTryAgainAction => 'Opnieuw proberen';

  @override
  String get commonContinueAction => 'Doorgaan';

  @override
  String get commonBackTooltip => 'Terug';

  @override
  String get commonSelectOptionHint => 'Selecteer een optie';

  @override
  String get commonPlayerFallback => 'speler';

  @override
  String get commonConnectionFailed =>
      'Verbinden met de server is mislukt. Controleer het adres en probeer het opnieuw.';

  @override
  String get commonPlayerSelectionFailed =>
      'Deze speler selecteren is mislukt. Probeer het opnieuw.';

  @override
  String get onboardingFindServerTitle => 'Server zoeken';

  @override
  String get onboardingFindServerSubtitle =>
      'Zoeken naar Music Assistant op je thuisnetwerk.';

  @override
  String get onboardingNetworkSearchFailed =>
      'Netwerk zoeken is mislukt. Je kunt het serveradres handmatig invoeren.';

  @override
  String get onboardingNoServersFound =>
      'Geen servers gevonden. Je kunt er handmatig een toevoegen.';

  @override
  String get onboardingDiscoveryWait =>
      'Dit duurt meestal maar een paar seconden.';

  @override
  String get onboardingSearchAgainAction => 'Opnieuw zoeken';

  @override
  String get onboardingManualEntryAction =>
      'Kun je de server niet vinden? Voer het adres handmatig in';

  @override
  String get onboardingServerAddressTitle => 'Serveradres';

  @override
  String get onboardingServerAddressSubtitle =>
      'Voer de hostnaam of het IP-adres en de poort in.';

  @override
  String get onboardingHostnameLabel => 'Hostnaam of IP-adres';

  @override
  String get onboardingPortLabel => 'Poort';

  @override
  String get onboardingServerAddressInvalid =>
      'Voer een geldig serveradres in.';

  @override
  String get onboardingPortInvalid => 'Voer een geldige poort in (1–65535).';

  @override
  String get onboardingMusicAssistantUnresponsive =>
      'Music Assistant reageert niet';

  @override
  String get onboardingScanToSignInTitle => 'Scan om aan te melden';

  @override
  String get onboardingScanToSignInInstructions =>
      'Scan deze code met je telefoon om je aan te melden bij Home Assistant. Verbind je telefoon en klok met hetzelfde wifi-netwerk.';

  @override
  String get onboardingWaitingForPhone => 'Wachten op je telefoon';

  @override
  String get onboardingCompleteSignInOnPhone =>
      'Voltooi het aanmelden op je telefoon';

  @override
  String get onboardingConnecting => 'Verbinden met Music Assistant…';

  @override
  String get onboardingPreparingSignIn => 'Aanmelding voorbereiden…';

  @override
  String get onboardingSignInFailed =>
      'Aanmelding voorbereiden is mislukt. Probeer het opnieuw.';

  @override
  String get onboardingBrowserSignInCancelled =>
      'Aanmelden is geannuleerd. Je kunt deze pagina sluiten.';

  @override
  String get onboardingBrowserTokenMissing =>
      'Music Assistant heeft geen aanmeldtoken teruggestuurd.';

  @override
  String get onboardingBrowserConnected =>
      'Verbonden. Je kunt teruggaan naar de klok.';

  @override
  String get onboardingBrowserLinkExpired =>
      'Deze aanmeldlink is niet meer geldig. Ga terug naar de klok en scan opnieuw.';

  @override
  String get onboardingBrowserClosePage => 'Je kunt deze pagina nu sluiten.';

  @override
  String get playerSetupTitle => 'Kies je speler';

  @override
  String get playerSetupSubtitle =>
      'Selecteer de speaker of groep die dit apparaat moet bedienen.';

  @override
  String get playerSetupSaving => 'Opslaan';

  @override
  String get playerSetupRefreshAction => 'Spelers vernieuwen';

  @override
  String get playerSetupNoPlayers => 'Geen spelers gevonden op deze server.';

  @override
  String get playerGroupSpeakers => 'speakers';

  @override
  String get playerGroupSpeaker => 'speaker';

  @override
  String get providerUnknownName => 'Onbekende provider';

  @override
  String get playerNothingPlaying => 'Er wordt niets afgespeeld';

  @override
  String get playerMusicIsPlaying => 'Muziek wordt afgespeeld';

  @override
  String get playerStartListening => 'Begin met luisteren';

  @override
  String get playerSwipeToChoose => 'Veeg om iets te kiezen om af te spelen';

  @override
  String get playerUnavailable => 'Niet beschikbaar';

  @override
  String get playerQualityUnknown => 'Kwaliteit onbekend';

  @override
  String get playerActionFailed => 'Actie voor de speler is mislukt.';

  @override
  String get idleStartRadioSection => 'Start met radio';

  @override
  String get idleRadioFavoritesEmpty => 'Geen favoriete radiozenders ingesteld';

  @override
  String get idlePlaylistsSection => 'Jouw afspeellijsten';

  @override
  String get idlePlaylistsEmpty => 'Geen afspeellijsten gevonden';

  @override
  String get idlePlayStartFailed => 'Afspelen starten is mislukt.';

  @override
  String get idleRadioDetailsTooltip => 'Details van radiozender';

  @override
  String get idleRadioStationTitle => 'Radiozender';

  @override
  String get queueTitle => 'Wachtrij';

  @override
  String get queueClearConfirmationTitle => 'Wachtrij wissen?';

  @override
  String get queueClearConfirmationBody =>
      'Alle items worden uit de wachtrij verwijderd.';

  @override
  String get queueCancelAction => 'Annuleren';

  @override
  String get queueClearAction => 'Wachtrij wissen';

  @override
  String get queueClearFailed => 'Wachtrij wissen is mislukt.';

  @override
  String get queueStartItemFailed =>
      'Dit item uit de wachtrij starten is mislukt.';

  @override
  String get queueRemoveItemFailed =>
      'Dit item uit de wachtrij verwijderen is mislukt.';

  @override
  String get queueItemAlreadyBuffered =>
      'Dit item staat al klaar om af te spelen.';

  @override
  String get queueTrackAlreadyBuffered =>
      'Dit nummer staat al klaar om hierna af te spelen.';

  @override
  String get queueLoadFailed => 'Wachtrij laden is mislukt.';

  @override
  String get queueEmpty => 'De wachtrij is leeg.';

  @override
  String get queueShuffleChangeFailed =>
      'Willekeurig afspelen wijzigen is mislukt.';

  @override
  String get queueShuffleUnavailable =>
      'Willekeurig afspelen is niet beschikbaar voor dynamische wachtrijen';

  @override
  String get queueDisableShuffleTooltip => 'Willekeurig afspelen uitschakelen';

  @override
  String get queueEnableShuffleTooltip => 'Willekeurig afspelen inschakelen';

  @override
  String get queueAutoplayChangeFailed =>
      'Automatisch afspelen wijzigen is mislukt.';

  @override
  String get queueDisableAutoplayTooltip => 'Automatisch afspelen uitschakelen';

  @override
  String get queueEnableAutoplayTooltip => 'Automatisch afspelen inschakelen';

  @override
  String get queueClearTooltip => 'Wachtrij wissen';

  @override
  String get queueCloseTooltip => 'Wachtrij sluiten';

  @override
  String get playerFavoriteChangeFailed => 'Favoriet wijzigen is mislukt.';

  @override
  String get playerRemoveFavoriteTooltip => 'Uit favorieten verwijderen';

  @override
  String get playerAddFavoriteTooltip => 'Aan favorieten toevoegen';

  @override
  String get playerShowQueueTooltip => 'Wachtrij tonen';

  @override
  String get playbackDetailsTitle => 'Afspeeldetails';

  @override
  String get playbackDetailsLoadFailed => 'Afspeeldetails laden is mislukt.';

  @override
  String get playbackDetailsUnavailable =>
      'Afspeeldetails zijn niet beschikbaar';

  @override
  String get playbackQualityLabel => 'Kwaliteit';

  @override
  String get playbackUnknownValue => 'Onbekend';

  @override
  String get playbackSourceLabel => 'Bron';

  @override
  String get playbackStreamLabel => 'Stream';

  @override
  String get playbackCodecLabel => 'Codec';

  @override
  String get playbackContainerLabel => 'Container';

  @override
  String get playbackSampleRateLabel => 'Samplefrequentie';

  @override
  String get playbackBitDepthLabel => 'Bitdiepte';

  @override
  String get playbackChannelsLabel => 'Kanalen';

  @override
  String get playbackBitrateLabel => 'Bitsnelheid';

  @override
  String get playerVolumeDialogTitle => 'Speakers en volume';

  @override
  String get playerVolumeLoadFailed =>
      'Speakers voor deze speler laden is mislukt.';

  @override
  String get playerVolumeUnsupported => 'Niet ondersteund';

  @override
  String get playerVolumeChangeFailed =>
      'Het volume van deze speaker wijzigen is mislukt.';

  @override
  String get playerGroupAddSpeaker => 'Speaker aan groep toevoegen';

  @override
  String get playerGroupAddAction => 'Aan groep toevoegen';

  @override
  String get playerGroupAddFailed =>
      'Speaker toevoegen aan de groep is mislukt.';

  @override
  String get playerGroupNoSpeakersAvailable =>
      'Geen compatibele speakers beschikbaar om toe te voegen.';

  @override
  String playbackStartingOn(String player) {
    return 'Starten op $player…';
  }

  @override
  String get settingsSecureStorageUnavailable =>
      'Beveiligde opslag is niet beschikbaar. Stop de app volledig en start deze opnieuw vanuit Flutter.';

  @override
  String get settingsSignInAgainToReconnect =>
      'Meld je opnieuw aan om weer verbinding te maken.';

  @override
  String get settingsConnectBeforeSelectingPlayer =>
      'Maak verbinding met Music Assistant voordat je een speler selecteert.';

  @override
  String get settingsCouldNotLoadPlayers =>
      'Spelers laden is mislukt. Probeer het opnieuw.';
}
