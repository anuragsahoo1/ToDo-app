import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:todoapp/screen/home.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('mybox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      // ignore: prefer_const_constructors
      // theme: ThemeData(primarySwatch: Color.fromARGB(255, 225, 134, 248)),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
