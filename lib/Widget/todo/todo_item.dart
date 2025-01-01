class TodoItem {
  final int id;
  final String task;
  final DateTime? time;
  bool calendered;
  bool completed;

  TodoItem({
    required this.id,
    required this.task,
    this.time,
    required this.calendered,
    required this.completed,
  });

  factory TodoItem.fromJson(Map<String, dynamic> json) {
    return TodoItem(
      id: json['id'],
      task: json['task'],
      time: json['time'] != null && json['time'].isNotEmpty
          ? DateTime.parse(json['time'])
          : null,
      calendered: json['calendered'],
      completed: json['completed'],
    );
  }
}

class NewItem {
  final int userId;
  final String task;
  final DateTime? time;

  NewItem({
    required this.userId,
    required this.task,
    this.time,
  });

  factory NewItem.fromJson(Map<String, dynamic> json) {
    return NewItem(
      userId: json['userId'],
      task: json['task'],
      time: json['time'] != null && json['time'].isNotEmpty
          ? DateTime.parse(json['time'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'task': task,
      'time': time?.toIso8601String(),
    };
  }
}
