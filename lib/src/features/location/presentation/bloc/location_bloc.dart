import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emergen_sync/src/features/location/data/location_repository.dart';
import 'package:emergen_sync/src/features/location/domain/user_location.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:location/location.dart';

part 'location_bloc.freezed.dart';

@freezed
abstract class LocationEvent with _$LocationEvent {
  const factory LocationEvent.updateLocation() = _UpdateLocation;
  const factory LocationEvent.getLocations() = _GetLocations;
}

@freezed
abstract class LocationState with _$LocationState {
  const factory LocationState.initial() = _Initial;
  const factory LocationState.loading() = _Loading;
  const factory LocationState.loaded(List<UserLocation> locations) = _Loaded;
  const factory LocationState.error(String message) = _Error;
}

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final LocationRepository _locationRepository;
  final Location _location = Location();

  LocationBloc(this._locationRepository) : super(const LocationState.initial()) {
    on<_UpdateLocation>((event, emit) async {
      try {
        final user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          final locationData = await _location.getLocation();
          final userLocation = UserLocation(
            uid: user.uid,
            latitude: locationData.latitude!,
            longitude: locationData.longitude!,
            timestamp: Timestamp.now(),
          );
          await _locationRepository.updateUserLocation(userLocation);
        }
      } catch (e) {
        emit(LocationState.error(e.toString()));
      }
    });

    on<_GetLocations>((event, emit) async {
      emit(const LocationState.loading());
      try {
        await emit.onEach(
          _locationRepository.getUsersLocation(),
          onData: (locations) => emit(LocationState.loaded(locations)),
          onError: (error, stackTrace) => emit(LocationState.error(error.toString())),
        );
      } catch (e) {
        emit(LocationState.error(e.toString()));
      }
    });
  }
}
