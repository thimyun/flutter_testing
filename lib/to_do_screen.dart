import 'package:flutter/material.dart';

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<String> _todoList = [];
  Map<int, bool> _todoListMap = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
      ),
      body: ListView.builder(
        itemCount: _todoList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Checkbox(
              value: _todoListMap[index] ?? false,
              fillColor: _todoListMap[index] == false ? MaterialStateProperty.all(Colors.grey) : MaterialStateProperty.all(Colors.green),
              onChanged: (value) {
                setState(() {
                  _todoListMap[index] = value!;
                });
              },
            ),
            title: Text(_todoList[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addTodoItem();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _addTodoItem() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newTodo = '';

        return AlertDialog(
          title: Text('Add New To-Do'),
          content: TextField(
            onChanged: (value) {
              newTodo = value;
            },
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                setState(() {
                  _todoList.add(newTodo);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
