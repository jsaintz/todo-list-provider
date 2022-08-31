// ignore_for_file: public_member_api_docs, sort_constructors_first
class TaskModel {
  final int id;
  final String description;
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

  TaskModel copyWith({
    int? id,
    String? description,
    DateTime? dateTime,
    bool? done,
  }) {
    return TaskModel(
      id: id ?? this.id,
      description: description ?? this.description,
      dateTime: dateTime ?? this.dateTime,
      done: done ?? this.done,
    );
  }
}
