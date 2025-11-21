
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  List<Contact>? _contacts;
  bool _permissionDenied = false;

  @override
  void initState() {
    super.initState();
    _requestPermissionAndFetchContacts();
  }

  Future<void> _requestPermissionAndFetchContacts() async {
    final status = await Permission.contacts.request();
    if (status.isGranted) {
      final contacts = await FlutterContacts.getContacts(
        withProperties: true, // Fetches phone numbers, emails, etc.
      );
      setState(() {
        _contacts = contacts;
      });
    } else {
      setState(() {
        _permissionDenied = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone Contacts'),
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.go('/contacts/emergency_contacts'),
        label: const Text('My Emergency Contacts'),
        icon: const Icon(Icons.star),
      ),
    );
  }

  Widget _buildBody() {
    if (_permissionDenied) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Text(
            'Permission to access contacts was denied. Please enable it in your phone settings to add emergency contacts.',
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    if (_contacts == null) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_contacts!.isEmpty) {
      return const Center(child: Text('No contacts found on your device.'));
    }

    return ListView.builder(
      itemCount: _contacts!.length,
      itemBuilder: (context, index) {
        final contact = _contacts![index];
        return ListTile(
          title: Text(contact.displayName),
          subtitle: Text(contact.phones.isNotEmpty
              ? contact.phones.first.number
              : 'No phone number'),
          leading: CircleAvatar(
            child: Text(contact.displayName.isNotEmpty
                ? contact.displayName[0]
                : '#'),
          ),
          trailing: ElevatedButton(
            onPressed: () {
              // TODO: Implement adding contact to emergency list
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Adding ${contact.displayName} to emergency contacts...'),
                ),
              );
            },
            child: const Text('Add'),
          ),
        );
      },
    );
  }
}
