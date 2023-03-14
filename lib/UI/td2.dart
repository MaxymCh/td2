import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:td2/UI/settingViewModel.dart';
import 'package:td2/UI/taskViewModel.dart';
import 'package:td2/theme/mytheme.dart';

import 'home.dart';

/*
class MyTD2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final theme = MyTheme.dark();
    return MaterialApp(
      theme: theme,
        title: "TD",
      home:Home(),
    );
  }
}*/


class MyTD2 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_){
              SettingViewModel settingViewModel = SettingViewModel();
//getSettings est deja appelee dans le constructeur
              return settingViewModel;
            }),
        ChangeNotifierProvider(
            create:(_){
              TaskViewModel taskViewModel = TaskViewModel();
              taskViewModel.generateTasks();
              return taskViewModel;
            } )
      ],
      child: Consumer<SettingViewModel>(
        builder: (context,SettingViewModel notifier,child){
          return MaterialApp(
              theme: notifier.isDark ? MyTheme.dark():MyTheme.light(),
              title: 'TD2',
              home: Home()
          );
        },
      ),
    );
  }
}