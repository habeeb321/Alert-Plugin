import Flutter
import UIKit

public class FlutterAlertDialogPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_alert_dialog", binaryMessenger: registrar.messenger())
    let instance = FlutterAlertDialogPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
     if (call.method == "getPlatformVersion") {
           result("iOS " + UIDevice.current.systemVersion)
       }
       else if (call.method == "showAlertDialog") {
           DispatchQueue.main.async {
               let alert = UIAlertController(title: "Alert", message: "Hi, This is ios Alert Dialog", preferredStyle: .alert);
               alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
               UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil);
           }
       }
  }
}
