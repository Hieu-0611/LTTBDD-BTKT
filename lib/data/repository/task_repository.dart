import '../models/task.dart';
import '../database/task_database.dart';

class TaskRepository {
  Future<List<Task>> getTasks() async {
    final db = await TaskDatabase.database;
    final result = await db.query("tasks", orderBy: "id DESC");

    return result.map((e) => Task.fromMap(e)).toList();
  }

  Future<void> addTask(Task task) async {
    final db = await TaskDatabase.database;
    await db.insert("tasks", task.toMap());
  }
}
