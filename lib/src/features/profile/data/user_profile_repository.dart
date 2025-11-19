import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emergen_sync/src/features/profile/domain/user_profile.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UserProfileRepository {
  final _usersCollection = FirebaseFirestore.instance.collection('users');
  final _storage = FirebaseStorage.instance;

  Future<UserProfile?> getUserProfile(String uid) async {
    final doc = await _usersCollection.doc(uid).get();
    if (doc.exists) {
      return UserProfile.fromMap(doc.data()!);
    } else {
      return null;
    }
  }

  Future<void> updateUserProfile(UserProfile userProfile) async {
    await _usersCollection.doc(userProfile.uid).set(userProfile.toMap());
  }

  Future<String> uploadProfilePicture(String uid, File image) async {
    final storageRef = _storage.ref().child('profile_pictures').child('$uid.jpg');
    final uploadTask = storageRef.putFile(image);
    final snapshot = await uploadTask.whenComplete(() => null);
    final downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}
