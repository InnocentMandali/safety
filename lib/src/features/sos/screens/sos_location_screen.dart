
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SosLocationScreen extends StatelessWidget {
  final double latitude;
  final double longitude;

  const SosLocationScreen({
    super.key,
    required this.latitude,
    required this.longitude,
  });

  @override
  Widget build(BuildContext context) {
    final LatLng location = LatLng(latitude, longitude);
    return Scaffold(
      appBar: AppBar(
        title: const Text('SOS Location'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: location,
          zoom: 15,
        ),
        markers: {
          Marker(
            markerId: const MarkerId('sos_location'),
            position: location,
            infoWindow: const InfoWindow(title: 'SOS Location'),
          ),
        },
      ),
    );
  }
}
