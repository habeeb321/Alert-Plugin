
import 'flutter_alert_dialog_platform_interface.dart';

class FlutterAlertDialog {
  Future<String?> getPlatformVersion() {
    return FlutterAlertDialogPlatform.instance.getPlatformVersion();
  }
}
