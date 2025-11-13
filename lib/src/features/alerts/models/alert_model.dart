
import 'package:cloud_firestore/cloud_firestore.dart';

class Alert {
  final String id;
  final String userId;
  final Timestamp timestamp;
  final GeoPoint location;

  Alert({
    required this.id,
    required this.userId,
    required this.timestamp,
    required this.location,
  });

  factory Alert.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Alert(
      id: doc.id,
      userId: data['userId'] ?? '',
      timestamp: data['timestamp'] ?? Timestamp.now(),
      location: data['location'] ?? const GeoPoint(0, 0),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'timestamp': timestamp,
      'location': location,
    };
  }
}
