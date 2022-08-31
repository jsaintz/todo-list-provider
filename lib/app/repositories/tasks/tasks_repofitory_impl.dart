import 'package:todo_list_provider/app/core/database/sqlite_connection_factory.dart';
import 'package:todo_list_provider/app/models/task_model.dart';

import 'tasks_repository.dart';

class TasksRepositoryImpl implements TasksRepository {
  late final SqliteConnectionFactory _sqliteConnectionFactory;

  TasksRepositoryImpl({
    required SqliteConnectionFactory sqliteConnectionFactory,
  }) : _sqliteConnectionFactory = sqliteConnectionFactory;

  @override
  Future<void> save(DateTime date, String description) async {
    final conn = await _sqliteConnectionFactory.openConnetion();
    await conn.insert('todo', {
      'id': null,
      'descryption': description,
      'date_time': date.toIso8601String(),
      'done': 0,
    });
  }

  @override
  Future<List<TaskModel>> findByPeriod(DateTime start, DateTime end) async {
    final startFilter = DateTime(start.year, start.month, start.day, 0, 0, 0);
    final endFilter = DateTime(start.year, start.month, start.day, 23, 59, 59);

    final conn = await _sqliteConnectionFactory.openConnetion();
    final result = await conn.rawQuery('''
      SELECT *
      FROM todo
      WHERE date_time
      BETWEEN ? AND ? ORDER BY  date_time''', [
      startFilter.toIso8601String(),
      endFilter.toIso8601String(),
    ]);

    return result.map((e) => TaskModel.loadFromDB(e)).toList();
  }

  @override
  Future<void> checkOrUncheckTask(TaskModel task) async {
    final conn = await _sqliteConnectionFactory.openConnetion();
    final done = task.done ? 1 : 0;
    await conn.rawUpdate('update todo set done = ? where id = ?', [done, task.id]);
  }
}
