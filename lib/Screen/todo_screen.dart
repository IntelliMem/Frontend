import 'package:flutter/material.dart';
import 'package:imagine_cup/Widget/search_header.dart';
import 'package:imagine_cup/Widget/todo/add_todo_list.dart';
import 'package:imagine_cup/Widget/todo/todo_item.dart';
import 'package:imagine_cup/Widget/todo/todo_list.dart';

class TodoScreen extends StatefulWidget {
  String userId;
  TodoScreen({super.key, required this.userId});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<TodoItem> list = [
    TodoItem(
        work: 'Fix unit tests1',
        timestamp: DateTime.now().subtract(Duration(days: 1))),
    TodoItem(
        work: 'Call Mike regarding quote2',
        timestamp: DateTime.now().subtract(Duration(hours: 2))),
    TodoItem(
        work: 'Fix unit tests3',
        timestamp: DateTime.now().subtract(Duration(days: 3))),
    TodoItem(
        work: 'Call Mike regarding quote4',
        timestamp: DateTime.now().subtract(Duration(minutes: 30))),
  ];

  List<TodoItem> addList = [
    TodoItem(
        work: 'Fix unit tests5',
        timestamp: DateTime.now().subtract(Duration(hours: 4))),
    TodoItem(
        work: 'Call Mike regarding quote6',
        timestamp: DateTime.now().subtract(Duration(days: 2))),
  ];

  void deleteItem(TodoItem item) {
    setState(() {
      addList.removeWhere(
          (todo) => todo.work == item.work && todo.timestamp == item.timestamp);
    });
  }

  void addItem(TodoItem item) {
    setState(() {
      list.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SearchHeadWidget(
            label: 'TO DO',
          ),
          Column(
            children: addList.map((item) {
              return AddTodoList(
                work: item.work,
                timestamp: item.timestamp,
                onDelete: deleteItem,
                onAdd: addItem,
              );
            }).toList(),
          ),
          TodoList(
            userId: widget.userId,
            list: list,
          ),
        ],
      ),
    );
  }
}
