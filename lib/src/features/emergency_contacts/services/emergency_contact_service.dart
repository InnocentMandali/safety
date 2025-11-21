
import 'package:emergen_sync/src/features/emergency_contacts/models/emergency_contact.dart';
import 'package:emergen_sync/src/services/database_service.dart';

class EmergencyContactService {
  final dbService = DatabaseService.instance;

  Future<int> addEmergencyContact(EmergencyContact contact) async {
    final db = await dbService.database;
    return await db.insert('emergency_contacts', contact.toMap());
  }

  Future<List<EmergencyContact>> getEmergencyContacts() async {
    final db = await dbService.database;
    final maps = await db.query('emergency_contacts');

    return List.generate(maps.length, (i) {
      return EmergencyContact.fromMap(maps[i]);
    });
  }

  Future<int> updateEmergencyContact(EmergencyContact contact) async {
    final db = await dbService.database;
    return await db.update(
      'emergency_contacts',
      contact.toMap(),
      where: 'id = ?',
      whereArgs: [contact.id],
    );
  }

  Future<int> deleteEmergencyContact(int id) async {
    final db = await dbService.database;
    return await db.delete(
      'emergency_contacts',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
