
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emergen_sync/src/features/alerts/models/alert_model.dart';
import 'package:emergen_sync/src/features/alerts/services/alert_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shake/shake.dart';
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:emergen_sync/src/features/authentication/services/auth_service.dart';
import 'package:emergen_sync/src/shared/providers/theme_provider.dart';

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
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not launch SMS app.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error sending SMS: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final authService = AuthService();

    return Scaffold(
      appBar: AppBar(
        title: const Text('EmergenSync'),
        actions: [
          IconButton(
            icon: Icon(themeProvider.themeMode == ThemeMode.dark
                ? Icons.light_mode
                : Icons.dark_mode),
            onPressed: () => themeProvider.toggleTheme(),
            tooltip: 'Toggle Theme',
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to EmergenSync',
              style: Theme.of(context).textTheme.displayLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              'Your personal safety companion',
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: _sendLocationSms,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              child: const Text('PANIC BUTTON'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.go('/emergency_contacts'),
              child: const Text('Emergency Contacts'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Or shake your phone to send an emergency SMS with your location.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
