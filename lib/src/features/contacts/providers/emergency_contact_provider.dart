
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:emergen_sync/src/features/contacts/models/emergency_contact.dart';
import 'package:emergen_sync/src/features/contacts/services/emergency_contact_service.dart';

class EmergencyContactProvider with ChangeNotifier {
  final EmergencyContactService _contactService = EmergencyContactService();
  List<EmergencyContact> _contacts = [];

  UnmodifiableListView<EmergencyContact> get contacts => UnmodifiableListView(_contacts);

  EmergencyContactProvider() {
    _contactService.getContacts().listen((contacts) {
      _contacts = contacts;
      notifyListeners();
    });
  }

  Future<void> addContact(EmergencyContact contact) async {
    await _contactService.addContact(contact);
  }

  Future<void> updateContact(EmergencyContact contact) async {
    await _contactService.updateContact(contact);
  }

  Future<void> deleteContact(String contactId) async {
    await _contactService.deleteContact(contactId);
  }
}
