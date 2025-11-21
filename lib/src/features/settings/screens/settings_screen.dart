
import 'package:emergen_sync/src/features/authentication/data/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:emergen_sync/src/themes/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          _SettingsSection(
            title: 'Appearance',
            tiles: [
              _SettingsTile(
                title: 'Dark Mode',
                subtitle: 'Tap to toggle dark mode',
                leading: Icon(themeProvider.themeMode == ThemeMode.dark
                    ? Icons.dark_mode
                    : Icons.light_mode),
                trailing: Switch(
                  value: themeProvider.themeMode == ThemeMode.dark,
                  onChanged: (value) {
                    themeProvider.toggleTheme();
                  },
                ),
              ),
            ],
          ),
          _SettingsSection(
            title: 'Notifications',
            tiles: [
              _SettingsTile(
                title: 'Push Notifications',
                subtitle: 'Enable or disable all notifications',
                leading: const Icon(Icons.notifications),
                trailing: Switch(
                  value: true, // Placeholder value
                  onChanged: (value) {
                    // TODO: Implement notification preference logic
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Notification settings are not yet implemented.'),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          _SettingsSection(
            title: 'Account',
            tiles: [
              _SettingsTile(
                title: 'Logout',
                subtitle: 'Sign out of your account',
                leading: const Icon(Icons.logout, color: Colors.red),
                onTap: () => context.read<AuthRepository>().signOut(),
              ),
            ],
          ),
          _SettingsSection(
            title: 'About',
            tiles: [
              _SettingsTile(
                title: 'About EmergenSync',
                subtitle: 'Version 1.0.0',
                leading: const Icon(Icons.info_outline),
                onTap: () {
                  showAboutDialog(
                    context: context,
                    applicationName: 'EmergenSync',
                    applicationVersion: '1.0.0',
                    applicationLegalese:
                        '© 2024 Your Company. All rights reserved.',
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 24.0),
                        child: Text(
                            'Your all-in-one emergency preparedness assistant.'),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Helper widget for a section of settings
class _SettingsSection extends StatelessWidget {
  final String title;
  final List<Widget> tiles;

  const _SettingsSection({required this.title, required this.tiles});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            title.toUpperCase(),
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
        ),
        ...tiles,
        const Divider(height: 0),
      ],
    );
  }
}

// Helper widget for a single setting tile
class _SettingsTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget leading;
  final Widget? trailing;
  final VoidCallback? onTap;

  const _SettingsTile({
    required this.title,
    required this.subtitle,
    required this.leading,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
