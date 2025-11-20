
import 'package:flutter/material.dart';
import 'package:emergen_sync/src/features/emergency_contacts/models/emergency_contact.dart';
import 'package:emergen_sync/src/features/emergency_contacts/services/emergency_contact_service.dart';

class EmergencyContactProvider with ChangeNotifier {
  final EmergencyContactService _contactService = EmergencyContactService();
  List<EmergencyContact> _contacts = [];

  List<EmergencyContact> get contacts => _contacts;

  Future<void> loadContacts() async {
    _contacts = await _contactService.getEmergencyContacts();
    notifyListeners();
  }

  Future<void> addContact(EmergencyContact contact) async {
    await _contactService.addEmergencyContact(contact);
    await loadContacts();
  }

  Future<void> updateContact(EmergencyContact contact) async {
    await _contactService.updateEmergencyContact(contact);
    await loadContacts();
  }

  Future<void> deleteContact(int id) async {
    await _contactService.deleteEmergencyContact(id);
    await loadContacts();
  }
}
