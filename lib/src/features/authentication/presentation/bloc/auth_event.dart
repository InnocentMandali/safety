
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
abstract class AuthEvent with _$AuthEvent {
  const factory AuthEvent.appStarted() = _AppStarted;
  const factory AuthEvent.signInRequested(String email, String password) =
      _SignInRequested;
  const factory AuthEvent.signUpRequested(
      String email, String password, String name) = _SignUpRequested;
  const factory AuthEvent.signOutRequested() = _SignOutRequested;
}
