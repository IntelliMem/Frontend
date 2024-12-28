import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:imagine_cup/Widget/search_header.dart';
import 'package:imagine_cup/Widget/todo/add_todo_list.dart';
import 'package:imagine_cup/Widget/todo/todo_item.dart';
import 'package:imagine_cup/Widget/todo/todo_list.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

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

  late TextEditingController controller = TextEditingController();

  // List<TodoItem> list = [];
  // int id = 1;
  // Future<void> fetchTodoList() async {
  //   try {
  //     final response = await http.get(
  //       Uri.parse('${dotenv.env['API_URL']}/api/v1/todo?userId=$id'),
  //     );

  //     if (response.statusCode == 200) {
  //       List<dynamic> data = jsonDecode(response.body);
  //       print('Fetched data: $data');

  //       setState(() {
  //         list = data.map((item) => TodoItem.fromJson(item)).toList();
  //       });
  //     } else {
  //       throw Exception('Failed to load todos');
  //     }
  //   } catch (e) {
  //     print('Error while fetching todos: $e');
  //   }
  // }

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
  void initState() {
    super.initState();
    // fetchTodoList();
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
      ),
    );
  }
}
