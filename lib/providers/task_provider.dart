import 'package:flutter/material.dart';
import '../services/database_helper.dart';
import '../models/task.dart';

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];
  final DatabaseHelper _dbHelper = DatabaseHelper();

  List<Task> get tasks => _tasks;

  Future<void> fetchTasks() async {
    final data = await _dbHelper.getAllTasks();
    _tasks = data.map((item) => Task.fromMap(item)).toList();
    notifyListeners();
  }

  Future<void> addTask(Task task) async {
    await _dbHelper.insertTask(task);
    fetchTasks();
  }

  Future<void> deleteTask(int id) async {
    await _dbHelper.deleteTask(id);
    fetchTasks();
  }

  Future<void> updateTask(Task task) async {
    await _dbHelper.updateTask(task);
    fetchTasks();
  }
}
