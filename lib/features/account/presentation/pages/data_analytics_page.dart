import 'package:flutter/material.dart';

class DataAnalyticsPage extends StatelessWidget {
  const DataAnalyticsPage({super.key});

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
          'Data & Analytics',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          children: [
            _ActionRow(
              title: 'Data Usage',
              subtitle: 'Control how your data is used for analytics.\nCustomize your preferences.',
              trailingColor: trailingColor,
              onTap: () {},
            ),
            _ActionRow(
              title: 'Ad Preferences',
              subtitle: 'Manage ad personalization settings. Tailor\nyour ad experience.',
              trailingColor: trailingColor,
              onTap: () {},
            ),
            _ActionRow(
              title: 'Download My Data',
              subtitle: 'Request a copy of your data. Your information,\nyour control.',
              trailingColor: trailingColor,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionRow extends StatelessWidget {
  const _ActionRow({
    required this.title,
    required this.subtitle,
    required this.trailingColor,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final Color trailingColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final titleStyle = theme.textTheme.bodyLarge?.copyWith(
      fontWeight: FontWeight.w600,
      color: theme.colorScheme.onBackground,
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
                    const SizedBox(height: 6),
                    Text(subtitle, style: subtitleStyle),
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

