import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:imagine_cup/Widget/search_header.dart';
import 'package:imagine_cup/Widget/todo/add_todo_list.dart';
import 'package:imagine_cup/Widget/todo/todo_item.dart';
import 'package:imagine_cup/Widget/todo/todo_list.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:imagine_cup/controller/calendar_controller.dart';
import 'package:intl/intl.dart';

class TodoScreen extends StatefulWidget {
  String userId;
  TodoScreen({super.key, required this.userId});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final CalendarController _calendarController = CalendarController();

  late TextEditingController controller = TextEditingController();

  List<TodoItem> list = [];
  int id = 1;
  Future<void> fetchTodoList() async {
    final fetchedList = await _calendarController.fetchTodoList(id);
    setState(() {
      list = fetchedList;
    });
  }

  List<NewItem> addList = [];
  Future<void> sendAndFetchAddList(String text) async {
    final fetchedList = await _calendarController.sendAndFetchAddList(text, id);
    setState(() {
      addList = fetchedList;
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

  String formatDate(DateTime? dateTime) {
    if (dateTime == null) return '';
    DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm');
    return dateFormat.format(dateTime);
  }

  void addItem(NewItem item) async {
    String formattedDate = formatDate(item.time);
    try {
      Map<String, dynamic> newItemData = {
        'userId': item.userId,
        'task': item.task,
        'time': formattedDate.isEmpty ? null : formattedDate,
      };

      final response = await http.post(
        Uri.parse('${dotenv.env['API_URL']}/api/v1/todo'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(newItemData),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Todo item added successfully')),
        );
        await fetchTodoList();
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
            SearchHeader(
              label: 'TO DO',
              controller: controller,
              onSubmitted: (value) {
                sendAndFetchAddList(value);
                controller.clear();
              },
              getVoiceInput: (text) {
                sendAndFetchAddList(text);
              },
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
