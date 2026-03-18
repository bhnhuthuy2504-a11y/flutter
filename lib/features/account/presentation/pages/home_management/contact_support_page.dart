import 'package:flutter/material.dart';

class ContactSupportPage extends StatelessWidget {
  const ContactSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;

    Widget row(IconData icon, String title) {
      return Container(
        height: 62,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Icon(icon, color: primary),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                title,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Icon(Icons.chevron_right_rounded, color: theme.hintColor),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text(
          'Contact Support',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          children: [
            row(Icons.headset_mic_outlined, 'Customer Support'),
            const SizedBox(height: 14),
            row(Icons.public_rounded, 'Website'),
            const SizedBox(height: 14),
            row(Icons.chat_rounded, 'WhatsApp'),
            const SizedBox(height: 14),
            row(Icons.facebook_rounded, 'Facebook'),
            const SizedBox(height: 14),
            row(Icons.alternate_email_rounded, 'Twitter'),
            const SizedBox(height: 14),
            row(Icons.camera_alt_rounded, 'Instagram'),
          ],
        ),
      ),
    );
  }
}
