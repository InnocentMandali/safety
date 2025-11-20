import 'package:emergen_sync/src/features/location/data/location_repository.dart';
import 'package:emergen_sync/src/features/location/presentation/bloc/location_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  final Map<String, Marker> _markers = {};

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocationBloc(LocationRepository())..add(const LocationEvent.getLocations()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Real-time User Locations'),
        ),
        body: BlocListener<LocationBloc, LocationState>(
          listener: (context, state) {
            state.maybeWhen(
              loaded: (locations) {
                setState(() {
                  _markers.clear();
                  for (final location in locations) {
                    final marker = Marker(
                      markerId: MarkerId(location.uid),
                      position: LatLng(location.latitude, location.longitude),
                      infoWindow: InfoWindow(title: location.uid),
                    );
                    _markers[location.uid] = marker;
                  }
                });
              },
              error: (message) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(message)),
                );
              },
              orElse: () {},
            );
          },
          child: GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(37.7749, -122.4194), // San Francisco
              zoom: 12,
            ),
            markers: _markers.values.toSet(),
          ),
        ),
      ),
    );
  }
}
