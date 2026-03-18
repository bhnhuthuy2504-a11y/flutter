import 'package:flutter/material.dart';

import 'change_password_page.dart';

class AccountSecurityPage extends StatefulWidget {
  const AccountSecurityPage({super.key});

  @override
  State<AccountSecurityPage> createState() => _AccountSecurityPageState();
}

class _AccountSecurityPageState extends State<AccountSecurityPage> {
  bool _biometricId = false;
  bool _faceId = false;
  bool _smsAuthenticator = false;
  bool _googleAuthenticator = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final scaffoldBg = isDark ? const Color(0xFF141821) : Colors.white;
    final trailingColor = isDark
        ? Colors.white.withOpacity(0.72)
        : Colors.black.withOpacity(0.60);
    final dividerColor = isDark
        ? Colors.white.withOpacity(0.10)
        : Colors.black.withOpacity(0.08);

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
          'Account & Security',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          children: [
            _ToggleRow(
              title: 'Biometric ID',
              value: _biometricId,
              onChanged: (v) => setState(() => _biometricId = v),
            ),
            _ToggleRow(
              title: 'Face ID',
              value: _faceId,
              onChanged: (v) => setState(() => _faceId = v),
            ),
            _ToggleRow(
              title: 'SMS Authenticator',
              value: _smsAuthenticator,
              onChanged: (v) => setState(() => _smsAuthenticator = v),
            ),
            _ToggleRow(
              title: 'Google Authenticator',
              value: _googleAuthenticator,
              onChanged: (v) => setState(() => _googleAuthenticator = v),
            ),
            Divider(height: 24, thickness: 1, color: dividerColor),
            _NavRow(
              title: 'Change Password',
              trailingColor: trailingColor,
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => const ChangePasswordPage(),
                ),
              ),
            ),
            _NavRow(
              title: 'Device Management',
              subtitle: 'Manage your account on the various devices you own.',
              trailingColor: trailingColor,
              onTap: () {},
            ),
            _NavRow(
              title: 'Deactivate Account',
              subtitle:
                  "Temporarily deactivate your account. Easily reactivate when you're ready.",
              trailingColor: trailingColor,
              onTap: () {},
            ),
            _NavRow(
              title: 'Delete Account',
              subtitle:
                  'Permanently remove your account and data. Proceed with caution.',
              trailingColor: trailingColor,
              titleColor: Colors.redAccent,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _ToggleRow extends StatelessWidget {
  const _ToggleRow({
    required this.title,
    required this.value,
    required this.onChanged,
  });

  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final titleStyle = theme.textTheme.bodyMedium?.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: theme.colorScheme.onBackground,
    );

    return SizedBox(
      height: 56,
      child: Row(
        children: [
          Expanded(child: Text(title, style: titleStyle)),
          Switch.adaptive(value: value, onChanged: onChanged),
        ],
      ),
    );
  }
}

class _NavRow extends StatelessWidget {
  const _NavRow({
    required this.title,
    required this.trailingColor,
    this.subtitle,
    this.titleColor,
    this.onTap,
  });

  final String title;
  final String? subtitle;
  final Color trailingColor;
  final Color? titleColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final titleStyle = theme.textTheme.bodyMedium?.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: titleColor ?? theme.colorScheme.onBackground,
    );
    final subtitleStyle = theme.textTheme.bodySmall?.copyWith(
      height: 1.3,
      color: theme.textTheme.labelMedium?.color,
    );

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: titleStyle),
                    if (subtitle != null) ...[
                      const SizedBox(height: 6),
                      Text(subtitle!, style: subtitleStyle),
                    ],
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Icon(
                  Icons.chevron_right_rounded,
                  size: 22,
                  color: trailingColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

