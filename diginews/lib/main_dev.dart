import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';

void main() {
  const appName = String.fromEnvironment(
    'APP_NAME',
    defaultValue: 'DEV - Mita',
  );

  runApp(const MyApp(appName: appName, isDev: true));
}

class MyApp extends StatelessWidget {
  final String appName;
  final bool isDev;

  const MyApp({super.key, required this.appName, required this.isDev});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: isDev ? AppTheme.devTheme : AppTheme.prodTheme,
      home: Scaffold(
        appBar: AppBar(title: Text(appName)),
        body: const Center(child: Text('Setup Flavor DEV Berhasil!')),
      ),
    );
  }
}
