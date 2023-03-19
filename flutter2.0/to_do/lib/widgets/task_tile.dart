import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool checkBoxVal;
  final String taskName;
  final VoidCallback checkBoxCallback;
  const TaskTile({
    required this.checkBoxVal,
    required this.taskName,
    required this.checkBoxCallback,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskName,
        style: TextStyle(
            decoration: checkBoxVal ? TextDecoration.lineThrough : null),
      ),
      leading: Icon(
        Icons.task_alt,
        color: Colors.green[400],
      ),
      trailing: Checkbox(
        activeColor: Colors.green[400],
        value: checkBoxVal,
        onChanged: (val) {
          checkBoxCallback();
        },
      ),
    );
  }
}
