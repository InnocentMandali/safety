import 'package:emergen_sync/src/features/authentication/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:emergen_sync/src/shared/providers/theme_provider.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late TextEditingController _messageController;
  String _emergencyMessage = 'I need help! My location is: [location]';

  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController();
    _loadEmergencyMessage();
  }

  void _loadEmergencyMessage() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _emergencyMessage = prefs.getString('emergency_message') ?? _emergencyMessage;
      _messageController.text = _emergencyMessage;
    });
  }

  void _saveEmergencyMessage(String message) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('emergency_message', message);
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text('Appearance'),
            tiles: [
              SettingsTile.navigation(
                leading: const Icon(Icons.color_lens),
                title: const Text('Theme'),
                value: Text(themeProvider.themeMode.name[0].toUpperCase() + themeProvider.themeMode.name.substring(1)),
                onPressed: (context) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Select Theme'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          RadioListTile<ThemeMode>(
                            title: const Text('System'),
                            value: ThemeMode.system,
                            groupValue: themeProvider.themeMode,
                            onChanged: (value) {
                              if (value != null) {
                                themeProvider.setTheme(value);
                                Navigator.of(context).pop();
                              }
                            },
                          ),
                          RadioListTile<ThemeMode>(
                            title: const Text('Light'),
                            value: ThemeMode.light,
                            groupValue: themeProvider.themeMode,
                            onChanged: (value) {
                              if (value != null) {
                                themeProvider.setTheme(value);
                                Navigator.of(context).pop();
                              }
                            },
                          ),
                          RadioListTile<ThemeMode>(
                            title: const Text('Dark'),
                            value: ThemeMode.dark,
                            groupValue: themeProvider.themeMode,
                            onChanged: (value) {
                              if (value != null) {
                                themeProvider.setTheme(value);
                                Navigator.of(context).pop();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          SettingsSection(
            title: const Text('Emergency Message'),
            tiles: [
              SettingsTile(
                title: const Text('Customize your emergency message. Use [location] as a placeholder for your coordinates.'),
              ),
              SettingsTile(
                title: TextField(
                  controller: _messageController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your emergency message',
                  ),
                  maxLines: 3,
                  onChanged: (value) {
                    setState(() {
                      _emergencyMessage = value;
                    });
                  },
                ),
              ),
              SettingsTile(
                title: ElevatedButton(
                  onPressed: () {
                    _saveEmergencyMessage(_emergencyMessage);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Message saved!')),
                    );
                  },
                  child: const Text('Save Message'),
                ),
              ),
            ],
          ),
          SettingsSection(
            tiles: [
              SettingsTile.navigation(
                leading: const Icon(Icons.logout),
                title: const Text('Log Out'),
                onPressed: (context) async {
                  final router = GoRouter.of(context);
                  await AuthService().signOut();
                  router.go('/');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
