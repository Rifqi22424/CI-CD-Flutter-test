import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:learn_testing/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('full app integration test', () {
    testWidgets('test if the login feature is works', (
      WidgetTester tester,
    ) async {
      app.main();

      await tester.pumpAndSettle();

      final dummyUsn = "Rifqi";
      final dummyPw = "rifqi12345";

      final usnTextField = find.byKey(Key('username_text_field'));
      final pwTextField = find.byKey(Key('password_text_field'));

      await tester.enterText(usnTextField, dummyUsn);
      await tester.enterText(pwTextField, dummyPw);

      await tester.tap(find.byType(ElevatedButton));

      await tester.pumpAndSettle();

      expect(find.text(dummyUsn), findsOne);
      expect(find.text(dummyPw), findsOne);
    });
  });
}
