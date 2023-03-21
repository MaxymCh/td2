import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
class Task {
  int id;
  String title;
  List<String> tags;
  int nbhours;
  int difficulty;
  String description;
  static int nb = 0;

  Task({required this.id,required this.title,required this.tags,required
  this.nbhours,required this.difficulty,
    required this.description});

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'difficulty': difficulty,
      'nbhours': nbhours,
      'description': description
    };
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
    id: json['id'],
    title: json['title'],
    difficulty: json['difficulty'],
    nbhours: json['nbhours'],
    description: json['description'],
    tags: json['tags'].cast<String>(),
    );

  }

  factory Task.newTask(){
    nb++; //attribut static de la classe.
    return Task(id: nb, title: 'title $nb', tags: ['tags $nb'], nbhours:
    nb, difficulty: nb%5, description: 'description $nb');
  }

  // Ajoutez cette fonction pour créer une nouvelle tâche avec un titre spécifique
  factory Task.newTaskWithTitle(String title) {
    nb++; //attribut static de la classe.
    return Task(
        id: nb,
        title: title,
        tags: ['tags $nb'],
        nbhours: nb,
        difficulty: nb % 5,
        description: 'description $nb');
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['difficulty'] = this.difficulty;
    data['nbhours'] = this.nbhours;
    data['description'] = this.description;
    data['tags'] = this.tags;
    return data;
  }
  static List<Task> generateTask(int i){
    return List.generate(i,
            (index) =>
                Task(
                  id: index,
                  title: "Titre de la task $index",
                  tags:['tags $index', "tags ${index +1}"],
                  nbhours: index,
                  difficulty: index,
                  description: "Voici la description de la task $index",
                ),
    );

  }
}


