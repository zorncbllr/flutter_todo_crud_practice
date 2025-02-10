import 'package:flutter/material.dart';
import 'package:flutter_todo_crud_practice/pages/home.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main(List<String> args) async {
  await Hive.initFlutter();

  var box = await Hive.openBox('mybox');

  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
