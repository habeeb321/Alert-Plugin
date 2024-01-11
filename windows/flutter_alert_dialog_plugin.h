#ifndef FLUTTER_PLUGIN_FLUTTER_ALERT_DIALOG_PLUGIN_H_
#define FLUTTER_PLUGIN_FLUTTER_ALERT_DIALOG_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace flutter_alert_dialog {

class FlutterAlertDialogPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  FlutterAlertDialogPlugin();

  virtual ~FlutterAlertDialogPlugin();

  // Disallow copy and assign.
  FlutterAlertDialogPlugin(const FlutterAlertDialogPlugin&) = delete;
  FlutterAlertDialogPlugin& operator=(const FlutterAlertDialogPlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace flutter_alert_dialog

#endif  // FLUTTER_PLUGIN_FLUTTER_ALERT_DIALOG_PLUGIN_H_
