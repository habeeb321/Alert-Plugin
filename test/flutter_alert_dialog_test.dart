import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_alert_dialog/flutter_alert_dialog.dart';
import 'package:flutter_alert_dialog/flutter_alert_dialog_platform_interface.dart';
import 'package:flutter_alert_dialog/flutter_alert_dialog_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterAlertDialogPlatform
    with MockPlatformInterfaceMixin
    implements FlutterAlertDialogPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterAlertDialogPlatform initialPlatform = FlutterAlertDialogPlatform.instance;

  test('$MethodChannelFlutterAlertDialog is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterAlertDialog>());
  });

  test('getPlatformVersion', () async {
    FlutterAlertDialog flutterAlertDialogPlugin = FlutterAlertDialog();
    MockFlutterAlertDialogPlatform fakePlatform = MockFlutterAlertDialogPlatform();
    FlutterAlertDialogPlatform.instance = fakePlatform;

    expect(await flutterAlertDialogPlugin.getPlatformVersion(), '42');
  });
}
