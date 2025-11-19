import 'package:flutter/foundation.dart';

@immutable
class UserProfile {
  const UserProfile({
    required this.uid,
    required this.name,
    required this.phoneNumber,
    required this.photoURL,
  });

  final String uid;
  final String name;
  final String phoneNumber;
  final String photoURL;

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      uid: map['uid'] as String,
      name: map['name'] as String,
      phoneNumber: map['phoneNumber'] as String,
      photoURL: map['photoURL'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'phoneNumber': phoneNumber,
      'photoURL': photoURL,
    };
  }
}
