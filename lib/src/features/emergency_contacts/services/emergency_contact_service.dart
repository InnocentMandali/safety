
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emergen_sync/src/features/emergency_contacts/models/emergency_contact_model.dart';

class EmergencyContactService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collectionPath = 'emergency_contacts';

  Future<void> addContact(EmergencyContact contact) async {
    await _firestore.collection(_collectionPath).add({
      'name': contact.name,
      'phone': contact.phone,
    });
  }

  Stream<List<EmergencyContact>> getContacts() {
    return _firestore.collection(_collectionPath).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return EmergencyContact(
          id: doc.id,
          name: doc['name'],
          phone: doc['phone'],
        );
      }).toList();
    });
  }

  Future<void> updateContact(EmergencyContact contact) async {
    await _firestore.collection(_collectionPath).doc(contact.id).update({
      'name': contact.name,
      'phone': contact.phone,
    });
  }

  Future<void> deleteContact(String id) async {
    await _firestore.collection(_collectionPath).doc(id).delete();
  }
}
