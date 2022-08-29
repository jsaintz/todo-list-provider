class TaskModel {
  final int id;
  final String? description;
  final DateTime? dateTime;
  final bool done;

  TaskModel({
    required this.id,
    required this.description,
    required this.dateTime,
    required this.done,
  });

  factory TaskModel.loadFromDB(Map<String, dynamic> task) {
    return TaskModel(
      id: task['id'],
      description: task['descryption'],
      dateTime: DateTime.tryParse(task['date_time']),
      done: task['done'] == 1,
    );
  }
}
