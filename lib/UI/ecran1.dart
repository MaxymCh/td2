import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:td2/UI/taskViewModel.dart';

import '../model/task.dart';

class Ecran1 extends StatelessWidget{
  late List<Task> tasks; //= Task.generateTask(50);
  String tags='';
  @override
  Widget build(BuildContext context) {
    tasks = context.watch<TaskViewModel>().liste;
    return ListView.builder(
        ...
    };
}