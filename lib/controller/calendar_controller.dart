import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:imagine_cup/Widget/todo/todo_item.dart';

class CalendarController {
  Future<List<TodoItem>> fetchCalendarList(int userId, String date) async {
    try {
      final response = await http.get(
        Uri.parse(
          '${dotenv.env['API_URL']}/api/v1/todo/calender?userId=$userId&date=$date',
        ),
      );

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        return data.map((item) => TodoItem.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load todos');
      }
    } catch (e) {
      print('Error while fetching todos: $e');
      return [];
    }
  }

  Future<List<NewItem>> sendAndFetchAddList(String voiceInput, int id) async {
    try {
      final Map<String, dynamic> requestData = {
        'voiceInput': voiceInput,
      };

      final response = await http.post(
        Uri.parse('${dotenv.env['API_URL']}/api/v1/openai'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestData),
      );

      final responseBody = response.body;
      final cleanedResponse =
          responseBody.replaceAll(RegExp(r"```json|```"), '').trim();

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(cleanedResponse);

        return data.map((json) {
          String task = json['task'] ?? '';
          String timeStr = json['time'] ?? '';
          DateTime? time = timeStr.isNotEmpty ? DateTime.parse(timeStr) : null;

          return NewItem(
            userId: id,
            task: task,
            time: time,
          );
        }).toList();
      } else {
        throw Exception('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

  Future<List<TodoItem>> fetchTodoList(int userId) async {
    try {
      final response = await http.get(
        Uri.parse('${dotenv.env['API_URL']}/api/v1/todo/today?userId=$userId'),
      );

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        return data.map((item) => TodoItem.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load todos');
      }
    } catch (e) {
      print('Error while fetching todos: $e');
      return [];
    }
  }

  Future<TodoItem> fetchTodoById(int todoId) async {
    final response = await http
        .get(Uri.parse('${dotenv.env['API_URL']}/api/v1/todo/$todoId'));

    if (response.statusCode == 200) {
      return TodoItem.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load todo');
    }
  }

  Future<bool> updateTodoStatus(int todoId, bool completed) async {
    try {
      final response = await http.patch(
        Uri.parse('${dotenv.env['API_URL']}/api/v1/todo/completed'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'todoId': todoId,
          'completed': completed,
        }),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('Failed to update todo status');
      }
    } catch (e) {
      print('Error while updating todo status: $e');
      return false;
    }
  }
}
