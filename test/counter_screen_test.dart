import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learn_testing/screens/counter_screen.dart';

void main() {
  group('Counter Function', () {
    testWidgets(
      'A counter should be zero at initial and when user tap it will be one',
      (WidgetTester tester) async {
        // arrange
        await tester.pumpWidget(CounterScreen());

        expect(find.text('0'), findsOne);
        expect(find.text('1'), findsNothing);

        await tester.tap(find.byIcon(Icons.add));

        await tester.pump();

        expect(find.text('1'), findsOne);
        expect(find.text('0'), findsNothing);
      },
    );
  });
}
