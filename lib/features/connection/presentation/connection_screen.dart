import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../player/data/music_assistant_repository.dart';
import '../../player/presentation/design_system/glass_design_system.dart';
import '../data/music_assistant_server_discovery.dart';

typedef ConnectionSubmit =
    Future<void> Function(String serverUrl, String username, String password);

class ConnectionScreen extends StatefulWidget {
  const ConnectionScreen({
    super.key,
    required this.isLoading,
    required this.error,
    required this.onConnect,
  });

  final bool isLoading;
  final String? error;
  final ConnectionSubmit onConnect;

  @override
  State<ConnectionScreen> createState() => _ConnectionScreenState();
}

class _ConnectionScreenState extends State<ConnectionScreen> {
  final _hostController = TextEditingController();
  final _portController = TextEditingController(text: '8095');
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _discovery = MusicAssistantServerDiscovery();

  List<DiscoveredMusicAssistantServer> _servers = [];
  bool _isDiscovering = false;
  bool _obscurePassword = true;
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) unawaited(_findServers());
    });
  }

  @override
  void dispose() {
    _serverPingTimer?.cancel();
    _hostController.dispose();
    _portController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _usernameFocus.dispose();
    _passwordFocus.dispose();
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
              'Could not search the network. You can enter the server manually.',
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
    _hostController.text = server.host;
    _portController.text = server.port.toString();
    _loginBackStep = 0;
    FocusScope.of(context).unfocus();
    _goToStep(2);
  }

  void _openManualEntry() {
    _serverInputError = null;
    _goToStep(1);
  }

  void _goToStep(int nextStep) {
    if (nextStep == _step) return;
    setState(() {
      _transitionDirection = nextStep > _step ? 1 : -1;
      _step = nextStep;
    });
  }

  Future<void> _continueToLogin() async {
    final host = _hostController.text.trim();
    final portText = _portController.text.trim();
    
    if (host.isEmpty) {
      setState(() => _serverInputError = 'Enter a valid server address.');
      return;
    }

    // Als de poort ingevuld is, moet het wel een geldig getal zijn
    if (portText.isNotEmpty) {
      final port = int.tryParse(portText);
      if (port == null || port < 1 || port > 65535) {
        setState(() => _serverInputError = 'Enter a valid port (1–65535).');
        return;
      }
    }

    try {
      _serverUrl;
    } on FormatException {
      setState(() => _serverInputError = 'Enter a valid server address.');
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
    _serverPingTimer?.cancel();
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

  Future<void> _submit() async {
    FocusScope.of(context).unfocus();
    await widget.onConnect(
      _serverUrl,
      _usernameController.text.trim(),
      _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: const Color(0xFF090D12),
    body: Stack(
      fit: StackFit.expand,
      children: [
        const _ConnectionBackdrop(),
        SafeArea(
          child: Column(
            children: [
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
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
                  child: _step == 0
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
                  child: _StepIndicator(activeStep: _step == 2 ? 1 : 0),
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

  bool get _keyboardOpen => MediaQuery.viewInsetsOf(context).bottom > 0;

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
        title: 'Find your server',
        subtitle: 'Looking for Music Assistant on your home network.',
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
            itemBuilder: (context, index) => _ServerOption(
              server: _servers[index],
              onTap: () => _selectServer(_servers[index]),
            ),
          ),
        )
      else if (!_isDiscovering) ...[
        _StatusMessage(
          icon: _discoveryError == null
              ? CupertinoIcons.search
              : CupertinoIcons.exclamationmark_circle,
          message:
              _discoveryError ?? 'No servers found. You can add one manually.',
        ),
        const SizedBox(height: 18),
      ],
      if (_isDiscovering) ...[
        const _StatusMessage(
          icon: CupertinoIcons.ellipsis,
          message: 'This usually takes a few seconds.',
        ),
        const SizedBox(height: 18),
      ],
      if (!_isDiscovering)
        Center(
          child: GlassInlineButton(
            onPressed: _findServers,
            icon: CupertinoIcons.refresh,
            label: 'Search again',
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
        label: 'Can’t find it? Enter server manually',
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
        tooltip: 'Back',
        onPressed: () => _goToStep(0),
        size: _compactLayout ? 40 : 48,
      ),
      SizedBox(height: _compactLayout ? 2 : 10),
      _pageHeading(
        title: 'Server address',
        subtitle: 'Enter the hostname or IP address and port.',
        compact: _compactLayout,
      ),
      SizedBox(height: _compactLayout ? 8 : 28),
      GlassTextField(
        controller: _hostController,
        label: 'Hostname or IP',
        hintText: 'music-assistant.local',
        icon: CupertinoIcons.globe,
        keyboardType: TextInputType.url,
        compact: _compactLayout,
      ),
      SizedBox(height: _compactLayout ? 6 : 14),
      GlassTextField(
        controller: _portController,
        label: 'Port',
        icon: CupertinoIcons.wifi,
        keyboardType: TextInputType.number,
        compact: _compactLayout,
      ),
      if (_serverInputError != null) ...[
        const SizedBox(height: 10),
        _ErrorMessage(message: _serverInputError!, compact: _compactLayout),
      ],
      SizedBox(height: _compactLayout ? 14 : 24),
      GlassActionButton(
        label: 'Continue',
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
      Row(
        children: [
          Expanded(
            child: SizedBox(
              height: _compactLayout ? 40 : 48,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GlassIconButton(
                      icon: CupertinoIcons.back,
                      tooltip: 'Back',
                      onPressed: widget.isLoading
                          ? null
                          : () => _goToStep(_loginBackStep),
                      size: _compactLayout ? 40 : 48,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 52),
                    child: GlassPageHeading(
                      title: 'Sign in',
                      subtitle: '',
                      compact: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      if (!_compactLayout) ...[
        const SizedBox(height: 4),
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
            style: const TextStyle(
              color: GlassTokens.textSecondary,
              fontSize: 12,
            ),
          ),
        ),
      ],
      if (_serverAlive != null) ...[
        const SizedBox(height: 8),
        Center(
          child: GlassSurface(
            borderRadius: GlassTokens.radiusMedium,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            showShadow: false,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  _serverAlive!
                      ? CupertinoIcons.checkmark_circle_fill
                      : CupertinoIcons.exclamationmark_circle,
                  size: 15,
                  color: _serverAlive!
                      ? GlassTokens.textPrimary
                      : GlassTokens.error,
                ),
                const SizedBox(width: 7),
                Text(
                  _serverAlive! ? 'Server reachable' : 'Server not responding',
                  style: TextStyle(
                    color: _serverAlive!
                        ? GlassTokens.textSecondary
                        : GlassTokens.error,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
      SizedBox(
        height: _keyboardOpen
            ? 4
            : _compactLayout
            ? 12
            : 24,
      ),
      GlassTextField(
        controller: _usernameController,
        focusNode: _usernameFocus,
        label: 'Username',
        icon: CupertinoIcons.person,
        textInputAction: TextInputAction.next,
        onSubmitted: (_) => _passwordFocus.requestFocus(),
        compact: _compactLayout,
      ),
      SizedBox(
        height: _keyboardOpen
            ? 2
            : _compactLayout
            ? 6
            : 14,
      ),
      GlassTextField(
        controller: _passwordController,
        focusNode: _passwordFocus,
        label: 'Password',
        icon: CupertinoIcons.lock,
        obscureText: _obscurePassword,
        textInputAction: TextInputAction.done,
        compact: _compactLayout,
        onSubmitted: (_) {
          if (!widget.isLoading) unawaited(_submit());
        },
        suffix: GlassIconButton(
          tooltip: _obscurePassword ? 'Show password' : 'Hide password',
          size: _compactLayout ? 34 : 40,
          iconSize: 18,
          onPressed: () => setState(() {
            _obscurePassword = !_obscurePassword;
          }),
          icon: _obscurePassword
              ? CupertinoIcons.eye
              : CupertinoIcons.eye_slash,
        ),
      ),
      if (widget.error != null) ...[
        SizedBox(
          height: _keyboardOpen
              ? 3
              : _compactLayout
              ? 6
              : 14,
        ),
        _ErrorMessage(message: widget.error!, compact: _compactLayout),
      ],
      SizedBox(
        height: _keyboardOpen
            ? 4
            : _compactLayout
            ? 8
            : 22,
      ),
      GlassActionButton(
        label: widget.isLoading ? 'Connecting' : 'Connect',
        icon: widget.isLoading ? null : CupertinoIcons.forward,
        isLoading: widget.isLoading,
        onPressed: widget.isLoading ? null : _submit,
        compact: _compactLayout,
      ),
      if (!_compactLayout) ...[
        const SizedBox(height: 16),
        const Text(
          'Use a trusted network when connecting over HTTP.',
          textAlign: TextAlign.center,
          style: TextStyle(color: GlassTokens.textMuted, fontSize: 11, height: 1.4),
        ),
      ],
    ],
  );
}

class _StepIndicator extends StatelessWidget {
  const _StepIndicator({required this.activeStep});

  final int activeStep;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      for (var index = 0; index < 2; index++) ...[
        AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          width: index == activeStep ? 22 : 6,
          height: 6,
          decoration: BoxDecoration(
            color: index == activeStep
                ? GlassTokens.textPrimary
                : GlassTokens.border,
            borderRadius: BorderRadius.circular(99),
          ),
        ),
        if (index != 1) const SizedBox(width: 7),
      ],
    ],
  );
}

class _ServerOption extends StatelessWidget {
  const _ServerOption({required this.server, required this.onTap});

  final DiscoveredMusicAssistantServer server;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => GlassSurface(
    borderRadius: GlassTokens.radiusLarge,
    padding: EdgeInsets.zero,
    tint: GlassTokens.surfaceTint,
    showShadow: false,
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(GlassTokens.radiusLarge),
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 72),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                const Icon(
                  CupertinoIcons.desktopcomputer,
                  size: 21,
                  color: GlassTokens.textSecondary,
                ),
                const SizedBox(width: 13),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        server.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: GlassTokens.textPrimary,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        '${server.host}:${server.port}',
                        style: const TextStyle(
                          color: GlassTokens.textMuted,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                const Icon(
                  CupertinoIcons.chevron_right,
                  color: GlassTokens.textSecondary,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

class _StatusMessage extends StatelessWidget {
  const _StatusMessage({required this.icon, required this.message});

  final IconData icon;
  final String message;

  @override
  Widget build(BuildContext context) => GlassSurface(
    borderRadius: GlassTokens.radiusMedium,
    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
    tint: GlassTokens.surfaceTintSubtle,
    showShadow: false,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 17, color: GlassTokens.textMuted),
        const SizedBox(width: 9),
        Flexible(
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: GlassTokens.textSecondary,
              fontSize: 12,
            ),
          ),
        ),
      ],
    ),
  );
}

class _ErrorMessage extends StatelessWidget {
  const _ErrorMessage({required this.message, this.compact = false});

  final String message;
  final bool compact;

  @override
  Widget build(BuildContext context) => GlassSurface(
    borderRadius: GlassTokens.radiusMedium,
    padding: EdgeInsets.symmetric(
      horizontal: compact ? 9 : 13,
      vertical: compact ? 5 : 11,
    ),
    tint: GlassTokens.errorSurface,
    border: Border.all(color: GlassTokens.errorBorder),
    showShadow: false,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          CupertinoIcons.exclamationmark_circle,
          color: GlassTokens.error,
          size: compact ? 15 : 18,
        ),
        const SizedBox(width: 9),
        Expanded(
          child: Text(
            message,
            maxLines: compact ? 1 : null,
            overflow: compact ? TextOverflow.ellipsis : null,
            style: const TextStyle(
              color: GlassTokens.errorText,
              fontSize: 13,
              height: 1.35,
            ),
          ),
        ),
      ],
    ),
  );
}

class _ConnectionBackdrop extends StatelessWidget {
  const _ConnectionBackdrop();

  @override
  Widget build(BuildContext context) => const ColoredBox(
    color: GlassTokens.background,
  );
}
