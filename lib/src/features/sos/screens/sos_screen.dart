
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import 'package:emergen_sync/src/features/emergency_contacts/providers/emergency_contact_provider.dart';

class SOSTriggerScreen extends StatefulWidget {
  const SOSTriggerScreen({super.key});

  @override
  State<SOSTriggerScreen> createState() => _SOSTriggerScreenState();
}

class _SOSTriggerScreenState extends State<SOSTriggerScreen> {
  bool _isSending = false;

  Future<void> _sendSOS() async {
    setState(() {
      _isSending = true;
    });

    if (await Permission.location.request().isGranted) {
      final locationData = await Location().getLocation();
      final latitude = locationData.latitude;
      final longitude = locationData.longitude;

      final contacts = Provider.of<EmergencyContactProvider>(context, listen: false).contacts;
      if (contacts.isEmpty) {
        _showSnackBar('No emergency contacts found. Please add contacts first.');
        setState(() {
          _isSending = false;
        });
        return;
      }

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
      } else {
        _showSnackBar('Could not launch SMS app.');
      }

    } else {
      _showSnackBar('Location permission is required to send an SOS.');
    }

    setState(() {
      _isSending = false;
    });
    Navigator.pop(context);
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirm SOS'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Press the button below to open your SMS app with a pre-filled SOS alert to all your emergency contacts.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 40),
            _isSending
                ? const CircularProgressIndicator()
                : ElevatedButton.icon(
                    onPressed: _sendSOS,
                    icon: const Icon(Icons.warning),
                    label: const Text('SEND SOS NOW'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
