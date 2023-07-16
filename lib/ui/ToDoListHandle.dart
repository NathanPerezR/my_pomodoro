import 'package:flutter/material.dart';

class ToDoListHandle extends StatefulWidget {
  const ToDoListHandle({Key? key}) : super(key: key);

  @override
  _ToDoListHandleState createState() => _ToDoListHandleState();
}

class _ToDoListHandleState extends State<ToDoListHandle> {
  final List<Map<String, String>> listOfColumns = [];

  final TextStyle _textStyle =  const TextStyle(color: Colors.white);

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
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel', style: TextStyle(color: Colors.black)),
            ),
            TextButton(
              onPressed: () {
                addListItem(newTaskName);
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Add', style: TextStyle(color: Colors.black)),
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
            color: const Color.fromARGB(255, 0, 0, 0),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.white),
            child: DataTable(
              columns: [
                DataColumn(label: Text('Task Name', style: _textStyle)),
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
                              color: Colors.white,
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
        ),
        Positioned(
          bottom: 302,
          right: 24,
          child: FloatingActionButton(
            onPressed: _showAddTaskDialog, // Call the dialog function
            mini: true,
            backgroundColor: Colors.black,
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
