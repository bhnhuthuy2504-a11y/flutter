import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final Map<String, bool> _values = <String, bool>{
    'Device Status Alerts': true,
    'Energy Consumption Alerts': true,
    'Bill Reminders': true,
    'Automation Updates': false,
    'Device Maintenance Reminders': false,
    'Security Alerts': true,
    'Weather-Based Suggestions': true,
    'Community Updates': false,
    'Home Invitations': true,
    'User Access Alerts': false,
    'Customer Support Updates': false,
    'Feedback & Updates': false,
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final scaffoldBg = isDark ? const Color(0xFF141821) : Colors.white;

    final items = _values.entries.toList(growable: false);

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
          'Notifications',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final entry = items[index];
            return _ToggleRow(
              title: entry.key,
              value: entry.value,
              onChanged: (v) => setState(() => _values[entry.key] = v),
            );
          },
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

