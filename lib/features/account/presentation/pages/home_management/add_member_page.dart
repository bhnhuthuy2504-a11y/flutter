import 'package:flutter/material.dart';

import 'ui_kit.dart';

class AddMemberPage extends StatefulWidget {
  const AddMemberPage({super.key});

  @override
  State<AddMemberPage> createState() => _AddMemberPageState();
}

class _AddMemberPageState extends State<AddMemberPage> {
  bool _qrSelected = false;
  int _role = 1; // 0 = admin, 1 = member

  final _emailController = TextEditingController(
    text: 'sarah.wilona@yourdomain.com',
  );

  @override
  void dispose() {
    _emailController.dispose();
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
          'Add Member',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 14, 20, 0),
              child: Images2CodeSegmentedTabs(
                leftLabel: 'Invite via Email',
                rightLabel: 'Invite via QR Code',
                isRightSelected: _qrSelected,
                onChanged: (isRight) => setState(() => _qrSelected = isRight),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
                child: Images2CodeSectionCard(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (!_qrSelected) ...[
                          Text(
                            'Email',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.surface.withOpacity(
                                0.65,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.mail_outline_rounded,
                                  color: theme.hintColor,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: TextField(
                                    controller: _emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 14),
                        ] else ...[
                          const SizedBox(height: 4),
                          Center(child: Images2CodeFakeQr(size: 250)),
                          const SizedBox(height: 14),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: theme.dividerColor.withOpacity(0.35),
                              ),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'F6Z9K4X7',
                                  style: theme.textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Invitation Code',
                                  style: theme.textTheme.labelMedium,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 14),
                        ],
                        Text('Select Role', style: theme.textTheme.labelMedium),
                        Divider(color: theme.dividerColor.withOpacity(0.45)),
                        RadioListTile<int>(
                          value: 0,
                          groupValue: _role,
                          onChanged: (v) => setState(() => _role = v ?? 0),
                          title: Text(
                            'Admin',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          subtitle: Text(
                            'Manage devices & rooms, manage members, & manage smart scenes',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.hintColor,
                            ),
                          ),
                        ),
                        RadioListTile<int>(
                          value: 1,
                          groupValue: _role,
                          onChanged: (v) => setState(() => _role = v ?? 1),
                          title: Text(
                            'Member',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          subtitle: Text(
                            'Use devices, use smart scenes',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.hintColor,
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 18),
              child: Images2CodePrimaryButton(
                label: _qrSelected ? 'Share Invite' : 'Send Invite',
                onPressed: () {
                  if (_qrSelected) {
                    _showShareSheet(context);
                    return;
                  }
                  showImages2CodeSuccessSheet(
                    context: context,
                    message:
                        'An invitation has been sent to\n"${_emailController.text.trim()}"',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _showShareSheet(BuildContext context) async {
  final theme = Theme.of(context);
  await showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    useSafeArea: true,
    backgroundColor: theme.colorScheme.surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      Widget iconChip(IconData icon, String label, Color color) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(icon, color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: theme.textTheme.labelMedium?.copyWith(
                color: theme.hintColor,
              ),
            ),
          ],
        );
      }

      Widget person(String name, int seed) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Images2CodeFakeAvatar(
                  initials: name.split(' ').take(2).map((e) => e[0]).join(),
                  seed: seed,
                  radius: 24,
                ),
                Positioned(
                  right: -2,
                  bottom: -2,
                  child: Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      color: const Color(0xFF25D366),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: theme.colorScheme.surface,
                        width: 2,
                      ),
                    ),
                    child: const Icon(
                      Icons.chat_rounded,
                      size: 10,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: 70,
              child: Text(
                name,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: theme.textTheme.labelMedium,
              ),
            ),
          ],
        );
      }

      return Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Share',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w800,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 14),
            Divider(color: theme.dividerColor.withOpacity(0.45)),
            const SizedBox(height: 10),
            Text('Recent people', style: theme.textTheme.labelMedium),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  person('Jenny\nWilson', 1),
                  const SizedBox(width: 16),
                  person('Kristin\nWatson', 2),
                  const SizedBox(width: 16),
                  person('Clinton\nMcclure', 3),
                  const SizedBox(width: 16),
                  person('Sarah\nWilona', 4),
                  const SizedBox(width: 16),
                  person('Alex\nHera', 5),
                ],
              ),
            ),
            const SizedBox(height: 14),
            Divider(color: theme.dividerColor.withOpacity(0.45)),
            const SizedBox(height: 10),
            Text('Social media', style: theme.textTheme.labelMedium),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  iconChip(
                    Icons.chat_rounded,
                    'WhatsApp',
                    const Color(0xFF25D366),
                  ),
                  const SizedBox(width: 16),
                  iconChip(
                    Icons.facebook_rounded,
                    'Facebook',
                    const Color(0xFF1877F2),
                  ),
                  const SizedBox(width: 16),
                  iconChip(
                    Icons.camera_alt_rounded,
                    'Instagram',
                    const Color(0xFFE1306C),
                  ),
                  const SizedBox(width: 16),
                  iconChip(
                    Icons.send_rounded,
                    'Telegram',
                    const Color(0xFF2AABEE),
                  ),
                  const SizedBox(width: 16),
                  iconChip(
                    Icons.alternate_email_rounded,
                    'Twitter',
                    const Color(0xFF1DA1F2),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
