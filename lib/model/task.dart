class Task {
  int id;
  String title;
  List<String> tags;
  int nbhours;
  int difficulty;
  String description;

  Task({required this.id,required this.title,required this.tags,required
  this.nbhours,required this.difficulty,
    required this.description});

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
                )
    );

  }
}


