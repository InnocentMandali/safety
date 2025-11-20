
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:emergen_sync/src/features/emergency_contacts/providers/emergency_contact_provider.dart';
import 'package:emergen_sync/src/features/emergency_contacts/screens/add_emergency_contact_screen.dart';

class EmergencyContactsScreen extends StatelessWidget {
  const EmergencyContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency Contacts'),
      ),
      body: Consumer<EmergencyContactProvider>(
        builder: (context, provider, child) {
          return FutureBuilder(
            future: provider.loadContacts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                  itemCount: provider.contacts.length,
                  itemBuilder: (context, index) {
                    final contact = provider.contacts[index];
                    return ListTile(
                      title: Text(contact.name),
                      subtitle: Text(contact.phoneNumber),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          provider.deleteContact(contact.id!);
                        },
                      ),
                    );
                  },
                );
              }
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddEmergencyContactScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
