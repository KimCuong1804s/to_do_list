import 'package:to_do_list/business/task_creator.dart';
import '../data/models/task.dart';
import '../data/task_storage.dart';

abstract class TaskAction {
  Future<void> addTask(String content);
  Future<void> deleteTask(String id);
  Future<void> updateTaskContent(Task task);
  Future<void> updateTaskState(Task task, dynamic value);
  void deleteTaskFromList(String id, List<Task> listTask);
  void updateAnExistingTask(Task task, List<Task> listTask);
}

class TaskActionImpl implements TaskAction {

  TaskStorage taskStorage = TaskStorageImpl();

  @override
  Future<void> addTask(String content) async {
    final newTask = taskCreator(content);
    final taskListData = await taskStorage.getListTaskStorage();
    taskListData.add(newTask);
    await taskStorage.saveListTaskToLocalStored(taskListData);
  }

  @override
  Future<void> deleteTask(String id) async {
    final taskListData = await taskStorage.getListTaskStorage();
    deleteTaskFromList(id, taskListData);
    await taskStorage.saveListTaskToLocalStored(taskListData);
  }

  @override
  Future<void> updateTaskContent(Task task) async {
    var taskListData = await taskStorage.getListTaskStorage();
    updateAnExistingTask(task, taskListData);
    await taskStorage.saveListTaskToLocalStored(taskListData);
  }

  @override
  Future<void> updateTaskState(Task task, dynamic value) async {
    if (value != null) {
      task.isDone = value;
      final taskListData = await taskStorage.getListTaskStorage();
      updateAnExistingTask(task, taskListData);
      await taskStorage.saveListTaskToLocalStored(taskListData);
    }
  }

  @override
  void deleteTaskFromList(String id, List<Task> listTask) {
    for(int i = 0; i < listTask.length; i++) {
      if (listTask[i].id == id) {
        listTask.removeAt(i);
        break;
      }
    }
  }

  @override
  void updateAnExistingTask(Task task, List<Task> listTask) {
    for(int i = 0; i < listTask.length; i++) {
      if (listTask[i].id == task.id) {
        listTask[i] = task;
        break;
      }
    }
  }
}