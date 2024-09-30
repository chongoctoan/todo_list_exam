class Task {
  int? id;
  String title;
  String deadline;
  bool isDone;

  Task({
    this.id,
    required this.title,
    required this.deadline,
    this.isDone = false,
  });

  // Chuyển đổi Task thành Map để lưu vào SQLite
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'deadline': deadline,
      'isDone': isDone ? 1 : 0,
    };
  }

  // Chuyển đổi Map từ SQLite thành Task
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      deadline: map['deadline'],
      isDone: map['isDone'] == 1,
    );
  }
}
