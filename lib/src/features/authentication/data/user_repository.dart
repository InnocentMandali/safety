import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emergen_sync/src/features/models/user_model.dart';

class UserRepository {
  final FirebaseFirestore _firestore;

  UserRepository({FirebaseFirestore? firestore}) : _firestore = firestore ?? FirebaseFirestore.instance;

  Stream<List<UserModel>> getUsers() {
    return _firestore.collection('users').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => UserModel.fromJson(doc.data())).toList();
    });
  }
}
