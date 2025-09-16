import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learn_testing/bloc/counter_bloc.dart';

void main() {
  group('Counter Bloc', () {
    blocTest<CounterBloc, int>(
      'when add increment it should be show 1',
      build: () => CounterBloc(),
      act: (bloc) => bloc.add(Increment()),
      expect: () => [1],
    );

    blocTest<CounterBloc, int>(
      'when add decrement it should eb show 0',
      build: () => CounterBloc(),
      act: (bloc) => bloc.add(Decrement()),
      expect: () => [-1],
    );

    blocTest<CounterBloc, int>(
      'when add increment and decrement it should return 1 and 0',
      build: () => CounterBloc(),
      act: (bloc) {
        bloc.add(Increment());
        bloc.add(Decrement());
      },
      expect: () => [1, 0],
    );
  });
}
