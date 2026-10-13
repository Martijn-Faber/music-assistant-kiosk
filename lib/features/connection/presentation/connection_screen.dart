import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../player/data/music_assistant_repository.dart';
import '../../player/presentation/design_system/glass_tokens.dart';
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
      setState(() => _serverInputError = 'Vul een geldig adres in.');
      return;
    }

    // Als de poort ingevuld is, moet het wel een geldig getal zijn
    if (portText.isNotEmpty) {
      final port = int.tryParse(portText);
      if (port == null || port < 1 || port > 65535) {
        setState(() => _serverInputError = 'Voer een geldig poortnummer in (1-65535).');
        return;
      }
    }

    try {
      _serverUrl;
    } on FormatException {
      setState(() => _serverInputError = 'Voer een geldig adres in.');
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
    Widget? leading,
    bool compact = false,
  }) => Column(
    children: [
      if (leading != null && !compact) ...[leading, const SizedBox(height: 10)],
      Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: compact ? 23 : 27,
          height: 1.12,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.5,
        ),
      ),
      if (!compact) ...[
        const SizedBox(height: 8),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 14,
            height: 1.4,
          ),
        ),
      ],
    ],
  );

  Widget _discoveryPage() => Column(
    key: const ValueKey('discovery-content'),
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      _pageHeading(
        title: 'Find your server',
        subtitle: 'Looking for Music Assistant on your home network.',
        leading: _isDiscovering
            ? const SizedBox.square(
                dimension: 25,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white70,
                ),
              )
            : const Icon(
                CupertinoIcons.wifi,
                color: Colors.white70,
                size: 27,
              ),
      ),
      const SizedBox(height: 26),
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
          child: TextButton.icon(
            onPressed: _findServers,
            icon: const Icon(CupertinoIcons.refresh, size: 18),
            label: const Text('Search again'),
            style: TextButton.styleFrom(foregroundColor: Colors.white70),
          ),
        ),
    ],
  );

  Widget _manualEntryLink() => Padding(
    padding: const EdgeInsets.only(top: 8, bottom: 24),
    child: Center(
      child: TextButton(
        onPressed: _openManualEntry,
        style: TextButton.styleFrom(foregroundColor: Colors.white),
        child: const Text('Can’t find it? Enter server manually'),
      ),
    ),
  );

  Widget _manualPage() => Column(
    key: const ValueKey('manual-content'),
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      _BackButton(onPressed: () => _goToStep(0), compact: _compactLayout),
      SizedBox(height: _compactLayout ? 2 : 10),
      _pageHeading(
        title: 'Server address',
        subtitle: 'Enter the hostname or IP address and port.',
        compact: _compactLayout,
        leading: const Icon(
          CupertinoIcons.desktopcomputer,
          color: Colors.white70,
          size: 27,
        ),
      ),
      SizedBox(height: _compactLayout ? 8 : 28),
      _GlassTextField(
        controller: _hostController,
        label: 'Hostname or IP',
        hintText: 'music-assistant.local',
        icon: CupertinoIcons.globe,
        keyboardType: TextInputType.url,
        compact: _compactLayout,
      ),
      SizedBox(height: _compactLayout ? 6 : 14),
      _GlassTextField(
        controller: _portController,
        label: 'Port',
        icon: CupertinoIcons.wifi,
        keyboardType: TextInputType.number,
        compact: _compactLayout,
      ),
      if (_serverInputError != null) ...[
        const SizedBox(height: 10),
        Text(
          _serverInputError!,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Color(0xFFFFA39B), fontSize: 12),
        ),
      ],
      SizedBox(height: _compactLayout ? 14 : 24),
      _PrimaryButton(
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
                    child: _BackButton(
                      onPressed: widget.isLoading
                          ? null
                          : () => _goToStep(_loginBackStep),
                      compact: _compactLayout,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 52),
                    child: Text(
                      'Sign in',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: _compactLayout ? 23 : 27,
                        height: 1.12,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.5,
                      ),
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
        Text(
          _serverUrl,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.white70, fontSize: 13),
        ),
      ],
      if (_serverAlive != null) ...[
        const SizedBox(height: 8),
        Text(_serverAlive! ? 'Music Assistant server is reachable' : 'Music Assistant server is not responding',
            textAlign: TextAlign.center,
            style: TextStyle(color: _serverAlive! ? Colors.white70 : const Color(0xFFFFA39B), fontSize: 11)),
      ],
      SizedBox(
        height: _keyboardOpen
            ? 4
            : _compactLayout
            ? 12
            : 24,
      ),
      _GlassTextField(
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
      _GlassTextField(
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
        suffix: IconButton(
          tooltip: _obscurePassword ? 'Show password' : 'Hide password',
          constraints: BoxConstraints.tightFor(
            width: _compactLayout ? 40 : 48,
            height: _compactLayout ? 40 : 48,
          ),
          visualDensity: _compactLayout ? VisualDensity.compact : null,
          onPressed: () => setState(() {
            _obscurePassword = !_obscurePassword;
          }),
          icon: Icon(
            _obscurePassword
                ? CupertinoIcons.eye
                : CupertinoIcons.eye_slash,
            size: 20,
          ),
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
      _PrimaryButton(
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
          style: TextStyle(color: Colors.white54, fontSize: 11, height: 1.4),
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
            color: index == activeStep ? Colors.white : Colors.white38,
            borderRadius: BorderRadius.circular(99),
          ),
        ),
        if (index != 1) const SizedBox(width: 7),
      ],
    ],
  );
}

class _BackButton extends StatelessWidget {
  const _BackButton({required this.onPressed, this.compact = false});

  final VoidCallback? onPressed;
  final bool compact;

  @override
  Widget build(BuildContext context) => Align(
    alignment: Alignment.centerLeft,
    child: IconButton(
      onPressed: onPressed,
      tooltip: 'Back',
      icon: const Icon(CupertinoIcons.back, color: Colors.white),
      constraints: BoxConstraints.tightFor(
        width: compact ? 40 : 48,
        height: compact ? 40 : 48,
      ),
      style: IconButton.styleFrom(
        backgroundColor: const Color(0x20FFFFFF),
        side: const BorderSide(color: Color(0x44FFFFFF)),
      ),
    ),
  );
}

class _ServerOption extends StatelessWidget {
  const _ServerOption({required this.server, required this.onTap});

  final DiscoveredMusicAssistantServer server;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Material(
    color: const Color(0x18FFFFFF),
    borderRadius: BorderRadius.circular(20),
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        constraints: const BoxConstraints(minHeight: 72),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: GlassTokens.border),
        ),
        child: Row(
          children: [
            const Icon(CupertinoIcons.desktopcomputer, size: 21, color: Colors.white70),
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
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    '${server.host}:${server.port}',
                    style: const TextStyle(color: Colors.white60, fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            const Icon(
              CupertinoIcons.chevron_right,
              color: Colors.white70,
              size: 24,
            ),
          ],
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
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, size: 18, color: Colors.white54),
      const SizedBox(width: 9),
      Flexible(
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white60, fontSize: 12),
        ),
      ),
    ],
  );
}

class _GlassTextField extends StatelessWidget {
  const _GlassTextField({
    required this.controller,
    required this.label,
    required this.icon,
    this.focusNode,
    this.hintText,
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.onSubmitted,
    this.suffix,
    this.compact = false,
  });

  final TextEditingController controller;
  final String label;
  final IconData icon;
  final FocusNode? focusNode;
  final String? hintText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final ValueChanged<String>? onSubmitted;
  final Widget? suffix;
  final bool compact;

  @override
  Widget build(BuildContext context) => TextField(
    controller: controller,
    focusNode: focusNode,
    keyboardType: keyboardType,
    textInputAction: textInputAction,
    obscureText: obscureText,
    onSubmitted: onSubmitted,
    style: const TextStyle(color: Colors.white, fontSize: 14),
    cursorColor: Colors.white,
    decoration: InputDecoration(
      labelText: label,
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.white38, fontSize: 12),
      labelStyle: const TextStyle(color: Colors.white70, fontSize: 13),
      floatingLabelStyle: const TextStyle(color: Colors.white),
      prefixIcon: Icon(icon, size: 19, color: Colors.white70),
      prefixIconConstraints: compact
          ? const BoxConstraints(minWidth: 40, minHeight: 40)
          : null,
      suffixIcon: suffix == null
          ? null
          : IconTheme(
              data: const IconThemeData(color: Colors.white70),
              child: suffix!,
            ),
      filled: true,
      fillColor: const Color(0x1EFFFFFF),
      isDense: compact,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 13,
        vertical: compact ? 6 : 15,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Color(0x44FFFFFF)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Color(0x44FFFFFF)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Colors.white, width: 1.3),
      ),
    ),
  );
}

class _PrimaryButton extends StatelessWidget {
  const _PrimaryButton({
    required this.label,
    required this.onPressed,
    this.icon,
    this.isLoading = false,
    this.compact = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool isLoading;
  final bool compact;

  @override
  Widget build(BuildContext context) => SizedBox(
    height: compact ? 42 : 52,
    child: FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF11161C),
        disabledBackgroundColor: const Color(0xBFFFFFFF),
        disabledForegroundColor: const Color(0xFF11161C),
        shape: const StadiumBorder(),
        textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
      ),
      child: isLoading
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox.square(
                  dimension: 18,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Color(0xFF11161C),
                  ),
                ),
                const SizedBox(width: 11),
                Text(label),
              ],
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(label),
                if (icon != null) ...[
                  const SizedBox(width: 8),
                  Icon(icon, size: 19),
                ],
              ],
            ),
    ),
  );
}

class _ErrorMessage extends StatelessWidget {
  const _ErrorMessage({required this.message, this.compact = false});

  final String message;
  final bool compact;

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.symmetric(
      horizontal: compact ? 9 : 13,
      vertical: compact ? 5 : 11,
    ),
    decoration: BoxDecoration(
      color: const Color(0x26FF776F),
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: const Color(0x66FF938A)),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          CupertinoIcons.exclamationmark_circle,
          color: Color(0xFFFFA39B),
          size: compact ? 15 : 18,
        ),
        const SizedBox(width: 9),
        Expanded(
          child: Text(
            message,
            maxLines: compact ? 1 : null,
            overflow: compact ? TextOverflow.ellipsis : null,
            style: const TextStyle(
              color: Color(0xFFFFC0BA),
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
  Widget build(BuildContext context) => DecoratedBox(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFF101923), Color(0xFF090D12), Color(0xFF14121B)],
      ),
    ),
    child: Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          top: -150,
          left: -100,
          child: _Glow(color: Color(0x333F8EBB), size: 390),
        ),
        Positioned(
          right: -170,
          bottom: -180,
          child: _Glow(color: Color(0x333F5C9B), size: 440),
        ),
      ],
    ),
  );
}

class _Glow extends StatelessWidget {
  const _Glow({required this.color, required this.size});

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) => Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      gradient: RadialGradient(colors: [color, color.withOpacity(0)]),
    ),
  );
}
