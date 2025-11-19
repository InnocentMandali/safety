import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:emergen_sync/src/features/profile/data/user_profile_repository.dart';
import 'package:emergen_sync/src/features/profile/domain/user_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_bloc.freezed.dart';

@freezed
abstract class UserProfileEvent with _$UserProfileEvent {
  const factory UserProfileEvent.loadProfile() = _LoadProfile;
  const factory UserProfileEvent.saveProfile(
      {required String name, required String phoneNumber, File? image}) = _SaveProfile;
}

@freezed
abstract class UserProfileState with _$UserProfileState {
  const factory UserProfileState.initial() = _Initial;
  const factory UserProfileState.loading() = _Loading;
  const factory UserProfileState.loaded({required UserProfile userProfile}) = _Loaded;
  const factory UserProfileState.error({required String message}) = _Error;
}

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final UserProfileRepository _userProfileRepository;

  UserProfileBloc(this._userProfileRepository) : super(const UserProfileState.initial()) {
    on<_LoadProfile>((event, emit) async {
      emit(const UserProfileState.loading());
      try {
        final user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          final userProfile = await _userProfileRepository.getUserProfile(user.uid);
          if (userProfile != null) {
            emit(UserProfileState.loaded(userProfile: userProfile));
          } else {
            emit(const UserProfileState.error(message: 'User profile not found'));
          }
        } else {
          emit(const UserProfileState.error(message: 'User not logged in'));
        }
      } catch (e) {
        emit(UserProfileState.error(message: e.toString()));
      }
    });

    on<_SaveProfile>((event, emit) async {
      emit(const UserProfileState.loading());
      try {
        final user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          String? photoUrl;
          if (event.image != null) {
            photoUrl = await _userProfileRepository.uploadProfilePicture(user.uid, event.image!);
          }

          final userProfile = await _userProfileRepository.getUserProfile(user.uid);

          final updatedProfile = UserProfile(
            uid: user.uid,
            name: event.name,
            phoneNumber: event.phoneNumber,
            photoURL: photoUrl ?? userProfile?.photoURL ?? '',
          );

          await _userProfileRepository.updateUserProfile(updatedProfile);
          emit(UserProfileState.loaded(userProfile: updatedProfile));
        } else {
          emit(const UserProfileState.error(message: 'User not logged in'));
        }
      } catch (e) {
        emit(UserProfileState.error(message: e.toString()));
      }
    });
  }
}
