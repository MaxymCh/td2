import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:td2/UI/detailTask.dart';
import 'package:td2/UI/taskViewModel.dart';

import '../model/task.dart';
import 'formulaire.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/task.dart';

class Card1 extends StatelessWidget {
  Card1({Key? key, required this.taskViewModel}) : super(key: key);

  final TaskViewModel taskViewModel;

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskViewModel>(
      builder: (context, taskViewModel, child) {
        return ListView.builder(
          itemCount: taskViewModel.tasks.length,
          itemBuilder: (context, index) => Card(
            elevation: 4,
            margin: const EdgeInsets.all(6),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(taskViewModel.tasks[index].id.toString()),
              ),
              title: Text(taskViewModel.tasks[index].title),
              subtitle: Text(taskViewModel.tasks[index].tags.join(" ")),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailTask(task: taskViewModel.tasks[index], taskViewModel: taskViewModel),
                  ),
                );
              },
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailTask(task: taskViewModel.tasks[index], taskViewModel: taskViewModel),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      taskViewModel.deleteTasks(taskViewModel.tasks[index].id);
                    },
                  ),
                ],
              ),

            ),
          ),
        );
      },
    );
  }
}

