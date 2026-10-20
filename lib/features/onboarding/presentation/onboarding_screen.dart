import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../l10n/generated/app_localizations.dart';
import '../data/qr_auth_service.dart';
import '../../player/data/music_assistant_repository.dart';
import '../../../design_system/glass_design_system.dart';
import '../data/music_assistant_server_discovery.dart';
import 'onboarding_components.dart';

typedef ConnectionSubmit =
    Future<void> Function(String serverUrl, String token);

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({
    super.key,
    required this.isLoading,
    required this.error,
    required this.onConnect,
    required this.onLocaleChanged,
    this.playerSetupPage,
    this.showPlayerSetup = false,
  });

  final bool isLoading;
  final String? error;
  final ConnectionSubmit onConnect;
  final ValueChanged<Locale> onLocaleChanged;
  final Widget? playerSetupPage;
  final bool showPlayerSetup;

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _hostController = TextEditingController();
  final _portController = TextEditingController(text: '8095');
  final _discovery = MusicAssistantServerDiscovery();

  List<DiscoveredMusicAssistantServer> _servers = [];
  bool _isDiscovering = false;
  QrAuthSession? _authSession;
  bool _isPreparingAuth = false;
  String? _authError;
  int _authGeneration = 0;
  int _step = 0; // 0: discovery, 1: manual entry, 2: sign in.
  int _transitionDirection = 1;
  int _loginBackStep = 0;
  String? _discoveryError;
  String? _serverInputError;
  Timer? _serverPingTimer;
  bool? _serverAlive;

  @override
  void initState() {
    super.initState();
    _step = widget.showPlayerSetup ? 3 : 0;
    if (!widget.showPlayerSetup) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) unawaited(_findServers());
      });
    }
  }

  @override
  void dispose() {
    _serverPingTimer?.cancel();
    _hostController.dispose();
    _portController.dispose();
    unawaited(_authSession?.close());
    super.dispose();
  }

  Future<void> _findServers() async {
    if (_isDiscovering) return;
    setState(() {
      _isDiscovering = true;
      _discoveryError = null;
    });
    try {
      final servers = await _discovery.discover();
      if (mounted) setState(() => _servers = servers);
    } catch (_) {
      if (mounted) {
        setState(
          () => _discoveryError =
              AppLocalizations.of(context).onboardingNetworkSearchFailed,
        );
      }
    } finally {
      if (mounted) setState(() => _isDiscovering = false);
    }
  }

  String get _serverUrl {
    final host = _hostController.text.trim();
    final portText = _portController.text.trim();
    final port = int.tryParse(portText);

    // A complete URL owns its scheme and port. In particular, don't append
    // the default local Music Assistant port (8095) to HTTPS proxy URLs.
    final suppliedUri = Uri.tryParse(host);
    if (suppliedUri != null &&
        (suppliedUri.scheme == 'http' || suppliedUri.scheme == 'https') &&
        suppliedUri.host.isNotEmpty) {
      return suppliedUri.toString();
    }

    // A bare host uses HTTP and the separately entered port.
    return Uri(
      scheme: 'http',
      host: host,
      port: port, // Als 'port' null is, laat Uri() automatisch de poort weg!
    ).toString();
  }

  void _selectServer(DiscoveredMusicAssistantServer server) {
    _hostController.text = server.url;
    _portController.text = server.port.toString();
    _loginBackStep = 0;
    FocusScope.of(context).unfocus();
    _startServerMonitoring();
    _goToStep(2);
  }

  void _openManualEntry() {
    _serverInputError = null;
    _goToStep(1);
  }

  void _goToStep(int nextStep) {
    if (nextStep == _step) return;
    if (_step == 2) _cancelQrAuth();
    setState(() {
      _transitionDirection = nextStep > _step ? 1 : -1;
      _step = nextStep;
    });
    if (nextStep == 2) unawaited(_startQrAuth());
  }

  Future<void> _continueToLogin() async {
    final host = _hostController.text.trim();
    final portText = _portController.text.trim();

    if (host.isEmpty) {
      setState(
        () => _serverInputError =
            AppLocalizations.of(context).onboardingServerAddressInvalid,
      );
      return;
    }

    // Als de poort ingevuld is, moet het wel een geldig getal zijn
    if (portText.isNotEmpty) {
      final port = int.tryParse(portText);
      if (port == null || port < 1 || port > 65535) {
        setState(
          () => _serverInputError =
              AppLocalizations.of(context).onboardingPortInvalid,
        );
        return;
      }
    }

    try {
      _serverUrl;
    } on FormatException {
      setState(
        () => _serverInputError =
            AppLocalizations.of(context).onboardingServerAddressInvalid,
      );
      return;
    }

    FocusScope.of(context).unfocus();
    _loginBackStep = 1;
    setState(() {
      _serverInputError = null;
      _serverAlive = null;
      _transitionDirection = 1;
      _step = 2;
    });
    _startServerMonitoring();
    unawaited(_startQrAuth());
  }

  void _startServerMonitoring() {
    _serverPingTimer?.cancel();
    _serverAlive = null;
    unawaited(_pingServer());
    _serverPingTimer = Timer.periodic(
      const Duration(seconds: 30),
      (_) => unawaited(_pingServer()),
    );
  }

  Future<void> _pingServer() async {
    final serverUrl = _serverUrl;
    try {
      final alive = await MusicAssistantRepository.probeServerTimeAt(serverUrl);
      if (mounted && serverUrl == _serverUrl) setState(() => _serverAlive = alive);
    } catch (_) {
      if (mounted && serverUrl == _serverUrl) setState(() => _serverAlive = false);
    }
  }

  Future<void> _startQrAuth() async {
    final generation = ++_authGeneration;
    final serverUrl = _serverUrl;
    await _authSession?.close();
    if (!mounted || _step != 2) return;
    setState(() {
      _authSession = null;
      _isPreparingAuth = true;
      _authError = null;
    });
    try {
      final l10n = AppLocalizations.of(context);
      final session = await QrAuthSession.start(
        serverUrl,
        messages: QrAuthMessages(
          signInCancelled: l10n.onboardingBrowserSignInCancelled,
          tokenMissing: l10n.onboardingBrowserTokenMissing,
          connected: l10n.onboardingBrowserConnected,
          linkExpired: l10n.onboardingBrowserLinkExpired,
          closePage: l10n.onboardingBrowserClosePage,
        ),
      );
      if (!mounted || generation != _authGeneration || _step != 2) {
        await session.close();
        return;
      }
      setState(() {
        _authSession = session;
        _isPreparingAuth = false;
      });
      unawaited(session.opened.then((_) {
        if (mounted && identical(_authSession, session)) setState(() {});
      }));
      unawaited(_finishQrAuth(session, generation, serverUrl));
    } catch (error) {
      if (!mounted || generation != _authGeneration) return;
      setState(() {
        _isPreparingAuth = false;
        _authError = AppLocalizations.of(context).onboardingSignInFailed;
      });
    }
  }

  Future<void> _finishQrAuth(
    QrAuthSession session,
    int generation,
    String serverUrl,
  ) async {
    var renewQrCode = false;
    try {
      final token = await session.token;
      if (!mounted || generation != _authGeneration) return;
      await widget.onConnect(serverUrl, token);
      if (!mounted || generation != _authGeneration) return;
      setState(() {
        _transitionDirection = 1;
        _step = 3;
      });
    } catch (error) {
      if (!mounted || generation != _authGeneration) return;
      if (error is TimeoutException && _step == 2) {
        setState(() {
          _authSession = null;
          _authError = null;
          _isPreparingAuth = true;
        });
        renewQrCode = true;
      } else {
        setState(() {
          _authSession = null;
          _authError =
              widget.error ??
              AppLocalizations.of(context).onboardingSignInFailed;
        });
      }
    } finally {
      await session.close();
      if (renewQrCode && mounted && _step == 2) {
        unawaited(_startQrAuth());
      }
    }
  }

  void _cancelQrAuth() {
    _authGeneration++;
    final session = _authSession;
    _authSession = null;
    if (session != null) unawaited(session.close());
  }

  void _showLanguagePicker() {
    final currentLanguage = Localizations.localeOf(context).languageCode;
    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        final l10n = AppLocalizations.of(dialogContext);
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.symmetric(horizontal: 24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 360),
            child: GlassSurface(
              borderRadius: GlassTokens.radiusLarge,
              padding: const EdgeInsets.all(20),
              tint: GlassTokens.surfaceTint,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.settingsLanguageLabel,
                    style: const TextStyle(
                      color: GlassTokens.textPrimary,
                      fontSize: GlassTokens.fontSize18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  for (final option in [
                    ('en', l10n.settingsLanguageEnglishOption),
                    ('nl', l10n.settingsLanguageDutchOption),
                  ])
                    Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(
                        GlassTokens.radiusMedium,
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(dialogContext).pop();
                          widget.onLocaleChanged(Locale(option.$1));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 14,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  option.$2,
                                  style: TextStyle(
                                    color: currentLanguage == option.$1
                                        ? GlassTokens.textPrimary
                                        : GlassTokens.textSecondary,
                                    fontSize: GlassTokens.fontSize16,
                                    fontWeight: currentLanguage == option.$1
                                        ? FontWeight.w600
                                        : FontWeight.w400,
                                  ),
                                ),
                              ),
                              if (currentLanguage == option.$1)
                                const Icon(
                                  CupertinoIcons.check_mark,
                                  color: GlassTokens.textPrimary,
                                  size: GlassTokens.iconSizeM,
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: const Color(0xFF090D12),
    floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    floatingActionButton: Padding(
      padding: const EdgeInsets.only(top: 12),
      child: GlassIconButton(
        icon: CupertinoIcons.globe,
        tooltip: AppLocalizations.of(context).settingsLanguageLabel,
        type: GlassIconButtonType.primary,
        onPressed: _showLanguagePicker,
      ),
    ),
    body: Stack(
      fit: StackFit.expand,
      children: [
        const ConnectionBackdrop(),
        SafeArea(
          child: Column(
            children: [
              Expanded(
                child: AnimatedSwitcher(
                  duration: GlassTokens.onboardingStepTransitionDuration,
                  switchInCurve: Curves.easeOutCubic,
                  switchOutCurve: Curves.easeInCubic,
                  transitionBuilder: (child, animation) => FadeTransition(
                    opacity: animation,
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: Offset(.06 * _transitionDirection, 0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: ScaleTransition(
                        scale: Tween<double>(begin: .98, end: 1).animate(
                          CurvedAnimation(
                            parent: animation,
                            curve: Curves.easeOutCubic,
                          ),
                        ),
                        child: child,
                      ),
                    ),
                  ),
                  child: _step == 3 && widget.playerSetupPage != null
                      ? widget.playerSetupPage!
                      : _step == 0
                      ? _stepViewport(
                          _discoveryPage(),
                          key: 'discovery',
                          scrollable: true,
                          belowFold: _manualEntryLink(),
                        )
                      : _step == 1
                      ? _stepViewport(_manualPage(), key: 'manual')
                      : _stepViewport(_loginPage(), key: 'login'),
                ),
              ),
              if (MediaQuery.viewInsetsOf(context).bottom == 0)
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 8, 24, 14),
                  child: OnboardingStepIndicator(
                    activeStep: _step == 3 ? 2 : (_step == 2 ? 1 : 0),
                    count: 3,
                  ),
                ),
            ],
          ),
        ),
      ],
    ),
  );

  Widget _stepViewport(
    Widget content, {
    required String key,
    bool scrollable = false,
    Widget? belowFold,
  }) => SizedBox.expand(
    key: ValueKey(key),
    child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 24,
        vertical: _compactLayout ? 0 : 8,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final page = SizedBox(
            width: constraints.maxWidth.clamp(0.0, 460.0).toDouble(),
            child: content,
          );
          if (scrollable) {
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: constraints.maxHeight,
                    child: Center(child: page),
                  ),
                  if (belowFold != null)
                    SizedBox(
                      width: constraints.maxWidth.clamp(0.0, 460.0).toDouble(),
                      child: belowFold,
                    ),
                ],
              ),
            );
          }
          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 460),
              child: content,
            ),
          );
        },
      ),
    ),
  );

  bool get _compactLayout {
    final media = MediaQuery.of(context);
    return media.size.height -
            media.viewInsets.bottom -
            media.padding.vertical <
        560;
  }

  Widget _pageHeading({
    required String title,
    required String subtitle,
    bool compact = false,
  }) => GlassPageHeading(
    title: title,
    subtitle: subtitle,
    compact: compact,
  );

  Widget _discoveryPage() => Column(
    key: const ValueKey('discovery-content'),
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      _pageHeading(
        title: AppLocalizations.of(context).onboardingFindServerTitle,
        subtitle: AppLocalizations.of(context).onboardingFindServerSubtitle,
      ),
      const SizedBox(height: 22),
      if (_servers.isNotEmpty)
        SizedBox(
          height: (_servers.length * 82.0)
              .clamp(82.0, _compactLayout ? 180.0 : 280.0)
              .toDouble(),
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: _servers.length,
            separatorBuilder: (_, _) => const SizedBox(height: 10),
            itemBuilder: (context, index) => DiscoveredServerCard(
              server: _servers[index],
              onTap: () => _selectServer(_servers[index]),
            ),
          ),
        )
      else if (!_isDiscovering) ...[
        OnboardingStatusMessage(
          icon: _discoveryError == null
              ? CupertinoIcons.search
              : CupertinoIcons.exclamationmark_circle,
          message:
              _discoveryError ??
                  AppLocalizations.of(context).onboardingNoServersFound,
        ),
        const SizedBox(height: 18),
      ],
      if (_isDiscovering) ...[
        OnboardingStatusMessage(
          icon: CupertinoIcons.ellipsis,
          message: AppLocalizations.of(context).onboardingDiscoveryWait,
        ),
        const SizedBox(height: 18),
      ],
      if (!_isDiscovering)
        Center(
          child: GlassInlineButton(
            onPressed: _findServers,
            icon: CupertinoIcons.refresh,
            label: AppLocalizations.of(context).onboardingSearchAgainAction,
            isLoading: _isDiscovering,
          ),
        ),
    ],
  );

  Widget _manualEntryLink() => Padding(
    padding: const EdgeInsets.only(top: 8, bottom: 24),
    child: Center(
      child: GlassInlineButton(
        onPressed: _openManualEntry,
        icon: CupertinoIcons.keyboard,
        label: AppLocalizations.of(context).onboardingManualEntryAction,
      ),
    ),
  );

  Widget _manualPage() => Column(
    key: const ValueKey('manual-content'),
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      GlassIconButton(
        icon: CupertinoIcons.back,
        tooltip: AppLocalizations.of(context).commonBackTooltip,
        onPressed: () => _goToStep(0),
        size: _compactLayout ? 40 : 48,
      ),
      SizedBox(height: _compactLayout ? 2 : 10),
      _pageHeading(
        title: AppLocalizations.of(context).onboardingServerAddressTitle,
        subtitle: AppLocalizations.of(context).onboardingServerAddressSubtitle,
        compact: _compactLayout,
      ),
      SizedBox(height: _compactLayout ? 8 : 28),
      GlassTextField(
        controller: _hostController,
        label: AppLocalizations.of(context).onboardingHostnameLabel,
        hintText: 'music-assistant.local',
        icon: CupertinoIcons.globe,
        keyboardType: TextInputType.url,
        compact: _compactLayout,
      ),
      SizedBox(height: _compactLayout ? 6 : 14),
      GlassTextField(
        controller: _portController,
        label: AppLocalizations.of(context).onboardingPortLabel,
        icon: CupertinoIcons.wifi,
        keyboardType: TextInputType.number,
        compact: _compactLayout,
      ),
      if (_serverInputError != null) ...[
        const SizedBox(height: 10),
        OnboardingErrorMessage(message: _serverInputError!, compact: _compactLayout),
      ],
      SizedBox(height: _compactLayout ? 14 : 24),
      GlassActionButton(
        label: AppLocalizations.of(context).commonContinueAction,
        icon: CupertinoIcons.forward,
        onPressed: _continueToLogin,
        compact: _compactLayout,
      ),
    ],
  );

  Widget _loginPage() => Column(
    key: const ValueKey('login-content'),
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      if (!_compactLayout) ...[
        const SizedBox(height: 12),
        GlassSurface(
          borderRadius: GlassTokens.radiusMedium,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          tint: GlassTokens.surfaceTintSubtle,
          showShadow: false,
          child: Text(
            _serverUrl,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: GlassTokens.textSecondary, fontSize: GlassTokens.fontSize12),
          ),
        ),
      ],
      if (_serverAlive == false) ...[
        const SizedBox(height: 9),
        Center(
          child: GlassSurface(
            borderRadius: GlassTokens.radiusMedium,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
            showShadow: false,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  CupertinoIcons.exclamationmark_circle,
                  size: GlassTokens.iconSizeS,
                  color: GlassTokens.error,
                ),
                const SizedBox(width: 7),
                Text(
                  AppLocalizations.of(
                    context,
                  ).onboardingMusicAssistantUnresponsive,
                  style: const TextStyle(color: GlassTokens.error, fontSize: GlassTokens.fontSize12),
                ),
              ],
            ),
          ),
        ),
      ],
      const SizedBox(height: 18),
      if (_authSession case final session?) ...[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context).onboardingScanToSignInTitle,
                    style: TextStyle(
                      color: GlassTokens.textPrimary,
                      fontSize: _compactLayout ? 23 : 26,
                      height: 1.12,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.5,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    AppLocalizations.of(
                      context,
                    ).onboardingScanToSignInInstructions,
                    style: TextStyle(
                      color: GlassTokens.textSecondary,
                      fontSize: GlassTokens.fontSize13,
                      height: 1.4,
                    ),
                  ),
                  SizedBox(height: 14),
                  OnboardingWaitingPill(opened: session.hasOpened),
                ],
              ),
            ),
            const SizedBox(width: 22),
            GlassSurface(
              borderRadius: GlassTokens.radiusLarge,
              padding: const EdgeInsets.all(12),
              tint: Colors.white,
              showShadow: true,
              child: QrImageView(
                data: session.qrUrl,
                size: _compactLayout ? 176 : 224,
                backgroundColor: Colors.white,
                errorCorrectionLevel: QrErrorCorrectLevel.M,
              ),
            ),
          ],
        ),
      ] else if (_isPreparingAuth || widget.isLoading) ...[
        SizedBox(
          height: _compactLayout ? 150 : 220,
          child: const Center(child: CircularProgressIndicator(color: Colors.white)),
        ),
        Center(
          child: Text(
            widget.isLoading
                ? AppLocalizations.of(context).onboardingConnecting
                : AppLocalizations.of(context).onboardingPreparingSignIn,
            textAlign: TextAlign.center,
            style: const TextStyle(color: GlassTokens.textSecondary, fontSize: GlassTokens.fontSize13),
          ),
        ),
      ] else if (_authError != null || widget.error != null) ...[
        OnboardingErrorMessage(message: _authError ?? widget.error!, compact: _compactLayout),
        const SizedBox(height: 14),
        GlassActionButton(
          label: AppLocalizations.of(context).commonTryAgainAction,
          icon: CupertinoIcons.refresh,
          onPressed: _startQrAuth,
          compact: _compactLayout,
        ),
      ],
    ],
  );
}
