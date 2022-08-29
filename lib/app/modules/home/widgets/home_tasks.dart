import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/core/ui/theme_extensions.dart';
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
          Text(
            'TASK\'S DE HOJE',
            style: context.titleStyle,
          ),
          Column(
            children: const [
              Task(),
            ],
          ),
        ],
      ),
    );
  }
}
