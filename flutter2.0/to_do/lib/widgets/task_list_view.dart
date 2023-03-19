import 'package:flutter/material.dart';
import './task_tile.dart';
import '../model/task.dart';

class TaskListView extends StatelessWidget {
  final List<Task> taskLists;
  final void Function(int) taskTileCallback;
  const TaskListView(
      {required this.taskLists, required this.taskTileCallback, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: taskLists.length,
      itemBuilder: (context, index) {
        return TaskTile(
            checkBoxVal: taskLists[index].isDone,
            taskName: taskLists[index].text,
            checkBoxCallback: () {
              taskTileCallback(index);
            });
      },
    );
  }
}
