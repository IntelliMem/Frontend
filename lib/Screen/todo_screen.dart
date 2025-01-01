import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:imagine_cup/Widget/search_header.dart';
import 'package:imagine_cup/Widget/todo/add_todo_list.dart';
import 'package:imagine_cup/Widget/todo/todo_item.dart';
import 'package:imagine_cup/Widget/todo/todo_list.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:imagine_cup/controller/calendar_controller.dart';

class TodoScreen extends StatefulWidget {
  String userId;
  TodoScreen({super.key, required this.userId});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final CalendarController _calendarController = CalendarController();
  final GlobalKey<TodoListState> todoListKey = GlobalKey<TodoListState>();

  List<NewItem> addList = [
    NewItem(
      userId: 1,
      task: "Complete Flutter project",
      time: DateTime.parse("2025-01-01T12:00:00Z"),
    ),
    NewItem(
      userId: 1,
      task: "Attend team meeting",
      time: DateTime.parse("2025-01-02T14:30:00Z"),
    ),
    NewItem(
      userId: 1,
      task: "Write unit tests for app",
      time: DateTime.parse("2025-01-03T09:00:00Z"),
    ),
  ];

  late TextEditingController controller = TextEditingController();

  List<TodoItem> list = [];
  int id = 1;
  Future<void> fetchTodoList() async {
    final fetchedList = await _calendarController.fetchTodoList(id);
    setState(() {
      list = fetchedList;
    });
  }

  void deleteItem(NewItem item) {
    setState(() {
      addList.removeWhere((todo) => todo.task == item.task);
    });
  }

  Future<void> deleteFromList(TodoItem item) async {
    int id = item.id;
    try {
      final response = await http
          .delete(Uri.parse('${dotenv.env['API_URL']}/api/v1/todo?todoId=$id'));

      print(response);
      if (response.statusCode == 200) {
        await fetchTodoList();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to delete item')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  // void deleteFromList(TodoItem item) async {
  //   setState(() {
  //     list.removeWhere((todo) => todo.id == item.id);
  //   });
  //   await fetchTodoList();
  // }

  void addItem(NewItem item) async {
    try {
      Map<String, dynamic> newItemData = {
        'userId': item.userId,
        'task': item.task,
        'time': item.time?.toIso8601String(),
      };

      final response = await http.post(
        Uri.parse('${dotenv.env['API_URL']}/api/v1/todo'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(newItemData),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Todo item added successfully')),
        );
        fetchTodoList();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add item')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    fetchTodoList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchHeadWidget(
              label: 'TO DO',
              controller: controller,
            ),
            Column(
              children: addList.map((item) {
                return AddTodoList(
                  item: item,
                  onDelete: deleteItem,
                  onAdd: addItem,
                );
              }).toList(),
            ),
            TodoList(
              key: todoListKey,
              userId: widget.userId,
              list: list,
              deleteItem: deleteFromList,
            ),
          ],
        ),
      ),
    );
  }
}
