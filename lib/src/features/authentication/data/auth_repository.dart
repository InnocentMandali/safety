import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth;

  AuthRepository({FirebaseAuth? firebaseAuth}) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<String?> getRole() async {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      final idTokenResult = await user.getIdTokenResult();
      return idTokenResult.claims?['role'] as String?;
    }
    return null;
  }

  Future<void> signInWithEmailAndPassword(String email, String password) {
    return _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signOut() {
    return _firebaseAuth.signOut();
  }
}
