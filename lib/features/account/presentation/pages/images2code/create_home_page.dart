import 'package:flutter/material.dart';

import 'images2code_ui_kit.dart';

class CreateHomePage extends StatefulWidget {
  const CreateHomePage({super.key});

  @override
  State<CreateHomePage> createState() => _CreateHomePageState();
}

class _CreateHomePageState extends State<CreateHomePage> {
  final _homeNameController = TextEditingController(text: 'My Rental House');
  final _rooms = <_RoomChoice>[
    _RoomChoice('Living Room', true),
    _RoomChoice('Bedroom', true),
    _RoomChoice('Bathroom', true),
    _RoomChoice('Kitchen', false),
    _RoomChoice('Study Room', true),
    _RoomChoice('Dining Room', false),
  ];

  @override
  void dispose() {
    _homeNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text(
          'Create a Home',
          style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.more_vert_rounded), onPressed: () {}),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                children: [
                  Images2CodeSectionCard(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text('Home Name', style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700)),
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.surface.withOpacity(0.65),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextField(
                              controller: _homeNameController,
                              decoration: const InputDecoration(border: InputBorder.none),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Divider(color: theme.dividerColor.withOpacity(0.45)),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: const Text('Location'),
                            trailing: const Icon(Icons.chevron_right_rounded),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Images2CodeSectionCard(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 6, 20, 6),
                              child: Row(
                                children: [
                                  Text(
                                    'Add Room(s)',
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(height: 1, indent: 20, endIndent: 20, color: theme.dividerColor.withOpacity(0.45)),
                            for (int i = 0; i < _rooms.length; i++) ...[
                              ListTile(
                                title: Text(_rooms[i].name),
                                trailing: _rooms[i].selected
                                    ? Container(
                                        width: 26,
                                        height: 26,
                                        decoration: BoxDecoration(
                                          color: theme.colorScheme.primary,
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(Icons.check_rounded, color: Colors.white, size: 16),
                                      )
                                    : const SizedBox(width: 26, height: 26),
                                onTap: () => setState(() => _rooms[i] = _rooms[i].toggle()),
                              ),
                              if (i < _rooms.length - 1)
                                Divider(
                                  height: 1,
                                  indent: 20,
                                  endIndent: 20,
                                  color: theme.dividerColor.withOpacity(0.45),
                                ),
                            ],
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12, right: 12),
                        child: FloatingActionButton(
                          mini: true,
                          onPressed: () {},
                          child: const Icon(Icons.add_rounded),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 18),
              child: Images2CodePrimaryButton(
                label: 'Save',
                onPressed: () => showImages2CodeSuccessSheet(
                  context: context,
                  message: '"${_homeNameController.text.trim()}" has been created!',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RoomChoice {
  const _RoomChoice(this.name, this.selected);

  final String name;
  final bool selected;

  _RoomChoice toggle() => _RoomChoice(name, !selected);
}

