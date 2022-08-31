import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/models/task_model.dart';
import 'package:todo_list_provider/app/modules/home/home_controller.dart';

class Task extends StatelessWidget {
  final TaskModel taskModel;
  final dateFortmat = DateFormat('dd/MM/y');
  Task({Key? key, required this.taskModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow(color: Colors.grey)],
      ),
      margin: const EdgeInsets.symmetric(vertical: 3),
      child: IntrinsicHeight(
        child: ListTile(
          contentPadding: const EdgeInsets.all(8),
          leading: Checkbox(
            value: taskModel.done,
            onChanged: (value) => context.read<HomeController>().checkOrUncheckTask(taskModel),
          ),
          title: Text(
            taskModel.description,
            style: TextStyle(
              decoration: taskModel.done ? TextDecoration.lineThrough : null,
            ),
          ),
          subtitle: Text(
            dateFortmat.format(taskModel.dateTime as DateTime),
            style: TextStyle(
              decoration: taskModel.done ? TextDecoration.lineThrough : null,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(width: 1),
          ),
        ),
      ),
    );
  }
}
