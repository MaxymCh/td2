import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:td2/UI/taskViewModel.dart';

import 'AddTask.dart';
import 'card1.dart';
import 'card2.dart';
import 'card3.dart';
import 'ecranSettings.dart';

class Home extends StatefulWidget{
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  late TaskViewModel taskViewModel;

  @override
  void initState() {
    super.initState();
    taskViewModel = Provider.of<TaskViewModel>(context, listen: false);
  }

  List<Widget> pages(BuildContext context) => <Widget>[
    Card1(taskViewModel: taskViewModel),
    Card2(),
    Card3(),
    EcranSettings()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Application TD2"),
      ),
      body: Center(
        child: pages(context)[_selectedIndex],
      ),
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTask(taskViewModel: taskViewModel),
            ),
          );
        },
        child: const Icon(Icons.add),
      )
          : const SizedBox.shrink(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor:
        Theme.of(context).textSelectionTheme.selectionColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.open_in_new_rounded),
            label: 'Open Dialog',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.language),
            label: 'Page 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.language),
            label: 'Theme',
          ),
        ],
      ),
    );
  }

  _onItemTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }
}


