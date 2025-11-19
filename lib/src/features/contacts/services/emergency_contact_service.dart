
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:emergen_sync/src/features/contacts/models/emergency_contact.dart';

class EmergencyContactService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Get user's emergency contacts
  Stream<List<EmergencyContact>> getContacts() {
    final user = _auth.currentUser;
    if (user == null) {
      return Stream.value([]);
    }
    return _firestore
        .collection('users')
        .doc(user.uid)
        .collection('emergency_contacts')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return EmergencyContact.fromMap(doc.data(), doc.id);
      }).toList();
    });
  }

  // Add an emergency contact
  Future<void> addContact(EmergencyContact contact) {
    final user = _auth.currentUser;
    if (user == null) {
      throw Exception('User not logged in');
    }
    return _firestore
        .collection('users')
        .doc(user.uid)
        .collection('emergency_contacts')
        .add(contact.toMap());
  }

  // Update an emergency contact
  Future<void> updateContact(EmergencyContact contact) {
    final user = _auth.currentUser;
    if (user == null) {
      throw Exception('User not logged in');
    }
    return _firestore
        .collection('users')
        .doc(user.uid)
        .collection('emergency_contacts')
        .doc(contact.id)
        .update(contact.toMap());
  }

  // Delete an emergency contact
  Future<void> deleteContact(String contactId) {
    final user = _auth.currentUser;
    if (user == null) {
      throw Exception('User not logged in');
    }
    return _firestore
        .collection('users')
        .doc(user.uid)
        .collection('emergency_contacts')
        .doc(contactId)
        .delete();
  }
}
