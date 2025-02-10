import 'package:flutter/material.dart';
import 'package:flutter_todo_crud_practice/utils/dialog_box.dart';
import 'package:flutter_todo_crud_practice/utils/todo.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<dynamic> todoList = [
    ['Learn mobile development', false],
    ['Learn rust-solana development', true],
  ];

  TextEditingController controller = TextEditingController();

  void changeTodoState(int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  void deleteTodo(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  void createNewTodo() {
    showDialog(
      context: context,
      builder: (context) {
        void addTodo() {
          setState(() {
            todoList.add([controller.text, false]);
            controller.clear();
            Navigator.of(context).pop();
          });
        }

        void onCancel() {
          controller.clear();
          Navigator.of(context).pop();
        }

        return DialogBox(
          controller: controller,
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
        foregroundColor: Colors.white60,
      ),

      // todo list
      body: Expanded(
        child: ListView.builder(
          padding: EdgeInsets.all(12),
          itemCount: todoList.length,
          itemBuilder: (context, index) => Todo(
            task: todoList[index][0],
            completed: todoList[index][1],
            onStateChanged: (_) => changeTodoState(index),
            onDelete: (_) => deleteTodo(index),
          ),
        ),
      ),

      // add button
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrangeAccent,
        onPressed: createNewTodo,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
