import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoList extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
  ToDoList(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.deleteFunction});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Color.fromARGB(255, 216, 60, 248),
              borderRadius: BorderRadius.circular(14),
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(24),
          
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 123, 79, 234),
            borderRadius:BorderRadius.all(Radius.circular(14)),
          ),
          child: Row(
            children: [
              // checkbox
              Checkbox(
                
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: const Color.fromARGB(255, 235, 4, 4),
              ),

              // task name
              Text(
                taskName,
                style: TextStyle(
                  color: const Color.fromARGB(255, 214, 141, 16),
                  decoration: taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
