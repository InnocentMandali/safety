
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../emergency_contacts/providers/emergency_contact_provider.dart';

class SOSTriggerScreen extends StatefulWidget {
  const SOSTriggerScreen({super.key});

  @override
  State<SOSTriggerScreen> createState() => _SOSTriggerScreenState();
}

class _SOSTriggerScreenState extends State<SOSTriggerScreen> {
  bool _isSending = false;

  Future<void> _sendSOS() async {
    if (!mounted) return;

    setState(() {
      _isSending = true;
    });

    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final contactProvider =
        Provider.of<EmergencyContactProvider>(context, listen: false);

    if (await Permission.location.request().isGranted &&
        await Permission.sms.request().isGranted) {
      try {
        final locationData = await Location().getLocation();
        final latitude = locationData.latitude;
        final longitude = locationData.longitude;

        final contacts = contactProvider.contacts;
        if (contacts.isEmpty) {
          scaffoldMessenger.showSnackBar(const SnackBar(
              content: Text('No emergency contacts found. Please add them first.')));
        } else {
          final String message =
              'EMERGENCY! This is an SOS alert. My current location is: https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
          final List<String> recipients = contacts.map((c) => c.phoneNumber).toList();

          final Uri smsLaunchUri = Uri(
            scheme: 'sms',
            path: recipients.join(','),
            queryParameters: <String, String>{
              'body': message,
            },
          );

          if (await canLaunchUrl(smsLaunchUri)) {
            await launchUrl(smsLaunchUri);
            scaffoldMessenger.showSnackBar(
              const SnackBar(content: Text('SOS message prepared in your SMS app!')),
            );
          } else {
            scaffoldMessenger.showSnackBar(
              const SnackBar(content: Text('Could not launch SMS app.')),
            );
          }
        }
      } catch (e) {
        scaffoldMessenger.showSnackBar(
          SnackBar(content: Text('Error fetching location or sending SOS: $e')),
        );
      }
    } else {
      scaffoldMessenger.showSnackBar(
        const SnackBar(
            content:
                Text('SMS and Location permissions are required to send an SOS.')),
      );
    }

    if (mounted) {
      setState(() {
        _isSending = false;
      });
      context.go('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirm SOS'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Press the button below to open your SMS app with a pre-filled SOS alert to all your emergency contacts.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 40),
              if (_isSending)
                const CircularProgressIndicator()
              else
                ElevatedButton.icon(
                  onPressed: _sendSOS,
                  icon: const Icon(Icons.warning_amber_rounded),
                  label: const Text('SEND SOS NOW'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 20),
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
