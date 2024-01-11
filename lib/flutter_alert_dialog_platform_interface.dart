import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_alert_dialog_method_channel.dart';

abstract class FlutterAlertDialogPlatform extends PlatformInterface {
  /// Constructs a FlutterAlertDialogPlatform.
  FlutterAlertDialogPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterAlertDialogPlatform _instance = MethodChannelFlutterAlertDialog();

  /// The default instance of [FlutterAlertDialogPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterAlertDialog].
  static FlutterAlertDialogPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterAlertDialogPlatform] when
  /// they register themselves.
  static set instance(FlutterAlertDialogPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
