import 'package:flutter/material.dart';
import 'package:flutter_todo_crud_practice/utils/todo.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Todo> todoList = [
    Todo(task: 'Learn mobile development', status: false),
    Todo(task: 'Learn web development', status: false),
    Todo(task: 'Learn blockchain development', status: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Todo App'),
        backgroundColor: Colors.white10,
        foregroundColor: Colors.white,
      ),

      // body
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) => todoList[index],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            todoList.removeWhere((todo) => todo.status);
          });
        },
        child: Icon(Icons.delete),
      ),
    );
  }
}
