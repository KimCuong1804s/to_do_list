import 'package:flutter_test/flutter_test.dart';
import 'package:to_do_list/business/task_action.dart';
import 'package:to_do_list/data/models/task.dart';

void main() { // file for test data

  test(('Update a task from list'), () {
    var listTask = [
      Task(id: '1', content: '1', isDone: false),
      Task(id: '2', content: '2', isDone: true),
    ];

    final updatedTask1 = Task(id: '1', content: 'updated1', isDone: true);

    TaskActionImpl().updateAnExistingTask(updatedTask1, listTask);

    var expectResult = [
      Task(id: '1', content: 'updated1', isDone: true),
      Task(id: '2', content: '2', isDone: true),
    ];

    expect(listTask[0].content, expectResult[0].content);

    final updatedTask2 = Task(id: '2', content: 'updated2', isDone: false);

    TaskActionImpl().updateAnExistingTask(updatedTask2, listTask);

    expectResult = [
      Task(id: '1', content: 'updated1', isDone: true),
      Task(id: '2', content: 'updated2', isDone: false),
    ];

    expect(listTask[1].content, expectResult[1].content);
  });

  test(('Remove a task from list'), () {
    var listTask = [
      Task(id: '1', content: '1', isDone: false),
      Task(id: '2', content: '2', isDone: true),
      Task(id: '3', content: '3', isDone: false),
    ];

    const deletedTaskId = '3';

    TaskActionImpl().deleteTaskFromList(deletedTaskId, listTask);

    var listId = listTask.map((e) => e.id).toList();

    final expectListId = ['1', '2'];

    expect(listId, expectListId);
  });
}
