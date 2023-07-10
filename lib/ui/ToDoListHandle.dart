import 'package:flutter/material.dart';
import 'dart:async';

class ToDoListHandle extends StatefulWidget {
  const ToDoListHandle({Key? key}) : super(key: key);

  @override
  _ToDoListHandleState createState() => _ToDoListHandleState();
}

class _ToDoListHandleState extends State<ToDoListHandle> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      child: Stack(
        children: [
          Container(
            height: 350,
            width: 300,     
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: const Text('To-Do List', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

}