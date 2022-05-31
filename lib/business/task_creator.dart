import 'package:uuid/uuid.dart';
import '../data/models/task.dart';

Task taskCreator(String content) {
  final newId = const Uuid().v4();
  final newTask = Task(id: newId, content: content, isDone: false);
  return newTask;
}