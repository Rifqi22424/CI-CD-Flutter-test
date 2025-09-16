import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learn_testing/channel/get_battery_channel.dart';

void main() {
  const channel = MethodChannel('samples.flutter.dev/battery');

  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Get Battery level mocks', (WidgetTester tester) async {
    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(channel, (
      MethodCall call,
    ) async {
      if (call.method == 'getBatteryLevel') {
        return 42;
      }
      return null;
    });

    final result = await getBatteryLevel();

    expect(result, 42);
  });
}
