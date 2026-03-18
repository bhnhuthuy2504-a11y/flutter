import 'package:flutter/material.dart';

import 'ui_kit.dart';

class HomeMemberDetailsPage extends StatelessWidget {
  const HomeMemberDetailsPage({
    super.key,
    required this.name,
    required this.email,
    required this.role,
    this.canRemove = true,
  });

  final String name;
  final String email;
  final String role;
  final bool canRemove;

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
          'Home Member',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          child: Column(
            children: [
              Images2CodeSectionCard(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      const SizedBox(height: 8),
                      Images2CodeFakeAvatar(
                        initials: name
                            .split(' ')
                            .take(2)
                            .map((e) => e[0])
                            .join(),
                        seed: name.hashCode,
                        radius: 34,
                      ),
                      const SizedBox(height: 14),
                      Text(
                        name,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        email,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.hintColor,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Divider(color: theme.dividerColor.withOpacity(0.45)),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text('Role'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              role,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.hintColor,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Icon(Icons.chevron_right_rounded),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 18),
              if (canRemove)
                Images2CodeDangerButton(
                  label: 'Remove Member',
                  onPressed: () => showImages2CodeConfirmSheet(
                    context: context,
                    title: 'Remove Member',
                    titleColor: Colors.redAccent,
                    message: 'Are you sure you want to remove\n"$name" ?',
                    confirmLabel: 'Yes, Remove',
                    onConfirm: () => showImages2CodeSuccessSheet(
                      context: context,
                      message: '"$name" has been removed!',
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
