
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:emergen_sync/src/features/authentication/data/user_repository.dart';
import 'package:emergen_sync/src/features/models/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_event.dart';
part 'users_state.dart';
part 'users_bloc.freezed.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final UserRepository _userRepository;
  StreamSubscription<List<UserModel>>? _usersSubscription;

  UsersBloc(this._userRepository) : super(const UsersState.initial()) {
    on<_LoadUsers>((event, emit) async {
      emit(const UsersState.loading());
      try {
        _usersSubscription?.cancel();
        _usersSubscription = _userRepository.getUsers().listen((users) {
          add(UsersEvent.usersUpdated(users));
        });
      } catch (e) {
        emit(UsersState.error(e.toString()));
      }
    });

    on<_UsersUpdated>((event, emit) {
      emit(UsersState.loaded(event.users));
    });
  }

  @override
  Future<void> close() {
    _usersSubscription?.cancel();
    return super.close();
  }
}
