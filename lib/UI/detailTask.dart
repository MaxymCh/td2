import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:td2/UI/taskViewModel.dart';

import '../model/task.dart';

class DetailTask extends StatelessWidget {
  // In the constructor, require a Todo.
  const DetailTask({super.key, required this.task, required this.taskViewModel});

  // Declare a field that holds the Todo.
  final Task task;
  final TaskViewModel taskViewModel;
  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(task.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              taskViewModel.deleteTasks(task.id);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(task.description),
      ),
    );
  }
}