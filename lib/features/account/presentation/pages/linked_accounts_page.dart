import 'package:flutter/material.dart';

class LinkedAccountsPage extends StatelessWidget {
  const LinkedAccountsPage({super.key});

  static const _items = <_LinkedAccountUiModel>[
    _LinkedAccountUiModel(
      name: 'Google',
      status: _LinkedAccountStatus.connected,
      logo: _LinkedAccountLogo.google,
    ),
    _LinkedAccountUiModel(
      name: 'Apple',
      status: _LinkedAccountStatus.connected,
      logo: _LinkedAccountLogo.apple,
    ),
    _LinkedAccountUiModel(
      name: 'Facebook',
      status: _LinkedAccountStatus.connect,
      logo: _LinkedAccountLogo.facebook,
    ),
    _LinkedAccountUiModel(
      name: 'Twitter',
      status: _LinkedAccountStatus.connect,
      logo: _LinkedAccountLogo.twitter,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final scaffoldBg = isDark ? const Color(0xFF141821) : Colors.white;
    final cardBg = isDark ? const Color(0xFF1E2430) : const Color(0xFFF6F7F9);

    return Scaffold(
      backgroundColor: scaffoldBg,
      appBar: AppBar(
        backgroundColor: scaffoldBg,
        surfaceTintColor: scaffoldBg,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text(
          'Linked Accounts',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          itemCount: _items.length,
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final item = _items[index];
            return _LinkedAccountCard(
              name: item.name,
              status: item.status,
              logo: item.logo,
              cardColor: cardBg,
              onTap: () {
                // UI-only.
              },
            );
          },
        ),
      ),
    );
  }
}

class _LinkedAccountCard extends StatelessWidget {
  const _LinkedAccountCard({
    required this.name,
    required this.status,
    required this.logo,
    required this.cardColor,
    required this.onTap,
  });

  final String name;
  final _LinkedAccountStatus status;
  final _LinkedAccountLogo logo;
  final Color cardColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final textColor = theme.colorScheme.onBackground;
    final connectedColor = isDark
        ? Colors.white.withOpacity(0.70)
        : Colors.black.withOpacity(0.55);
    final actionColor = const Color(0xFF2F4BFF);

    final statusText = status == _LinkedAccountStatus.connected ? 'Connected' : 'Connect';
    final statusStyle = theme.textTheme.bodyMedium?.copyWith(
      fontWeight: FontWeight.w600,
      color: status == _LinkedAccountStatus.connected ? connectedColor : actionColor,
    );

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: isDark
                ? null
                : [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 14,
                      offset: const Offset(0, 4),
                    ),
                  ],
          ),
          child: Row(
            children: [
              _LogoBadge(logo: logo),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  name,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                ),
              ),
              Text(statusText, style: statusStyle),
            ],
          ),
        ),
      ),
    );
  }
}

class _LogoBadge extends StatelessWidget {
  const _LogoBadge({required this.logo});

  final _LinkedAccountLogo logo;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final bg = isDark ? Colors.white.withOpacity(0.10) : Colors.white;
    final border = isDark ? Colors.white.withOpacity(0.10) : Colors.black.withOpacity(0.06);

    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: border),
      ),
      child: Center(
        child: Icon(_iconFor(logo), color: _iconColorFor(logo), size: 26),
      ),
    );
  }

  IconData _iconFor(_LinkedAccountLogo logo) {
    switch (logo) {
      case _LinkedAccountLogo.google:
        return Icons.g_mobiledata_rounded;
      case _LinkedAccountLogo.apple:
        return Icons.apple_rounded;
      case _LinkedAccountLogo.facebook:
        return Icons.facebook_rounded;
      case _LinkedAccountLogo.twitter:
        return Icons.alternate_email_rounded;
    }
  }

  Color? _iconColorFor(_LinkedAccountLogo logo) {
    switch (logo) {
      case _LinkedAccountLogo.google:
        return const Color(0xFF2563EB);
      case _LinkedAccountLogo.apple:
        return null;
      case _LinkedAccountLogo.facebook:
        return const Color(0xFF1877F2);
      case _LinkedAccountLogo.twitter:
        return const Color(0xFF1D9BF0);
    }
  }
}

enum _LinkedAccountStatus { connected, connect }

enum _LinkedAccountLogo { google, apple, facebook, twitter }

class _LinkedAccountUiModel {
  const _LinkedAccountUiModel({
    required this.name,
    required this.status,
    required this.logo,
  });

  final String name;
  final _LinkedAccountStatus status;
  final _LinkedAccountLogo logo;
}

