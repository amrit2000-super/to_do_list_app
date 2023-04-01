class Task {
  int? id;
  String? title;
  String? note;
  int? color;
  String? Date;
  int? completed;

  Task(
      {required this.title,
      required this.note,
      required this.color,
      required this.Date,
      required this.completed});

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['note'] = this.note;
    data['color'] = this.color;
    data['Date'] = this.Date;
    data['completed'] = this.completed;
    return data;
  }

  Task.fromJson(Map<String, dynamic> mp) {
    id = mp['id'];
    title = mp['title'];
    note = mp['note'];
    color = mp['color'];
    Date = mp['Date'];
    completed = mp['completed'];
  }
}
