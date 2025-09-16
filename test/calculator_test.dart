import 'package:flutter_test/flutter_test.dart';
import 'package:learn_testing/calculator.dart';

void main() {
  group('Calculator', () {
    test('add method should return the sum of two members', () {
      final calculator = Calculator();

      final result = calculator.add(2, 4);

      expect(result, 6);
    });

    test(
      'substract method should return the difference between two numbers',
      () {
        final calculator = Calculator();

        final result = calculator.substract(5, 1);

        expect(result, 4);
      },
    );
  });
}
