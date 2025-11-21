import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:emergen_sync/src/features/authentication/data/auth_repository.dart';
import 'package:emergen_sync/src/features/authentication/data/auth_exceptions.dart';
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
    on<AuthLoginRequested>(_onLoginRequested);
    on<AuthSignUpRequested>(_onSignUpRequested);

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
      if (role != null) {
        emit(AuthState.authenticated(user: event.user!, role: role));
      } else {
        emit(const AuthState.unauthenticated());
      }
    }
  }

  void _onLogoutRequested(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) {
    _authRepository.signOut();
  }

  Future<void> _onLoginRequested(
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    try {
      await _authRepository.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
    } on LogInWithEmailAndPasswordFailure catch (e) {
      emit(AuthState.error(e.message));
    }
  }

  Future<void> _onSignUpRequested(
    AuthSignUpRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    try {
      await _authRepository.signUp(
        email: event.email,
        password: event.password,
      );
    } on SignUpWithEmailAndPasswordFailure catch (e) {
      emit(AuthState.error(e.message));
    }
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }
}
