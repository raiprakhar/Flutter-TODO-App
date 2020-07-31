import 'package:flutter/foundation.dart';
import './tasks.dart';
import 'dart:collection';

class TaskData with ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'exercise'),
    Task(name: 'coding'),
    Task(name: 'flutter'),
  ];
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTasks(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTasks(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
