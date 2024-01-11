#include "include/flutter_alert_dialog/flutter_alert_dialog_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "flutter_alert_dialog_plugin.h"

void FlutterAlertDialogPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  flutter_alert_dialog::FlutterAlertDialogPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
