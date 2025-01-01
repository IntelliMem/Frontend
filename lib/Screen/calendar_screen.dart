import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:imagine_cup/Widget/calendar/calendar_dialog.dart';
import 'package:imagine_cup/Widget/calendar/calendar_list.dart';
import 'package:imagine_cup/Widget/calendar/calendar_widget.dart';
import 'package:imagine_cup/Widget/todo/todo_item.dart';
import 'package:imagine_cup/controller/calendar_controller.dart';
import 'package:imagine_cup/util.dart';
import 'package:intl/intl.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class CalendarScreen extends StatefulWidget {
  final String userId;
  CalendarScreen({super.key, required this.userId});

  final double _containerWidth2 = Util.getWidgetSize(7 / 9);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final CalendarController _calendarController = CalendarController();
  DateTime timestamp = DateTime.now();

  List<TodoItem> list = [];
  int id = 1;
  String selectedDate = "";

  Future<void> fetchCalendarList() async {
    final todos = await _calendarController.fetchCalendarList(id, selectedDate);
    setState(() {
      list = todos;
    });
  }

  Future<void> fetchTodoList() async {
    final fetchedList = await _calendarController.fetchTodoList(id);
    setState(() {
      list = fetchedList;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchTodoList();
  }

  void _updateSelectedDate(DateTime date) {
    setState(() {
      timestamp = date;
      selectedDate = DateFormat('yyyy-MM-dd').format(date);
      fetchCalendarList();
    });
  }

  void _handleDateClick(DateTime date) {
    DialogHelper.showTodoDialog(
      context,
      date: date,
      list: list,
      containerWidth2: widget._containerWidth2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      body: Column(
        children: [
          CalendarWidget(onDateSelected: _updateSelectedDate),
          CalendarList(
            timeStamp: timestamp,
            list: list,
            onDateClick: _handleDateClick,
          ),
        ],
      ),
    );
  }
}
