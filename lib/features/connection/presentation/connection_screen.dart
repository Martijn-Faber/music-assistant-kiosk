import 'dart:async';

import 'package:flutter/material.dart';

import '../../../shared/widgets/brand.dart';

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
  final _serverController = TextEditingController(
    text: 'http://192.168.178.148:8095',
  );
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _serverController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    FocusScope.of(context).unfocus();
    await widget.onConnect(
      _serverController.text.trim(),
      _usernameController.text.trim(),
      _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final form = _loginForm(context);
            if (constraints.maxWidth < 680) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    const Brand(compact: true),
                    const SizedBox(height: 24),
                    form,
                  ],
                ),
              );
            }

            return Row(
              children: [
                const Expanded(flex: 4, child: Brand(compact: false)),
                Expanded(
                  flex: 6,
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 460),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 36),
                        child: form,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _loginForm(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Connect your server',
          style: textTheme.headlineSmall?.copyWith(
            color: const Color(0xFFF1F4EA),
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Sign in with your Music Assistant account.',
          style: textTheme.bodyMedium?.copyWith(color: const Color(0xFFAAB7B4)),
        ),
        const SizedBox(height: 22),
        _TextField(
          controller: _serverController,
          label: 'Server address',
          icon: Icons.dns_outlined,
          keyboardType: TextInputType.url,
        ),
        const SizedBox(height: 12),
        _TextField(
          controller: _usernameController,
          label: 'Username',
          icon: Icons.person_outline,
          textInputAction: TextInputAction.next,
        ),
        const SizedBox(height: 12),
        _TextField(
          controller: _passwordController,
          label: 'Password',
          icon: Icons.lock_outline,
          obscureText: _obscurePassword,
          textInputAction: TextInputAction.done,
          onSubmitted: (_) {
            if (!widget.isLoading) unawaited(_submit());
          },
          suffix: IconButton(
            tooltip: _obscurePassword ? 'Show password' : 'Hide password',
            onPressed: () => setState(() {
              _obscurePassword = !_obscurePassword;
            }),
            icon: Icon(
              _obscurePassword
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              size: 20,
            ),
          ),
        ),
        if (widget.error != null) ...[
          const SizedBox(height: 12),
          Text(
            widget.error!,
            style: const TextStyle(color: Color(0xFFFF8E7C), fontSize: 13),
          ),
        ],
        const SizedBox(height: 18),
        SizedBox(
          height: 50,
          child: FilledButton.icon(
            onPressed: widget.isLoading ? null : _submit,
            icon: widget.isLoading
                ? const SizedBox.square(
                    dimension: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.arrow_forward_rounded, size: 19),
            label: Text(widget.isLoading ? 'CONNECTING' : 'CONNECT'),
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xFFB6E36A),
              foregroundColor: const Color(0xFF101819),
              textStyle: const TextStyle(fontWeight: FontWeight.w800),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Use a trusted network when connecting over HTTP.',
          textAlign: TextAlign.center,
          style: TextStyle(color: Color(0xFF83918E), fontSize: 11),
        ),
      ],
    );
  }
}

class _TextField extends StatelessWidget {
  const _TextField({
    required this.controller,
    required this.label,
    required this.icon,
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.onSubmitted,
    this.suffix,
  });

  final TextEditingController controller;
  final String label;
  final IconData icon;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final ValueChanged<String>? onSubmitted;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      obscureText: obscureText,
      onSubmitted: onSubmitted,
      style: const TextStyle(color: Color(0xFFF1F4EA), fontSize: 14),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, size: 19),
        suffixIcon: suffix,
        filled: true,
        fillColor: const Color(0xFF192526),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: const BorderSide(color: Color(0xFF293A3A)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: const BorderSide(color: Color(0xFFB6E36A), width: 1.5),
        ),
      ),
    );
  }
}
