import 'package:flutter/material.dart';

import 'add_member_page.dart';
import 'home_member_details_page.dart';
import 'room_management_page.dart';
import 'images2code_ui_kit.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, this.homeName = 'My Home'});

  final String homeName;

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
          homeName,
          style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.more_vert_rounded), onPressed: () {}),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          children: [
            Images2CodeSectionCard(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: const Text('Home Name'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(homeName, style: theme.textTheme.bodyMedium?.copyWith(color: theme.hintColor)),
                        const SizedBox(width: 8),
                        const Icon(Icons.chevron_right_rounded),
                      ],
                    ),
                    onTap: () => _showEditHomeNameSheet(context, initialValue: homeName),
                  ),
                  Divider(height: 1, indent: 20, endIndent: 20, color: theme.dividerColor.withOpacity(0.45)),
                  ListTile(
                    title: const Text('Room Management'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('6 Room(s)', style: theme.textTheme.bodyMedium?.copyWith(color: theme.hintColor)),
                        const SizedBox(width: 8),
                        const Icon(Icons.chevron_right_rounded),
                      ],
                    ),
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute<void>(builder: (_) => const RoomManagementPage()),
                    ),
                  ),
                  Divider(height: 1, indent: 20, endIndent: 20, color: theme.dividerColor.withOpacity(0.45)),
                  ListTile(
                    title: const Text('Device Management'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('37 Device(s)', style: theme.textTheme.bodyMedium?.copyWith(color: theme.hintColor)),
                        const SizedBox(width: 8),
                        const Icon(Icons.chevron_right_rounded),
                      ],
                    ),
                    onTap: () {},
                  ),
                  Divider(height: 1, indent: 20, endIndent: 20, color: theme.dividerColor.withOpacity(0.45)),
                  ListTile(
                    title: const Text('Location'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('701 7th Ave...', style: theme.textTheme.bodyMedium?.copyWith(color: theme.hintColor)),
                        const SizedBox(width: 8),
                        const Icon(Icons.chevron_right_rounded),
                      ],
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Stack(
              alignment: Alignment.topRight,
              children: [
                Images2CodeSectionCard(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 14, 20, 8),
                        child: Row(
                          children: [
                            Text(
                              'Home Members (4)',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(height: 1, indent: 20, endIndent: 20, color: theme.dividerColor.withOpacity(0.45)),
                      _MemberTile(
                        name: 'Andrew Ainsley (You)',
                        email: 'andrew.ainsley@yourdomain.com',
                        role: 'Owner',
                        seed: 1,
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (_) => const HomeMemberDetailsPage(
                              name: 'Andrew Ainsley',
                              email: 'andrew.ainsley@yourdomain.com',
                              role: 'Owner',
                              canRemove: false,
                            ),
                          ),
                        ),
                      ),
                      Divider(height: 1, indent: 20, endIndent: 20, color: theme.dividerColor.withOpacity(0.45)),
                      _MemberTile(
                        name: 'Jenny Wilson',
                        email: 'jenny.wilson@yourdomain.com',
                        role: 'Admin',
                        seed: 2,
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (_) => const HomeMemberDetailsPage(
                              name: 'Jenny Wilson',
                              email: 'jenny.wilson@yourdomain.com',
                              role: 'Admin',
                            ),
                          ),
                        ),
                      ),
                      Divider(height: 1, indent: 20, endIndent: 20, color: theme.dividerColor.withOpacity(0.45)),
                      _MemberTile(
                        name: 'Robert Hawkins',
                        email: 'robert.hawkins@yourdomain.com',
                        role: 'Member',
                        seed: 3,
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (_) => const HomeMemberDetailsPage(
                              name: 'Robert Hawkins',
                              email: 'robert.hawkins@yourdomain.com',
                              role: 'Member',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, right: 12),
                  child: FloatingActionButton(
                    mini: true,
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute<void>(builder: (_) => const AddMemberPage()),
                    ),
                    child: const Icon(Icons.add_rounded),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 22),
            Images2CodeDangerButton(
              label: 'Delete Home',
              onPressed: () => showImages2CodeConfirmSheet(
                context: context,
                title: 'Delete Home',
                titleColor: Colors.redAccent,
                message:
                    'Are you sure you want to delete this home?\n\nAfter the home is deleted, all members will be removed, and all devices will be unpaired.',
                confirmLabel: 'Yes, Delete',
                onConfirm: () => showImages2CodeSuccessSheet(
                  context: context,
                  message: '"$homeName" has been successfully deleted!',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MemberTile extends StatelessWidget {
  const _MemberTile({
    required this.name,
    required this.email,
    required this.role,
    required this.seed,
    required this.onTap,
  });

  final String name;
  final String email;
  final String role;
  final int seed;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      onTap: onTap,
      leading: Images2CodeFakeAvatar(
        initials: name.trim().split(' ').take(2).map((e) => e.isEmpty ? '' : e[0]).join(),
        seed: seed,
      ),
      title: Text(name, style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700)),
      subtitle: Text(email, style: theme.textTheme.bodyMedium?.copyWith(color: theme.hintColor)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(role, style: theme.textTheme.bodyMedium?.copyWith(color: theme.hintColor)),
          const SizedBox(width: 8),
          const Icon(Icons.chevron_right_rounded),
        ],
      ),
    );
  }
}

Future<void> _showEditHomeNameSheet(
  BuildContext context, {
  required String initialValue,
}) async {
  final controller = TextEditingController(text: initialValue);
  final theme = Theme.of(context);

  await showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    useSafeArea: true,
    backgroundColor: theme.colorScheme.background,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.fromLTRB(
          20,
          10,
          20,
          20 + MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Home Name',
              style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 12),
            Divider(color: theme.dividerColor.withOpacity(0.45)),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface.withOpacity(0.65),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(border: InputBorder.none),
              ),
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                Expanded(
                  child: FilledButton.tonal(
                    onPressed: () => Navigator.of(context).pop(),
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(26),
                      ),
                    ),
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: FilledButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(26),
                      ),
                    ),
                    child: const Text(
                      'Save',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}

