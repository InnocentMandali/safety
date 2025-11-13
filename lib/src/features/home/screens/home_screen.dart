import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emergen_sync/src/features/alerts/models/alert_model.dart';
import 'package:emergen_sync/src/features/alerts/services/alert_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shake/shake.dart';
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:emergen_sync/src/features/authentication/services/auth_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ShakeDetector detector;
  Location location = Location();
  final AlertService _alertService = AlertService();

  @override
  void initState() {
    super.initState();
    detector = ShakeDetector.autoStart(
      onPhoneShake: (ShakeEvent event) {
        _sendLocationSms();
      },
    );
  }

  @override
  void dispose() {
    detector.stopListening();
    super.dispose();
  }

  void _sendLocationSms() async {
    try {
      final locData = await location.getLocation();
      final user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        final newAlert = Alert(
          id: '', // Firestore generates the ID
          userId: user.uid,
          timestamp: Timestamp.now(),
          location: GeoPoint(locData.latitude!, locData.longitude!),
        );
        await _alertService.logAlert(newAlert);
      }

      final String sms =
          'sms:?body=I need help! My location is: https://www.google.com/maps/search/?api=1&query=${locData.latitude},${locData.longitude}';
      final Uri uri = Uri.parse(sms);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Could not launch SMS app.')),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error sending SMS: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authService = AuthService();

    return Scaffold(
      appBar: AppBar(
        title: const Text('EmergenSync'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.go('/settings'),
            tooltip: 'Settings',
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await authService.signOut();
              context.go('/login');
            },
            tooltip: 'Logout',
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              children: [
                Text(
                  'Welcome to EmergenSync',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'Your personal safety companion',
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),

            // Panic Button
            SizedBox(
              width: 200,
              height: 200,
              child: ElevatedButton(
                onPressed: _sendLocationSms,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[700],
                  foregroundColor: Colors.white,
                  shape: const CircleBorder(),
                  elevation: 10,
                  shadowColor: Colors.red.withOpacity(0.8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.warning_amber_rounded, size: 60),
                    const SizedBox(height: 8),
                    const Text(
                      'PANIC',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            
            Text(
              'Press the button or shake your phone to send an emergency SMS with your location.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            
            // Other options
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.people_alt_outlined),
                  onPressed: () => context.go('/emergency_contacts'),
                  label: const Text('Contacts'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                ),
                 ElevatedButton.icon(
                  icon: const Icon(Icons.admin_panel_settings_outlined),
                  onPressed: () => context.go('/admin'),
                  label: const Text('Admin'),
                   style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
