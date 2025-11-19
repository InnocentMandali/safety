import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Email & Password Sign Up
  Future<User?> signUp(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  // Email & Password Sign In
  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  // Save User to Firestore
  Future<void> saveUserToFirestore(String name, String email, String uid) async {
    try {
      await _firestore.collection('users').doc(uid).set({
        'name': name,
        'email': email,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  // Sign Out
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Send Sign In Link to Email
  Future<void> sendSignInLinkToEmail(String email) async {
    try {
      final actionCodeSettings = ActionCodeSettings(
        url: 'https://emergensync.firebaseapp.com/__/auth/action?mode=signIn&oobCode=<oobCode>',
        handleCodeInApp: true,
        androidPackageName: 'com.example.emergen_sync',
        androidInstallApp: true,
        androidMinimumVersion: '12',
      );
      await _auth.sendSignInLinkToEmail(
        email: email,
        actionCodeSettings: actionCodeSettings,
      );
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  // Auth State Changes
  Stream<User?> get user {
    return _auth.authStateChanges();
  }
}
