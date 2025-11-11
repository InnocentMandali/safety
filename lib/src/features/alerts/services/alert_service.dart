
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emergen_sync/src/features/alerts/models/alert_model.dart';

class AlertService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collectionPath = 'alerts';

  Future<void> logAlert(Alert alert) async {
    await _firestore.collection(_collectionPath).add({
      'userId': alert.userId,
      'timestamp': alert.timestamp,
      'location': alert.location,
    });
  }
}
