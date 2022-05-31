import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'models/task.dart';

var storedFileName = '/listTask.json';

abstract class TaskStorage {
  Future<List<Task>> getListTaskStorage({bool? filter});
  Future<File> storedFile();
  Future<void> saveListTaskToLocalStored(List<Task> data);
}

class TaskStorageImpl implements TaskStorage {

  @override
  Future<List<Task>> getListTaskStorage({bool? filter}) async {
    try {
      final file = await storedFile();
      final content = await file.readAsString();
      final List<dynamic> jsonArray = jsonDecode(content);
      final listTask = jsonArray.map((jsonObject) => Task.fromJson(jsonObject)).toList();
      if (filter == null) {
        return listTask;
      } else {
        List<Task> newList = [];
        for (int i = 0; i < listTask.length; i ++) {
          if (listTask[i].isDone == filter) {
            newList.add(listTask[i]);
          }
        }
        return newList;
      }
    } catch (e) {
      return [];
    }
  }

  @override
  Future<File> storedFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    return File('$path/$storedFileName');
  }

  @override
  Future<void> saveListTaskToLocalStored(List<Task> data) async {
    try {
      final file = await storedFile();
      final jsonArray = data.map((task) => task.toJson()).toList();
      await file.writeAsString(jsonEncode(jsonArray));
    } catch (e) {
      print("error: ${e.toString()}");
      return;
    }
  }

}

