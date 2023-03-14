import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/task.dart';

class Card1 extends StatelessWidget{
  List<Task> tasks = Task.generateTask(50);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) => Card(
          elevation: 4,
          margin: const EdgeInsets.all(6),
          child: ListTile(
            leading: CircleAvatar(child: Text(tasks[index].id.toString()),),
            title: Text(tasks[index].title),
            subtitle: Text(tasks[index].tags.join(" ")),
          ),
        ));
  }

}