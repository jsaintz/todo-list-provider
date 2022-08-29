import 'package:todo_list_provider/app/models/task_model.dart';
import 'package:todo_list_provider/app/models/week_task_model.dart';
import 'package:todo_list_provider/app/repositories/tasks/tasks_repository.dart';

import './tasks_service.dart';

class TasksServiceImpl implements TasksService {
  final TasksRepository _taskRepository;
  TasksServiceImpl({required TasksRepository taskRepository}) : _taskRepository = taskRepository;

  @override
  Future<void> save(DateTime date, String description) => _taskRepository.save(date, description);

  @override
  Future<List<TaskModel>> getToday() => _taskRepository.findByPeriod(DateTime.now(), DateTime.now());
  @override
  Future<List<TaskModel>> getTomorrow() {
    DateTime tomorrow = DateTime.now().add(const Duration(days: 1));
    return _taskRepository.findByPeriod(tomorrow, tomorrow);
  }

  @override
  Future<WeekTaskModel> getWeek() async {
    DateTime today = DateTime.now();
    DateTime startFilter = DateTime(today.year, today.month, today.day, 0, 0, 0);
    DateTime endFilter;

    if (startFilter.weekday != DateTime.monday) {
      startFilter = startFilter.subtract(Duration(days: (startFilter.weekday - 1)));
    }
    endFilter = startFilter.add(const Duration(days: 7));
    List<TaskModel> tasks = await _taskRepository.findByPeriod(startFilter, endFilter);
    return WeekTaskModel(startDate: startFilter, endDate: endFilter, tasks: tasks);
  }
}
