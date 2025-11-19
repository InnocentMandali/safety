import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emergen_sync/src/features/location/domain/user_location.dart';

class LocationRepository {
  final _locationsCollection = FirebaseFirestore.instance.collection('locations');

  Future<void> updateUserLocation(UserLocation location) async {
    await _locationsCollection.doc(location.uid).set(location.toMap());
  }

  Stream<List<UserLocation>> getUsersLocation() {
    return _locationsCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => UserLocation.fromMap(doc.data())).toList();
    });
  }
}
