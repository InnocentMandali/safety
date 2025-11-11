
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
}
