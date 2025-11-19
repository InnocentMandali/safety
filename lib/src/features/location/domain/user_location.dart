import 'package:cloud_firestore/cloud_firestore.dart';

class UserLocation {
  final String uid;
  final double latitude;
  final double longitude;
  final Timestamp timestamp;

  UserLocation({
    required this.uid,
    required this.latitude,
    required this.longitude,
    required this.timestamp,
  });

  factory UserLocation.fromMap(Map<String, dynamic> map) {
    return UserLocation(
      uid: map['uid'] as String,
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      timestamp: map['timestamp'] as Timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'latitude': latitude,
      'longitude': longitude,
      'timestamp': timestamp,
    };
  }
}
