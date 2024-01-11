import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:popup_alert/flutter_alert_dialog_method_channel.dart';

void main() {
  MethodChannelFlutterAlertDialog platform = MethodChannelFlutterAlertDialog();
  const MethodChannel channel = MethodChannel('flutter_alert_dialog');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
