import 'package:hive_flutter/hive_flutter.dart';

class DataDatabase {
  List todoList = [];
  final _myBox = Hive.box('mybox');
  void createList() {
    todoList = [
      ["Start working", false]
    ];
  }

  void loadData() {
    todoList = _myBox.get("TODOLIST");
  }

  void updateData() {
    _myBox.put("TODOLIST", todoList);
  }
}
