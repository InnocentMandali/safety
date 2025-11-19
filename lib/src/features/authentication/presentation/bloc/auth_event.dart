part of 'auth_bloc.dart';

@freezed
abstract class AuthEvent with _$AuthEvent {
  const factory AuthEvent.authStatusChanged(User? user) = _AuthStatusChanged;
  const factory AuthEvent.logoutRequested() = AuthLogoutRequested;
}
