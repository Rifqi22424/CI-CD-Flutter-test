import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/user.dart';

abstract class UserEvent {}

class LoadUsers extends UserEvent {}

class EditUser extends UserEvent {
  final int id;
  final String newName;

  EditUser({required this.id, required this.newName});
}

class RemoveUser extends UserEvent {
  final int id;

  RemoveUser({required this.id});
}

abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final List<User> users;
  UserLoaded(this.users);

  @override
  String toString() => 'UserLoaded(${users.length} users)';
}

class UserError extends UserState {
  final String message;

  UserError(this.message);
}

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<LoadUsers>((event, emit) async {
      emit(UserLoading());
      await Future.delayed(const Duration(milliseconds: 300));
      emit(
        UserLoaded([
          User(id: 1, name: "Rifqi"),
          User(id: 2, name: "Ahmad"),
          User(id: 3, name: "Asep"),
        ]),
      );
    });

    on<EditUser>((event, emit) async {
      final users = (state as UserLoaded).users;
      if (state is UserLoaded) {
        emit(UserLoading());
        await Future.delayed(const Duration(milliseconds: 300));
        final updatedUsers = users
            .map(
              (user) => user.id == event.id
                  ? user.copyWith(name: event.newName)
                  : user,
            )
            .toList();
        emit(UserLoaded(updatedUsers));
      }
    });

    on<RemoveUser>((event, emit) async {
      final users = (state as UserLoaded).users;
      if (state is UserLoaded) {
        emit(UserLoading());
        await Future.delayed(const Duration(milliseconds: 300));
        final updatedUsers = users
            .where((user) => user.id != event.id)
            .toList();
        emit(UserLoaded(updatedUsers));
      }
    });
  }
}
