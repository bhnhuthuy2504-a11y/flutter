import 'package:flutter/material.dart';

import 'images2code_ui_kit.dart';

class ManageRoomsPage extends StatefulWidget {
  const ManageRoomsPage({super.key});

  @override
  State<ManageRoomsPage> createState() => _ManageRoomsPageState();
}

class _ManageRoomsPageState extends State<ManageRoomsPage> {
  final _rooms = <String>[
    'Living Room',
    'Bedroom',
    'Bathroom',
    'Bathroom',
    'Dining Room',
    'Backyard',
    'Bedroom 2',
  ];

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
          'Manage Rooms',
          style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
        ),
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          itemCount: _rooms.length,
          separatorBuilder: (_, __) => const SizedBox(height: 14),
          itemBuilder: (context, index) {
            return Container(
              height: 62,
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(14),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                children: [
                  Icon(Icons.drag_indicator_rounded, color: theme.hintColor),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      _rooms[index],
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => showImages2CodeConfirmSheet(
                      context: context,
                      title: 'Delete Room',
                      titleColor: Colors.redAccent,
                      message:
                          'Are you sure you want to delete the Room\n"${_rooms[index]}" ?\n\nAll devices paired and associated with this room will be unpaired after this action.',
                      confirmLabel: 'Yes, Delete',
                      onConfirm: () => showImages2CodeSuccessSheet(
                        context: context,
                        message: 'The Room "${_rooms[index]}" has been successfully deleted!',
                      ),
                    ),
                    icon: const Icon(Icons.delete_outline_rounded, color: Colors.redAccent),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

