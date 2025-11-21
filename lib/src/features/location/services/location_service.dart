
import 'package:location/location.dart';

class LocationService {
  final Location _location = Location();

  Future<LocationData?>getLocation() async {
    try {
      return await _location.getLocation();
    } catch (e) {
      return null;
    }
  }
}
