part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.authStatusChanged(User? user) = _AuthStatusChanged;
  const factory AuthEvent.logoutRequested() = AuthLogoutRequested;
  const factory AuthEvent.loginRequested({
    required String email,
    required String password,
  }) = AuthLoginRequested;
  const factory AuthEvent.signUpRequested({
    required String email,
    required String password,
  }) = AuthSignUpRequested;
}
