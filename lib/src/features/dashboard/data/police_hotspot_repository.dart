import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emergen_sync/src/features/models/police_hotspot_model.dart';

class PoliceHotspotRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<PoliceHotspotModel>> getPoliceHotspots() async {
    try {
      final snapshot = await _firestore.collection('police_hotspots').get();
      return snapshot.docs
          .map((doc) => PoliceHotspotModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
