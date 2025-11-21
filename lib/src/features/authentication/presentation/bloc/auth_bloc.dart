
import 'package:bloc/bloc.dart';

import '../../data/auth_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc(this._authRepository) : super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      await event.when(
        appStarted: () async {
          try {
            final user = _authRepository.getCurrentUser();
            if (user != null) {
              emit(AuthState.authenticated(user: user));
            } else {
              emit(const AuthState.unauthenticated());
            }
          } catch (e) {
            emit(AuthState.unauthenticated(error: e.toString()));
          }
        },
        signInRequested: (email, password) async {
          emit(const AuthState.loading());
          try {
            final user = await _authRepository.signInWithEmailAndPassword(email, password);
            if (user != null) {
              emit(AuthState.authenticated(user: user));
            } else {
              emit(const AuthState.unauthenticated(error: 'Invalid credentials'));
            }
          } catch (e) {
            emit(AuthState.unauthenticated(error: e.toString()));
          }
        },
        signUpRequested: (email, password, name) async {
          emit(const AuthState.loading());
          try {
            final user = await _authRepository.signUpWithEmailAndPassword(email, password, name);
            if (user != null) {
              emit(AuthState.authenticated(user: user));
            } else {
              emit(const AuthState.unauthenticated(error: 'Signup failed'));
            }
          } catch (e) {
            emit(AuthState.unauthenticated(error: e.toString()));
          }
        },
        signOutRequested: () async {
          emit(const AuthState.loading());
          await _authRepository.signOut();
          emit(const AuthState.unauthenticated());
        },
      );
    });
  }
}
