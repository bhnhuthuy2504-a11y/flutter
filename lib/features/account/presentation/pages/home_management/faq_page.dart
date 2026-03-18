import 'package:flutter/material.dart';

import 'ui_kit.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  String _category = 'General';
  final _search = TextEditingController();
  int _expandedIndex = 0;

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cats = const ['General', 'Account', 'Services', 'Home'];

    final items = const [
      (
        'What is Smartify?',
        'Smartify is a user-friendly smart home application that enables seamless control and automation of connected devices, enhancing your living experience through innovative technology.',
      ),
      ('How do I add a new device?', ''),
      ('How do I create an automation?', ''),
      ("What's the 'Tap-to-Run' feature?", ''),
      ('Can I use Smartify offline?', ''),
      ('How can I reset my password?', ''),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text(
          'FAQ',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(16),
              ),
              child: TextField(
                controller: _search,
                decoration: const InputDecoration(
                  icon: Icon(Icons.search_rounded),
                  hintText: 'Search',
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 14),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (final c in cats) ...[
                    ChoiceChip(
                      label: Text(c),
                      selected: _category == c,
                      onSelected: (_) => setState(() => _category = c),
                      selectedColor: theme.colorScheme.primary,
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: _category == c
                            ? Colors.white
                            : theme.colorScheme.onSurface,
                      ),
                      shape: StadiumBorder(
                        side: BorderSide(
                          color: theme.dividerColor.withOpacity(0.35),
                        ),
                      ),
                      backgroundColor: theme.colorScheme.surface,
                    ),
                    const SizedBox(width: 10),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 14),
            for (int i = 0; i < items.length; i++) ...[
              Images2CodeSectionCard(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Theme(
                  data: theme.copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    initiallyExpanded: i == _expandedIndex,
                    onExpansionChanged: (v) =>
                        setState(() => _expandedIndex = v ? i : _expandedIndex),
                    title: Text(
                      items[i].$1,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    trailing: Icon(
                      i == _expandedIndex
                          ? Icons.keyboard_arrow_up_rounded
                          : Icons.keyboard_arrow_down_rounded,
                      color: theme.hintColor,
                    ),
                    childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 14),
                    children: [
                      if (items[i].$2.isNotEmpty)
                        Text(
                          items[i].$2,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontSize: 15,
                            height: 1.4,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
            ],
          ],
        ),
      ),
    );
  }
}
