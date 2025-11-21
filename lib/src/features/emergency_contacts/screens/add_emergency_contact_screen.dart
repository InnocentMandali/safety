
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:emergen_sync/src/features/emergency_contacts/models/emergency_contact.dart';
import 'package:emergen_sync/src/features/emergency_contacts/providers/emergency_contact_provider.dart';

class AddEmergencyContactScreen extends StatefulWidget {
  const AddEmergencyContactScreen({super.key});

  @override
  AddEmergencyContactScreenState createState() =>
      AddEmergencyContactScreenState();
}

class AddEmergencyContactScreenState extends State<AddEmergencyContactScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _phoneNumber = '';

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final newContact = EmergencyContact(name: _name, phoneNumber: _phoneNumber);
      Provider.of<EmergencyContactProvider>(context, listen: false)
          .addContact(newContact);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Emergency Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a name' : null,
                onSaved: (value) => _name = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Phone Number'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a phone number' : null,
                onSaved: (value) => _phoneNumber = value!,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                child: const Text('Add Contact'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
