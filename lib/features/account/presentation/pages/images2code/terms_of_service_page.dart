import 'package:flutter/material.dart';

class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({super.key});

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
        title: Text('Terms of Service', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800)),
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
                    'Last Updated: December 20, 2024',
                    style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w800, fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'By using the Smartify application, you agree to the following Terms of Service:',
                  ),
                  const SizedBox(height: 18),
                  _Section(
                    number: '1.',
                    title: 'Acceptance of Terms',
                    body:
                        'You agree to comply with all applicable laws and regulations when using Smartify. If you do not agree with any part of these terms, please do not use the application.',
                  ),
                  _Section(
                    number: '2.',
                    title: 'Use of Services',
                    body:
                        'You are granted a non-exclusive, non-transferable, revocable license to use Smartify for personal, non-commercial purposes.',
                  ),
                  _Section(
                    number: '3.',
                    title: 'User Account',
                    body:
                        'To use certain features, you may be required to create an account. You are responsible for maintaining the confidentiality of your account information.',
                  ),
                  _Section(
                    number: '4.',
                    title: 'Prohibited Activities',
                    body:
                        'You agree not to engage in any activities that may violate laws or regulations, infringe on the rights of others, or misuse the application.',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.number, required this.title, required this.body});

  final String number;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$number  $title',
            style: theme.textTheme.titleLarge?.copyWith(fontSize: 18, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 10),
          Text(body),
        ],
      ),
    );
  }
}

