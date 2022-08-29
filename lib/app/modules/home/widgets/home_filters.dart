import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/core/ui/theme_extensions.dart';
import 'package:todo_list_provider/app/models/task_filter_enum.dart';
import 'package:todo_list_provider/app/models/total_tasks_model.dart';
import 'package:todo_list_provider/app/modules/home/home_controller.dart';
import 'package:todo_list_provider/app/modules/home/widgets/todo_card_filter.dart';

class HomeFilters extends StatelessWidget {
  const HomeFilters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('FILTROS', style: context.titleStyle),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              TodoCardFilter(
                label: 'HOJE',
                taskFilterEnum: TaskFilterEnum.today,
                totalTasksModel: TotalTasksModel(totalTasks: 8, totalTasksFinish: 5),
                selected: context.select<HomeController, TaskFilterEnum>((value) => value.filterSelected) ==
                    TaskFilterEnum.today,
              ),
              TodoCardFilter(
                label: 'AMANHÃ',
                taskFilterEnum: TaskFilterEnum.tomorrow,
                totalTasksModel: TotalTasksModel(totalTasks: 10, totalTasksFinish: 5),
                selected: context.select<HomeController, TaskFilterEnum>((value) => value.filterSelected) ==
                    TaskFilterEnum.tomorrow,
              ),
              TodoCardFilter(
                label: 'SEMANA',
                taskFilterEnum: TaskFilterEnum.week,
                totalTasksModel: TotalTasksModel(totalTasks: 10, totalTasksFinish: 5),
                selected: context.select<HomeController, TaskFilterEnum>((value) => value.filterSelected) ==
                    TaskFilterEnum.week,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
