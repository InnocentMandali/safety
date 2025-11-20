part of 'users_bloc.dart';

@freezed
class UsersEvent with _$UsersEvent {
  const factory UsersEvent.loadUsers() = _LoadUsers;
  const factory UsersEvent.usersUpdated(List<UserModel> users) = _UsersUpdated;
}
