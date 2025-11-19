
import 'package:flutter/foundation.dart';
import '../models/task.dart';

class TaskProvider with ChangeNotifier {
  final List<Task> _tasks = [
    Task(
      id: '1',
      title: 'Welcome to your Task Manager',
      description: 'This is a sample task to get you started.',
    ),
    Task(
      id: '2',
      title: 'Add a new task',
      description: 'Click on the + button to add a new task.',
      isDone: true,
    ),
  ];

  List<Task> get tasks => _tasks;

  void addTask(String title, String description) {
    final newTask = Task(
      id: DateTime.now().toString(),
      title: title,
      description: description,
    );
    _tasks.add(newTask);
    notifyListeners();
  }

  void toggleTaskStatus(String taskId) {
    final taskIndex = _tasks.indexWhere((task) => task.id == taskId);
    if (taskIndex != -1) {
      _tasks[taskIndex].isDone = !_tasks[taskIndex].isDone;
      notifyListeners();
    }
  }

  void deleteTask(String taskId) {
    _tasks.removeWhere((task) => task.id == taskId);
    notifyListeners();
  }
}
