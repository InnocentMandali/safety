
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;

  AuthRepository({
    FirebaseAuth? firebaseAuth,
    FirebaseFirestore? firebaseFirestore,
  })  : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<String?> getRole() async {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      final idTokenResult = await user.getIdTokenResult();
      return idTokenResult.claims?['role'] as String?;
    }
    return null;
  }

  Future<void> signUpWithEmailAndPassword(String email, String password, String name) async {
    try {
      final UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User? user = userCredential.user;
      if (user != null) {
        await _firebaseFirestore.collection('users').doc(user.uid).set({
          'name': name,
          'email': email,
          'role': 'user',
        });
      }
    } on FirebaseAuthException catch (e) {
      // handle error
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String password) {
    return _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signOut() {
    return _firebaseAuth.signOut();
  }
}
