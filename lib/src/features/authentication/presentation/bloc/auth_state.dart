part of 'auth_bloc.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.unknown() = _Unknown;
  const factory AuthState.authenticated({required User user, required String? role}) = _Authenticated;
  const factory AuthState.unauthenticated() = _Unauthenticated;
}
