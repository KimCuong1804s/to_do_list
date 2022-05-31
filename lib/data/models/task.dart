class Task {
  Task({
    this.id = "",
    this.content = "",
    this.isDone = false,
  });

  String id;
  String content;
  bool isDone;

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json["id"] ?? "",
        content: json["content"] ?? "",
        isDone: json["isDone"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "content": content,
        "isDone": isDone,
      };
}




