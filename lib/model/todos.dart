class Todo {
  int userId;
  int id;
  String title;
  bool completed;


  Todo({required this.userId,required this.id,required this.title,required this.completed});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );

  }
  
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['completed'] = this.completed;
    return data;
  }
  static List<Todo> generateTask(int i){
    return List.generate(i,
            (index) =>
                Todo(
                  id: index,
                  title: "Titre du todo $index",
                  userId: index,
                  completed: false,
                )
    );

  }
}


