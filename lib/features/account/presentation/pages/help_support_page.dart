import 'package:flutter/material.dart';

class HelpSupportPage extends StatelessWidget {
  const HelpSupportPage({super.key});

  static const _items = <String>[
    'FAQ',
    'Contact Support',
    'Privacy Policy',
    'Terms of Service',
    'Partner',
    'Job Vacancy',
    'Accessibility',
    'Feedback',
    'About us',
    'Rate us',
    'Visit Our Website',
    'Follow us on Social Media',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final scaffoldBg = isDark ? const Color(0xFF141821) : Colors.white;
    final trailingColor = isDark
        ? Colors.white.withOpacity(0.72)
        : Colors.black.withOpacity(0.60);

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
          'Help & Support',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          itemCount: _items.length,
          itemBuilder: (context, index) {
            return _SupportRow(
              title: _items[index],
              trailingColor: trailingColor,
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

class _SupportRow extends StatelessWidget {
  const _SupportRow({
    required this.title,
    required this.trailingColor,
    this.onTap,
  });

  final String title;
  final Color trailingColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.bodyMedium?.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: theme.colorScheme.onBackground,
    );

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 56,
          child: Row(
            children: [
              Expanded(child: Text(title, style: titleStyle)),
              Icon(
                Icons.chevron_right_rounded,
                size: 22,
                color: trailingColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

