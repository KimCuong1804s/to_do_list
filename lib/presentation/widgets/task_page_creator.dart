
import 'package:flutter/cupertino.dart';

import '../task_page.dart';

class TaskPageCreator {
  static Widget allTasksPage() { // show all tasks
    return TaskPage(null, key: const Key('0'));
  }

  static Widget inCompleteTasksPage() { // only show incomplete tasks
    return TaskPage(false, key: const Key('1'));
  }

  static Widget completedTasksPage() { // only show completed tasks
    return TaskPage(true, key: const Key('2'));
  }

  static String getTitle(bool? filter) {
    if (filter == null) {
      return 'All Tasks';
    } else if (filter == false) {
      return 'Incomplete Tasks';
    } else {
      return 'Completed Tasks';
    }
  }
}