import 'package:todo_list_provider/app/repositories/tasks/tasks_repository.dart';

import './tasks_service.dart';

class TasksServiceImpl implements TasksService {
  final TasksRepository _taskRepository;
  TasksServiceImpl({required TasksRepository taskRepository}) : _taskRepository = taskRepository;

  @override
  Future<void> save(DateTime date, String description) => _taskRepository.save(date, description);
}
