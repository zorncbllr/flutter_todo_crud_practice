import 'package:flutter/material.dart';
import 'package:flutter_todo_crud_practice/data/database.dart';
import 'package:flutter_todo_crud_practice/utils/dialog_box.dart';
import 'package:flutter_todo_crud_practice/utils/todo.dart';
import 'package:hive/hive.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _mybox = Hive.box('mybox');

  TodoDatabase db = TodoDatabase();

  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    if (_mybox.get('TODOLIST') == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  void _changeTodoState(int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateDatase();
  }

  void _deleteTodo(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDatase();
  }

  void _createNewTodo() {
    showDialog(
      context: context,
      builder: (context) {
        void addTodo() {
          setState(() {
            db.todoList.add([_controller.text, false]);
            _controller.clear();
            Navigator.of(context).pop();
          });
          db.updateDatase();
        }

        void onCancel() {
          _controller.clear();
          Navigator.of(context).pop();
        }

        return DialogBox(
          controller: _controller,
          onSubmit: addTodo,
          onCancel: onCancel,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        title: Text('TO DO'),
        centerTitle: true,
        backgroundColor: Colors.white12,
        foregroundColor: Colors.white,
      ),

      // todo list
      body: Expanded(
        child: ListView.builder(
          padding: EdgeInsets.all(12),
          itemCount: db.todoList.length,
          itemBuilder: (context, index) => Todo(
            task: db.todoList[index][0],
            completed: db.todoList[index][1],
            onStateChanged: (_) => _changeTodoState(index),
            onDelete: (_) => _deleteTodo(index),
          ),
        ),
      ),

      // add button
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white12,
        onPressed: _createNewTodo,
        child: Icon(
          Icons.add,
          color: Colors.deepOrangeAccent,
        ),
      ),
    );
  }
}
