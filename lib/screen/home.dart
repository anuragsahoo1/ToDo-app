import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/database/database.dart';

import '../constraints/todolist.dart';
import '../constraints/dialog.dart';

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  // const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _myBox = Hive.box('mybox');
  final _controller = TextEditingController();
  DataDatabase db = DataDatabase();
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateData();
  }

  void onSaveHandler() {
    setState(() {
      db.todoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  void changeList() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onCancel: () => Navigator.of(context).pop(),
          onSave: onSaveHandler,
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      db.createList();
    } else {
      db.loadData();
    }
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        
        title: const Text("ToDo",style: TextStyle(color: Colors.lightGreenAccent),),
        centerTitle: true,
         leading: IconButton(onPressed: (){}, icon: IconButton(icon: const Icon(Icons.menu),
        onPressed: (){},)),
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 123, 79, 234),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 160, 78, 112),
        onPressed: changeList,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return ToDoList(
            taskName: db.todoList[index][0],
            taskCompleted: db.todoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (p0) => deleteTask(index),
          );
        },
      ),
    );
  }
}
