import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do_list/business/task_action.dart';
import 'package:to_do_list/presentation/update_task_page.dart';
import 'package:to_do_list/presentation/widgets/confirm_dialog.dart';
import 'package:to_do_list/presentation/widgets/list_task.dart';
import 'package:to_do_list/presentation/widgets/task_page_creator.dart';
import '../data/models/task.dart';
import '../data/task_storage.dart';

class TaskPage extends StatefulWidget {
  TaskPage(this.filter, {Key? key}) : super(key: key);
  bool? filter;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TaskPageState();
  }
}

class _TaskPageState extends State<TaskPage> {
  bool? filter;
  final TaskStorage _listTask = TaskStorageImpl();
  final TaskAction _taskAction = TaskActionImpl();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    filter = widget.filter;

    return Scaffold(
      appBar: AppBar(
        title: Text(TaskPageCreator.getTitle(filter)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          HapticFeedback.lightImpact();
          Navigator.pushNamed(context, "/updatetask").then((value) async {
            if (value != null) {
              final content = value as String;
              await _taskAction.addTask(content);
              setState(() {});
            }
          });
        },
        heroTag: widget.key,
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder<List<Task>>(
        future: _listTask.getListTaskStorage(filter: filter),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            final listTask = snapshot.data!;
            return ListTaskWidget(
                listTask: listTask,
                updateTaskContent: (task) async {
                  HapticFeedback.lightImpact();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          UpdateTaskPage(passedContent: task.content),
                    ),
                  ).then((value) async {
                    if (value != null) {
                      task.content = value as String;
                      await _taskAction.updateTaskContent(task);
                      setState(() {});
                    }
                  });
                },
                updateTaskState: (task, value) async {
                  HapticFeedback.lightImpact();
                  await _taskAction.updateTaskState(task, value);
                  setState(() {});
                },
                deleteTask: (task) async {
                  HapticFeedback.lightImpact();
                  showDialog(context: context, builder: (context) {
                    return ConfirmDialog('Are you sure?', 'Do you want to delete this task?', 'Yes', 'No', () async {
                      await _taskAction.deleteTask(task.id);
                      setState(() {});
                    }, () {
                      print("dissmiss alert");
                    });
                  });
                });
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Something went wrong"),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
