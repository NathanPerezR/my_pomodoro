import 'package:flutter/material.dart';
import 'package:my_pomodoro/ui/DWidget.dart';
import 'package:my_pomodoro/ui/TimerHandle.dart';
import 'package:my_pomodoro/ui/ToDoListHandle.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const DWidget(),
      body: const Column(
        children: [
          SizedBox(height: 33),
          TimerHandle(),
          SizedBox(height: 0),
          ToDoListHandle(),
          Card(),
        ],
      ),
    );
    
  }
}
