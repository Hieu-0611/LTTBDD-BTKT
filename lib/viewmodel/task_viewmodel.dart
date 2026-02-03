import 'package:flutter/material.dart';
import '../data/models/task.dart';
import '../data/repository/task_repository.dart';

class TaskViewModel extends ChangeNotifier {
  final TaskRepository _repo = TaskRepository();

  List<Task> tasks = [];

  Future<void> loadTasks() async {
    tasks = await _repo.getTasks();
    notifyListeners();
  }

  Future<void> createTask(String title, String desc) async {
    await _repo.addTask(
      Task(title: title, description: desc),
    );

    await loadTasks(); // ✅ add xong load lại list
  }
}
