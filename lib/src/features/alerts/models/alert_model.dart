import 'package:cloud_firestore/cloud_firestore.dart';

class Alert {
  final String userId;
  final GeoPoint location;
  final Timestamp timestamp;

  Alert({
    required this.userId,
    required this.location,
    required this.timestamp,
  });

  factory Alert.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Alert(
      userId: data['userId'] ?? '',
      location: data['location'] ?? const GeoPoint(0, 0),
      timestamp: data['timestamp'] ?? Timestamp.now(),
    );
  }
}
