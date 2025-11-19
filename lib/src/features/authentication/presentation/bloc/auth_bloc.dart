import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:emergen_sync/src/features/authentication/data/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  StreamSubscription<User?>? _userSubscription;

  AuthBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const AuthState.unknown()) {
    on<_AuthStatusChanged>(_onAuthStatusChanged);
    on<AuthLogoutRequested>(_onLogoutRequested);

    _userSubscription = _authRepository.authStateChanges.listen(
      (user) => add(AuthEvent.authStatusChanged(user)),
    );
  }

  Future<void> _onAuthStatusChanged(
    _AuthStatusChanged event,
    Emitter<AuthState> emit,
  ) async {
    if (event.user == null) {
      emit(const AuthState.unauthenticated());
    } else {
      final role = await _authRepository.getRole();
      emit(AuthState.authenticated(user: event.user!, role: role));
    }
  }

  void _onLogoutRequested(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) {
    _authRepository.signOut();
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }
}
