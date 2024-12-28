class TodoItem {
  final String work;
  final DateTime timestamp;

  TodoItem({required this.work, required this.timestamp});

  factory TodoItem.fromJson(Map<String, dynamic> json) {
    return TodoItem(
      work: json['work'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }
}
