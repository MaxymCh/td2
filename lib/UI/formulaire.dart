// Ajoutez un typedef pour le callback d'ajout de tâche
import 'package:flutter/material.dart';

typedef AddTaskCallback = void Function(String title);

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key, required this.onAddTask}) : super(key: key);

  final AddTaskCallback onAddTask;

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final myController = TextEditingController();

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
          widget.onAddTask(myController.text);
          myController.clear();
        },
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
    );
  }
}
