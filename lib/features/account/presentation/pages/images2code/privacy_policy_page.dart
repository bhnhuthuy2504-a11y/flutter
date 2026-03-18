import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final controller = ScrollController();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text('Privacy Policy', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800)),
      ),
      body: SafeArea(
        child: Scrollbar(
          controller: controller,
          thumbVisibility: true,
          child: SingleChildScrollView(
            controller: controller,
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 24),
            child: DefaultTextStyle(
              style: theme.textTheme.bodyMedium!.copyWith(fontSize: 15.5, height: 1.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Last Updated: December 19, 2024',
                    style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w800, fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'This Privacy Policy outlines how Smartify ("we," "us," or "our") collects, uses, and protects your personal information when you use our smart home application. By using Smartify, you agree to the terms outlined in this policy.',
                  ),
                  const SizedBox(height: 18),
                  Text('1.  Information We Collect', style: theme.textTheme.titleLarge?.copyWith(fontSize: 18, fontWeight: FontWeight.w900)),
                  const SizedBox(height: 10),
                  const Text('We may collect the following types of information:'),
                  const SizedBox(height: 10),
                  const _Bullet(
                    title: 'Personal Information',
                    body: 'This includes but is not limited to your name, email address, and other contact details provided during account creation.',
                  ),
                  const _Bullet(
                    title: 'Device Information',
                    body: 'We collect data related to your connected smart devices, such as device names and statuses.',
                  ),
                  const _Bullet(
                    title: 'Usage Data',
                    body: 'Information about how you interact with the Smartify application, including device control history and app usage patterns.',
                  ),
                  const SizedBox(height: 18),
                  Text('2.  How We Use Your Information', style: theme.textTheme.titleLarge?.copyWith(fontSize: 18, fontWeight: FontWeight.w900)),
                  const SizedBox(height: 10),
                  const Text('We use the collected information to:'),
                  const SizedBox(height: 10),
                  const _Bullet(title: 'Provide and improve our services.', body: ''),
                  const _Bullet(title: 'Personalize your experience.', body: ''),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Bullet extends StatelessWidget {
  const _Bullet({required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(color: theme.colorScheme.onBackground, shape: BoxShape.circle),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: theme.textTheme.bodyMedium!.copyWith(fontSize: 15.5, height: 1.5, color: theme.colorScheme.onBackground),
                children: [
                  TextSpan(text: '$title: ', style: const TextStyle(fontWeight: FontWeight.w800)),
                  if (body.isNotEmpty) TextSpan(text: body),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

