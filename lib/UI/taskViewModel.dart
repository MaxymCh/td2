import 'package:flutter/foundation.dart';
import '../model/task.dart';

class TaskViewModel extends ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void generateTasks() {
    _tasks = Task.generateTask(50);
    Task.nb += 50;
    notifyListeners();
  }

  void deleteTasks(int id) {
    for(var tache in _tasks){
      if(tache.id == id){
        _tasks.remove(tache);
      }
    }
    notifyListeners();
  }

  void addTaskWithTitle(String title) {
    int id = _tasks.length + 1;
    _tasks.add(Task.newTaskWithTitle(title));
    notifyListeners();
  }
}
