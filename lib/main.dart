import 'dart:io';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'ui/MyApp.dart';

// Set Max screen size 
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  if (Platform.isWindows) {
    WindowManager.instance.setMinimumSize(const Size(390, 844));
    WindowManager.instance.setMaximumSize(const Size(390, 844));
  }
  runApp(MyApp());
}
