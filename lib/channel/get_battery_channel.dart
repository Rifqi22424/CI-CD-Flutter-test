import 'package:flutter/services.dart';

Future<int> getBatteryLevel() async {
  const channel = MethodChannel('samples.flutter.dev/battery');
  return await channel.invokeMethod<int>('getBatteryLevel') ?? -1;
}
