import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/core/ui/theme_extensions.dart';
import 'package:todo_list_provider/app/models/task_filter_enum.dart';
import 'package:todo_list_provider/app/models/task_model.dart';
import 'package:todo_list_provider/app/modules/home/home_controller.dart';
import 'package:todo_list_provider/app/modules/home/widgets/task.dart';

class HomeTasks extends StatelessWidget {
  const HomeTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Selector<HomeController, String>(
            selector: (context, controller) => controller.filterSelected.description,
            builder: (context, value, child) => Text(
              'TASK\'S $value',
              style: context.titleStyle,
            ),
          ),
          Column(
            children: context
                .select<HomeController, List<TaskModel>>((controller) => controller.filteredTasks)
                .map((e) => Task(
                      taskModel: e,
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
