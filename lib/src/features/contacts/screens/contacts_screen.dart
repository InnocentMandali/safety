
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:emergen_sync/src/features/contacts/providers/emergency_contact_provider.dart';
import 'package:emergen_sync/src/features/contacts/screens/add_edit_contact_screen.dart';
import 'package:emergen_sync/src/features/contacts/widgets/contact_list_item.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency Contacts'),
      ),
      body: Consumer<EmergencyContactProvider>(
        builder: (context, provider, child) {
          if (provider.contacts.isEmpty) {
            return const Center(
              child: Text('No emergency contacts found.'),
            );
          }
          return ListView.builder(
            itemCount: provider.contacts.length,
            itemBuilder: (context, index) {
              final contact = provider.contacts[index];
              return ContactListItem(
                contact: contact,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddEditContactScreen(contact: contact),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddEditContactScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
