import 'package:flutter/material.dart';
import 'Themes.dart';

class ToDoListHandle extends StatefulWidget {
  const ToDoListHandle({Key? key}) : super(key: key);

  @override
  _ToDoListHandleState createState() => _ToDoListHandleState();
}

class _ToDoListHandleState extends State<ToDoListHandle> {
  final List<Map<String, String>> listOfColumns = [];

  final TextStyle _textStyle =  TextStyle(color: CommonThemes().defaultTheme.colorScheme.onSurfaceVariant);

  void addListItem(String taskName) {
    setState(() {
      listOfColumns.add({"Name": taskName});
    });
  }

  Future<void> _showAddTaskDialog() async {
    String newTaskName = '';

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Task'),
          content: TextField(
            onChanged: (value) {
              newTaskName = value;
            },
            decoration: const InputDecoration(
              hintText: 'Enter task name',
            ),
            autofocus: true,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); 
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                addListItem(newTaskName);
                Navigator.of(context).pop(); 
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 350,
          width: 300,
          decoration: BoxDecoration(
            color: CommonThemes().defaultTheme.colorScheme.surface,
            borderRadius: BorderRadius.circular(20.0),
          ),
            child: DataTable(
              columns: [
                DataColumn(label: Text('ToDo List', style: _textStyle)),
                DataColumn(label: Text('', style: _textStyle)),
              ],
              rows: listOfColumns
                  .map(
                    (element) => DataRow(
                      cells: <DataCell>[
                        DataCell(
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(element["Name"]!, style: _textStyle),
                          ),
                        ),
                        DataCell(
                          Container(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              color: CommonThemes().defaultTheme.colorScheme.onSurfaceVariant,
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                setState(() {
                                  listOfColumns.remove(element);
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),

        Positioned(
          bottom: 302,
          right: 24,
          child: FloatingActionButton(
            onPressed: _showAddTaskDialog,
            mini: true,
            backgroundColor: CommonThemes().defaultTheme.colorScheme.surface,
            child: Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
