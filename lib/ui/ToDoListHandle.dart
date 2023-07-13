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
      final List<Map<String, String>> listOfColumns = [
    {"Name": "AAAAAA", "Number": "1", "State": "Yes"},
    {"Name": "BBBBBB", "Number": "2", "State": "no"},
    {"Name": "CCCCCC", "Number": "3", "State": "Yes"}
  ];
  
    return DefaultTextStyle(
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20.0,
      ),
      child: Stack(
          children: [
            Container(
              height: 350,
              width: 300,     
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child:  DataTable(
        columns: [
          DataColumn(label: Text('Patch')),
          DataColumn(label: Text('Version')),
          DataColumn(label: Text('Ready')),
        ],
        rows:
            listOfColumns // Loops through dataColumnText, each iteration assigning the value to element
                .map(
                  ((element) => DataRow(
                        cells: <DataCell>[
                          DataCell(Text(element["Name"]!)), //Extracting from Map element the value
                          DataCell(Text(element["Number"]!)),
                          DataCell(Text(element["State"]!)),
                        ],
                      )),
                )
                .toList(),
      ),
              ), 
            
          ],
        ),
    );
  }

}