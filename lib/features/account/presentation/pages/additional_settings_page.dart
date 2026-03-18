import 'package:flutter/material.dart';

class AdditionalSettingsPage extends StatelessWidget {
  const AdditionalSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final scaffoldBg = isDark ? const Color(0xFF141821) : Colors.white;

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
          'Additional Settings',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          children: const [
            _ValueNavRow(title: 'Temperature Units', value: 'Celsius'),
            _ValueNavRow(title: 'Clear Cache', value: '15.6 MB'),
            _ValueNavRow(title: 'Experimental Features'),
            _ValueNavRow(title: 'System Permissions'),
            _ValueNavRow(title: 'Legal Information'),
            _ValueNavRow(title: 'Check for Updates'),
          ],
        ),
      ),
    );
  }
}

class _ValueNavRow extends StatelessWidget {
  const _ValueNavRow({
    required this.title,
    this.value,
  });

  final String title;
  final String? value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final trailingColor = isDark
        ? Colors.white.withOpacity(0.72)
        : Colors.black.withOpacity(0.60);

    final titleStyle = theme.textTheme.bodyMedium?.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: theme.colorScheme.onBackground,
    );

    final valueStyle = theme.textTheme.bodyMedium?.copyWith(
      fontWeight: FontWeight.w500,
      color: trailingColor,
    );

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: SizedBox(
          height: 56,
          child: Row(
            children: [
              Expanded(child: Text(title, style: titleStyle)),
              if (value != null) ...[
                Text(value!, style: valueStyle),
                const SizedBox(width: 10),
              ],
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

