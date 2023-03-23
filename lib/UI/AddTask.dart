import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:td2/UI/taskViewModel.dart';

import '../model/task.dart';
import 'formulaire.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key, required this.taskViewModel, this.task}) : super(key: key);

  final TaskViewModel taskViewModel;
  final Task? task;

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Retrieve Text Input'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
          child: MyCustomForm(
            task: widget.task,
            taskViewModel: widget.taskViewModel,
        ),
      ),

    );
  }
}
