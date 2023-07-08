import 'package:flutter/material.dart';
import 'package:my_pomodoro/pages/Home.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build (BuildContext context) {
    return const MaterialApp(
      home: Home()
    );
  }
}
