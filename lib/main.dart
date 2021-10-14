import 'package:flutter/material.dart';
import 'package:involucrate/theme/theme_config.dart';
import 'package:involucrate/views/splash/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeConfig.lightTheme,
      home: Splash(),
    );
  }
}
