import 'package:flutter/material.dart';
import 'package:flutter_todo_crud_practice/utils/input-bar.dart';
import 'package:flutter_todo_crud_practice/utils/todo.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Todo> todoList = [
    Todo(task: 'Learn web development.'),
    Todo(task: 'Learn mobile development with flutter.'),
  ];

  TextEditingController controller = TextEditingController();

  void createNewTodo() {
    setState(() {
      todoList.add(Todo(task: controller.text));
      controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        title: Text('Todo App'),
        backgroundColor: Colors.white12,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // todo list
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: todoList.length,
              itemBuilder: (context, index) => todoList[index],
            ),
          ),

          // textfield bar
          InputBar(
            controller: controller,
            createNewTodo: createNewTodo,
          )
        ],
      ),
    );
  }
}
