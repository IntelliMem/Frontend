import 'package:flutter/material.dart';
import 'package:imagine_cup/Widget/calendar/calendar_dialog.dart';
import 'package:imagine_cup/Widget/calendar/calendar_list.dart';
import 'package:imagine_cup/Widget/calendar/calendar_widget.dart';
import 'package:imagine_cup/Widget/todo/todo_item.dart';
import 'package:imagine_cup/util.dart';

class CalendarScreen extends StatefulWidget {
  final String userId;
  CalendarScreen({super.key, required this.userId});

  final double _containerWidth2 = Util.getWidgetSize(7 / 9);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime timestamp = DateTime.now();

  List<TodoItem> list = [
    TodoItem(
        work:
            'Fix unit tests1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
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
    TodoItem(
        work: 'Call Mike regarding quote4',
        timestamp: DateTime.now().subtract(Duration(minutes: 30))),
    TodoItem(
        work: 'Call Mike regarding quote4',
        timestamp: DateTime.now().subtract(Duration(minutes: 30))),
    TodoItem(
        work: 'Call Mike regarding quote4',
        timestamp: DateTime.now().subtract(Duration(minutes: 30))),
    TodoItem(
        work: 'Call Mike regarding quote4',
        timestamp: DateTime.now().subtract(Duration(minutes: 30))),
    TodoItem(
        work: 'Call Mike regarding quote4',
        timestamp: DateTime.now().subtract(Duration(minutes: 30))),
    TodoItem(
        work: 'Call Mike regarding quote4',
        timestamp: DateTime.now().subtract(Duration(minutes: 30))),
    TodoItem(
        work: 'Call Mike regarding quote4',
        timestamp: DateTime.now().subtract(Duration(minutes: 30))),
    TodoItem(
        work: 'Call Mike regarding quote4',
        timestamp: DateTime.now().subtract(Duration(minutes: 30))),
  ];

  void _updateSelectedDate(DateTime date) {
    setState(() {
      timestamp = date;
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
