import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learn_testing/bloc/user_bloc.dart';
import 'package:learn_testing/model/user.dart';

void main() {
  group('User Bloc', () {
    blocTest(
      'emits [userLoading, userLoaded] when loadUsers is added',
      build: () => UserBloc(),
      act: (bloc) => bloc.add(LoadUsers()),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        isA<UserLoading>(),
        isA<UserLoaded>().having((s) => s.users.length, 'users length', 3),
      ],
    );

    blocTest(
      'emits updated users with EditUser is added',
      build: () => UserBloc(),
      seed: () =>
          UserLoaded([User(id: 1, name: "Asep"), User(id: 2, name: "Basan")]),
      act: (bloc) => bloc.add(EditUser(id: 1, newName: "Cecep")),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        isA<UserLoading>(),
        isA<UserLoaded>().having(
          (s) => s.users[0].name,
          "edit the name",
          "Cecep",
        ),
      ],
    );

    blocTest(
      'emits remove users with RemoveUser is added',
      build: () => UserBloc(),
      seed: () =>
          UserLoaded([User(id: 1, name: "Rifqi"), User(id: 2, name: "Asep")]),
      wait: const Duration(seconds: 1),
      act: (bloc) => bloc.add(RemoveUser(id: 1)),
      expect: () => [
        isA<UserLoading>(),
        isA<UserLoaded>().having(
          (s) => s.users.length,
          "length of the user would be 1",
          1,
        ),
      ],
    );
  });
}
