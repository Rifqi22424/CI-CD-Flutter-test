import 'package:flutter_test/flutter_test.dart';
import 'package:learn_testing/email_validator.dart';

void main() {
  group('Email Validator', () {
    // validator should return false if empty
    test('validator should return false if empty', () {
      // arrange
      // act
      final result = EmailValidator.isValid('');
      // assert
      expect(result, isFalse);
    });
    // validator should return false if there's no '@' symbol
    test('validator should return false if there\'s no \'@\' symbol', () {
      final result = EmailValidator.isValid('rifqimuzakki.com');

      expect(result, isFalse);
    });
    // validator should return true if not empty and include '@' symbol
    test(
      'validator should return true if not empty and include \'@\' symbol',
      () {
        final result = EmailValidator.isValid('rifqimuzakki45@gmail.com');

        expect(result, isTrue);
      },
    );
  });
}
