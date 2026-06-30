import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'main_dev.dart'; // Import MyApp dari file sebelah agar rapi

void main() {
  const appName = String.fromEnvironment(
    'APP_NAME',
    defaultValue: 'UTD - 20123051',
  );

  runApp(const MyApp(appName: appName, isDev: false));
}
