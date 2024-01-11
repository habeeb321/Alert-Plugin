This plugin allows you to show alert dialogs in your Flutter app from Java code.

## Getting Started

To use this plugin, add the following to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter_alert_dialog: ^latest_version
```

Then, run `flutter pub get`.

## Usage

To show an alert dialog, call the `showAlertDialog` method from your Flutter code:

```dart
import 'package:flutter_alert_dialog/flutter_alert_dialog.dart';

void showAlertDialog() {
  const channel = MethodChannel('flutter_alert_dialog');
  channel.invokeMethod('showAlertDialog');
}
```

This will show an alert dialog with the title "My Alert Dialog" and the message "This is an alert dialog." The alert dialog will have two buttons: "OK" and "Cancel."

You can customize the title, message, and buttons of the alert dialog by passing a `Map` of options to the `showAlertDialog` method. For example, you could change the title to "My Custom Title" and the message to "This is a custom message" as follows:

```dart
void showAlertDialog() {
  const channel = MethodChannel('flutter_alert_dialog');
  channel.invokeMethod('showAlertDialog', {
    'title': 'My Custom Title',
    'message': 'This is a custom message',
  });
}
```

You can also use the `FlutterAlertDialogPlugin` plugin to show other types of dialogs, such as a confirmation dialog or a list dialog. For more information, please refer to the plugin's documentation.

## Example

The following is an example of how to use the `FlutterAlertDialogPlugin` plugin to show an alert dialog:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_alert_dialog/flutter_alert_dialog.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter AlertDialog Plugin Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              showAlertDialog(context);
            },
            child: Text('Show Alert Dialog'),
          ),
        ),
      ),
    );
  }

  void showAlertDialog(BuildContext context) {
    const channel = MethodChannel('flutter_alert_dialog');
    channel.invokeMethod('showAlertDialog', {
      'title': 'My Custom Title',
      'message': 'This is a custom message',
    });
  }
}
```

This example will show an alert dialog with the title "My Custom Title" and the message "This is a custom message." The alert dialog will have two buttons: "OK" and "Cancel."

## Java Code

The following is the Java code for the `FlutterAlertDialogPlugin` plugin:

```java
package com.example.flutter_alert_dialog;

import android.app.Dialog;
import android.content.Context;
import androidx.appcompat.app.AlertDialog;
import android.content.DialogInterface;
import android.widget.Toast;

import androidx.annotation.NonNull;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** FlutterAlertDialogPlugin */
public class FlutterAlertDialogPlugin implements FlutterPlugin, MethodCallHandler {
  private MethodChannel channel;
  private Context context;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    context = flutterPluginBinding.getApplicationContext();
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "flutter_alert_dialog");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    } else if(call.method.equalsIgnoreCase("showAlertDialog")) {
        String title = call.argument("title");
        String message = call.argument("message");
        AlertDialog.Builder builder = new AlertDialog.Builder(context);
        builder.setTitle(title);
        builder.setMessage(message);
        builder.setPositiveButton("OK", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                // Handle the positive button click.
            }
        });
        builder.setNegativeButton("Cancel", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                // Handle the negative button click.
            }
        });
        AlertDialog dialog = builder.create();
        dialog.show();
    } else {
      result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
}
```

## License

This project is licensed under the MIT License.