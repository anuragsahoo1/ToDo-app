import 'package:flutter/material.dart';
import 'package:todoapp/constraints/button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel
  
  });
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue,
      content: Container(
        height: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          TextField(
            controller: controller,
            decoration: const InputDecoration(border: OutlineInputBorder(),
            hintText: "Add a new task"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Button(text: "Save", onPressed: onSave),
              const SizedBox(width: 6),
              Button(text: "Cancel", onPressed: onCancel)
            ],
          ),
        ],),
      ),
    );
  }
}
