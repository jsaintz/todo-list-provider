import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/core/ui/theme_extensions.dart';
import 'package:todo_list_provider/app/modules/tasks/task_create_controller.dart';

class CalendarButton extends StatefulWidget {
  const CalendarButton({Key? key}) : super(key: key);

  @override
  State<CalendarButton> createState() => _CalendarButtonState();
}

class _CalendarButtonState extends State<CalendarButton> {
  final deteFormat = DateFormat('dd/MM/y');
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await selectedCurrentyDate(context);
      },
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(30)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.today, color: Colors.grey),
            const SizedBox(height: 10),
            Selector<TaskCreateController, DateTime?>(
              selector: (context, controller) => controller.selectedDate,
              builder: (context, value, child) {
                return isValidSelectedDate(selectedDate, context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Text isValidSelectedDate(DateTime? selectedDate, BuildContext context) {
    if (selectedDate != null) {
      return Text(deteFormat.format(selectedDate), style: context.titleStyle);
    } else {
      return Text('SELECIONE UMA DATA', style: context.titleStyle);
    }
  }

  Future<void> selectedCurrentyDate(BuildContext context) async {
    DateTime lastDate = DateTime.now();
    DateTime currentDate = lastDate.add(const Duration(days: 10 * 365));

    selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: currentDate,
    );

    // ignore: use_build_context_synchronously
    context.read<TaskCreateController>().selectedDate = selectedDate;
  }
}
