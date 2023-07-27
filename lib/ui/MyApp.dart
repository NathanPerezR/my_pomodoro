import 'package:flutter/material.dart';
import 'package:my_pomodoro/pages/Home.dart';
import 'Themes.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build (BuildContext context) {
    return MaterialApp(
      theme: CommonThemes().defaultTheme,
      home: const Home()
    );
  }
}
