// Ajoutez un typedef pour le callback d'ajout de tâche
import 'package:flutter/material.dart';
import 'package:td2/UI/taskViewModel.dart';

import '../model/task.dart';

typedef AddTaskCallback = void Function(String title);

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key, required this.taskViewModel, this.task}) : super(key: key);

  final TaskViewModel taskViewModel;
  final Task? task;

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  late final myController = TextEditingController(text: widget.task?.title ?? '');

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Retrieve Text Input'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: myController,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Utilisez le callback pour ajouter une tâche
          widget.taskViewModel.addOrUpdateTask(myController.text, widget.task);

          myController.clear();
          Navigator.pop(context);
        },
        tooltip: 'Add/Save Task',
        child: const Icon(Icons.save),
      ),
    );
  }
}
