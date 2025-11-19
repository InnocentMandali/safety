
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:emergen_sync/src/features/contacts/models/emergency_contact.dart';

class ContactListItem extends StatelessWidget {
  final EmergencyContact contact;
  final VoidCallback onTap;

  const ContactListItem({super.key, required this.contact, required this.onTap});

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      throw 'Could not launch $launchUri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.person),
      title: Text(contact.name),
      subtitle: Text(contact.relationship),
      trailing: IconButton(
        icon: const Icon(Icons.call),
        onPressed: () => _makePhoneCall(contact.phoneNumber),
      ),
      onTap: onTap,
    );
  }
}
