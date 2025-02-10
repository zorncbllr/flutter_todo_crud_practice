import 'package:hive/hive.dart';

class TodoDatabase {
  List<dynamic> todoList = [];

  final _mybox = Hive.box('mybox');

  void createInitialData() {
    todoList = [
      ['Learn rust-solana development.', false],
      ['Learn mobile development.', false],
    ];
  }

  void loadData() {
    todoList = _mybox.get('TODOLIST');
  }

  void updateDatase() {
    _mybox.put("TODOLIST", todoList);
  }
}
