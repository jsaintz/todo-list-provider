import 'package:todo_list_provider/app/core/database/sqlite_connection_factory.dart';

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
}
