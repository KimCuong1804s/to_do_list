import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../data/models/task.dart';

class ListTaskWidget extends StatelessWidget {

  ListTaskWidget(
      {required this.listTask,
      required this.updateTaskContent,
      required this.updateTaskState,
      required this.deleteTask});

  List<Task> listTask;
  Function(Task task) updateTaskContent;
  Function(Task task, dynamic value) updateTaskState;
  Function(Task task) deleteTask;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Container(
            height: 1, color: const Color(0xffd2d2d2).withAlpha(80));
      },
      itemBuilder: (BuildContext context, int index) {
        var task = listTask[index];
        return Slidable(
          endActionPane: ActionPane(
            motion: const DrawerMotion(),
            extentRatio: 0.3,
            children: [
              SlidableAction(
                  backgroundColor: const Color(0xFF92AAB5),
                  foregroundColor: Colors.white,
                  icon: Icons.edit,
                  onPressed: (context) {
                    updateTaskContent(task);
                  }),
              SlidableAction(
                  backgroundColor: const Color(0xFF92AAB5),
                  foregroundColor: Colors.white,
                  icon: Icons.delete_outline,
                  onPressed: (context) {
                    deleteTask(task);
                  })
            ],
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 24, right: 24, top: 10, bottom: 10),
            child: Row(
              children: [
                Checkbox(
                    value: task.isDone,
                    shape: const CircleBorder(),
                    onChanged: (value) async {
                      updateTaskState(task, value);
                    }),
                Text(listTask[index].content, maxLines: null),
              ],
            ),
          ),
        );
      },
      itemCount: listTask.length,
    );
    ;
  }
}
