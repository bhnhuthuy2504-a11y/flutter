import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/theme/theme_provider.dart';

class AppAppearancePage extends StatelessWidget {
  const AppAppearancePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final themeMode = context.select<ThemeProvider, ThemeMode>(
      (p) => p.themeMode,
    );

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
          'App Appearance',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              _PreferenceRow(
                title: 'Theme',
                value: _themeModeLabel(themeMode),
                valueColor: trailingColor,
                onTap: () => _showThemePicker(context, themeMode),
              ),
              _PreferenceRow(
                title: 'App Language',
                value: 'English (US)',
                valueColor: trailingColor,
                onTap: () {
                  // UI-only.
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _themeModeLabel(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'Light';
      case ThemeMode.dark:
        return 'Dark';
      default:
        return 'System';
    }
  }

  Future<void> _showThemePicker(BuildContext context, ThemeMode current) async {
    final selected = await showModalBottomSheet<ThemeMode>(
      context: context,
      showDragHandle: true,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('System'),
                trailing: current == ThemeMode.system
                    ? const Icon(Icons.check_rounded)
                    : null,
                onTap: () => Navigator.of(context).pop(ThemeMode.system),
              ),
              ListTile(
                title: const Text('Light'),
                trailing: current == ThemeMode.light
                    ? const Icon(Icons.check_rounded)
                    : null,
                onTap: () => Navigator.of(context).pop(ThemeMode.light),
              ),
              ListTile(
                title: const Text('Dark'),
                trailing: current == ThemeMode.dark
                    ? const Icon(Icons.check_rounded)
                    : null,
                onTap: () => Navigator.of(context).pop(ThemeMode.dark),
              ),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );

    if (selected != null) {
      context.read<ThemeProvider>().setThemeMode(selected);
    }
  }
}

class _PreferenceRow extends StatelessWidget {
  const _PreferenceRow({
    required this.title,
    required this.value,
    required this.valueColor,
    this.onTap,
  });

  final String title;
  final String value;
  final Color valueColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.bodyLarge?.copyWith(
      fontWeight: FontWeight.w500,
    );
    final valueStyle = theme.textTheme.bodyMedium?.copyWith(
      color: valueColor,
      fontWeight: FontWeight.w500,
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
              Text(value, style: valueStyle),
              const SizedBox(width: 6),
              Icon(
                Icons.chevron_right_rounded,
                size: 22,
                color: theme.textTheme.labelMedium?.color,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
