import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
      return null;
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
      return null;
    }
  }

  // Sign Out
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Send Sign In Link to Email
  Future<void> sendSignInLinkToEmail(String email) async {
    try {
      // IMPORTANT: Replace YOUR_PROJECT_ID with your actual Firebase project ID.
      const projectId = 'emergensync';
      final actionCodeSettings = ActionCodeSettings(
        url: 'https://\${projectId}.firebaseapp.com/__/auth/action?mode=signIn&oobCode=<oobCode>',
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
    }
  }

  // Auth State Changes
  Stream<User?> get user {
    return _auth.authStateChanges();
  }
}
