import 'package:todo_list_provider/app/models/task_model.dart';

class WeekTaskModel {
  final DateTime startDate;
  final DateTime endDate;
  final List<TaskModel> tasks;

  WeekTaskModel({
    required this.startDate,
    required this.endDate,
    required this.tasks,
  });
}
