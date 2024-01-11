import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_alert_dialog_platform_interface.dart';

/// An implementation of [FlutterAlertDialogPlatform] that uses method channels.
class MethodChannelFlutterAlertDialog extends FlutterAlertDialogPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  static const methodChannel = MethodChannel('flutter_alert_dialog');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  static get showAlertDialog async {
    await methodChannel.invokeMethod('showAlertDialog');
  }
}
