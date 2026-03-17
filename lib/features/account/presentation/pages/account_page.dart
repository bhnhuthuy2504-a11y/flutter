import 'package:flutter/material.dart';

import 'home_management_page.dart';
import '../widgets/profile_header.dart';
import '../widgets/settings_tile.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  int _selectedIndex = 3;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Row(
          children: [
            Text(
              'My Home',
              style: theme.textTheme.titleLarge,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.keyboard_arrow_down_sharp),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.fullscreen_rounded),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert_rounded),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          children: [
            const ProfileHeader(
              name: 'Andrew Ainsley',
              email: 'andrew.ainsley@yourdomain.com',
            ),
            const SizedBox(height: 24),
            _buildSectionLabel(context, 'General'),
            const SizedBox(height: 8),
            SettingsTile(
              icon: Icons.home_rounded,
              title: 'Home Management',
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => const HomeManagementPage(),
                ),
              ),
            ),
            const SettingsTile(
              icon: Icons.mic_rounded,
              title: 'Voice Assistants',
            ),
            const SettingsTile(
              icon: Icons.notifications_none_rounded,
              title: 'Notifications',
            ),
            const SettingsTile(
              icon: Icons.lock_outline_rounded,
              title: 'Account & Security',
            ),
            const SettingsTile(
              icon: Icons.swap_horiz_rounded,
              title: 'Linked Accounts',
            ),
            const SettingsTile(
              icon: Icons.visibility_outlined,
              title: 'App Appearance',
            ),
            const SettingsTile(
              icon: Icons.settings_outlined,
              title: 'Additional Settings',
            ),
            const SizedBox(height: 24),
            _buildSectionLabel(context, 'Support'),
            const SizedBox(height: 8),
            const SettingsTile(
              icon: Icons.insert_chart_outlined_rounded,
              title: 'Data & Analytics',
            ),
            const SettingsTile(
              icon: Icons.help_outline_rounded,
              title: 'Help & Support',
            ),
            const SizedBox(height: 24),
            _buildLogoutButton(context),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flash_on_outlined),
            label: 'Smart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_rounded),
            label: 'Reports',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            activeIcon: Icon(Icons.person_rounded),
            label: 'Account',
          ),
        ],
      ),
    );
  }

  Widget _buildSectionLabel(BuildContext context, String label) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(color: theme.textTheme.labelMedium?.color),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            width: double.infinity,
            height: 1,
            color: theme.textTheme.labelMedium?.color,
          ),
        )
      ],
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    final theme = Theme.of(context);
    return TextButton.icon(
      onPressed: () {},
      style: TextButton.styleFrom(
        foregroundColor: Colors.redAccent,
        padding: EdgeInsets.zero,
        alignment: Alignment.centerLeft,
      ),
      icon: const Icon(Icons.logout_rounded),
      label: Text(
        'Logout',
        style: theme.textTheme.bodyMedium?.copyWith(
          color: Colors.redAccent,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}


